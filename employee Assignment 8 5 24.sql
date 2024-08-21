-- =============================================
-- Author:		Kelvin Oduwale
-- Create date: 07-6-2024
-- Description:	This code is to extract data from sql
--				Do more analysis on Table Customers.
--Revise Date: 08-20-2024
--Version:		v1.0
-- =============================================


create database SQLinterview
go 

use SQLinterview

create table location
(
Location_Id int primary key,
City varchar (20) 
);

insert into location
values
(122, 'New York'),
(123, 'Dallas'),
(124, 'Chicago'),
(167, 'Boston');

create table department 
values
(10, 'Accounting' 122),
(20, 'Sales', 124),
(30, 'Research', 123),
(40, 'Operation', 167);

create table Job
(Job_Id int, DESIGNATION varchar(20))

insert into Job 
Values
(667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales Person'),
(671, 'Manager'),
(672, 'President');

create table Employee 
(
Emlpoyee_Id int,
Last_Name varchar(20),
First_Name varchar(20),
Middle_Name varchar(20),
Job_Id int,
Manager_Id int,
Hire_Data date,
Salary money,
Comm int,
Department_Id int
);

insert into Employee
Values
(7369, 'Smith', 'John', 'Q', 667, 7902, '17-DEC-84', 800, NULL, 20),
(7499, 'Allen', 'Kevin', 'J', 670, 7698, '20-FEB-85', 1600, 300, 30),
(7505, 'Doyle', 'Jean', 'K', 671, 7839, '04-APR-85', 2850, NULL, 30),
(7506, 'DENNIS', 'LYNN', 'S', 671, 7839, '15-MAY-85', 2750, NULL, 30),
(7507, 'Baker', 'Leslie', 'D', 671, 7839, '10-JUN-85', 2200, NULL, 40),
(7521, 'Wark', 'Cynthia', 'D', 670, 7698, '22-FEB-85', 1250, 500, 30);


--QUESTION 1: DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES
select * 
from
(
select *,
case
when Salary <=1500 then 'Grade1'
when Salary >=1500 and Salary <=2000 then 'Grade2'
when Salary between 1500 and 2000 then 'Grade3'
when Salary between 2000 and 2500 then 'Grade4'
when Salary >2500 then 'Grade5'
else 'Unknown'
end as 'Salary Grade'
from Employee
)x

--QUESTION 2 - LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS
select * from DEPARTMENT
select * from EMPLOYEE
select 
b.*,
d.*
from DEPARTMENT b
join EMPLOYEE d
on b.DEPARTMENT_ID = d.Department_ID
where b.DEPARTMENT_ID in (10, 20)


--QUESTION 3: DISPLAY THE EMPLOYEES LIST WHO GOT THE MAXIMUM SALARY

select * from Employee
where Salary = (
select max(salary)
from Employee
)

--QUESTION 4: DISPLAY THE EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT
select * 
from Employee
where Department_Id = 20

--QUESTION 5: FIND OUT NO. OF EMPLOYEES WORKING IN SALES DEPARTMENT

select count (*) as No_of_Employees
from EMPLOYEE
where Department_ID = 20

--QUESTION 6: DISPLAY  THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS
select *
from(
select *,
DENSE_RANK () over (order by salary desc) as 'DRNK'
from Employee
)x
where DRNK= 2;

--QUESTION 7: List out the employees who earn more than every employee in department 
select *
from Employee
where Department_Id = 30 and Salary = (
select max(salary)
from Employee
);

--QUESTION 8: Find out the employee who earn greater than the average salary for their deparment
select * 
from Employee
where salary > (
select avg(salary)
from Employee as [avg]
where [avg].Department_Id = Employee.Department_Id
)

--PART TWO

CREATE TABLE customers (
    customer_id integer PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100)
);

CREATE TABLE products (
    product_id integer PRIMARY KEY,
    product_name varchar(100),
    price decimal
);

CREATE TABLE orders (
    order_id integer PRIMARY KEY,
    customer_id integer,
    order_date date
);

CREATE TABLE order_items (
    order_id integer,
    product_id integer,
    quantity integer
);

