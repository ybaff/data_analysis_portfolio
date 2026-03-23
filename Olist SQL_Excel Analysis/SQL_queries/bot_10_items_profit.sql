-- Question: Which items generate the most/least profit?
-- Tables: order_items, customers, category_name_translation
-- Assumptions: Profit = revenue * 0.25. Invoiced/canceled orders excluded.
-- Output: bot_10_items_profit.csv

SELECT SUM(oi.estimated_profit) AS total_profit, n_trns.product_category_name_english,
SUM(oi.freight_value)
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN category_name_translation n_trns ON p.product_category_name = n_trns.product_category_name
GROUP BY n_trns.product_category_name_english
ORDER BY total_profit ASC
LIMIT 10;