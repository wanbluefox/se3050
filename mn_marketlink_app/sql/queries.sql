USE mn_marketlink;

-- 1. List all active markets with city, date, and time
SELECT m.market_id,
       m.name AS market_name,
       a.city,
       m.market_date,
       m.start_time,
       m.end_time
FROM Markets m
JOIN Market_Address a ON m.zip_code = a.zip_code
WHERE m.is_active = TRUE
ORDER BY m.market_date, a.city;

-- 2. Show all vendors attending a specific market (by market_id)
SELECT mv.market_id,
       m.name AS market_name,
       v.vendor_id,
       v.business_name,
       mv.setup_location,
       mv.expected_arrival_time,
       mv.is_confirmed
FROM Market_Vendors mv
JOIN Markets m ON mv.market_id = m.market_id
JOIN Vendors v ON mv.vendor_id = v.vendor_id
WHERE mv.market_id = 1
ORDER BY v.business_name;

-- 3. Products available at a given market, grouped by vendor
SELECT m.name AS market_name,
       v.business_name,
       p.product_id,
       p.name AS product_name,
       p.category,
       p.base_price
FROM Market_Vendors mv
JOIN Markets m   ON mv.market_id = m.market_id
JOIN Vendors v   ON mv.vendor_id = v.vendor_id
JOIN Products p  ON p.vendor_id  = v.vendor_id
WHERE mv.market_id = 1
ORDER BY v.business_name, p.category, p.name;

-- 4. Order history for each customer
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       o.order_id,
       o.order_date,
       o.pickup_date,
       o.status,
       o.payment_status
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
ORDER BY c.customer_id, o.order_date DESC;

-- 5. Order line items with calculated total per order
SELECT o.order_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       SUM(oi.subtotal) AS order_total
FROM Orders o
JOIN Customers c  ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY o.order_id, customer_name
ORDER BY o.order_id;

-- 6. Sales summary per vendor and market
SELECT m.market_id,
       m.name AS market_name,
       v.vendor_id,
       v.business_name,
       SUM(oi.subtotal) AS total_sales
FROM Orders o
JOIN Market_Vendors mv ON o.market_vendor_id = mv.market_vendor_id
JOIN Markets m         ON mv.market_id = m.market_id
JOIN Vendors v         ON mv.vendor_id = v.vendor_id
JOIN Order_Items oi    ON o.order_id = oi.order_id
GROUP BY m.market_id, m.name, v.vendor_id, v.business_name
ORDER BY m.market_id, total_sales DESC;

-- 7. Products filtered by category (example: vegetables)
SELECT p.product_id,
       p.name,
       p.category,
       p.base_price,
       v.business_name
FROM Products p
JOIN Vendors v ON p.vendor_id = v.vendor_id
WHERE p.category = 'vegetables'
ORDER BY p.base_price;
