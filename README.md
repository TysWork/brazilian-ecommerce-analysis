# E-Commerce Delivery, Review, and Category Performance Analysis

### In Progress

## How to Run

1. Install MariaDB and the required Python package:

```bash
sudo apt update
sudo apt install mariadb-server mariadb-client python3-mysqldb
```

2. Start MariaDB:

```bash
sudo service mariadb start
```

3. Check that the username and password match in `database/setup_user.sql` and `scripts/load_data.py`.

4. Create the database and user:

```bash
sudo mariadb < database/setup_user.sql
```

5. Test the login:

```bash
mysql -u olist_user -p olist_ecommerce
```

Enter the password stored in `DB_CONFIG`.

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
 
