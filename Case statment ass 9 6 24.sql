use SQLTrainingCase

--Assignment on stored procedure 
create procedure spBusinessCaseGeneration
@NAME varchar (50)
as
select 
ID,
[Name],
Age,
[Address],
Salary,
case when Age>30 then 'GenX'
when Age in (23,24,25) then 'Genz'
when Age=22 then 'Gen Alpha'
when Age=27 then 'Gen Y'
else 'Unknown'
end as 'Generation'
from Business
where Name =@NAME

exec spBusinessCaseGeneration Muffy




create procedure spBusinessCaseGen
@Generation varchar (50)
as
select * from
(
select 
ID,
[Name],
Age,
[Address],
Salary,
case when Age>30 then 'GenX'
when Age in (23,24,25) then 'Genz'
when Age=22 then 'Gen Alpha'
when Age=27 then 'Gen Y'
else 'Unknown'
end as 'Generation'
from Business
)x
where Generation =@Generation

exec spBusinessCaseGen GenX




create procedure spStudentScoreCase
@Score int
as
select
ID,
[Name],
Score,
case when Score between 60 and 66 then 'D'
when Score between 67 and 69 then 'D+'
when Score between 70 and 72 then 'C-'
when Score between 73 and 76 then 'C'
when Score between 77 and 79 then 'C+'
when Score between 80 and 82 then 'B-'
when Score between 83 and 86 then 'B'
when Score between 87 and 89 then 'B+'
when Score between 90 and 93 then 'A-'
when Score>=94 then 'A'
else 'F'
end as 'Grade'
from Student
where Score =@Score
order by Score desc


exec spStudentsScoreCase 86
