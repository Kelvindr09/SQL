-- =============================================
-- Author:		Kelvin Oduwale
-- Create date: 06-17-2024
-- Description:	This code is to extract data from sql
--				Do more analysis on Table Customers.
--Revise Date: 08-20-2024
--Version:		v1.0
-- =============================================


use SQLTraining;

create table World
(
[CountryName] varchar (50) not null,
Continent varchar (50) not null,
Area bigint not null,
[Population] bigint not null,
GDP bigint not null
);

insert into World
(
CountryName,
Continent,
Area,
[Population],
GDP
)
values
('Afghanistan', 'Asia', 652230, 2500100, 20343000000),
('Albania', 'Europe', 28748, 2831741, 12960000000),
('Algeria', 'Africa', 2381741, 37100000, 188681000000),
('Andorra', 'Europe', 468, 78115, 3712000000),
('Angola', 'Africa', 1246700, 20609294, 100990000000);

select * from World
where Area= 468;

select * from World
where [CountryName]='Angola';

select MIN(GDP)as lowestGDP from World

create view vwLOWGdpCountries
as select * from World where GDP=(select MIN(GDP) from World);

select * from vwLOWGdpCountries

select count(*) as 'Number of records' from World;

select count(*) from World
where continent= 'Europe';

select * from World

select 
CountryName,
Continent,
Case when CountryName= 'Afghanistan' then 'As'
when CountryName= 'Albania' then 'Eu'
when CountryName= 'Algeria' then 'Af'
when CountryName= 'Andorra' then 'Eu'
when CountryName= 'Angola' then 'An'
else 'Unknown'
end as 'New_Continent'
from World;

--second method
select
CountryName,
Continent,
case
when LEN(Continent)>=2 then left(Continent, 2)
else 'Unknown'
end as 'New_Continent'
from World



