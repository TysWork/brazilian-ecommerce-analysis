-- Payment method usage and payment value for delivered orders

SELECT
    op.payment_type,
    COUNT(*) AS payment_count,
    COUNT(DISTINCT op.order_id) AS total_orders,
    ROUND(SUM(op.payment_value), 2) AS total_payment_value,
    ROUND(AVG(op.payment_value), 2) AS avg_payment_value
FROM order_payments op
JOIN orders o
    ON op.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY op.payment_type
ORDER BY payment_count DESC;

-- Credit card installment behavior

SELECT
    op.payment_installments,
    COUNT(*) AS payment_records,
    COUNT(DISTINCT op.order_id) AS total_orders,
    ROUND(SUM(op.payment_value), 2) AS total_payment_value,
    ROUND(AVG(op.payment_value), 2) AS avg_payment_value
FROM order_payments op
JOIN orders o
    ON op.order_id = o.order_id
WHERE o.order_status = 'delivered'
  AND op.payment_type = 'credit_card'
GROUP BY op.payment_installments
ORDER BY op.payment_installments;