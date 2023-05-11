drop table mango.employee;
drop table mango.employee1;
drop database mango;
drop table mango.email_registration;
truncate table mango.employee;



create database mango;

use mango;

create table employee(
sno int auto_increment,
first_name varchar(20) not null,
last_name varchar(20) not null,
emp_id int not null,
location varchar(30) default "Chennai",
primary key(sno)
);

insert into employee(first_name,last_name,emp_id)
values("steve","rogers",101235);

insert into employee(first_name,last_name,emp_id,location)
values("steve","smith",102235,"new york"),
("taylor","swift",103235,"los angeles");

alter table employee add gender varchar(30) not null;
alter table employee drop gender;

select * from mango.employee;

create table email_registration(
f_name varchar(20) not null,
l_name varchar(20) not null,
email varchar(50) not null unique key,
primary key(f_name,l_name)
);

insert into email_registration values(
"radha","krishna","radha_k@gmail.com"),
("shaurya","kannan","s_k@gmail.com"),
("vijay","prakash","v_p@yahoo.com"
);

select * from mango.email_registration;

insert into email_registration values(
"radhika","pandit","radha_k@gmail.com");
desc email_registration;


create table mango.employee1(
sno int not null,
f_name varchar(20) not null,
l_name varchar(20) not null,
email varchar(50) not null unique key,
primary key(f_name,l_name));

select * from mango.employee1;

alter table mango.employee1 modify sno int;

create table mango.employee2(
sno int not null auto_increment,
age int not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
emp_id int not null,
location varchar(50) not null default "chennai",
primary key(sno));

insert into employee2(age,first_name,last_name,emp_id,location) values
(33,"sri","ram",101235,"bengaluru"),
(23,"sri","raksha",104235,"mumbai"),
(45,"rama","krishna",102283,"chennai");

select * from mango.employee2;

select first_name,last_name from employee2 where age < 25;

select * from employee2 where first_name = "sri";

select * from employee2 where last_name like "%r%m";

use mango;
drop table mango.student;
create table student(
id int auto_increment,
first_name varchar(20) not null,
last_name varchar(20) not null,
age int not null,
course_enrolled varchar(20) not null default 'Data Analytics',
course_fee int not null,
primary key(id), unique key(last_name)
);

select * from mango.student;
desc mango.student;

insert into student(first_name,last_name,age,course_enrolled,course_fee) values(
'Sagari','Kumari',24,'Data Science',10000),('Madhavi','Krishna',24,'Data Analytics',25000),
('Sagari','K',24,'Data Science',10000);

insert into student(first_name,last_name,age,course_enrolled,course_fee) values(
'Sagar','M',24,'Data Science',23000),('Madhavi','B',24,'Data Analytics',1000),
('Sagarika','MS',24,'Data Science',5000);

select first_name,last_name from student where course_fee > 15000;
select * from student where first_name like '%a%';
select * from student where first_name like '%S%';
select * from student where first_name like '%v%';
select * from student where last_name like '%$%';
select * from student where first_name like '_____'; # gives five character first names 

insert into student(first_name,last_name,age,course_enrolled,course_fee) values(
'Sagar','M$',24,'Data Science',23000);

select * from mango.student;
delete from student where last_name = 'K';


/*---------------------------------------------------------------------------------------*/
create database education_db;
use education_db;
show tables;





















