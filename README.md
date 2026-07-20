# E-Commerce Delivery, Review, and Category Performance Analysis

### In Progress

## How to Run:

1. Install required packages MariaDB and MySQLdb using: 
    `sudo apt install mariadb-server mariadb-client`
    `sudo apt install python3-mysqldb`
    `sudo service mariadb start`
2. Set up your olist_user through database/setup_user.sql (check password in
    both database/setup_user and scripts/load_data.py)
3. Run `sudo mariadb < setup_user.sql` or `sudo mariadb < database/setup_user.sql`
4. Test login wit `mysql -u olist_user -p olist_ecommerce` and enter `DBCONFIG` password.

## Project Goal:

Analyze how delivery performance, product category, and seller behavior affect customer satisfaction.

## Business Questions:

This project is organized into four analysis areas:

### 1. Revenue & Order Trends 

- Which product categories generate the most revenue?
- Which sellers generate the most revenue?
- Which states/cities drive the most orders?

### 2. Product & Category Performance 

- Which categories have the best/worst review scores?
- Which categories generate strong revenue but poor customer service? 

### 3. Delivery Performance

- Do late deliveries lower customer review scores?
- How do freight costs affect total order value?


### 4. Customer & Review Analytics

- Are repeat customers more valuable than one-time customers?
- How do freight costs affect total order value?
- What factors appear most onnected to low review scores?
 
