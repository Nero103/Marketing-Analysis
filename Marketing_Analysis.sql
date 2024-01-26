-- Average total amount spent on products
SELECT 
	ROUND(AVG(MntWines),2) as avg_wines,
	ROUND(AVG(MntFruits),2) as avg_fruits,
	ROUND(AVG(MntMeatProducts),2) as avg_meats,
	ROUND(AVG(MntFishProducts),2) as avg_fish,
	ROUND(AVG(MntSweetProducts),2) as avg_sweets,
	ROUND(AVG(MntGoldProds),2) as avg_gold
FROM
	['cleaned_marketing_data $'];

-- Earliest and most Recent birthyear
SELECT
	MIN(YearBirth) as min_birthyear,
	MAX(YearBirth) as max_birthyear
FROM
	['cleaned_marketing_data $'];

-- Lowest, average, and highest income
SELECT
	MIN(Income) as min_income,
	ROUND(AVG(Income),2) as avg_income,
	MAX(Income) as max_income
FROM
	['cleaned_marketing_data $'];

/* Customer Profile */

-- Marital status frequency
SELECT
	MaritalStatus, 
	COUNT(ID) as number_of_customers
FROM
	['cleaned_marketing_data $']
GROUP BY MaritalStatus;

-- Singles status frequency
WITH single_cust AS (
SELECT
	MaritalStatus, 
	COUNT(ID) as number_of_customers
FROM
	['cleaned_marketing_data $']
GROUP BY MaritalStatus
)
SELECT
	SUM(IIF(MaritalStatus IN ('YOLO', 'Absurd', 'Alone', 'Single'), number_of_customers, 0)) AS singles
FROM
	single_cust;

-- Education frequency
SELECT
	Education, 
	COUNT(ID) as number_of_customers
FROM
	['cleaned_marketing_data $']
GROUP BY Education;

-- Age frequency
SELECT
	COUNT(ID) as number_of_customers,
	(YEAR(GETDATE()) - YearBirth) as customer_age
FROM
	['cleaned_marketing_data $']
GROUP BY
	YEAR(GETDATE()) - YearBirth;

-- Number of Marketing Campaign Acceptance 
SELECT
	SUM(AcceptedCmp1) as campaign_1,
	SUM(AcceptedCmp2) as campaign_2,
	SUM(AcceptedCmp3) as campaign_3,
	SUM(AcceptedCmp4) as campaign_4,
	SUM(AcceptedCmp5) as campaign_5,
	SUM(Response) as last_campaign
FROM
	['cleaned_marketing_data $'];

/* Incremental Revenue per Product */

-- What is the Incremental Revenue for Wine Products?
SELECT
	SUM(IIF(AcceptedCmp1 = 1, MntWines * AcceptedCmp1, 0)) as campaign_1_wine,
	SUM(IIF(AcceptedCmp2 = 1, MntWines * AcceptedCmp2, 0)) as campaign_2_wine,
	SUM(IIF(AcceptedCmp3 = 1, MntWines * AcceptedCmp3, 0)) as campaign_3_wine,
	SUM(IIF(AcceptedCmp4 = 1, MntWines * AcceptedCmp4, 0)) as campaign_4_wine,
	SUM(IIF(AcceptedCmp5 = 1, MntWines * AcceptedCmp5, 0)) as campaign_5_wine,
	SUM(IIF(Response = 1, MntWines * Response, 0)) as last_campaign_wine
FROM
	['cleaned_marketing_data $'];

-- What is the Incremental Revenue for Fruit Products?
SELECT
	SUM(IIF(AcceptedCmp1 = 1, MntFruits * AcceptedCmp1, 0)) as campaign_1_fruit,
	SUM(IIF(AcceptedCmp2 = 1, MntFruits * AcceptedCmp2, 0)) as campaign_2_fruit,
	SUM(IIF(AcceptedCmp3 = 1, MntFruits * AcceptedCmp3, 0)) as campaign_3_fruit,
	SUM(IIF(AcceptedCmp4 = 1, MntFruits * AcceptedCmp4, 0)) as campaign_4_fruit,
	SUM(IIF(AcceptedCmp5 = 1, MntFruits * AcceptedCmp5, 0)) as campaign_5_fruit,
	SUM(IIF(Response = 1, MntFruits * Response, 0)) as last_campaign_fruit
FROM
	['cleaned_marketing_data $'];

