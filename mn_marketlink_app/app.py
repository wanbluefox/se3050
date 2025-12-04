from flask import Flask, render_template, request, redirect, url_for
from db import get_connection

app = Flask(__name__)

@app.route("/")
def home():
    return redirect(url_for("list_markets"))

# 1. Browse markets
@app.route("/markets")
def list_markets():
    conn = get_connection()
    with conn.cursor() as cur:
        cur.execute("""
            SELECT m.market_id, m.name, a.city, m.market_date, m.start_time, m.end_time
            FROM Markets m
            JOIN Market_Address a ON m.zip_code = a.zip_code
            WHERE m.is_active = TRUE
            ORDER BY m.market_date, a.city;
        """)
        markets = cur.fetchall()
    conn.close()
    return render_template("markets.html", markets=markets)

# 2. Market details + vendors
@app.route("/markets/<int:market_id>")
def market_detail(market_id):
    conn = get_connection()
    with conn.cursor() as cur:
        cur.execute("""
            SELECT m.*, a.city, a.state, a.location_address
            FROM Markets m
            JOIN Market_Address a ON m.zip_code = a.zip_code
            WHERE m.market_id = %s;
        """, (market_id,))
        market = cur.fetchone()

        cur.execute("""
            SELECT v.vendor_id, v.business_name, mv.setup_location, mv.is_confirmed
            FROM Market_Vendors mv
            JOIN Vendors v ON mv.vendor_id = v.vendor_id
            WHERE mv.market_id = %s;
        """, (market_id,))
        vendors = cur.fetchall()
    conn.close()
    return render_template("market_detail.html", market=market, vendors=vendors)

# 3. Product search
@app.route("/products/search")
def product_search():
    q = request.args.get("q", "")
    products = []
    if q:
        conn = get_connection()
        with conn.cursor() as cur:
            cur.execute("""
                SELECT p.product_id, p.name AS product_name, p.category, p.base_price,
                       v.business_name, m.name AS market_name, a.city
                FROM Products p
                JOIN Vendors v ON p.vendor_id = v.vendor_id
                JOIN Market_Vendors mv ON v.vendor_id = mv.vendor_id
                JOIN Markets m ON mv.market_id = m.market_id
                JOIN Market_Address a ON m.zip_code = a.zip_code
                WHERE p.name LIKE %s
                ORDER BY p.name;
            """, (f"%{q}%",))
            products = cur.fetchall()
        conn.close()
    return render_template("product_search.html", q=q, products=products)

# 4. Pre-order form + transaction
@app.route("/order/<int:product_id>", methods=["GET", "POST"])
def place_order(product_id):
    if request.method == "GET":
        return render_template("order_form.html", product_id=product_id)

    # POST: handle transaction
    first_name = request.form["first_name"]
    last_name = request.form["last_name"]
    email = request.form["email"]
    quantity = int(request.form["quantity"])

    conn = get_connection()
    try:
        with conn.cursor() as cur:
            # 1) Find or create customer
            cur.execute("SELECT customer_id FROM Customers WHERE email = %s", (email,))
            row = cur.fetchone()
            if row:
                customer_id = row["customer_id"]
            else:
                cur.execute("""
                    INSERT INTO Customers (first_name, last_name, email)
                    VALUES (%s, %s, %s)
                """, (first_name, last_name, email))
                customer_id = cur.lastrowid

            # 2) Find vendor + market_vendor for this product (simplified: pick first)
            cur.execute("""
                SELECT v.vendor_id, mv.market_vendor_id, p.base_price
                FROM Products p
                JOIN Vendors v ON p.vendor_id = v.vendor_id
                JOIN Market_Vendors mv ON mv.vendor_id = v.vendor_id
                WHERE p.product_id = %s
                LIMIT 1;
            """, (product_id,))
            vm = cur.fetchone()
            market_vendor_id = vm["market_vendor_id"]
            unit_price = vm["base_price"]
            subtotal = unit_price * quantity

            # 3) Insert order
            cur.execute("""
                INSERT INTO Orders (customer_id, market_vendor_id, pickup_date, status, payment_status)
                VALUES (%s, %s, CURDATE(), 'pending', 'pending');
            """, (customer_id, market_vendor_id))
            order_id = cur.lastrowid

            # 4) Insert order item
            cur.execute("""
                INSERT INTO Order_Items (order_id, product_id, quantity, unit_price, subtotal)
                VALUES (%s, %s, %s, %s, %s);
            """, (order_id, product_id, quantity, unit_price, subtotal))

        conn.commit()
    except Exception as e:
        conn.rollback()
        raise e
    finally:
        conn.close()

    return render_template("order_success.html", order_id=order_id)

if __name__ == "__main__":
    app.run(debug=True)
