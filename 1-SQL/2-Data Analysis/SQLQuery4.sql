
/* This query allows to make a data analysis for understanding which is the best
   fuel type taking into account the total number of claims and the ratio.
   I have defined the ratio as the number of total claims divided by
   the number of the total amount of sales without claims.
*/ 


WITH 
NO_claims AS(
	 -- tot_NO_claims per fuel_type
         SELECT   COUNT(car_id_sales) AS tot_NO_claims
                  ,fuel_type
         FROM     [dbo].[FINAL_complessiva]
         WHERE    claim_number IS NULL
         GROUP BY fuel_type),

YES_claims AS(
	 -- tot_claims per fuel_type
         SELECT   COUNT(car_id_sales) AS tot_claims
                  ,fuel_type
         FROM     [dbo].[FINAL_complessiva]
         WHERE    claim_number IS NOT NULL
         GROUP BY fuel_type)

SELECT   YES_claims. fuel_type
         ,NO_claims.tot_NO_claims 
         ,YES_claims.tot_claims
         ,ROUND(CAST(YES_claims.tot_claims AS FLOAT)/CAST(NO_claims.tot_NO_claims AS FLOAT)*100,2) AS ratio 
FROM     YES_claims 
         INNER JOIN NO_claims ON YES_claims.fuel_type =NO_claims.fuel_type
ORDER BY ratio
--ORDER BY tot_NO_claims desc
