-- Question: Which items are sold most/least??
-- Tables: order_items, orders, customers, category_name_translation
-- Assumptions: Only delivered orders (actual sales). 
-- Excludes: canceled, invoiced, shipped, processing
-- Output: top_10_items_sold.csv

SELECT COUNT(oi.product_id) AS sum_items, n_trns.product_category_name_english, o.order_status
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN category_name_translation n_trns ON p.product_category_name = n_trns.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY n_trns.product_category_name_english, o.order_status
ORDER BY sum_items DESC
LIMIT 10;