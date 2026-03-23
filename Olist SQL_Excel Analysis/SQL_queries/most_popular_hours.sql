-- Question: Which day/hour/month/ was most popular?
-- Tables: order_items, orders, customers, category_name_translation
-- Assumptions: Only delivered orders (actual sales). 
-- Excludes: canceled, invoiced, shipped, processing
-- Output: most_popular_hour.csv

SELECT EXTRACT(HOUR FROM order_purchase_timestamp) AS hour, COUNT(*) AS order_count
FROM orders
WHERE orders.order_status = 'delivered'
GROUP BY EXTRACT(HOUR FROM order_purchase_timestamp)
ORDER BY hour;