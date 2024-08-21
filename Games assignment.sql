-- =============================================
-- Author:		Kelvin Oduwale
-- Create date: 07-24-2024
-- Description:	This code is to extract data from sql
--				Do more analysis on Table Customers.
--Revise Date: 08-7-2024
--Version:		v1.0
-- =============================================


use SQLTraining;

create procedure Games#
as
create table Games
(
[Year] int not null,
City varchar (50) not null
);


create table Games
(
[Year] int not null,
City varchar (50) not null
);

select * from Games

insert into Games
(
[Year],
City
)
values
(2000, 'Sydney'),
(2004, 'Athens'),
(2008, 'Beijing'),
(2012, 'London');

select * from Games
where year= 2004;

select * from Games 
where year= 2012;
select * from Games
where year= 2012;

insert into Games
values 
(2024, 'paris');

create view vwOldGames
as (select * from Games where Year<2008);

select * from vwOldGames

select count (*) as 'Number of records'
from Games;

select * from Games
where City not in('London','Athens');

--using case statements and logical expression
select * from Games


/**
Write a Case statement to show the era of the year.
Name the new column "Year_Status"
**/
select 
[Year],
City,
Case when [Year] =2000 then 'GenZ'
when [Year] =2004 then 'GenX'
when [Year] =2008 then 'GenY'
else 'Unknown'
end as 'Year_Status'
from Games;


/**
Write a Case Statement to show year range 2000 and 2008, make sure this shows Year_status as "Great".
any record that is 2024 and above, show them as "Supper". Any other record show them as "Good"
Name the new column "Year_Status"
**/

select
[Year],
City,
Case when [year] in (2008) then 'Great'
when [Year]>= 2024 then 'Super'
else 'Good'
end as 'Year_Status'
from Games;    --to use this code, you have to write out the years


--another way
select
[Year],
City,
Case when [year] between 2000 and 2008 then 'Great'
when [Year]>= 2024 then 'Super'
else 'Good'
end as 'Year_Status'
from Games;

--third way

select
[Year],
City,
Case when [Year]>=2004 and [Year]<=2012 then 'Great'
when [Year]= 2000 then 'Okay'
when [Year]>=2024 then 'Super'
else 'Good'
end as 'Year_Status'
from Games;



