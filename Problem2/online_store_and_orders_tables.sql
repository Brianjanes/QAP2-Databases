----------------------------------------------------------------------------------------------------------------------------
-- Online Store Inventory and Orders System
----------------------------------------------------------------------------------------------------------------------------

-- Products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(75) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INTEGER NOT NULL
);

-- Customers table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
);

-- Orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Order Items table
CREATE TABLE order_items (
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

----------------------------------------------------------------------------------------------------------------------------
-- Insertions of data into each table.
----------------------------------------------------------------------------------------------------------------------------

-- Insert data into the products table
INSERT INTO products (product_name, price, stock_quantity) VALUES
('Cool Laptop', 1099.99, 15),
('Anchovies', 3.99, 193),
('Speaker Wire (10 ft length)', 2.99, 221),
('Miscelaneous Drake CDs', 5.99, 1033),
('Novelty Graphic t-shirt (Dog eating hot dog on back)', 19.99, 275),
('Discount Used Shoes (varying mismatched sizes)', 13.99, 1909);

-- Confirmation query
SELECT * FROM products;

----------------------------------------------------------------------------------------------------------------------------

-- Insert data into the customers table
INSERT INTO customers (first_name, last_name, email) VALUES
('Brian', 'Janes', 'janes.brian@customer.com'),
('Jane', 'Smith', 'jane.smith@customer.com'),
('Michael', 'Johnson', 'johnson.michael_1@customer.com'),
('Emily', 'Brown', 'brown_emily_420@customer.com'),
('David', 'Wilson', 'like_david_wilson_did@gmail.com');

-- Confirmation query
SELECT * FROM customers;

----------------------------------------------------------------------------------------------------------------------------

-- Insert data into the orders table
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2022-12-15'),
(2, '2023-09-01'),
(3, '2022-09-01'),
(4, '2024-01-15'),
(5, '2023-01-15'),
(2, '2024-01-15'),
(2, '2023-09-01'),
(3, '2022-09-01'),
(3, '2024-01-15'),
(5, '2023-01-15');

-- Confirmation query
SELECT * FROM orders;

----------------------------------------------------------------------------------------------------------------------------

-- Insert 5 different order items into the order_items table
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 3),
(3, 4, 4),
(4, 5, 5),
(5, 6, 6),
(6, 1, 7),
(7, 2, 8),
(8, 3, 9),
(9, 4, 10),
(10, 5, 11);

-- Confirmation query
SELECT 
    o.id AS order_id,
    p.product_name,
    oi.quantity
FROM 
    order_items oi
JOIN 
    orders o ON oi.order_id = o.id
JOIN 
    products p ON oi.product_id = p.id;
