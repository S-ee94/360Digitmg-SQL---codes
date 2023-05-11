###creates a new database called "student"####
create database student;

###deletes the "student" database.###
drop database student;

### displays a list of existing databases###
show databases;
create database student;

### selects the "student" database as the current database to use
use student;

### creates a new table called "students" with four columns: Rollno, Names, Class, and section.
create table students(Rollno int,Names char(20),Class int,section char(1));

### displays the structure of the "students" table.
desc students;

### deletes the "students" table
drop table students;

### recreates the "students" table.
create table students(Rollno int,Names char(20),Class int,section char(1));

### adds a primary key constraint to the "Rollno" column of the "students" table.
Alter table students add primary key(Rollno);

### displays the structure of the "students" table
desc students;

###  inserts a new row into the "students" table.
insert into students values (1,'Ravi',10,'A');
insert into students values(2,'Rahul',11,'B');
insert into students values(3,'Aditya',11,'C');
insert into students values(4,'Raj',12,'C');
insert into students values(5,'Shivi',10,'D');

### displays all rows in the "students" table
select*from students;

### removes the primary key constraint from the "Rollno" column of the "students" table.
alter table students drop primary key;

### displays the structure of the "students" table.
desc students;

### adds a new column called "fees" to the "students" table.
alter table students add fees int;

### modifies the data type of the "fees" column to "int".
alter table students modify column fees int;

### removes the "section" column from the "students" table.
alter table students drop column section;

### updates the "fees" value to 2000 for the row where the "Names" column is 'Raj'.
update students set fees=2000 where names ='Raj';
update students set fees=1500 where names ='shivi';
update students set fees=2500 where names ='Aditya';
Update students set fees=1500 where names ='Ravi';

### displays all rows in the "students" table.
select*from students;

### displays the "Names", "Class", and "fees" columns for rows where "fees" is greater than 1500.
select names,class,fees from students where fees>1500;
select names,class,fees from students where fees<2000;
select names,class,fees+100 from students;
select names,class,fees-500 from students;
select names,class from students where class=10 or class=12;
select names,class from students where class!=10;

select names from students where names like'A%';

select *from students order by names;
select*from students order by names desc;
select*from students order by names desc,class asc;
select*from students order by class asc;

select*from students;
select min(fees) from students;
select max(fees) from students;
select sum(fees) from students;
select avg(fees) from students;
select count(fees) from students;
select upper(names) from students;
select lower(names) from students;
