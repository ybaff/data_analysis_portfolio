Sales Performance Analysis - Superstore Dataset


# Objective

The three questions to be answered were:
Which category of items makes the most gross profit?
Which category of items makes the most profit per order?
Which category would have the highest theoretical net profit (discounts removed)?

This project analyses the revenue across each category within the dataset. This can give us an insight into which categories are most successful with our customers, and which categories are underperforming, which could result in increase in revenue.

# Dataset Overview

This dataset, sourced from kaggle, shows the relevant information relating to the purchase of a shipment of goods by the customer, including the price that it was sold at, the amount of profit generated from one shipment, the postal code of the delivery, and the class of the delivery. One row represents one delivery.

# Methodology

When I loaded in the dataset, I first got a general sense of the data, such as the information contained within each row, and the names of each category. I then made a new column, called theoretical profit, for each row, which reverses the discount applied on the shipment. From there I grouped the data based on each category and produced a table which included the amount of individual items sold per category, the average profit per item per category, the total gross of profit per category, and the total theoretic gross profit per category. I then generated charts based on my findings.

# Key Findings

Theoretical gross profit was significantly lower than gross profit. This meant the reversal of discounts amplified the negative numbers in the profit column, or the amount of money lost. 
Technology has a significantly higher profit amount, per item, compared to the other two categories, Office supplies and Furniture, indicating a high value to the customers.
Technology had a significantly higher theoretical gross profit amount, compared to the two other categories, meaning less discounts were put on each shipment
Office supplies had a significant more amount of quantity sold, which in profit wise, makes up for the smaller amount in profit per item
Furniture had a significantly lower total gross profit, more than 50%, indicating that this does not have a significant impact on general income


# Interpretation

Changes in theoretical profit indicates discounts were generated when items weren’t being sold, and sold at lower prices in order to lower stock and prevent value depreciation.
The high average profit per item in technology indicates a very high value to customers, which can allow for higher pricing and profit.
Office supplies have a high quantity, which indicates an ease of access to buy from suppliers, which is needed to generate reasonable profit
Furniture had the lowest gross profit, and a quantity similar to technology, which means this category is of lesser importance to the business.

# Limitations

Purchases limited to USA, doesn’t represent needs worldwide
Purchases limited to customers that know brand, doesn’t represent needs of the wider American population
Validation of purchase and shipment is not clear
Specific sub-categories not explored, could hint to specific items being popular

# Conclusion

In conclusion, technology has the most profit per item, and office supplies has the most individual purchases in the categories, both generating high amounts of profit for the company, however, furniture is a less important aspect for profit. Limited exploration of sub-categories could mask important details, and values only represent customer needs of the American market of buyers that know the company.

