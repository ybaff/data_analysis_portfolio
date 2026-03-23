-- Question: Which city/postcode/state contains the most sellers?
-- Tables: sellers.
-- Assumptions: All sellers had valid products. 
-- Output: bot_100_sellers_zip.csv
-- Validation

SELECT COUNT(s.seller_zip_code_prefix), s.seller_zip_code_prefix
FROM sellers s
GROUP BY s.seller_zip_code_prefix
ORDER BY COUNT(s.seller_zip_code_prefix) ASC
LIMIT 100;