# Brazilian E-Commerce Sales and Customer Satisfaction Analysis

### Status: In Progress

## Project Overview

This project analyzes the Brazilian Olist e-commerce dataset using MariaDB, SQL, and Python. The goal is to understand marketplace performance across revenue trends, product categories, delivery performance, customer reviews, payment behavior, sellers, and geography.

The analysis focuses on delivered orders to avoid including canceled or unavailable orders in revenue and performance metrics.

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

## Project Goal

Analyze Brazilian e-commerce marketplace data to identify patterns in sales, delivery performance, product categories, customer satisfaction, payments, sellers, and geography.

## Business Questions

This project is organized around seven business questions:

1. What are the overall marketplace KPIs for delivered orders?
2. How did revenue, order volume, and average order value change over time?
3. Which product categories generated the most revenue?
4. Do late deliveries affect customer review scores?
5. Which payment methods are most common, and how much revenue do they represent?
6. Which sellers generated the most revenue and order volume?
7. Which customer states/cities generated the most orders and revenue?

## Data Preparation Notes

Product categories were translated from Portuguese to English using the product category translation table.

Products with missing category names were grouped as `Unknown` instead of being removed. These represented 1,537 delivered order items, or about 1.4% of delivered items and 1.3% of delivered GMV, so they were retained to keep revenue totals consistent.

Most analysis queries filter to delivered orders using:

```sql
WHERE o.order_status = 'delivered'
```

This keeps revenue, delivery, and review analysis focused on completed customer orders.

## Database Schema

The database contains the following main tables:

* `customers`
* `orders`
* `order_items`
* `order_payments`
* `order_reviews`
* `products`
* `product_translation`
* `sellers`
* `geolocation`

Key relationships used in the analysis:

* `orders.customer_id = customers.customer_id`
* `orders.order_id = order_items.order_id`
* `orders.order_id = order_reviews.order_id`
* `orders.order_id = order_payments.order_id`
* `order_items.product_id = products.product_id`
* `order_items.seller_id = sellers.seller_id`
* `products.product_category_name = product_translation.product_category_name`

## Analysis

### 1. KPI Overview

**Business question:**
What are the overall marketplace KPIs for delivered orders?

**SQL file:**
`analysis/01_kpi_overview.sql`

**Metrics included:**

* Total delivered orders
* Total unique customers
* Total sellers
* Total items sold
* Product revenue
* Freight revenue
* GMV
* Average order value
* Average items per order

**Finding:**

The delivered-order dataset includes 96,478 completed orders, 96,478 customers, and 2970 sellers. Delivered orders generated $13.22M in product revenue, $2.20M in freight revenue, and $15.42M in total GMV. The average order value was $159.83, with an average of 1.14 items per order.

| Metric | Value |
|---|---:|
| Total delivered orders | 96,478 |
| Total customers | 96,478 |
| Total sellers | 2,970 |
| Total product revenue | $13,221,498.11 |
| Total freight | $2,198,275.64 |
| Total GMV | $15,419,773.75 |
| Average items per order | 1.14 |
| Average order value | $159.83 |

---

### 2. Revenue Trends

**Business question:**
How did revenue, order volume, and average order value change over time?

**SQL file:**
`analysis/02_revenue_trends.sql`

**Metrics included:**

* Monthly delivered orders
* Monthly items sold
* Monthly product revenue
* Monthly freight revenue
* Monthly GMV
* Monthly average order value

**Finding:**
Monthly GMV and order volume increased substantially from early 2017 through 2018, showing marketplace growth over time. Revenue changes were mostly driven by changes in order volume, while average order value stayed within a narrower range and fluctuated month to month. The earliest months appear to contain limited activity, so they should be interpreted cautiously in comparison to later months. 

---

### 3. Category Performance

**Business question:**
Which product categories generated the most revenue?

**SQL file:**
`analysis/03_category_performance.sql`

**Metrics included:**

* Product category
* Total orders
* Total items sold
* Product revenue
* Freight revenue
* GMV
* Average item price

