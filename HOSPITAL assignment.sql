-- =============================================
-- Author:		Kelvin Oduwale
-- Create date: 08-17-2024
-- Description:	This code is to extract data from sql
--				Do more analysis on Table Customers.
--Revise Date: 08-19-2024
--Version:		v1.0
-- =============================================

use hospital;

create table appointment
(
AppointmentId Int not null,
Patient Int not null,
Prepnurse Int not null,
Physician Int null,
Start_dt_Time datetime not null, 
End_dt_Time datetime not null,
ExaminationRoom varchar (1) not null
);

insert into appointment
(
AppointmentId,
Patient,
Prepnurse,
Physician,
Start_dt_Time,
End_dt_Time,
ExaminationRoom
)
values
(13216584, 100000001, 101, 1, '2008-04-24 10:00:00', '2008-04-24 11:00:00', 'A'),
(26548913, 100000002, 101, 2, '2008-04-24 10:00:00', '2008-04-24 11:00:00', 'B'),
(36549879, 100000001, 102, 1, '2008-04-25 10:00:00', '2008-04-25 11:00:00', 'A'),
(46846589, 100000004, 103, 4, '2008-04-25 10:00:00', '2008-04-25 11:00:00', 'B'),
(59871321, 100000004, '', 4, '2008-04-26 10:00:00', '2008-04-26 11:00:00', 'C'),
(69879231, 100000003, 103, 2, '2008-04-26 11:00:00', '2008-04-26 12:00:00', 'C'),
(76983231, 100000001, '', 3, '2008-04-26 12:00:00', '2008-04-26 13:00:00', 'C'),
(86213939, 100000004, 102, 9, '2008-04-27 10:00:00', '2008-04-21 11:00:00', 'A'),
(93216548, 100000002, 101, 2, '2008-04-27 10:00:00', '2008-04-27 11:00:00', 'B');

select * from appointment

select count (*) as "Number of patients taken at least one appointment"
from appointment
where physician>=1;