INSERT INTO customers (customer_id, first_name, last_name, email) VALUES
(1, 'John', 'Doe', 'johndoe@email.com'),
(2, 'Jane', 'Smith', 'janesmith@email.com'),
(3, 'Bob', 'Johnson', 'bobjohnson@email.com'),
(4, 'Alice', 'Brown', 'alicebrown@email.com'),
(5, 'Charlie', 'Davis', 'charliedavis@email.com'),
(6, 'Eva', 'Fisher', 'evafisher@email.com'),
(7, 'George', 'Harris', 'georgeharris@email.com'),
(8, 'Ivy', 'Jones', 'ivyjones@email.com'),
(9, 'Kevin', 'Miller', 'kevinmiller@email.com'),
(10, 'Lily', 'Nelson', 'lilynelson@email.com'),
(11, 'Oliver', 'Patterson', 'oliverpatterson@email.com'),
(12, 'Quinn', 'Roberts', 'quinnroberts@email.com'),
(13, 'Sophia', 'Thomas', 'sophiathomas@email.com');

INSERT INTO products (product_id, product_name, price) VALUES
(1, 'Product A', 10.00),
(2, 'Product B', 15.00),
(3, 'Product C', 20.00),
(4, 'Product D', 25.00),
(5, 'Product E', 30.00),
(6, 'Product F', 35.00),
(7, 'Product G', 40.00),
(8, 'Product H', 45.00),
(9, 'Product I', 50.00),
(10, 'Product J', 55.00),
(11, 'Product K', 60.00),
(12, 'Product L', 65.00),
(13, 'Product M', 70.00);

INSERT INTO orders (order_id, customer_id, order_date) VALUES
(1, 1, '2023-05-01'),
(2, 2, '2023-05-02'),
(3, 3, '2023-05-03'),
(4, 1, '2023-05-04'),
(5, 2, '2023-05-05'),
(6, 3, '2023-05-06'),
(7, 4, '2023-05-07'),
(8, 5, '2023-05-08'),
(9, 6, '2023-05-09'),
(10, 7, '2023-05-10'),
(11, 8, '2023-05-11'),
(12, 9, '2023-05-12'),
(13, 10, '2023-05-13'),
(14, 11, '2023-05-14'),
(15, 12, '2023-05-15'),
(16, 13, '2023-05-16');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 2, 1),
(2, 3, 3),
(3, 1, 1),
(3, 3, 2),
(4, 2, 4),
(4, 3, 1),
(5, 1, 1),
(5, 3, 2),
(6, 2, 3),
(6, 1, 1),
(7, 4, 1),
(7, 5, 2),
(8, 6, 3),
(8, 7, 1),
(9, 8, 2),
(9, 9, 1),
(10, 10, 3),
(10, 11, 2),
(11, 12, 1),
(11, 13, 3),
(12, 4, 2),
(12, 5, 1),
(13, 6, 3),
(13, 7, 2),
(14, 8, 1),
(14, 9, 2),
(15, 10, 3),
(15, 11, 1),
(16, 12, 2),
(16, 13, 3);

select * from order_items


select * from customers a
select * from products b
select * from orders c
select * from order_items d

--	Question 1:Which product has the highest price? Only return a single row.
Select * from products
where price= (
select max(price)
from products
)
	
--QUESTION 2: WHICH CUSTOMER HAS MADE THE MOST ORDERS?
select
a.customer_id, 
a.first_name, 
a.last_name,
a.email,
count(c.order_id) as order_count
from orders c
join customers a
on a.customer_id = c.customer_id
group by
a.customer_id, a.first_name, a.last_name, a.email
order by order_count desc

--USING DENSE RANK
select *
from
(
select 
a.customer_id, 
a.first_name, 
a.last_name,
a.email,
count (order_id) as Order_count,
Dense_rank () over (order by count (order_id) desc) as 'DRNK' 
from orders c 
join customers a 
on c.customer_id = a.customer_id
group by 
a.customer_id, a.first_name, a.last_name, a.email
)x
where DRNK = 1  


/**
with CTE1 as (
select
customer_id,
count (customer_id) as Customer_count
from orders
group by
customer_id
),
CTE2 as (
select * from customers
)
select * from CTE2 C2
inner join CTE1 C1
on C1.customer_id = C2.customer_id
where Customer_count =
**/

--QUESTION 3- WHAT IS THE TOTAL REVENUE PER PRODUCT
select * from products b
select * from order_items d

select 
b.product_id,
b.product_name,
sum( b.price * d.quantity) as Total_Revenue
from products b
join order_items d 
on b.product_id = d.product_id
group by
b.product_id, b.product_name
order by Total_Revenue 


