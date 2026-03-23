-- Question: Which day/hour/month/ was most popular?
-- Tables: order_items, orders, customers, category_name_translation
-- Assumptions: Only delivered orders (actual sales). 
-- Excludes: canceled, invoiced, shipped, processing
-- Output: most_popular_month.csv

SELECT TO_CHAR(order_purchase_timestamp, 'YYYY-MM') AS month, COUNT(*) AS order_count
FROM orders
WHERE orders.order_status = 'delivered'
GROUP BY TO_CHAR(order_purchase_timestamp, 'YYYY-MM')
ORDER BY month;