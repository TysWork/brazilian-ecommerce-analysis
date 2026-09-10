-- 06_seller_performance.sql
-- Top sellers by delivered order revenue and volume

SELECT
    s.seller_id,
    s.seller_city,
    s.seller_state,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    COUNT(*) AS total_items_sold,
    ROUND(SUM(oi.price), 2) AS product_revenue,
    ROUND(SUM(oi.freight_value), 2) AS freight_revenue,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS gmv
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
JOIN sellers s
    ON oi.seller_id = s.seller_id
WHERE o.order_status = 'delivered'
GROUP BY
    s.seller_id,
    s.seller_city,
    s.seller_state
ORDER BY product_revenue DESC
LIMIT 20;