

/* 
We have cleaned the three tables so we can join them to get the final table
On which I can perform the analysis
*/

QUERYR 1.4
SELECT *
INTO [dbo].[FINAL_complessiva] 
FROM [dbo].[FINAL_sales] 
     INNER JOIN [dbo].[FINAL_details] ON [dbo].[FINAL_sales].car_id_sales = [dbo].[FINAL_details].car_id_details
     INNER JOIN [dbo].[FINAL_claims]  ON [dbo].[FINAL_sales].car_id_sales = [dbo].[FINAL_claims].car_id_claims
