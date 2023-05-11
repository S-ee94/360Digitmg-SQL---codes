/*Sub Query*/

create table department(id int primary key, name varchar(10));

insert into department values(1,'IT'),(2,'HR');

select * from department;


create table emp1(id serial primary key, 
name varchar(20),salary real, 
departmentId int,foreign key(departmentId) references department(id));

insert into emp1(name, salary, departmentId)
values ('Ravi', 70000, 1),('Ram', 90000, 1),('Priya', 80000, 2),('Mohan', 75000, 2),
('Shilpa', 90000, 1);

select * from emp1;

insert into emp1(name,salary,departmentId)values('Manoj', 80000, 3); 
  ---- violates the foreign key constraint

/* Q. Find out the names of Employees whose salary is less than the overall average */

select avg(salary) as average from emp1;  --- 81000
select * from emp1 where salary < 81000;

/*the above statement can be written using sub query*/
select * from emp1 where salary < (Select avg(salary) from emp1);

/* Q. Get the highest salary by the department.  */

select max(salary) from emp1 group by departmentId;

/* Q. Show the department id also in the above query. */

select departmentId, max(salary) from emp1 group by departmentId;
  
/* Q. Show the name of the department. */  
  
select departmentId, department.name, max(salary) from emp1 inner join department on 
emp1.departmentId = department.id
group by departmentId, department.name;    
  
/* Q. show the name of the employee also. */

select departmentId, department.name, emp1.name, max(salary) from emp1 inner join department 
on emp1.departmentId = department.id
group by departmentId, department.name, emp1.name;
  
/* This doesn't work as we are now creating groups on the combination 
of Department and Employee. Hence correct query is as below */  

select department.name,emp1.name,salary 
from emp1 inner join department 
on emp1.departmentId = department.id 
where (departmentId, salary) in 
(select departmentId, max(salary) as salary from emp1 group by departmentId);
  
  
/* Q. Selecting the second-highest salary of an employee
Q. Select the Max salary of employees; */

select max(salary) from emp1; 

/* Q. Suppose we need those salaries which are less than the second highest salary? */

select salary from emp1 where salary < (select max(salary) from emp1);

/* Q. The second maximum means - the maximum of the new list. */

select max(salary) from emp1 where salary < (select max(salary) from emp1);
  
/* Q. Get top nth record. 
- The above approach would not be an optimum solution, instead, we can use thi - */

select salary from emp1 order by salary desc limit 1 offset 2;

/* Index */

create table department1(id int primary key, name varchar(10));
insert into department1 values(1,'IT'),(2,'HR');
select * from department1;

create table emp2(id serial primary key, 
name varchar(20),salary real, 
departmentId int,foreign key(departmentId) references department1(id));

insert into emp2(name, salary, departmentId)
values ('Ravi', 70000, 1),('Ram', 90000, 1),('Priya', 80000, 2),('Mohan', 75000, 2),
('Shilpa', 90000, 1);

select * from emp2;

create index salary_index on emp2(salary);

select * from emp2; 
explain select * from emp2 where salary = 90000;

/* by using index the query gets executed fastly */

/* ------------------------   Normalization   ----------------- */

/* Theory - in courses */





