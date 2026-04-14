-- Question: What are the stats for order funnels? (placed, approved, shipped, delivered)
-- Tables: orders
-- Includes: placed orders, approved orders, shipped orders, delivered orders.
-- Output: order_funnel.csv

SELECT '1. Placed' as stage, COUNT(order_id) as count FROM orders WHERE order_purchase_timestamp IS NOT NULL
UNION ALL
SELECT '2. Approved' as stage, COUNT(order_id) as count FROM orders WHERE order_approved_at IS NOT NULL
UNION ALL
SELECT '3. Shipped' as stage, COUNT(order_id) as count FROM orders WHERE order_delivered_carrier_date IS NOT NULL
UNION ALL
SELECT '4. Delivered' as stage, COUNT(order_id) as count FROM orders WHERE order_status = 'delivered'
ORDER BY count DESC;
