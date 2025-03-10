

/*
Since I have to join the 3 tables, I have to make sure that the 
Car_id (primary key) are the same in the rows of the 3 tables.
I don’t have to take this result for granted since we have removed
some rows in the step before.
*/

QUERY 1.3A
SELECT *
INTO  [dbo].[FINAL_sales]
FROM  [dbo].[sales_filtered]
WHERE [dbo].[sales_filtered].car_id_sales IN (
      SELECT car_id_details
      FROM   [dbo].[details_filtered]
             INTERSECT
      SELECT car_id_claims
      FROM   [dbo].[claims_filtered]
             INTERSECT
      SELECT car_id_sales
      FROM   [dbo].[sales_filtered])


QUERY 1.3B
SELECT *
INTO  [dbo].[FINAL_details]
FROM  [dbo].[details_filtered]
WHERE [dbo].[details_filtered].car_id_details IN (
      SELECT car_id_details
      FROM   [dbo].[details_filtered]
             INTERSECT
      SELECT car_id_claims
      FROM   [dbo].[claims_filtered]
             INTERSECT
      SELECT car_id_sales
      FROM   [dbo].[sales_filtered])

QUERY 1.3C
SELECT *
INTO  [dbo].[FINAL_claims]
FROM  [dbo].[claims_filtered]
WHERE [dbo].[claims_filtered].car_id_claims IN (
      SELECT car_id_details
      FROM   [dbo].[details_filtered]
             INTERSECT
      SELECT car_id_claims
      FROM   [dbo].[claims_filtered]
             INTERSECT
      SELECT car_id_sales
      FROM   [dbo].[sales_filtered])
