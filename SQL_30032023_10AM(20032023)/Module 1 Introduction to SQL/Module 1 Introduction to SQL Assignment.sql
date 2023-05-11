/*Commands
/* DATABASE CREATE
/*1.Create a database ‘classroom’
  2.Create a table named ‘science_class’ with the following properties
  3. columns(enrollment_no int, name varchar, science_marks int)*/

/*drop table classroom.science_class;*/
create database classroom;
use classroom;
create table science_class(
enrollment_no int,
name varchar(20),
science_marks int);

/*INSERTING AND IMPORTING
1.Insert the following data into science_class using insert into command
1	popeye	33
2	olive	54
3	brutus	98

2.import data from CSV file ‘student.csv’ attached in resources to science_class to 
insert data of next 8 students
*/

insert into science_class values(
1,'popeye',33),(2,'olive',54),(3,'brutus',98);

select * from science_class;

/*In order to import the 'Student' CSV file, we should go to the classroom database
in the schemas and under that go to tables and then under that go to science_class 
table and right click table data import wizard. After this, give the path of the csv
file and click on next until finish*/

/*After importing the file */

select * from science_class;

/*SELECT & WHERE*/ 
/* 1.Retrieve all data from the table ‘Science_Class’*/

select * from science_class;

/* 2.Retrieve the name of students who have scored more than 60 marks*/

select * from science_class where science_marks > 60;

/* 3.Retrieve all data of students who have scored more than 35 but less than 60 marks*/

select * from science_class where science_marks between 35 and 60;

/* 4.Retrieve all other students i.e. who have scored less than or equal to 35 or more than 
or equal to 60.*/

select * from science_class where science_marks <= 35 or science_marks >= 60;

/*UPDATING TABLES*/

/* 1.update the marks of popeye to 45 */

update science_class set science_marks = 45 where name = 'popeye';
select * from science_class

/* 2.delete the row containing details of the student named ‘robb’ */      

delete from science_class where name = 'Robb';
select * from science_class;

/* 3.Rename column ‘name’ to ‘student_name’ */

alter table science_class rename column name to student_name;
select * from science_class;









