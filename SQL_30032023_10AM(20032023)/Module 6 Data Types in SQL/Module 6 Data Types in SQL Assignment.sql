/*1.Get data with all columns of the sales table, and customer name, customer age, product name, 
and category are in the same result set. (use join in the subquery, refer to the datafiles from 
Assignments-05)
2.	Get data sales table, product name, and category in the result set.
3.	Without using the join concept create a sub-query by using the customer, product, sales data.
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

select sales.*,Customer.Customer_name, Customer.Age,
Product.Product_name, Product.Category from (Customer full outer join sales on
Customer.Customer_ID=Sales.Customer_ID full outer join product on
Product.Product_ID=Sales.Product_ID);

select sales.*,Product.Product_Name,Product.Category from (Customer full outer join Sales
on Customer.Customer_ID=Sales.Customer_ID full outer join product on
Product.Product_ID=Sales.Product_ID);

select * from Sales where Quantity=20;

update Sales
set Quantity=20 where Order_Line=1;

update Sales
set Quantity=20 where Order_Line in(select Order_Line from Sales where Customer_ID='DV-13045')

update Sales
set Ship_Mode='B-300' where Product_ID in(select Ship_Mode from Sales where 
Product_ID='FUR-BO-10001798');

--Functions: -
--string functions: -

-- Find maximum length of characters in the Product name string from Product table
select * from Product;

select max(length(product_name)) from product;

--Retrieve product name, sub-category and category from Product table 
--and an additional column named “product_details” which contains a 
--concatenated string of product name, sub-category and category.

select concat(product_name,sub_category,category) as con_lisst from product;

-- Analyze the product_id column and take out the three parts 
-- composing the product_id in three different columns.

select *,SPLIT_Part(product_id,'-',1),split_part(product_id,'-',2),split_part(product_id,'-',3)
from Product

-- List down comma separated product name where sub-category is either Chairs or tables.

select product_name,sub_category from product where sub_category in('Chairs','Tables')

/* Mathematical functions: - */

-- You are running a lottery for your customers. 
-- So, pick a list of 5 lucky customers from customer table using random function.

select * from customer

select customer_name from customer where customer_name like ('Cy%')

-- Suppose you cannot charge the customer in fraction points.
-- So, for sales value of 1.63, you will get either 1 (or) 2. In such a scenario, find out.

--1.  Total sales revenue if you are charging the lower integer value of sales always.

select sum(floor(sales)) as down_round from sales;

--2. Total sales revenue if you are charging the higher integer value is sales always.
select sum(ceiling(sales)) as up_round from sales;

--3. Total sales revenue if you are rounding-off the sales always.
select sum(Round(sales)) as round from sales;

/* Date & Time functions: - */

-- Find out the current age of “batman” who was born on “April 6,1939” in Years, months and days

create table batman(sno integer, name varchar, DOB date)

insert into batman(
values(1,'batman','1939/04/06'))

select * from batman;

select age(now(),dob) from batman

-- Analyze and find out the monthly sales of sub-category
-- chair. Do you Observe any seasonality in sales of this sub-category.

select product_name,order_date,sales from (product full outer join sales
on 
product.product_id=sales.product_id) where sub_category in ('Chairs')


















