-- Customer geography by delivered order volume and GMV
SELECT
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(*) AS total_items_sold,
    ROUND(SUM(oi.price), 2) AS product_revenue,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS gmv,
    ROUND(
        SUM(oi.price + oi.freight_value) / COUNT(DISTINCT o.order_id), 2
        ) AS avg_order_value
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY total_orders DESC;

-- Supporting query: top customer cities by GMV

SELECT
    c.customer_city,
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT c.customer_unique_id) AS total_customers,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS gmv,
    ROUND(
        SUM(oi.price + oi.freight_value) / COUNT(DISTINCT o.order_id),
        2
    ) AS avg_order_value
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY
    c.customer_city,
    c.customer_state
ORDER BY gmv DESC
LIMIT 20;