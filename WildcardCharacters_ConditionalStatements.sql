
/*1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character (58 rows)
2- write a sql to get all the orders placed in the month of dec 2020 (352 rows)
3- write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020 (944 rows)
4- write a query to get all the orders where customer name neither start with "A" and nor ends with "n" (9815 rows)
5- write a query to get all the orders where profit is negative (1871 rows)
6- write a query to get all the orders where either quantity is less than 3 or profit is 0 (3348)
7- your manager handles the sales for South region and he wants you to create a report of all the orders in his region where some discount is provided to the customers (815 rows)
8- write a query to find top 5 orders with highest sales in furniture category 
9- write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only (1021 rows)
10-write a query to find all the orders where order date is in year 2020 but ship date is in 2021 (33 rows)*/

--1
SELECT * FROM [dbo].[Orders] WHERE Customer_Name LIKE '_a_d%'
-- 2
SELECT * FROM [dbo].[Orders] WHERE Order_Date BETWEEN '2020-12-01' AND '2020-12-31'
-- 3
SELECT * FROM [dbo].[Orders] WHERE Ship_Mode NOT IN ('Standard Class','First Class') AND Ship_Date >= '2020-12-01'
--4
SELECT * FROM [dbo].[Orders] WHERE Customer_Name NOT LIKE 'A%' OR Customer_Name NOT LIKE '%n'
--5
SELECT * FROM [dbo].[Orders] WHERE Profit < 0
--6
SELECT * FROM [dbo].[Orders] WHERE Quantity < 3 OR Profit=0
-- 7
SELECT * FROM [dbo].[Orders] WHERE Region='South' AND Discount > 0
--8
SELECT TOP 5 * FROM [dbo].[Orders] WHERE Category='Furniture' ORDER BY Sales DESC
--9 
SELECT * FROM [dbo].[Orders] WHERE Category IN ('Furniture','Technology') AND (Order_Date BETWEEN '2020-01-01' AND '2020-12-31') 
--10
SELECT * FROM [dbo].[Orders] WHERE Order_Date < '2021-01-01' AND Ship_Date >='2021-01-01'
