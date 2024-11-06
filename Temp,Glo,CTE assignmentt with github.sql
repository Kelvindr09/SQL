-- =============================================
-- Author:		Kelvin Oduwale
-- Create date: 05-5-2024
-- Description:	USing Temp table, CTE
--				Do more analysis on Table Customers
--Revise Date: 05-7-2024
--Version:		v1.0
-- =============================================

use SQLTraining

select * from Noble

--TEMP table

SELECT TOP (1000) [Year]
      ,[Subject]
      ,[Winner]
	  into #Noble
  FROM [SQLTraining].[dbo].[Noble]

select * from #Noble

--GLOBAL table
select
year,
subject, 
Winner
into ##Noble
from Noble

select * from ##Noble


with NobleCTE as 
(
SELECT TOP (1000) [Year]
      ,[Subject]
      ,[Winner]
  FROM [SQLTraining].[dbo].[Noble]
  )
  select * from NobleCTE


--TEMP table

SELECT TOP (1000) [CountryName]
      ,[Continent]
      ,[Area]
      ,[Population]
      ,[GDP]
	  into #World
  FROM [SQLTraining].[dbo].[World]

  select * from #World

--GLOBAL table

SELECT TOP (1000) [CountryName]
      ,[Continent]
      ,[Area]
      ,[Population]
      ,[GDP]
	  into ##World
  FROM [SQLTraining].[dbo].[World]
 
   select * from ##World


with WorldCTE as 
(
SELECT TOP (1000) [CountryName]
      ,[Continent]
      ,[Area]
      ,[Population]
      ,[GDP]
  FROM [SQLTraining].[dbo].[World]
  )
  select * from WorldCTE


--TEMP table
  SELECT TOP (1000) [Year]
      ,[City]
	  into #Games
  FROM [SQLTraining].[dbo].[Games]

    select * from #Games


 --GLOBAL table
  SELECT TOP (1000) [Year]
      ,[City]
	  into ##Games
  FROM [SQLTraining].[dbo].[Games]
 
   select * from ##Games


with GamesCTE as
(
 SELECT TOP (1000) [Year]
      ,[City]
  FROM [SQLTraining].[dbo].[Games]
  )
  select * from GamesCTE
