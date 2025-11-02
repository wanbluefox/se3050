SQL Script for MySQL Workbench

-- 1. Markets
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
    FOREIGN KEY (zip_code) REFERENCES Market_Address(zip_code)
);

-- 2. Vendors
CREATE TABLE Vendors (
    vendor_id INT AUTO_INCREMENT PRIMARY KEY,
    business_name VARCHAR(100) NOT NULL,
    farm_name VARCHAR(100),
    contact_phone VARCHAR(15),
    website VARCHAR(200),
    description TEXT,
    logo_url VARCHAR(500),
    is_organic_certified BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
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
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    preferred_pickup_market INT,  
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (preferred_pickup_market) REFERENCES Markets(market_id) ON DELETE SET NULL
);

-- 6. Orders
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

-- 8. Market_Address
CREATE TABLE Market_Address (
    zip_code VARCHAR(10) PRIMARY KEY,
    city VARCHAR(50),
    state CHAR(2),
    location_address VARCHAR(200)
);