-- Key Performance Indicator
SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    COUNT(DISTINCT oi.seller_id) AS total_sellers,
    ROUND(SUM(oi.freight_value), 2) AS total_freight,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_gmv,
    ROUND(SUM(oi.price), 2) AS total_product_revenue,
    ROUND(COUNT(*) / COUNT(DISTINCT o.order_id), 2) AS avg_items_per_order,
    ROUND(SUM(oi.price + oi.freight_value) / COUNT(DISTINCT o.order_id), 2)
    AS avg_order_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered';
