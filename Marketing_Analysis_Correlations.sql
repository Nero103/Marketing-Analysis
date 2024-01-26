/* Correlations */

-- What significant factors are related to web purchases?

-- Calcualate correlation coefficient

DECLARE @Number INT, @SumValue1 FLOAT, @SumValue2 FLOAT, @SumValue1Squared FLOAT, @SumValue2Squared FLOAT, 
		@SumProduct FLOAT;

SELECT 
	@Number = COUNT(*),
	@SumValue1 = SUM(NumWebPurchases),
	@SumValue2 = SUM(KidHome),
	@SumValue1Squared = SUM(NumWebPurchases * NumWebPurchases),
	@SumValue2Squared = SUM(KidHome * KidHome),
	@SumProduct = SUM(NumWebPurchases * KidHome)
FROM
	['cleaned_marketing_data $'];

-- Calculate correlation coefficient (pearson)

DECLARE @Correlation FLOAT;

SELECT
	@Correlation =
	(@Number * @SumProduct - @SumValue1 * @SumValue2) /
	(SQRT((@Number * @SumValue1Squared - POWER(@SumValue1, 2)) * (@Number * @SumValue2Squared - POWER(@SumValue2, 2))))
FROM
	['cleaned_marketing_data $'];

SELECT ROUND(@Correlation,2) as correlation_coefficient