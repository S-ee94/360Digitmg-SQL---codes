create database sql1;
use sql1;

#Student table
create table student (Sno int not null, Name char(20)unique, class int, section char(1));
alter table student add column Fees int;
alter table student add column student_id int;
desc student;
insert into student values(01, 'ravi', 10, 'A', 2000, 101);
insert into student values(02, 'sam', 11, 'B', 4000, 102);
insert into student values(03, 'rahul', 12, 'C', 4000, 103);
insert into student values(04, 'aman', 10, 'D', 5000, 104);
insert into student values(05, 'Tani', 10, 'D', 2000, 105);
select * from student;
alter table student add unique (name);

#add primary key
alter table student add primary key (sno);
desc student;
insert into student values ('Tani', 10, 'D', 2000, 105);
insert into student values (05, 'Tani', 10, 'D', 2000, 106);
insert into student values (06, 'Tanvi', 11, 'D', 2000, 106);
select * from student;


#Employee table
create table Employee (Sno int,Name char(20),Dept char(20),Gender char(1),Salary int,EmpID int);
insert into Employee values(01,'ravi','HR','M',20000,101);
insert into Employee values(02,'sam','Tech','F',25000,102);
insert into Employee values(03,'rahul','Admin','M',4000,103);
insert into Employee values(04,'aman','HR','M',20000,104);
insert into Employee values(05,'Tani','Tech','F',25000,105);
select * from Employee;

#add primary key
alter table Employee add primary key(EmpID);
desc Employee;

#drop
desc Employee;
alter table Employee drop primary key;
alter table Employee drop Gender ;

select  * from student;
select * from Employee;

# INNER JOIN 
SELECT student.student_ID, Employee.EmpID
FROM student 
INNER JOIN employee
ON student.student_ID=Employee.EmpID;

#LEFT JOIN 
SELECT student.student_ID, Employee.EmpID 
FROM student 
LEFT JOIN employee
ON student.student_ID=Employee.EmpID;

SELECT Employee.EmpID ,student.student_ID
FROM employee 
LEFT JOIN student
ON Employee.EmpID=student.student_ID;



#RIGHT JOIN 
SELECT student.student_ID, Employee.EmpID 
FROM student 
RIGHT JOIN employee
ON student.student_ID=Employee.EmpID;


select max(fees) 
from student
where class>10;

select*from student;


#FOREIGN KEY
CREATE TABLE orders (order_id INT PRIMARY KEY,
   customer_id INT, order_date DATE,  -- other columns
   FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE customers (customer_id INT PRIMARY KEY,
   first_name VARCHAR(50),
   last_name VARCHAR(50)
);



MAM class notes -------------------


create table courses(name varchar, course varchar);
insert into courses values('BBB','Tableau'),('CCC','Python'),('DDD','DataAnalytics'),('EEE','SQL');
select * from courses;


create table students(name varchar,age int);
insert into students values('AAA',22),('BBB',24),('CCC',25),('DDD',30);
select *from students;


/*inner join - only matches from both the tables.*/
select students.name, age, courses.name, courses from students inner join courses on students.name = courses.name;

/*left join - all the data from the left side and the matches from the right side, when match is not found nulls are padded*/
select students.name, age, courses.name, courses from students left join courses on students.name = courses.name;


/*left join - all the data from the right side and the matches from the left side, when match is not found nulls are padded*/
select students.name, age, courses.name, courses from students right join courses on students.name = courses.name;


/*full join - all the data from the both tables, when match is not found nulls are padded*/
select students.name, age, courses.name, courses from students full outer join courses on students.name = courses.name; 

/*left outer join -(left only senario)
select students.name, age, courses.name, courses from students left join courses on students.name = courses.name where