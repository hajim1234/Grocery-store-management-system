CREATE DATABASE IF NOT EXISTS grocery_store;
USE grocery_store;

CREATE TABLE uom (
    uom_id INT AUTO_INCREMENT PRIMARY KEY,
    uom_name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    uom_id INT,
    price_per_unit DOUBLE NOT NULL,
    FOREIGN KEY (uom_id) REFERENCES uom(uom_id)
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    total DOUBLE NOT NULL,
    datetime DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    quantity DOUBLE NOT NULL,
    total_price DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data
INSERT INTO uom (uom_name) VALUES ('kg'), ('units');
INSERT INTO products (name, uom_id, price_per_unit) VALUES ('Apple', 1, 100), ('Milk', 2, 50);
