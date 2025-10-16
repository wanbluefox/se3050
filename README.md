# se3050
class project
Team members:Jackie Xiong, William Xiong,Xuehai Wan

## Project Management
Our GitHub Projects board: ![Project Board Screenshot](image/project-board-screenshot.jpg)


https://trello.com/invite/b/68ca3a2cce1e360f2c05134b/ATTI60127e67a64b1602d6b63e80ba30e6acDF86FF7B/我的-trello-面板


# Milestone 2: Database Modeling & Design for MN MarketLink

## Project Proposal

### Application Features Overview

**MN MarketLink** is a comprehensive platform connecting Minnesota farmers markets with local communities. Key features include:

1. **Market Discovery**: Browse all farmers markets by location, date, and season
2. **Vendor Management**: Farmers and vendors register and manage their market appearances
3. **Product Catalog**: Detailed product listings with availability, pricing, and seasonal information
4. **Pre-Order System**: Customers browse products and place pre-orders for market pickup
5. **Order Fulfillment**: Vendors receive and manage customer orders for each market
6. **User Accounts**: Separate authentication for customers, vendors, and market administrators
7. **Search & Filtering**: Advanced search across markets, vendors, and products

### Core Entities & Relationships
- **Markets**: Physical locations hosting farmers markets on specific dates
- **Vendors**: Farmers/businesses selling at markets
- **Products**: Items available for sale by vendors
- **Customers**: Users placing pre-orders
- **Orders**: Pre-order transactions linking customers, vendors, products, and markets
- **Users**: Authentication system for all user types (customers, vendors, admins)

---

## Entity-Relationship Diagram (ERD)

### Core Entities & Attributes

#### 1. Markets
- **market_id** (PK, INT)
- **name** (VARCHAR(100))
- **location_address** (VARCHAR(200))
- **city** (VARCHAR(50))
- **state** (CHAR(2)) DEFAULT 'MN'
- **zip_code** (VARCHAR(10))
- **market_date** (DATE)
- **start_time** (TIME)
- **end_time** (TIME)
- **season_start** (DATE)
- **season_end** (DATE)
- **description** (TEXT)
- **is_active** (BOOLEAN) DEFAULT TRUE
- **created_at** (TIMESTAMP)

#### 2. Vendors
- **vendor_id** (PK, INT)
- **user_id** (FK, INT) → Users
- **business_name** (VARCHAR(100))
- **farm_name** (VARCHAR(100))
- **contact_phone** (VARCHAR(15))
- **website** (VARCHAR(200))
- **description** (TEXT)
- **logo_url** (VARCHAR(500))
- **is_organic_certified** (BOOLEAN)
- **created_at** (TIMESTAMP)

#### 3. Products
- **product_id** (PK, INT)
- **vendor_id** (FK, INT) → Vendors
- **name** (VARCHAR(100))
- **category** (VARCHAR(50)) ENUM('vegetables', 'fruits', 'dairy', 'meat', 'bakery', 'flowers', 'other')
- **description** (TEXT)
- **unit_type** (VARCHAR(20)) ENUM('lb', 'kg', 'each', 'bunch', 'dozen')
- **base_price** (DECIMAL(10,2))
- **image_url** (VARCHAR(500))
- **is_seasonal** (BOOLEAN)
- **availability_notes** (TEXT)
- **created_at** (TIMESTAMP)

#### 4. Market_Vendors (Junction Table)
- **market_vendor_id** (PK, INT)
- **market_id** (FK, INT) → Markets
- **vendor_id** (FK, INT) → Vendors
- **setup_location** (VARCHAR(100))
- **expected_arrival_time** (TIME)
- **special_requests** (TEXT)
- **is_confirmed** (BOOLEAN) DEFAULT FALSE

#### 5. Users
- **user_id** (PK, INT)
- **email** (VARCHAR(255)) UNIQUE
- **password_hash** (VARCHAR(255))
- **first_name** (VARCHAR(50))
- **last_name** (VARCHAR(50))
- **phone** (VARCHAR(15))
- **user_type** (ENUM('customer', 'vendor', 'admin', 'market_manager'))
- **is_active** (BOOLEAN) DEFAULT TRUE
- **created_at** (TIMESTAMP)
- **last_login** (TIMESTAMP)

#### 6. Customers
- **customer_id** (PK, INT)
- **user_id** (FK, INT) → Users
- **preferred_pickup_market** (INT) → Markets
- **delivery_instructions** (TEXT)
- **allergy_notes** (TEXT)

#### 7. Orders
- **order_id** (PK, INT)
- **customer_id** (FK, INT) → Customers
- **market_vendor_id** (FK, INT) → Market_Vendors
- **order_date** (TIMESTAMP)
- **pickup_date** (DATE)
- **status** (ENUM('pending', 'confirmed', 'ready', 'picked_up', 'cancelled'))
- **total_amount** (DECIMAL(10,2))
- **payment_status** (ENUM('pending', 'paid', 'refunded'))
- **special_instructions** (TEXT)

#### 8. Order_Items
- **order_item_id** (PK, INT)
- **order_id** (FK, INT) → Orders
- **product_id** (FK, INT) → Products
- **quantity** (INT)
- **unit_price** (DECIMAL(10,2))
- **subtotal** (DECIMAL(10,2))
- **notes** (TEXT)

### Key Relationships

1. **Markets ↔ Market_Vendors ↔ Vendors** (Many-to-Many)
   - A market has many vendors attending
   - A vendor can attend multiple markets
   - Junction table captures specific attendance details

2. **Vendors → Products** (One-to-Many)
   - Each vendor offers multiple products
   - Products belong to one vendor

3. **Users → Vendors/Customers** (One-to-One)
   - Users authenticate; vendor/customer data extends user profile
   - Supports role-based access control

4. **Customers → Orders** (One-to-Many)
   - Customers place multiple orders over time

5. **Orders → Order_Items** (One-to-Many)
   - Each order contains multiple products

6. **Market_Vendors → Orders** (One-to-Many)
   - Orders are tied to specific vendor attendance at markets

### Cardinality Summary
Markets 1 ↔ * Market_Vendors * ↔ 1 Vendors
Vendors 1 → * Products
Users 1 → 1 Vendors (subtype)
Users 1 → 1 Customers (subtype)
Customers 1 → * Orders
Orders 1 → * Order_Items
Market_Vendors 1 → * Orders
Products * ← * Order_Items
