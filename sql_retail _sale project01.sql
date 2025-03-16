-- creating database-- 
drop database if exists retail_salesproject1; 
CREATE database retail_salesproject1;
use retail_salesproject1;
create table retail_sales
(
transactions_id int primary key,
sale_date date,
sale_time time,
customer_id int,
gender varchar(50),
age int,
category varchar(50),
quantiy int,
price_per_unit decimal,
cogs decimal,
total_sale decimal
);
select * from retail_sales ;


-- data cleaning-- 

select * from retail_sales 
where
transactions_id is null
or
sale_date is null
or 
sale_time is null
or 
customer_id is null
or 
gender is null
or 
age is null
or 
category is null
or 
quantiy is null
or
price_per_unit is null
or 
cogs is null
or 
total_sale is null;

-- data exploration-- 
-- how many sales we have-- 

select count(*)from retail_sales;

-- how many uniqk customers we have

select count(distinct customer_id) from retail_sales;
select distinct category from retail_sales;

-- data analysis business key problems

-- Q1 write a sql query to retrive the colums sales made on 22-11-2024

select * from retail_sales where sale_date = '2022-05-11';

-- Q2 write a sql query to retrive the all the transations where category is clothing and quantity  sold is more than 4 in the month of nov-2022

select category, sum(quantiy) 
from retail_sales 
where category ='clothing' AND
sale_date between '2022-11-01' and '2022-11-30' and
quantiy>2;

-- Q3write a sql query to calculate the total_sales for each category

select category,sum(total_sale) from retail_sales
group by 1;

-- Q4write a sql query to find avg age of customers wh purchase items from 'bueaty'category;

select avg(age) as avgage from retail_sales
where category='beauty';

-- Q5write a sql query to find all the transations where the total_ia greater than 1000;
select * from retail_sales
where total_sale>1000;

-- Q6 write a sql query to find all the transations made by each gender in each category;

select category,gender,count(*) as retail_sales
 from retail_sales
group by category,gender 
order by 1;

-- Q7 write a sql query to calculate avarage sale for each month find out the best selling month in each year

select 
extract(YEAR FROM sale_date) as year,
extract(month FROM sale_date) as month,
avg(total_sale) as avg_sale
from retail_sales
group by 1,2
order by 1,2;

-- Q8 write a sql query to find out the top 5 customers based on heigest total sale; 

select customer_id,  sum(total_sale) as total_sale 
from retail_sales
group by 1
order by 2 desc
limit 5;

-- Q9 write a sql query to find the number of uniqe customer who purchased from each category;

select category, count( distinct customer_id) as distinctcustomer
from retail_sales
group by category;
-- Q10 write a sql query to create each shift and numbr=er of orders(example morning=<12,afternoon between 12&17, evening>17)

select *,
case 
   when extract(hour from sale_time) <12 then 'morning'
   when extract(hour from sale_time) between 12 and 17 then 'afternoon'
   else
   'evening'
 end as shift 
 from retail_sales;
 
 -- project end--  