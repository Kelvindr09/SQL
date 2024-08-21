-- =============================================
-- Author:		Kelvin Oduwale
-- Create date: 05-10-2024
-- Description:	This code is to extract data from sql
--				Do more analysis on Table Customers.
--Revise Date: 08-14-2024
--Version:		v1.0
-- =============================================



use SQLTraining

create table Movies (
[No] int,
[Name] varchar (50),
[Type] varchar (50),
Rating varchar (10),
Stars varchar (50),
Qty int,
Price decimal(10,2)
);

insert into Movies
Values
(1, 'Gone with wind', 'Drama', 'G', 'Gable', 4, 39.95),
(2, 'Friday the 13', 'Horror', 'R', 'Jason', 2, 60.95),
(3, 'Top Gun', 'Drama', 'PG', 'Cruise', 7, 49.95),
(4, 'Splash', 'Comedy', 'PG13', 'Hanks', 3, 29.95),
(5, 'Independent day', 'Drama', 'R', 'Turner', 3, 19.25),
(6, 'Risk Business', 'Comedy', 'R', 'Cruise', 2, 44.95),
(7, 'Cocoon', 'Sci-fi', 'PG', 'Ameche', 2, 31.95),
(8, 'Crocodile', 'Comedy', 'PG13', 'Harris', 2, 69.95),
(9, '101 Dalmatians', 'Comedy', 'G', 'Hoffman', 3, 59.95),
(10, 'Tootsie', 'Comedy', 'PG', 'Croft', 1, 29.95);

select * from Movies

--Show the total number of records in the drama
select count (*) as Total_drama
from Movies
where type= 'drama';

--display a list of all movies with price over 20 and sorted by price
select [Name], price
from Movies 
where price > 20 
order by price;

--display all the movies sorted by QTY in decreasing order
select *
from Movies 
order by Qty DESC;

--Display a report listing total by movie type ....
--Calculate the replacement value for all movies as QTY * Price * 1.15
select 
Type,
count (*) as Total_Movies,
Sum(qty * price) as Current_value,
Sum(qty * price * 1.15) as Replacement_value
from Movies
Group by Type;

--Count the numbers of movies where rating is not G and insert a new movie table.
select count (*) as Rating from Movies
where Rating not in ('G')

insert into Movies (No, Name, Type, Rating, Stars, Qty)
select distinct 11, 'Nollywood', 'Super Story', 'R', 'Regina', 10
from Movies
where Price> 30