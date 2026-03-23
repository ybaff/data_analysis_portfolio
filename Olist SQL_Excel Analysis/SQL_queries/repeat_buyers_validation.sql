-- Question: How big of an impact do repeat buyers have on the profit of the company?
-- Tables: order_items, orders, customers,
-- Assumptions: Only delivered orders (actual sales). 
-- Excludes: canceled, invoiced, shipped, processing
-- Output: repeat_buyers.csv

WITH customer_stats AS (
    SELECT 
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(oi.price + oi.freight_value) AS total_spent
    FROM customers c
    INNER JOIN orders o ON c.customer_id = o.customer_id
    INNER JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id
)
SELECT 
    CASE WHEN total_orders > 1 THEN 'Repeat' ELSE 'One-Time' END AS type,
    SUM(total_spent) AS group_revenue,
    SUM(SUM(total_spent)) OVER () AS grand_total_revenue
FROM customer_stats
GROUP BY 1;