--QUESTION 4 -FIND THE DAY WITH THE HIGHEST REVENUE
select 
c.order_date,
b.product_name,
b.price,
d.quantity,
(b.price * d.quantity) as Total_Revenue
from order_items d
join orders c
on c.order_id = d.order_id
join products b
on b.product_id = d.product_id
where (b.price * d.quantity) = 
(
		select 
		max(b.price * d.quantity)
		from order_items d
		join products b
		on b.product_id=d.product_id
)


--QUESTION 5 - FIND THE FIRST ORDER (BY DATE) FOR EACH CUSTOMER
--FIRST WAY 
select
a.customer_id, 
a.first_name, 
a.Last_Name,
min(c.order_date) as First_Order_Date
from customers a
join orders c
on a.customer_id = c.customer_id
group by
a.customer_id, a.first_name, a.Last_Name

select * from orders


--SECOND WAY
select
a.customer_id, 
a.first_name, 
a.Last_Name,
c.order_date as First_Order_Date
from customers a
join orders c
on a.customer_id = c.customer_id
where order_date = (
select
min(c.order_date) as First_Order_Date
from orders c
)


--another way
select
a.customer_id, 
a.first_name, 
a.Last_Name,
c.order_date as First_Order_Date
from customers a
join orders c
on a.customer_id = c.customer_id
order by 4 


--QUESTION 6 -FIND THE TOP 3 CUSTOMERS WHO HAVE ORDERED THE MOST DISTINCT PRODUCTS

SELECT * FROM customers a
SELECT * FROM order_items d
SELECT * FROM orders c


--USING TOP 3 BUT NOT ADVISABLE
select TOP 3
a.customer_id,
a.first_name, 
a.Last_Name,
count (distinct d.product_id) as Distinct_Count
from customers a
join orders c
on a.customer_id = c.customer_id
join order_items d
on d.order_id = c.order_id
group by 
a.customer_id, a.first_name, a.Last_Name
order by Distinct_Count desc


--USING DENSE RANK 
select *
from
(
select 
a.customer_id, 
a.first_name, 
a.last_name,
count (DISTINCT d.product_id) as Distinct_Product_Count,
Dense_rank () over (order by count (DISTINCT d.product_id) desc) as 'DRNK' 
from customers a
join orders c
on a.customer_id = c.customer_id
join order_items d
on d.order_id = c.order_id
group by 
a.customer_id, a.first_name, a.last_name
)x
where DRNK = 1



--QUESTION 7 - WHICH PRODUCT HAS BEEN BOUGHT THE LEAST IN TERMS OF QUANTITY
SELECT * FROM order_items d
SELECT * FROM products b


--USING DENSE RANK
select *
from
(
select 
b.product_id,
b.product_name,
sum(d.quantity) as Total_Quantity_Sold,
Dense_rank () over (order by sum(d.quantity)) as 'DRNK' 
from products b
join order_items d
on b.product_id = d.product_id
group by
b.product_id, b.product_name
)x
where DRNK = 1


--QUESTION 8 - WHAT IS THE MEDIAN ORDER TOTAL
select avg(order_total) as Median_Order_Total
from
(
select 
sum(b.price * d.quantity) as order_total
from orders c
join order_items d
on d.order_id = c.order_id
join products b
on b.product_id = d.product_id
group by c.order_id
)x



--QUESTION 9 -FOR EACH ORDER, DETERMINE IF IT WAS 'EXPENSIVE' (TOTAL OVER 300)
--AFFORDABLE (TOTAL OVER 100), CHEAP (<100)
SELECT * FROM order_items
SELECT * FROM orders
select
order_id,
order_total,
case 
when order_total > 300 then 'Expensive'
when order_total > 100 then 'Affordable'
else 'Cheap'
end as Order_Class
from
(
select
c.order_id,
sum (b.price * d.quantity) as order_total
from orders c
join order_items d
on c.order_id = d.order_id
join products b
on d.product_id = b.product_id
group by
c.order_id
)x

--QUESTION 10 - FIND CUSTOMERS WHO HAVE ORDERED THE PRODUCT WITH THE HIGHEST PRICE 

select 
a.Customer_id,
a.first_name,
a.last_name,
a.email,
b.price
from customers a
join orders c
on a.customer_id=c.customer_id
join order_items d
on d.order_id=c.order_id
join products b
on d.product_id = b.product_id
where b.price =
(
select max(price)
from products
)