
/* This query allows to understand if customers prefer tuning cars or not. 
   For doing it I have taken into account the total number of claims and the ratio.
   I have defined the ratio as the number of total claims divided by
   the number of the total sales without claims.
*/ 


WITH 
NO_claims AS(
         -- tot_NO_claims per has_tuning
         SELECT   COUNT(car_id_sales) AS tot_NO_claims
                  ,has_tuning
         FROM     [dbo].[FINAL_complessiva]
         WHERE    claim_number IS NULL
         GROUP BY has_tuning),

YES_claims AS(
         -- tot_claims per has_tuning
         SELECT   COUNT(car_id_sales) AS tot_claims
                  ,has_tuning
         FROM     [dbo].[FINAL_complessiva]
         WHERE    claim_number IS NOT NULL
         GROUP BY has_tuning)

SELECT   YES_claims. has_tuning
         ,NO_claims.tot_NO_claims 
         ,YES_claims.tot_claims
         ,ROUND(CAST(YES_claims.tot_claims AS FLOAT)/CAST(NO_claims.tot_NO_claims AS FLOAT)*100,2) AS ratio 
FROM     YES_claims 
         INNER JOIN NO_claims ON YES_claims.has_tuning =NO_claims.has_tuning
ORDER BY ratio
--ORDER BY tot_NO_claims desc

