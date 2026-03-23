-- Question: Which items are most frequently bought in an order?
-- Tables: order_items, orders, products, category_name_translation
-- Assumptions: Only delivered orders (actual sales). 
-- Excludes: canceled, invoiced, shipped, processing
-- Output: bot10_most_freq_items.csv

SELECT n_trns.product_category_name_english AS product_name,
COUNT(DISTINCT oi.product_id) AS order_appearences
FROM order_items oi
INNER JOIN products p ON oi.product_id = p.product_id
INNER JOIN orders o ON oi.order_id = o.order_id
INNER JOIN category_name_translation n_trns ON 
p.product_category_name = n_trns.product_category_name
WHERE o.order_status = 'delivered'
GROUP BY product_name
ORDER BY COUNT(DISTINCT oi.product_id) ASC
LIMIT 10;