SHOW TABLES FROM olist_ecommerce;

SELECT * FROM customers;
SELECT * FROM order_items oi; 
SELECT * FROM products;
SELECT * FROM orders; 
SELECT * FROM product_translation pt;
-- Revenue & Order Trends

SELECT p.product_id, oi.price 
FROM products p
INNER JOIN order_items oi
	ON oi.price
WHERE oi.product_id = p.product_id
ORDER BY p.product_id;



