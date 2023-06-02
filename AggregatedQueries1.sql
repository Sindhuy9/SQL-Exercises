--1- write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909

UPDATE Orders SET City=null WHERE Order_ID IN ('CA-2020-161389' , 'US-2021-156909')

--2- write a query to find orders where city is null (2 rows)

SELECT * FROM [dbo].[Orders] WHERE City is null

--3- write a query to get total profit, first order date and latest order date for each category

SELECT Category,sum(profit) as total_profit, min(Order_date) as first_order_date, max(Order_date) as latest_order_date
FROM [dbo].[Orders]
GROUP BY Category

--4- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category

SELECT Sub_Category,avg(Profit) as avg_profit,max(profit) as max_profit
FROM [dbo].[Orders]
GROUP BY Sub_Category
HAVING avg(Profit) > (0.5* max(Profit))

--5- create the exams table with below script;
create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

--write a query to find students who have got same marks in Physics and Chemistry.

select student_id , marks
from exams
where subject in ('Physics','Chemistry')
group by marks,student_id 
having count(marks)=2

--*6- write a query to find total number of products in each category.



SELECT Category, COUNT(DISTINCT Product_ID) AS No_of_products
FROM Orders 
GROUP BY Category

-- 7- write a query to find top 5 sub categories in west region by total quantity sold

SELECT TOP 5 Sub_Category,SUM(Quantity) as total_quantity FROM [dbo].[Orders] 
WHERE Region='West'
GROUP BY Sub_Category
ORDER BY total_quantity DESC


--8- write a query to find total sales for each region and ship mode combination for orders in year 2020
--order by total_sales desc

SELECT Region, Ship_Mode,SUM(Sales) as total_sales FROM [dbo].[Orders] 
WHERE Order_Date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY Region, Ship_Mode
ORDER BY total_sales DESC
