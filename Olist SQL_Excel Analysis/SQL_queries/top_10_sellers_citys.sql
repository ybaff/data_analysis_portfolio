-- Question: Which city/postcode/state contains the most sellers?
-- Tables: sellers.
-- Assumptions: All sellers had valid products. 
-- Output: top_10_sellers_city.csv
-- Validation

SELECT COUNT(s.seller_city), s.seller_city
FROM sellers s
GROUP BY s.seller_city
ORDER BY COUNT(s.seller_city) DESC
LIMIT 10;