**Finding:**


The highest revenue categories were `health_beauty`, `watches_gifts`, `bed_bath_table`, `sports_leisure`, and `computers_accessories`. `health_beauty` led all categories with $1.23M in product revenue and $1.41M in GMV across 8,647 total orders.

Revenue was concentrated in high-volume categories rather only than high-price categories. For example, `computers` had the highest average item price of $1,098.92, but only had 177 delivered orders. In comparison, `health_beauty` had a much lower average item price of $130.28 but generated more revenue because of its much higher volume.

| Category | Total Orders | Items Sold | Product Revenue | GMV | Avg Item Price |
|---|---:|---:|---:|---:|---:|
| health_beauty | 8,647 | 9,465 | $1,233,131.72 | $1,412,089.53 | $130.28 |
| watches_gifts | 5,495 | 5,859 | $1,166,176.98 | $1,264,333.12 | $199.04 |
| bed_bath_table | 9,272 | 10,953 | $1,023,434.76 | $1,225,209.26 | $93.44 |
| sports_leisure | 7,530 | 8,431 | $954,852.55 | $1,118,256.91 | $113.25 |
| computers_accessories | 6,530 | 7,644 | $888,724.61 | $1,032,723.77 | $116.26 |
---

### 4. Delivery Performance and Review Scores

**Business question:**
Do late deliveries affect customer review scores?

**SQL file:**
`analysis/04_delivery_reviews.sql`

**Metrics included:**

* Delivery status
* Total orders
* Average review score
* Average delivery days
* Average days early or late

**Finding:**
Delivery performance showed a clear difference in customer satisfaction. Orders delivered on time or early had an average review score of 4.30, while late orders averaged 2.57.

Most delivered orders arrived on time or early, with 87,751 on-time/early orders compared with 7,613 late orders. On-time/early deliveries took 10.81 days on average and arrived 13.70 days before the estimated delivery date. Late deliveries took 31.34 days on average and arrived 8.77 days after the estimated delivery date.

This suggests that late delivery was strongly associated with lower customer review scoresi 

---

### 5. Payment Behavior

**Business question:**
Which payment methods are most common, and how much revenue do they represent?

**SQL file:**
`analysis/05_payment_behavior.sql`

**Metrics included:**

* Payment type
* Number of payments
* Total payment value
* Average payment value
* Average installments

**Finding:**
*To be added after analysis is finalized.*

---

### 6. Seller Performance

**Business question:**
Which sellers generated the most revenue and order volume?

**SQL file:**
`analysis/06_seller_performance.sql`

**Metrics included:**

* Seller ID
* Seller state
* Total orders
* Total items sold
* Product revenue
* GMV
* Average review score

**Finding:**
*To be added after analysis is finalized.*

---

### 7. Geographic Sales Analysis

**Business question:**
Which customer states/cities generated the most orders and revenue?

**SQL file:**
`analysis/07_geographic_sales.sql`

**Metrics included:**

* Customer state
* Customer city
* Total orders
* Total customers
* Product revenue
* GMV
* Average order value

**Finding:**
*To be added after analysis is finalized.*

## Visualizations

Planned visualizations:

* Monthly GMV and order volume trend
* Top product categories by revenue
* Average review score by delivery status
* Payment type revenue share
* Top seller states by revenue
* Customer orders by state

Visualizations will be created using Tableau after the SQL analysis files are finalized.

## Key Findings

*To be completed after analysis is finalized.*

Planned summary format:

* Finding 1
* Finding 2
* Finding 3
* Finding 4

## Next Steps

Future improvements could include:

* Analyze whether repeat customers are more valuable than one-time customers
* Compare freight costs against review scores and order value
* Identify product categories with high revenue but low customer satisfaction
* Add month-over-month revenue growth using window functions
* Create a Tableau dashboard for portfolio presentation
* Add screenshots of final visuals to the README

## Tools Used

* SQL
* MariaDB / MySQL
* Python
* Pandas
* Tableau
* Git / GitHub
