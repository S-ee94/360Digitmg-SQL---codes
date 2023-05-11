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
select students.name, age, courses.name, courses from students full join courses on students.name = courses.name; 

/*left outer join -(left only senario)  same as left join */
select students.name, age, courses.name, courses from students left outer join courses on students.name = courses.name where
courses.name is null;

/*right outer join - (right only scenario) same as right join but with condition */
select students.name, age, courses.name, courses from students right outer join courses on students.name = courses.name
where students.name is null;

/*full outer join - uncommon data from both tables will be displayed */
select students.name, age, courses.name, courses from students full outer join courses on students.name = courses.name
where students.name is null or courses.name is null; 

/*Conditional Constraints Triggers and Functions*/

create table school(
name varchar,
schoolname varchar default '360digitmg',
age int,
check (age>=10)
);

insert into school (name,age) 
values('Ram',10),('Ravi',20);

select * from school;
insert into school (name,age) 
values('Ruhi',8); /*error will be displayed violation of constraint*/

/* functions */

create table sales_data1(
cust_name varchar not null,
product_name varchar not null,
sales real not null,
quantity int not null,
total_price real
);

insert into sales_data1 values('Ravi','Chair', 500.00,5),('Sam','Fan',3000.00,2);

select *from sales_data1;

/*CREATE THE FUNCTION*/

create function calc_tot_price2()
returns trigger
as $$
declare
	total numeric;
begin
	total= new.sales * new.quantity; /*(new is the key word for inserting/updating data)*/
	new.total_price=total;
	return new;
end;
$$language plpgsql;

/*CREATE THE TRIGGER*/
create trigger calc_tot_insert2
before insert
on sales_data1
for each row
execute procedure calc_tot_price2();

/*Application of Triggers*/

/*CREATE THE TRIGGER*/
create trigger calc_total_insert2
before insert
on sales_data1
for each row
execute procedure calc_tot_price2();

/* AUTOMATICALLY UPDATING LATEST TIMESTAMP WHENEVER A RECORD IS UPDATED */

create table employeenew(
id serial primary key,
name varchar not null,
dept varchar not null,
date_of_joining date not null default current_date,
status varchar default 'Active',
salary real not null,
last_updated timestamp default CURRENT_TIMESTAMP
);
insert into employeenew(name,dept,salary) 
values('Ravi','HR',40000.00),
('PriyaDarshini','IT',25000.00),('Mohan','Finance',30000.00);

select *from employeenew;

CREATE FUNCTION update_on_status_change()
RETURNS TRIGGER
AS $$
BEGIN
	NEW.last_updated=now();
	RETURN NEW;
END;
$$ language plpgsql;

CREATE TRIGGER status_updated_on
  BEFORE UPDATE
  ON
    employeenew
	FOR EACH ROW
EXECUTE PROCEDURE update_on_status_change();

update employeenew set status = 'Inactive' where name = 'PriyaDarshini';

select *from employeenew;

/******************************************/

/*DCL - GRANT, REVOKE.
TCL - COMMIT,ROLLBACK,BEGIN

GRANT- add people and grant permission to access table:*/


create table employee(
id  serial primary key,
f_nm varchar(20) not null,
l_nm varchar(20) not null,
age int not null,
location varchar(20) not null default 'Hyderabad',
dept varchar(20) not null
);

/*->run the query and see the output. */

insert into employee(f_nm,l_nm,age,dept)
values('Devi','Sree',31,'HR'),('Rajesh','reddy',34,'Finance'),('Allen','Mary',34,'IT');

insert into employee(f_nm,l_nm,age,dept)
values('Ravi','kiran',25,'HR');

insert into employee(f_nm,l_nm,age,dept)
values('Priya','darshini',21,'HR'),
('Mohan','Bhargav',35,'IT'),
('Manoj','Bajpal',40,'IT');

insert into employee(f_nm,l_nm,age,location,dept)
values('Akil','k',26,'Bangalore','IT'),
('Raja','Roy',35,'Bangalore','IT'),
('Shilpa','Sharma',40,'Chennai','HR');

select *from employee;
	   
	   
/**********************************************   DCL ////////////////// */
	   
Create user PS4 password '12345';
grant select on employee to PS4;
grant insert on employee to PS4;
grant update on employee to PS4;
grant delete on employee to PS4;


/*-> After granting permission, goto the connection dialog box and select new connection option.
->you will see a dialog box -> enter the db name -> user name PS4-> save
->now switch to the new connection->enter password '12345'
->Now you can make the below changes on the table.*/

select * from employee;

insert into employee(id,f_nm,l_nm,age,location,dept)
values(11,'Rama','kumara',32,'Chennai','HR');    

update employee set dept = 'HR' where f_nm ='Mohan';

delete from employee where f_nm ='Devi';


/*Revoke command */
/* REVOKE - Stops the granted permission.*/
revoke delete on employee from PS4;
revoke update on employee from PS4;
revoke insert on employee from PS4;
revoke select on employee from PS4;


drop user PS1;

revoke USAGE, SELECT ON SEQUENCE employee_id_seq from PS1; /*does not work*/

/*TCL -TRANSACTION CONTROL LANGUAGE - COMMIT, ROLLBACK, BEGIN */

select *from employee;

delete from employee where f_nm ='Priya';
/*->now priya is deleted.
-> How to bring back priya again?*/

begin;
->start transaction.

delete from employee where f_nm ='Ravi';

/*->now ravi is deleted, but we can bring back the data.*/
rollback;

/*Ravi is returned, but Priya is not as transaction was not begun before deleting Priya*/

commit; 
->stop transaction.

delete from employee where f_nm ='Akil';


select * from employee;































