Create database classroom

use classroom
Create table science_class(
Enrollment_no int,
name varchar(30),
science_marks int)

Insert into science_class(Enrollment_no,name,science_marks)
values(1,'popeye',33),(2,'olive',54),(3,'brutus',98)

Select * from student
union
select * from science_class

insert into science_class(Enrollment_no,name,science_marks)
Select * from student


select * from abc 

drop table student

select * from science_class

select name from science_class
where science_marks<=35 and science_marks>=60

update science_class
set science_marks=45
where name='popeye'

delete from science_class
where name='Robb'
