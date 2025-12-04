
# MN MarketLink — SE3050 Final Project (Milestone 5)

A simple Flask + MySQL web application for a farmers market pre-order system. The app connects to our `mn_marketlink` database and demonstrates the full database life-cycle: browsing markets, viewing vendors, searching products, and placing a pre-order using a database transaction.

## Core Features (Required)

* ✅ Browse a list of farmers markets
* ✅ View details for a specific market, including a list of vendors
* ✅ Search for products across all markets
* ✅ Place a pre-order for a product (handled by a DB transaction)

---

## Tech Stack

* **Backend:** Python 3.11 + Flask
* **Database:** MySQL (local)
* **DB Driver:** PyMySQL (+ `cryptography` for MySQL 8 auth)
* **Frontend:** HTML (Jinja templates) + Bootstrap

---

## Project Location in Repo

This app lives here:

```
mn_marketlink_app/
```

---

## Setup & Run Instructions

### 1) Start MySQL

Make sure your MySQL server is running and that your database `mn_marketlink` is created and populated using our `schema.sql` + `data.sql` files.

### 2) Create/Activate Python environment

If you already have the class env:

```bash
conda activate school
```

### 3) Install dependencies

From the app folder:

```bash
cd mn_marketlink_app
pip install -r requirements.txt
```

> Note: On MySQL 8, PyMySQL may require the `cryptography` package for authentication (`caching_sha2_password`). This is included in `requirements.txt`.

### 4) Configure DB credentials

Edit `db.py` and set your local MySQL login:

```python
host="localhost"
user="root"
password="YOUR_PASSWORD"
database="mn_marketlink"
```

### 5) Run the Flask app

```bash
python app.py
```

You should see:

```
Running on http://127.0.0.1:5000
```

### 6) Open the app in your browser

* Browse markets: `http://127.0.0.1:5000/markets`
* Product search: `http://127.0.0.1:5000/products/search`

> `127.0.0.1` is local-only. The live behavior is shown in our demo video.

---

## Demo Video
Video link: (to be added)


Suggested demo flow:

1. Markets page (`/markets`)
2. Click a market → show vendors
3. Product search (`/products/search?q=carrot`)
4. Click **Pre-order** → fill form → submit
5. Show order success page + new `order_id`

---


## Repository Contents (Milestones)

* Database schema + sample data scripts (Milestones 1–4)
* Final working UI application (Milestone 5)

---

## Troubleshooting

### Error: `cryptography package is required ... caching_sha2_password`

Run:

```bash
pip install cryptography
```

(or re-run `pip install -r requirements.txt`)







