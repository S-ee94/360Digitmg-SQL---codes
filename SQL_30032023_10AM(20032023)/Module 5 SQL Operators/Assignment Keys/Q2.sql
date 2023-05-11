use dheeraj

-- Find maximum length of characters in the Product name string from Product table

select max(len(Product_Name)) from Product_01

select * from Product_01

-- Retrieve product name, sub-category and category from Product table and an 
-- additional column named “product_details” which contains a concatenated string 
-- of product name, sub-category and category.



select Sub_category,Product_name,Category,concat(Category,Sub_Category,product_name) as 'product_details' from product_01

-- Analyze the product_id column and take out the three parts composing the product_id in three different columns



create table batman(sno integer,Cname varchar(30),DOB date)

insert into batman(sno,Cname,DOB)
values(1,'batman','06/04/1939')

select datediff(yy,DOB,getdate()) from batman

-- 