-- What is the Incremental Revenue for Meat Products?
SELECT
	SUM(IIF(AcceptedCmp1 = 1, MntMeatProducts * AcceptedCmp1, 0)) as campaign_1_meat_rev,
	SUM(IIF(AcceptedCmp2 = 1, MntMeatProducts * AcceptedCmp2, 0)) as campaign_2_meat_rev,
	SUM(IIF(AcceptedCmp3 = 1, MntMeatProducts * AcceptedCmp3, 0)) as campaign_3_meat_rev,
	SUM(IIF(AcceptedCmp4 = 1, MntMeatProducts * AcceptedCmp4, 0)) as campaign_4_meat_rev,
	SUM(IIF(AcceptedCmp5 = 1, MntMeatProducts * AcceptedCmp5, 0)) as campaign_5_meat_rev,
	SUM(IIF(Response = 1, MntMeatProducts * Response, 0)) as last_campaign_meat_rev
FROM
	['cleaned_marketing_data $'];

-- What is the Incremental Revenue for Fish Products?
SELECT
	SUM(IIF(AcceptedCmp1 = 1, MntFishProducts * AcceptedCmp1, 0)) as campaign_1_fish_rev,
	SUM(IIF(AcceptedCmp2 = 1, MntFishProducts * AcceptedCmp2, 0)) as campaign_2_fish_rev,
	SUM(IIF(AcceptedCmp3 = 1, MntFishProducts * AcceptedCmp3, 0)) as campaign_3_fish_rev,
	SUM(IIF(AcceptedCmp4 = 1, MntFishProducts * AcceptedCmp4, 0)) as campaign_4_fish_rev,
	SUM(IIF(AcceptedCmp5 = 1, MntFishProducts * AcceptedCmp5, 0)) as campaign_5_fish_rev,
	SUM(IIF(Response = 1, MntFishProducts * Response, 0)) as last_campaign_fish_rev
FROM
	['cleaned_marketing_data $'];

-- What is the Incremental Revenue for Sweet Products?
SELECT
	SUM(IIF(AcceptedCmp1 = 1, MntSweetProducts * AcceptedCmp1, 0)) as campaign_1_sweet_rev,
	SUM(IIF(AcceptedCmp2 = 1, MntSweetProducts * AcceptedCmp2, 0)) as campaign_2_sweet_rev,
	SUM(IIF(AcceptedCmp3 = 1, MntSweetProducts * AcceptedCmp3, 0)) as campaign_3_sweet_rev,
	SUM(IIF(AcceptedCmp4 = 1, MntSweetProducts * AcceptedCmp4, 0)) as campaign_4_sweet_rev,
	SUM(IIF(AcceptedCmp5 = 1, MntSweetProducts * AcceptedCmp5, 0)) as campaign_5_sweet_rev,
	SUM(IIF(Response = 1, MntSweetProducts * Response, 0)) as last_campaign_sweet_rev
FROM
	['cleaned_marketing_data $'];

-- What is the Incremental Revenue for Gold Products?
SELECT
	SUM(IIF(AcceptedCmp1 = 1, MntGoldProds * AcceptedCmp1, 0)) as campaign_1_gold_rev,
	SUM(IIF(AcceptedCmp2 = 1, MntGoldProds * AcceptedCmp2, 0)) as campaign_2_gold_rev,
	SUM(IIF(AcceptedCmp3 = 1, MntGoldProds * AcceptedCmp3, 0)) as campaign_3_gold_rev,
	SUM(IIF(AcceptedCmp4 = 1, MntGoldProds * AcceptedCmp4, 0)) as campaign_4_gold_rev,
	SUM(IIF(AcceptedCmp5 = 1, MntGoldProds * AcceptedCmp5, 0)) as campaign_5_gold_rev,
	SUM(IIF(Response = 1, MntGoldProds * Response, 0)) as last_campaign_gold_rev
FROM
	['cleaned_marketing_data $'];

/* Channel Performance */

-- Which channel is under performing?
SELECT
	'discount' as channel,
	SUM(NumDealsPurchases) as total_purchase
FROM
	['cleaned_marketing_data $']
UNION
SELECT
	'web' as channel,
	SUM(NumWebPurchases) as total_purchase
FROM
	['cleaned_marketing_data $']
UNION
SELECT
	'catalog' as channel,
	SUM(NumCatalogPurchases) as total_purchase
FROM
	['cleaned_marketing_data $']
UNION
SELECT
	'onsite' as channel,
	SUM(NumStorePurchases) as total_purchase
FROM
	['cleaned_marketing_data $']
ORDER BY total_purchase ASC;

-- What is the frequency of customers and website visits in month per country?
SELECT
	Country,
	COUNT(ID) as number_of_customers,
	SUM(NumWebVisitsMonth) as total_website_visits_in_month
FROM
	['cleaned_marketing_data $']
GROUP BY
	Country
ORDER BY
	3 DESC;