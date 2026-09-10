SELECT 
    COALESCE(pt.product_category_name_english, p.product_category_name, 'Unknown') AS category,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    COUNT(*) AS total_items_sold,
    ROUND(SUM(oi.price), 2) AS product_revenue,
    ROUND(SUM(oi.freight_value), 2) AS freight_revenue,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS gmv,
    ROUND(AVG(oi.price), 2) AS avg_item_price
FROM order_items oi
JOIN orders o
    ON oi.order_id = o.order_id
JOIN products p
    ON oi.product_id = p.product_id
LEFT JOIN product_translation pt
    ON p.product_category_name = pt.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY category
ORDER BY product_revenue DESC;