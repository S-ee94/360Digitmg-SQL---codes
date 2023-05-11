create table employee(
id serial primary key,
f_nm varchar(20) not null,
l_nm varchar(20) not null,
age int not null,
location varchar(20) not null default 'Hyderabad',
dept varchar(20) not null);

insert into employee(f_nm,l_nm,age,dept)values(
'Devi','Sree',31,'HR'),('Rajesh','Reddy',34,'Finance'),('Allen','Mary',34,'IT');

alter table employee add salary real;

insert into employee(f_nm,l_nm,age,dept,salary)values(
'Priya','Darshini',21,'HR',32000.00),
('Mohan','Bhargav',35,'IT',40000.00),
('Manoj','Bajpai',40,'IT',45000.00);

insert into employee(f_nm,l_nm,age,location,dept,salary)values(
'Akhil','k',26,'Bengaluru','IT',43000.00),
('Raja','Roy',35,'Bengaluru','IT',32000.00),
('Shilpa','Sharma',40,'Chennai','IT',44000.00);

select * from employee;

select distinct * from employee;

select location from employee;

select distinct location from employee;

select distinct dept from employee;

select count(dept) from employee;

select count(distinct dept) from employee;

select f_nm from employee;

select f_nm from employee order by f_nm;

select * from employee order by f_nm;

select f_nm from employee order by f_nm desc;

select f_nm,age from employee order by age;

select f_nm,age from employee order by age,f_nm;

select f_nm,age from employee order by age desc;

select * from employee order by age, salary;

select * from employee limit 3;

select * from employee order by salary limit 3;  - Bottom 3 employees by Salary

select * from employee order by salary desc limit 6; - Top 3 employees by Salary

select * from employee order by age limit 5; 

select * from employee order by age, salary limit 4;

select id,f_nm,l_nm from employee order by id limit 1 offset 0;  --- gives the first record

select id,f_nm,l_nm from employee order by id limit 3 offset 3;  --- beginning in the 4th place it will give 3 records.

AGGREGATE FUNCTIONS - Sum, Avg, Min, Max, Count, Count Distinct

/*To get the total number of records -*/ 
select count(*) from employee;

/*From how many locations are people joining:*/
select count(location) from employee;  

/*From how many distinct locations are people joining:*/
select count(distinct location) from employee;

/*To give an alias name to the column: */
select count(distinct location) as num_of_locations from employee;

/*To get the number of people above 30 years: */
select count(f_nm) from employee where age>30;

select count(f_nm) from employee where age>25 and age <35;

/*Total salaries being paid to employees*/
select sum(salary) from employee;

/*Average of the salaries being paid to the employees*/
select avg(salary) from employee;

/*similarly, minimum and maximum also can be done.*/

/*Identify the youngest employee*/
select min(age) from employee;  

/*gives the minimum age, but to know who is the employee:*/
select f_nm, l_nm,age from employee order by age limit 1;

/*GROUP BY and HAVING:*/

select count(location) from employee;

select count(distinct location) from employee;

select location, count(*) from employee group by location;/* number of employees in each location*/

select location, dept, count(*) from employee group by location,dept;/* - number of employees in each location in each department*/

/*number of employees in each location in each department and above 30 years of age*/
select location, dept, count(*) from employee group by location, dept where age>30; 
/*error is obtained as where should be used before group by clause*/

select location, dept, count(*) from employee  where age>30 group by location,dept;

/*WHERE must be used before GROUP BY. */
/*Here, we can use HAVING as "HAVING" works after the aggregation to work with the aggregated data.*/

select location, count(*) as total from employee group by location;

/*We need the list of locations with more than 1 employee -*/
select location, count(*) as total from employee group by location having count(*) > 1;

/*Number of people from each location-*/
select location, count(*) from employee group by location ;

/*Number of people from Hyderabad - */
select location, count(*) from employee group by location where location = 'Hyderabad' ;   --- is wrong

select location, count(*) from employee group by location having location = 'Hyderabad' ;  --- is correct

/*this would put a computational load on the server, instead, we can do this -*/ 
select location, count(*) from employee where location = 'Hyderabad' group by location; --- check the run time
/*Where is used to filter the records before group by, and having is after group 
by to work with aggregated data.*/
















