-- Question: Which hour/day/week/month was most popular?
-- Tables: order_items, orders, customers, category_name_translation
-- Assumptions: Only delivered orders (actual sales). 
-- Excludes: canceled, invoiced, shipped, processing
-- Output: most_popular_weeks.csv

SELECT DATE_TRUNC('week', order_purchase_timestamp) AS order_week, COUNT(*) AS order_count
FROM orders
WHERE order_status = 'delivered'
GROUP BY order_week
ORDER BY order_count DESC;