create database hospital
go 

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

