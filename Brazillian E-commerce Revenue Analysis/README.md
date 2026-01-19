# Objective

This project analyses how revenue and order volume vary across Brazilian states using real e-commerce data. The goal is to understand whether differences in revenue are primarily driven by the number of orders or by higher-value orders.

# Data

The analysis uses the Olist Brazilian E-commerce Dataset (Kaggle), combining the following tables:

Customers – customer location data (state)

Orders – order-level information

Order Items – item-level prices and freight (shipping) costs

Each table represents a different level of granularity and was joined to enable state-level analysis.

# Method

Joined customers, orders, and order items using their respective keys

Defined revenue per item as price + freight_value

Aggregated data by customer state

# Calculated:

Total revenue per state

Order volume per state (count of unique orders)

Analysed the relationship between revenue and order volume

# Key Findings

States with higher order volume generate significantly higher total revenue

Revenue is strongly correlated with order volume, indicating that differences in revenue are mainly driven by the number of orders rather than unusually high order values

States with low order counts show more volatile revenue figures, highlighting the impact of sample size

# Limitations

Data is limited to transactions on the Olist platform and may not represent the entire Brazilian e-commerce market

Analysis is aggregated at the state level and does not account for time-based trends

Revenue is calculated at item level and aggregated upward, which assumes consistent pricing behaviour across states

# Tools Used

Python

pandas

Jupyter Notebook


