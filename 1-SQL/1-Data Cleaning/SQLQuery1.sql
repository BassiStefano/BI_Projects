

/*
These queries allow to remove duplicates from the tables.
*/

--QUERY 1.1A
SELECT DISTINCT *
INTO [dbo].[car_sales]
FROM [dbo].[IMPORT_car_sales]

--QUERY 1.1B
SELECT DISTINCT *
INTO [dbo].[car_details]
FROM [dbo].[IMPORT_car_details]

--QUERY 1.1C
SELECT DISTINCT *
INTO [dbo].[car_claims]
FROM [dbo].[IMPORT_car_claims]








