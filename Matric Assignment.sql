--ASSIGNMENT

--CREATE A METRIC TO SHOW THE RECORDS FOR THE 3 ENVIRONMENT

--NOBLE
select * into Dev.dbo.Noble
from SQLTraining.dbo.Noble

select * into Test.dbo.Noble
from SQLTraining.dbo.Noble

select * into Prod.dbo.Noble
from SQLTraining.dbo.Noble


select 'Sql_Training' as source , 'Noble' as TableName ,Count(*) as Total 
from SQLTraining.dbo.Noble
UNION ALL
select 'Prod' as source,'Noble' as TableName ,Count(*) as Total 
from Prod.dbo.Noble
UNION ALL
select 'Test' as source ,'Noble' as TableName ,Count(*) as Total 
from Test.dbo.Noble
UNION ALL
select 'DEV' as source ,'Noble' as TableName ,Count(*) as Total 
from DEV.dbo.Noble



--GAMES
select * into Dev.dbo.Games
from SQLTraining.dbo.Games

select * into Test.dbo.Games
from SQLTraining.dbo.Games

select * into Prod.dbo.Games
from SQLTraining.dbo.Games


select 'Sql_Training' as source , 'Games' as TableName ,Count(*) as Total 
from SQLTraining.dbo.Games
UNION ALL
select 'Prod' as source,'Games' as TableName ,Count(*) as Total 
from Prod.dbo.Games
UNION ALL
select 'Test' as source ,'Games' as TableName ,Count(*) as Total 
from Test.dbo.Games
UNION ALL
select 'DEV' as source ,'Games' as TableName ,Count(*) as Total 
from DEV.dbo.Games



--WORLD
select * into Dev.dbo.World
from SQLTraining.dbo.World

select * into Test.dbo.World
from SQLTraining.dbo.World

select * into Prod.dbo.World
from SQLTraining.dbo.World



select 'Sql_Training' as source , 'World' as TableName ,Count(*) as Total 
from SQLTraining.dbo.World
UNION ALL
select 'Prod' as source,'World' as TableName ,Count(*) as Total 
from Prod.dbo.World
UNION ALL
select 'Test' as source ,'World' as TableName ,Count(*) as Total 
from Test.dbo.World
UNION ALL
select 'DEV' as source ,'World' as TableName ,Count(*) as Total 
from DEV.dbo.World


--MOVIES
select * into Dev.dbo.Movies
from SQLTraining.dbo.Movies

select * into Test.dbo.Movies
from SQLTraining.dbo.Movies

select * into Prod.dbo.Movies
from SQLTraining.dbo.Movies


select 'Sql_Training' as source , 'Movies' as TableName ,Count(*) as Total 
from SQLTraining.dbo.Movies
UNION ALL
select 'Prod' as source,'Movies' as TableName ,Count(*) as Total 
from Prod.dbo.Movies
UNION ALL
select 'Test' as source ,'Movies' as TableName ,Count(*) as Total 
from Test.dbo.Movies
UNION ALL
select 'DEV' as source ,'Movies' as TableName ,Count(*) as Total 
from DEV.dbo.Movies


--FRUITS
select * into Dev.dbo.Fruits
from SQLTraining.dbo.Fruits

select * into Test.dbo.Fruits
from SQLTraining.dbo.Fruits

select * into Prod.dbo.Fruits
from SQLTraining.dbo.Fruits


select 'Sql_Training' as source , 'Fruits' as TableName ,Count(*) as Total 
from SQLTraining.dbo.Fruits
UNION ALL
select 'Prod' as source,'Fruits' as TableName ,Count(*) as Total 
from Prod.dbo.Fruits
UNION ALL
select 'Test' as source ,'Fruits' as TableName ,Count(*) as Total 
from Test.dbo.Fruits
UNION ALL
select 'DEV' as source ,'Fruits' as TableName ,Count(*) as Total 
from DEV.dbo.Fruits


--INSTRUCTOR
select * into Dev.dbo.Instructor
from SQLTraining.dbo.Instructor

select * into Test.dbo.Instructor
from SQLTraining.dbo.Instructor

select * into Prod.dbo.Instructor
from SQLTraining.dbo.Instructor


select 'Sql_Training' as source , 'Instructor' as TableName ,Count(*) as Total 
from SQLTraining.dbo.Instructor
UNION ALL
select 'Prod' as source,'Instructor' as TableName ,Count(*) as Total 
from Prod.dbo.Instructor
UNION ALL
select 'Test' as source ,'Instructor' as TableName ,Count(*) as Total 
from Test.dbo.Instructor
UNION ALL
select 'DEV' as source ,'Instructor' as TableName ,Count(*) as Total 
from DEV.dbo.Instructor


--EMPLOYEES
select * into Dev.dbo.Employees
from SQLTraining.dbo.Employees

select * into Test.dbo.Employees
from SQLTraining.dbo.Employees

select * into Prod.dbo.Employees
from SQLTraining.dbo.Employees


select 'Sql_Training' as source , 'Employees' as TableName ,Count(*) as Total 
from SQLTraining.dbo.Employees
UNION ALL
select 'Prod' as source,'Employees' as TableName ,Count(*) as Total 
from Prod.dbo.Employees
UNION ALL
select 'Test' as source ,'Employees' as TableName ,Count(*) as Total 
from Test.dbo.Employees
UNION ALL
select 'DEV' as source ,'Employees' as TableName ,Count(*) as Total 
from DEV.dbo.Employees

