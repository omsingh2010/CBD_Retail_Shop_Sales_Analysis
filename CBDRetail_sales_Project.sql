Create Database Retail_Sales_Project;
USE Retail_Sales_Project;
CREATE TABLE SalesData
(
transactions_id INT,
sale_date	DATE,
sale_time	TIME,
customer_id	INT,
gender	VARCHAR(15),
age	INT,
category VARCHAR(15),	
quantiy	INT,
price_per_unit FLOAT,	
cogs	FLOAT,
total_sale FLOAT
);

ALTER TABLE SalesData ADD PRIMARY KEY (transactions_id);
SELECT * FROM SalesData;

-- Checking Irregularities in Data by findinf NULL values in all coloumn. 

Select * from salesdata
where 
transactions_id  is NULL
OR 
sale_date is NULL
OR 
sale_time is NULL
OR
Customer_id is NULL
OR 
Gender is NULL
or
Age is NULL
or
Category is Null
or
quantiy is Null
or
Price_per_unit is NULL
or 
Cogs is NULL
or Total_sale is NULL
;

-- Deleting the NULL records datasets to clean data
Delete FROM salesData
WHERE 
transactions_id  is NULL
OR 
sale_date is NULL
OR 
sale_time is NULL
OR
Customer_id is NULL
OR 
Gender is NULL
or
Age is NULL
or
Category is Null
or
quantiy is Null
or
Price_per_unit is NULL
or 
Cogs is NULL
or Total_sale is NULL
;

-- 1987 Rows Left
-- LET'S EXPLORE THE DATA.
-- How many sales transaction has happened in total?
select count(*) from salesdata;

-- How many total customers do we have?
Select Count(DISTINCT Customer_id) from salesdata;

-- How many categories we have?
Select distinct category from salesdata;

-- Data Analysis & Solving Kay Business provlems. 

-- Write a SQL query to retrieve all columns for sales made on '2022-11-05'
Select *
FROM salesdata 
WHERE sale_date = '2022-11-05';

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select *
from salesdata
where category = 'clothing'
AND  Quantiy > 1
AND sale_date >= '2022-05-01'
AND sale_date< '2022-06-01';

SELECT *
FROM salesdata
WHERE category = 'Clothing'      
  AND quantiy > 1
  AND DATE_FORMAT(sale_date, '%Y-%M') = '2022-05'; -- %M LIKHNE pe 0 rows returned BUT %m likhne pe 12 records.  WHY??

-- Write a SQL query to calculate the total sales (total_sale) for each category.
select category, Count(*) from salesdata group by category;


-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select avg(age) as AVG_AGE 
from salesdata
where category = 'beauty'; 

-- Write a SQL query to find all transactions where the total sale is greater than 1000.

select * from salesdata where total_sale> '1000';

-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select gender, count(*) from salesdata group by gender;

-- Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

select Month(sale_date) as MONTH_, avg(total_sale) as AVG_SALE_PER_Month 
from salesdata 
WHERE Year(sale_date)= 2023 
group by MOnth(sale_date) 
order by month(sale_date);

-- Write a SQL query to find the top 5 customers based on the highest total sales

select Customer_id, SUM(total_sale) as Total
FROM salesdata
GROUP BY Customer_id 
Order by count(total_sale) desc  Limit 5 ;

-- Write a SQL query to find the number of unique customers who purchased items from each category.
select Category, Count(distinct customer_id) as Customers 
from salesdata  
GROUP BY category;


-- Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17).
-- THIS IS CALLED DATA SEGMENTATION as we segmented the sales data into 3 shifts by extracting time HOURS from sale_time...................
Select*,
CASE
WHEN Extract(HOUR from Sale_time) < 12 THEN 'MORNING'
WHEN Extract(HOUR from Sale_time) BETWEEN 12 AND 17 THEN 'AFTERNOON'
ELSE 'EVENING'
END as SHIFT
FROM SalesData;

WITH Shift_Data as
(
Select*,
CASE
WHEN Extract(HOUR from Sale_time) < 12 THEN 'MORNING'
WHEN Extract(HOUR from Sale_time) BETWEEN 12 AND 17 THEN 'AFTERNOON'
ELSE 'EVENING'
END as SHIFT
FROM SalesData
)
Select Shift, COUNT(transactions_id) as Transactions from Shift_data Group by Shift; 

-- END OF THE PROJECT--











 











































