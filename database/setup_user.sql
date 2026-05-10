CREATE DATABASE IF NOT EXISTS olist_ecommerce;

CREATE USER IF NOT EXISTS 'olist_user'@'localhost'
IDENTIFIED BY 'your_password_here';

GRANT ALL PRIVILEGES ON olist_ecommerce.*
TO 'olist_user'@'localhost';

FLUSH PRIVILEGES;
