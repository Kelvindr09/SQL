-- =============================================
-- Author:		Kelvin Oduwale
-- Create date: 05-5-2024
-- Description:	Store procedures
--				Do more analysis on Table Customers.
--Revise Date: 05-7-2024
--Version:		v1.0
-- =============================================

use SQLTraining

select * from Noble;

create procedure spNoble
as
begin
select * from Noble
end;

exec spNoble

create procedure spWorld
as
begin
select * from World
end;

exec spWorld


select * from Games
create procedure spGames
as 
begin 
select * from Games
end;

exec spGames



////
use SQLTrainingCase
create procedure spCompanyinfo
as
begin
select * from Companyinfo
end;

exec spCompanyinfo


create procedure spEmployeeinfo
as
begin
select * from EmployeeInfo
end;

exec spEmployeeinfo


create procedure spBusiness
as
begin
select * from Business
end;

exec spBusiness
