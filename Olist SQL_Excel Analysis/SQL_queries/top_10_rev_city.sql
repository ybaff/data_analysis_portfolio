-- Question: Which cities have the highest revenue?
-- Tables: orders, customers, order_items
-- Assumptions: Revenue = price + freight. Invoiced/canceled orders excluded.
-- Output: top_10_rev_city.csv

SELECT customers.customer_city,
SUM(order_items.price + order_items.freight_value) AS total_revenue
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
WHERE orders.order_status = 'delivered'
GROUP BY customers.customer_city
ORDER BY total_revenue DESC
LIMIT 10;