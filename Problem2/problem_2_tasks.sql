-- 1. Write SQL Queries:

-- a. Retrieve the names and stock quantities of all products.

SELECT 
    product_name,
    stock_quantity
FROM
    products;

----------------------------------------------------------------------------------------------------------------------------

-- b. Retrieve the product names and quantities for one of the orders placed.

SELECT 
    p.product_name,
    oi.quantity
FROM
    order_items AS oi
JOIN
    products p ON oi.product_id = p.id
WHERE
    oi.order_id = 1;

----------------------------------------------------------------------------------------------------------------------------

-- c. Retrieve all orders placed by a specific customer (including the ID’s of what was ordered and the quantities).

SELECT 
    o.id AS order_id,
    p.id AS product_id,
    p.product_name,
    oi.quantity
FROM
    orders o
JOIN
    order_items oi ON o.id = oi.order_id
JOIN
    products p ON oi.product_id = p.id
WHERE
    o.customer_id = 1;

----------------------------------------------------------------------------------------------------------------------------

-- 2. Update Data:
-- Perform an update to simulate the reducing of stock quantities of items after a customer places an order. Please describe or indicate which order you are simulating the reducton for

-- Check stock before update
SELECT 
    p.id,
    p.product_name,
    p.stock_quantity AS before_update,
    oi.quantity AS ordered_quantity
FROM
    products p
JOIN
    order_items oi ON p.id = oi.product_id
WHERE
    oi.order_id = 1;

-- Perform the update
UPDATE products p
SET stock_quantity = p.stock_quantity - oi.quantity
FROM order_items oi
WHERE oi.order_id = 1
AND p.id = oi.product_id;

-- Check stock after update
SELECT 
    p.id,
    p.product_name,
    p.stock_quantity AS after_update,
    oi.quantity AS ordered_quantity
FROM
    products p
JOIN
    order_items oi ON p.id = oi.product_id
WHERE
    oi.order_id = 1;

----------------------------------------------------------------------------------------------------------------------------

-- 3. Delete Data:

-- Remove one of the orders and all associated order items from the system.
SELECT o.id AS order_id, c.first_name, c.last_name, p.product_name, oi.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE o.id = 3;

-- Deleting the order items first
DELETE FROM order_items WHERE order_id = 3;

-- Then, delete the order itself
DELETE FROM orders WHERE id = 3;

-- Confirm that the order and its items have been deleted
SELECT * FROM orders WHERE id = 3;
SELECT * FROM order_items WHERE order_id = 3;
