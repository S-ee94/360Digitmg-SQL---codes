/*Joins 
1.	Run the below query to create the datasets.
a.	/*Creating sales table of the year 2015*/
•	Create table sales_2015 as select * from sales where ship_date between '2015-01-01' and '2015-12-31';
•	select count(*) from sales_2015; 
•	select count(distinct customer_id) from sales_2015;*/

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


create table sales_2015 as
select * from Sales where Ship_Date between '2015-01-01' and '2015-12-31';	

select * from sales_2015;

select count(*) from sales_2015;

select count(distinct Customer_ID) from sales_2015;

/*b.	/* Customers with ages between 20 and 60 */
•	create table customer_20_60 as select * from customer where age between 20 and 60;
•	select count (*) from customer_20_60;
*/

create table customer_20_60 as
select * from Customer where Age between 20 and 60;
select count(*) from customer_20_60;

/*2.	Find the total sales done in every state for customer_20_60 and sales_2015 table
Hint: Use Joins and Group By command
*/

select * from customer_20_60;
select * from sales_2015;

select customer_20_60.Customer_ID,States,Sales from customer_20_60 inner join sales_2015
on customer_20_60.Customer_ID = sales_2015.Customer_ID group by customer_20_60.Customer_ID,States,Sales;

/*3. Get data containing Product_id, Product name, category, total sales value of that product, and total 
quantity sold. (Use sales and product tables)*/

select * from Product;
select * from Sales;

select Product.Product_ID,Product_Name,Category,Sales,Quantity from Product inner join Sales
on Product.Product_ID = Sales.Product_ID group by Product.Product_ID,Product_Name,Category,Sales,Quantity;




















