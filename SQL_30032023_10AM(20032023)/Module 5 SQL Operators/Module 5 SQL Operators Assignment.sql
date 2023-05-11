/*SELECTION COMMANDS:- (FILTERING):- in, like, between
1.	Create a Supermart_DB with the tables created from the datasets shared (Customer.csv, Sales.csv and Product.csv files)
*/
 
/*create database Supermart_DB;*/

/* 2.Define the relationship between the tables using constraints/keys.  */

/* 3.In the database Supermart _DB, find the following:
a.	Get the list of all the cities where the region is south or east without any duplicates using IN statement.
b.	Get the list of all orders where the ‘sales’ value is between 100 and 500 using the BETWEEN operator.
c.	Get the list of customers whose customer name contains only 10 characters using LIKE.
*/

create table Customer(
Customer_ID varchar(30),Customer_Name varchar(30),Segment varchar(30),Age int, Country varchar(30),City varchar(30),
States varchar(30),Postal_Code varchar(30),Region varchar(30),
primary key(Customer_ID)
);

select * from Customer;

create table Product(
Product_ID varchar(30),Category varchar(30),Sub_Category varchar(30),Product_Name varchar(500),
primary key(Product_ID)
);

select * from Product; 

create table Sales(
Order_Line int,Order_ID varchar(30),Order_Date date,Ship_Date date,Ship_Mode varchar(30),Customer_ID varchar(30),
Product_ID varchar(30),Sales real,Quantity int,Discount real,Profit real,
foreign key(Customer_ID) references Customer(Customer_ID),foreign key(Product_ID) references Product(Product_ID)
);

select * from Sales; 

/* a */
select distinct city,region from Customer where region in ('South','East');

/* b */
select Order_ID,Sales from Sales where Sales between 100 and 500;

/* c */
select Customer_Name from Customer where Customer_Name like '__________';


/* SELECTION COMMANDS:- ordering */
/* 1.	Retrieve all orders where the ‘discount’ value is greater than zero ordered in descending order basis
‘discount’ value
2.	Limit the number of results in the above query to the top 10. */

select * from Sales where Discount > 0 order by Discount desc limit 10;

/* Aggregate commands:- */

/* 1.	Find the sum of all ‘sales’ values.
   2.	Find count of the number of customers in the west region with ages between 20 and 30
   3.	Find the average age of east region customers
   4.	Find the minimum and maximum aged customers from Philadelphia */
   
select sum(Sales) from Sales;

select count(*) from Customer where Age between 20 and 30 group by Region having Region ='West';

select avg(Age) from Customer where Region = 'East';

select min(Age),max(Age) from Customer where City = 'Philadelphia';

/* GROUP BY COMMANDS:-
1.	Make a dashboard showing the following figures for each product ID
a.	Total sales (in $) order by this column in descending 
b.	Total sales quantity
c.	The number of orders
d.	Max Sales value
e.	Min Sales value
f.	Average sales value
2.	Get the list of product ID’s where the quantity of product sold is greater than 10
*/

select Product_ID,Sales from Sales group by Product_ID,Sales order by Sales desc;

select Quantity,Sales from Sales group by Quantity,Sales order by Sales desc;

select Order_ID,Sales from Sales group by Order_ID,Sales order by Sales desc;

select max(Sales),Product_ID from Sales group by Sales,Product_ID;

select min(Sales),Product_ID from Sales group by Sales,Product_ID;

select avg(Sales),Product_ID from Sales group by Sales,Product_ID;

select Product_ID,Quantity from Sales where Quantity > 10 group by Product_ID,Quantity;

/*Order by & limit:-
1.	Retrieve all orders where ‘discount’ value is greater than Zero ordered in descending order basis ‘discount’
Value.
2.	Limit the number of results in above query to top 10.
*/

select * from Sales where Discount > 0 order by Discount desc limit 10;

   






















