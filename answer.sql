-- =========================================================
-- Week 1 Assignment: Database Setup Script
-- Topic: Online Shop Management System
-- =========================================================

-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS online_shop_db;
USE online_shop_db;

-- Step 2: Create Tables
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Step 3: Insert Sample Data
INSERT INTO customers (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@example.com', '098-765-4321');

INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Wireless Mouse', 'Electronics', 25.99, 100),
('Mechanical Keyboard', 'Electronics', 75.50, 50),
('Coffee Mug', 'Home & Kitchen', 12.00, 200);

INSERT INTO orders (customer_id, total_amount) VALUES
(1, 101.49),
(2, 12.00);

-- Step 4: Verification Queries
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
