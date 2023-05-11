## Create Database with name DA #####
create database DA;
use da;

### Created a table named "student" with columns rollno, Name, class. ###
create table student (rollno int, Name char(20), class int, section char(1));

### To describe the structure of the "student" table. ###
desc student;

### Inserted five rows of data into the "student" table using the INSERT INTO statement. ###
insert into student values(101,'ravi',10,'A');
insert into student values(102,'sam',11,'B');
insert into student values(103,'rahul',12,'C');
insert into student values(104,'aman',10,'D');
insert into student values(105,'shiv',10,'A');

### Selected all rows from the "student" table using the SELECT statement. ###
select * from student;

###Deleted a row from the "student" table where the Name column is equal to 'ravi' using the DELETE statement.###
delete from student where Name = 'ravi';

###Dropped the "student" table using the DROP TABLE statement.###
drop table student;

###Checking student column wheather it available or not.###
select name from student;

### Again we need to create a table ###
create table student (rollno int, Name char(20), class int, section char(1));

### Then we need to describe student table###
desc student;

###Added two columns (Fees and student_id) to the "student" table using the ALTER TABLE statement.###
alter table student add column Fees int;
alter table student add column student_id int;

select * from student;

###removing all the rows of data from the "student" table.###
truncate table student;

###update the "class" and "fees" columns of the row where "rollno" is 102 to new values.###
update student set class = 10, fees=6000 where rollno=102;
update student
set name = 'shiv', section = 'E'
where rollno = 105;
update student set name = 'Kunal',section='h' where rollno=115;

###deletes the row of data from the "student" table where the value in the "name" column is 'sam'.###
delete from student where name='sam';

###select data from the "student" table, but also includes the keyword "rollback" ###
select * from student rollback;
rollback;

select * from student;
select* from student where rollno=103 and fees>2000;

#add primary key 
alter table student Add primary key(rollno);
desc student;

### drops the "section" column from the "student" table.###
alter table student drop column section;
alter table student add column studentfees char(5);
alter table student modify column fees int;

update student set fees=2000 where name ='shiv';
update student set fees=1000 where name ='sam';
update student set fees=1500 where name ='rahul';
update student set fees=2200 where name ='aman';
select * from student;

select name,class,fees+100 from student;
select name, class, fees from student where fees>1500;
select name,class from student where class=10 or class=12;
select * from student where name like's%';

select * from student order by name;
select* from student order by name desc;

select name,max(fees) from student group by Name;
select name,min(fees) from student group by name;

select sum(fees) from student;
select avg(fees) from student;
select upper(name),class from student;