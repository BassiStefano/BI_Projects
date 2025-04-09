
/* This query allows to make a data analysis for comparing the sales and the claims
   of cars with and without an alarm system.
   I have taken into account the total number of claims and the ratio.
   I have defined the ratio as the number of total claims divided by
   the number of the total amount of sales without claims.
*/ 

WITH 
NO_claims AS(
		-- tot_NO_claims per has_alarm_system
         SELECT   COUNT(car_id_sales) AS tot_NO_claims
                  ,has_alarm_system
         FROM     [dbo].[FINAL_sales] 
                  INNER JOIN [dbo].[FINAL_details] ON [dbo].[FINAL_sales].car_id_sales = [dbo].[FINAL_details].car_id_details
                  INNER JOIN [dbo].[FINAL_claims]  ON [dbo].[FINAL_sales].car_id_sales = [dbo].[FINAL_claims].car_id_claims
         WHERE    claim_number IS NULL
         GROUP BY has_alarm_system),

YES_claims AS(
		-- tot_claims per has_alarm_system
         SELECT   COUNT(car_id_sales) AS tot_claims
                  ,has_alarm_system
         FROM     [dbo].[FINAL_sales] 
                  INNER JOIN [dbo].[FINAL_details] ON [dbo].[FINAL_sales].car_id_sales = [dbo].[FINAL_details].car_id_details
                  INNER JOIN [dbo].[FINAL_claims]  ON [dbo].[FINAL_sales].car_id_sales = [dbo].[FINAL_claims].car_id_claims
         WHERE    claim_number IS NOT NULL
         GROUP BY has_alarm_system)

SELECT   YES_claims. has_alarm_system
         ,NO_claims.tot_NO_claims 
         ,YES_claims.tot_claims
         ,ROUND(CAST(YES_claims.tot_claims AS FLOAT)/CAST(NO_claims.tot_NO_claims AS FLOAT)*100,2) AS ratio 
FROM     YES_claims 
         INNER JOIN NO_claims ON YES_claims.has_alarm_system =NO_claims.has_alarm_system
ORDER BY ratio
--ORDER BY tot_NO_claims desc
