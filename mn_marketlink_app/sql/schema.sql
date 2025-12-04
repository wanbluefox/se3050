-- schema.sql
-- SQL Script for MySQL to create the MN MarketLink database schema.
-- Run this in MySQL Workbench or any MySQL client to implement the ERD.

CREATE DATABASE IF NOT EXISTS mn_marketlink;
USE mn_marketlink;

-- 8. Market_Address (Created first due to FK dependency in Markets)
-- Separate table to normalize address details and avoid transitive dependencies (e.g., zip_code → city/state).
CREATE TABLE Market_Address (
    zip_code VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    state CHAR(2) DEFAULT 'MN',
    location_address VARCHAR(200) NOT NULL
);

-- 1. Markets
-- References Market_Address for normalized location data.
CREATE TABLE Markets (
    market_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    market_date DATE,
    start_time TIME,
    end_time TIME,
    season_start DATE,
    season_end DATE,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (zip_code) REFERENCES Market_Address(zip_code) ON DELETE RESTRICT
);

-- 2. Vendors
-- Removed user_id FK (no Users table); added email for direct contact.
CREATE TABLE Vendors (
    vendor_id INT AUTO_INCREMENT PRIMARY KEY,
    business_name VARCHAR(100) NOT NULL,
    farm_name VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    contact_phone VARCHAR(15),
    website VARCHAR(200),
    description TEXT,
    logo_url VARCHAR(500),
    is_organic_certified BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Products
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    vendor_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    category ENUM('vegetables', 'fruits', 'dairy', 'meat', 'bakery', 'flowers', 'other') NOT NULL,
    description TEXT,
    unit_type ENUM('lb', 'kg', 'each', 'bunch', 'dozen') NOT NULL,
    base_price DECIMAL(10,2) NOT NULL,
    image_url VARCHAR(500),
    is_seasonal BOOLEAN,
    availability_notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vendor_id) REFERENCES Vendors(vendor_id) ON DELETE CASCADE
);

-- 4. Market_Vendors (Junction Table)
CREATE TABLE Market_Vendors (
    market_vendor_id INT AUTO_INCREMENT PRIMARY KEY,
    market_id INT NOT NULL,
    vendor_id INT NOT NULL,
    setup_location VARCHAR(100),
    expected_arrival_time TIME,
    special_requests TEXT,
    is_confirmed BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (market_id) REFERENCES Markets(market_id) ON DELETE CASCADE,
    FOREIGN KEY (vendor_id) REFERENCES Vendors(vendor_id) ON DELETE CASCADE
);

-- 5. Customers
-- Removed user_id FK (no Users table); added first_name, last_name, email, phone for complete profile.
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    preferred_pickup_market INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (preferred_pickup_market) REFERENCES Markets(market_id) ON DELETE SET NULL
);

-- 6. Orders
-- Removed total_amount to avoid redundancy (calculable from Order_Items.subtotal).
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    market_vendor_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    pickup_date DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'ready', 'picked_up', 'cancelled') DEFAULT 'pending',
    payment_status ENUM('pending', 'paid', 'refunded') DEFAULT 'pending',
    special_instructions TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (market_vendor_id) REFERENCES Market_Vendors(market_vendor_id) ON DELETE CASCADE
);

-- 7. Order_Items
CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    notes TEXT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE RESTRICT
);

-- Indexes for performance
CREATE INDEX idx_market_date ON Markets(market_date);
CREATE INDEX idx_vendor_id ON Products(vendor_id);
CREATE INDEX idx_product_category ON Products(category);
CREATE INDEX idx_order_status ON Orders(status);

-- Additional UNIQUE constraints to prevent duplicates
ALTER TABLE Markets ADD UNIQUE KEY uk_market_event (name, zip_code, market_date);
ALTER TABLE Vendors ADD UNIQUE KEY uk_vendor_business (business_name);
ALTER TABLE Products ADD UNIQUE KEY uk_product_vendor (vendor_id, name);