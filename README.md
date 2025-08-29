🛒 Walmart Sales Analytics

This project demonstrates a comprehensive analytics pipeline for Walmart sales data. It integrates data preprocessing (Python), relational modeling (SQL), and business intelligence (Power BI) to extract statistically meaningful insights.

The analysis focuses on understanding customer behavior, revenue drivers, and geographic performance, applying structured data modeling and exploratory analytics to support evidence-based decision-making.


🧹 Data Preparation & Cleaning

Performed in Python (Jupyter Notebook) with a statistically robust approach:

Missing values: Quantified and imputed where feasible (e.g., median imputation for numerical fields, mode for categorical).

Outlier detection: Applied z-score thresholds and IQR filtering for payment values, shipping costs, and product dimensions.

Categorical standardization: Collapsed inconsistent state/city spellings and normalized product categories.

Temporal validation: Ensured monotonicity in timestamps (purchase date < approval date < delivery date).

Deduplication: Removed records with identical transaction keys.

The resulting dataset achieved >98% completeness and high integrity for downstream SQL modeling.


🗄️ Database Schema

The schema follows 3rd Normal Form (3NF) to minimize redundancy and ensure referential integrity.

Fact Table: Orders (transaction-level data)

Dimension Tables: Customers, Sellers, Products, Geolocation

Bridge Tables: Order_Items, Payments

Auxiliary Table: Trustpilot_Reviews (customer sentiment metadata)


📊 Analytical Findings

The Power BI dashboard provides descriptive, diagnostic, and trend analysis across multiple dimensions.

Key Statistical Insights:

Revenue Growth: CAGR of ~120% from 2016 to 2018 (0.1M → 8.7M).

Customer Growth: YoY increment of +20.95%, indicating expanding market penetration.

Order Economics:

Mean Order Value = $160.58

Mean Shipping Cost = $22.82 (≈14% of order value, a significant margin factor).

Geospatial Analysis:

São Paulo accounts for >12% of total revenue (~$2M).

Secondary clusters: Rio de Janeiro, Belo Horizonte, Brasília.

Product Category Mix:

Health & Beauty, Bed & Bath, and Sport & Leisure dominate with highest revenue share.

Long-tail categories (e.g., Garden Tools) show lower frequency but potential niche growth.

Seller Distribution:

Revenue per seller averages $5.12K.

Pareto distribution observed: top 10 sellers contribute >40% of total revenue.


📌 Future Directions

Predictive Analytics: Time-series forecasting (ARIMA/Prophet) for revenue prediction.

Customer Segmentation: Clustering (K-means, DBSCAN) to identify high-value cohorts.

Churn Analysis: Survival models to evaluate customer retention.

Operational Optimization: Statistical modeling of shipping costs vs. delivery performance.


👨‍💻 Author

Developed by Anjali Sakhpara – Data Engineering & Analytics Enthusiast.
