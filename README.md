# Marketing-Analysis

# Introduction
This is an exploratory analysis project on marketing campaign data from Maven Analytics. The project goal was to learn factors that are significantly related to web purchases, uncover the most successful campaign, identify what the customers look like, and see which products performed best and which channel is underperforming. Two dashboards were built, one shows the marketing analytics while the other shows customer analytics.

# Tools
Excel, SQL Server, Tableau

# Data Collection
I downloaded the .csv files of the dataset and data dictionary and used **Excel** to access and do preliminary processing of the data, which involved exploring the dataset for missing data and detecting outliers. I copied the raw data and saved it to another worksheet named *working data* to work on the data and preserve the raw data. I used conditional formatting to highlight any blank values in the columns and renamed some columns for easier interpretation.

# Data Cleaning
Upon exploring the data, missing values were found in the income column only. To resolve the missing data in the income column, I created a histogram to see the distribution. Since the distribution was normal, I imputed the 24 blank values with the mean. I also created a box plot to see specific outliers and removed four records with customer age and income beyond the norm of the dataset. Once I saved the dataset, I saved it into another sheet named *cleaned data* and ingested the data into **SQL Server**

# Data Analysis
I explored and created a customer profile in SQL by counting the unique customer IDs and grouping the customers by respective categories such as Marital Status, Education, and Customer Age. Campaigns were then aggregated to see which was most accepted by customers. Next, to see which product performed best, I aggregated each product regarding each campaign. Following the aggregation, I used IIF() to apply a condition so that the revenue is only summed up if the campaign was accepted. For determining channel performance, I created a string to represent each channel (e.g., ‘catalog’), applied the alias channel for that column, and aggregated the number of purchases in that channel. I then used a UNION to stack the queries into a result-set to see how each channel performed on purchases. Next, I grouped countries by number of customers (based on ID) and SUM() of website visits. Lastly, I declared variables to extract correlation coefficients from the query by comparing web purchases to other factors.

# Data visualization
I made two dashboards. The first showed marketing analytics and used a Z-pattern to drill down into the data. Multi-dimension selectors were used to filter on each campaign and product. I also made buttons to filter the years in the dataset. 

![iFood Marketing](https://github.com/user-attachments/assets/47bdb6ad-f58a-47d3-b2da-bc4a10a2da40)

The second dashboard showed customer analytics. A sheet selector swaps between the cohort analysis on marital status and the customer purchase frequency, the latter using a parameter to change the channel being viewed in the chart. A correlation and cluster were also built, with the cluster revealing a hidden crosstab chart of the selected segment’s details when a mark in that cluster is selected.

![IFood Customers](https://github.com/user-attachments/assets/60633ba9-c69a-489d-9c9a-480bedcbdfc6), ![IFood Customers (1)](https://github.com/user-attachments/assets/55f7a825-168d-4519-a4de-67cb5a4b5339)

# Insights
In the customer profile, married couples, graduates, and ages between 30 to 50 made up most of the customers. Wine and Meat were the best-selling products overall, and the number of kids at home had a statistically significant negative correlation with web purchases. Between 2012 and 2014 while excluding the last campaign, campaign 4 was the most accepted, but campaign 5 had generated the most incremental revenue across products except for fish. Lastly, by total purchases, the ‘Deals’ channel underperformed, but by unique purchases the ‘Catalog’ channel underperformed. Lastly, with over 30 in count, Spain has the most visits per month, with there being between 2 to 5 visits each time.


