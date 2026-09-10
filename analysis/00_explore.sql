-- Initial dataset exploration and sanity checks

-- Preview core tables
SELECT *
FROM customers
LIMIT 10;

SELECT *
FROM orders
LIMIT 10;

SELECT *
FROM order_items
LIMIT 10;

SELECT *
FROM products
LIMIT 10;

SELECT *
FROM order_reviews
LIMIT 10;

SELECT *
FROM order_payments
LIMIT 10;

SELECT *
FROM sellers
LIMIT 10;

SELECT *
FROM product_translation
LIMIT 10;

-- Row counts by table
SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_order_items
FROM order_items;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_reviews
FROM order_reviews;

SELECT COUNT(*) AS total_payments
FROM order_payments;

SELECT COUNT(*) AS total_sellers
FROM sellers;

-- Order status distribution
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- Check item count per order
SELECT
    order_id,
    COUNT(*) AS items_in_order
FROM order_items
GROUP BY order_id
ORDER BY items_in_order DESC
LIMIT 20;

