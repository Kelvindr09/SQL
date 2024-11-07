-- =============================================
-- Author:		Kelvin Oduwale
-- Create date: 08-17-2024
-- Description:	This code is to extract data from sql
--				Do more analysis on Table Customers.
--Revise Date: 07-2-2024
--Version:		v1.0
-- =============================================

create database hospital
go 

--Making new changes
use hospital;
create table Nurse
(
EmployeeId bigint not null,
[Name] varchar (50) not null,
Position varchar (50) not null,
Registered varchar (50) not null,
SSN bigint not null
);

select * from Nurse

insert into Nurse
(
EmployeeId,
[Name],
Position,
Registered,
SSN
)
values
(101, 'Calra Espinosa', 'Head Nurse', 'True', 111111110),
(102, 'Laverne Roberts', 'Nurse', 'true', 222222220),
(103, 'Paul Flowers', 'Nurse', 'False', 333333330);


select * from Nurse
Where Registered ='false';


select [Name] as 'Name', Position as 'Position'
from nurse
where Position='Head Nurse';

