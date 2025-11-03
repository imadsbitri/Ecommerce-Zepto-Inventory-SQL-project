drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR (150) NOT NULL,
mrp NUMERIC (8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountSellingPrice NUMERIC (8,2),
weightInGms INTEGER,
outofstock BOOLEAN,
quantity INTEGER 
);

-- Reset the auto-increment sequence to start from 1
ALTER SEQUENCE zepto_sku_id_seq RESTART WITH 1;

--Data exploration 

--Count of rows
Select count(*) 
from zepto;

--sample data
select *
from zepto
limit 10;

--null values
SELECT* from zepto 
where name is NULL 
OR
category is NULL 
OR
mrp is NULL 
OR
discountpercent is NULL 
OR
availablequantity is NULL 
OR
discountsellingprice is NULL 
OR
weightingms is NULL 
OR
outofstock is NULL 
OR
quantity is NULL;

-- different products categories
SELECT DISTINCT category FROM zepto 
ORDER BY category;

-- products in stock vs products out of stock
Select outofstock,count(*)
from zepto
group by outofstock;

--product names present multiple times
Select name , count(sku_id) AS "Number of SKUs"
from zepto 
group by name
having count(sku_id)>1
Order by count(sku_id) Desc;

--data cleaning

--products wit price =0
Select * from zepto
where mrp=0 or discountsellingprice =0;

Delete from zepto
where mrp=0;

--convert price to rupies
update zepto 
set mrp=mrp/100.0,
discountsellingprice=discountsellingprice/100.0;

Select mrp,discountsellingprice from zepto;

-- Q1. Find the top 10 best-value products based on the discount percentage.
select distinct name ,mrp,discountpercent
from zepto
order by discountpercent desc
limit 10;

--Q2.What are the Products with High MRP but Out of Stock
Select distinct name ,mrp, outofstock
from zepto 
where outofstock =true and mrp>300
order by mrp desc;

--Q3.Calculate Estimated Revenue for each category
select category,sum(discountsellingprice * availablequantity) AS total_revenue
from zepto
group by category
order by total_revenue;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
Select *
from zepto
where mrp>500 and discountpercent<10
order by mrp desc;
-- Q5. Identify the top 5 categories offering the highest average discount percentage.
Select category,AVG(discountpercent)
from zepto
group by category
order by AVG(discountpercent) desc
limit 5 ;
-- Q6. Find the price per gram for products above 100g and sort by best value.
Select name , mrp/weightingms AS price_per_gram 
from zepto
where weightingms >100 
order by price_per_gram;
--Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN 'Low'
	WHEN weightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;
--Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;
