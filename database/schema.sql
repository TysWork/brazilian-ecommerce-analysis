DROP TABLE IF EXISTS order_reviews;
DROP TABLE IF EXISTS order_payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS product_translation;
DROP TABLE IF EXISTS sellers;
DROP TABLE IF EXISTS geolocation;


CREATE TABLE IF NOT EXISTS geolocation (
    geolocation_zip_code_prefix INT PRIMARY KEY,
    geolocation_lat DOUBLE,
    geolocation_long DOUBLE,
    geolocation_city VARCHAR(30),
    geolocation_state VARCHAR(30),
); 

CREATE TABLE IF NOT EXISTS sellers (
    seller_id VARCHAR(50) PRIMARY KEY, 
    seller_zip_code_prefix INT,
    seller_city VARCHAR(30),
    seller_state VARCHAR(2)
    
);

CREATE TABLE IF NOT EXISTS product_translation (
    product_category_name VARCHAR(50) PRIMARY KEY,
    product_category_name_english VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category VARCHAR(100),
    product_name_length INT,
    product_description_length INT, 
    pdocut_photos_qty INT, 
    product_weight_g INT,
    product_height_cm INT,
    product_width_cm INT
);

CREATE TABLE IF NOT EXISTS customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(30),
    customer_state VARCHAR(2)
);

CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_date TIMESTAMP,
    oder_approved TIMESTAMP,
    delivered_to_carrier TIMESTAMP
    delivered_to_customer TIMESTAMP,
    estimated_delivery TIMESTAMP,
);

CREATE TABLE order_items (
    order_id VARCHAR(50) PRIMARY KEY,
    order_item_id VARCHAR(10),
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL (10,2)
);

CREATE TABLE order_payments (
order_id VARCHAR(50) PRIMARY KEY, 
payment_sequential INT,
payment_type 
);

CREATE TABLE order_reviews (

);

CREATE TABLE orders (

);
