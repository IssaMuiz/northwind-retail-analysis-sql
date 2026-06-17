SELECT
    c.id as customer_id,
    c.company,
    c.first_name,
    c.last_name,
    SUM(d.unit_price * d.quantity) as total_revenue
FROM
    customers c
    JOIN orders o ON c.id = o.customer_id
    JOIN order_details d ON o.id = d.order_id
    JOIN products p ON p.id = d.product_id
GROUP BY
    c.id
ORDER BY
    total_revenue DESC