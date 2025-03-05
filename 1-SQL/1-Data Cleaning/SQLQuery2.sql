

/*
Since there were rows with values that create ambiguity,
I’ve dediced to remove them through the following queries.
It has been a good solution since the quantity of the removed rows
Is the 1.4% of the total number of rows.
*/

QUERY 1.2A
SELECT *
INTO  [dbo].[sales_filtered]
FROM  [dbo].[car_sales]
WHERE car_id_sales NOT IN (
      SELECT   car_id_sales
      FROM     [dbo].[car_sales]
      GROUP BY car_id_sales
      HAVING   COUNT(car_id_sales)>1)

QUERY 1.2B
SELECT *
INTO  dbo.details_filtered
FROM  dbo.car_details
WHERE car_id_details NOT IN (
      SELECT   car_id_details
      FROM     [dbo].[car_details]
      GROUP BY car_id_details
      HAVING   COUNT(car_id_details)>1)

QUERY 1.2C
SELECT *
INTO  dbo.claims_filtered
FROM  dbo.car_claims
WHERE car_id_claims NOT IN (
      SELECT   car_id_claims
      FROM     [dbo].[car_claims]
      GROUP BY car_id_claims
      HAVING   COUNT(car_id_claims)>1)
