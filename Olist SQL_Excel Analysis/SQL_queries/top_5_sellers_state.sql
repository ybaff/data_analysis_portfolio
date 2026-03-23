-- Question: Which city/postcode/state contains the most sellers?
-- Tables: sellers.
-- Assumptions: All sellers had valid products. 
-- Output: top_5_sellers_state.csv
-- Validation

SELECT COUNT(s.seller_state), s.seller_state
FROM sellers s
GROUP BY s.seller_state
ORDER BY COUNT(s.seller_state) DESC
LIMIT 5;