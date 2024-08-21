-- =============================================
-- Author:		Kelvin Oduwale
-- Create date: 05-5-2024
-- Description:	This code is to extract data from sql
--				Do more analysis on Table Customers.
--Revise Date: 05-7-2024
--Version:		v1.0
-- =============================================

use SQLTraining

Create table Dealer_Customer(
Customer_ID int,
Last_Name varchar(50),
First_Name varchar(50)
);

select * from Dealer_Customer

insert into Dealer_Customer
Values
(1, 'Adams', 'Frank'),
(2, 'Smith', 'John'),
(3, 'Hamilton', 'Edward'),
(4, 'Parks', 'Sara'),
(5, 'Zone', 'Nancy'),
(6, 'Johnson', 'Mark'),
(7, 'Craft', 'Susan'),
(8, 'Ford', 'Henry'),
(9, 'London', 'Jack'),
(10, 'Polansky', 'Shelly');




Create table Dealer_Car(
CarId int,
Make varchar(50),
Model varchar(50),
Price int, 
Store_Location varchar(50),
Customer_Id int
);

id
insert into Dealer_Car
Values
(1, 'Ford', 'F150', 13000, 'San Francisco', 1),
(2, 'Mercedes Benz', 'E350', 50000, 'San Jose', 2),
(3, 'Ford', 'F250', 24000, 'San Francisco', 5),
(4, 'Toyota', 'Camry', 30000, 'Oakland', 4),
(5, 'Toyota', 'Corolla', 10000, 'Oakland', 2),
(6, 'Honda', 'Civic', 9000, 'San Jose', 1),
(7, 'Honda', 'CRV', 16000, 'San Francisco', 3),
(8, 'Mazda', '3', 3000, 'San Jose', NULL),
(9, 'Tesla', 'Model 3', 102000, 'San Francisco', Null);

select * from Dealer_Customer

select * from Dealer_Car

select 
a.Customer_Id,
b.Last_Name,
b.First_Name,
a.CarId,
a.Make,
a.Model,
a.Price,
a.Store_Location
from Dealer_Car a
Join Dealer_Customer b
on a.Customer_Id=b.Customer_ID
where a.Store_Location='San Francisco'

--List all the cars whoose price is greater than 10000
select * from Dealer_Car
where price > 10000

--List all the customers whose name ends with smith 
select * from Dealer_Customer
where Last_Name = 'Smith'

--List of average price of cars
Select avg(Price) as average_Price
from Dealer_Car

--List all the cars whose price ranges from 1000 to 10000
select * from Dealer_Car
where price between 1000 and 10000;

--How many cars does the car dealer have in total?
select Count(*) as Total_cars
from Dealer_Car;

--What are the maximum prices of the cars
Select max(Price) as highest_Price
from Dealer_Car;

--What are the minimum prices of the cars
Select min(Price) as lowest_Price
from Dealer_Car

--List all the cars that are related to the San fose store
select * from Dealer_Car
where Store_Location = 'San Jose';

--How many cars do we have in each store
select Store_Location,
Count(*) as car_count from Dealer_Car
Group by Store_Location

--List all the customers who bought cars in San Francisco
select 
a.Customer_Id,
b.Last_Name,
b.First_Name,
a.CarId,
a.Make,
a.Model,
a.Price,
a.Store_Location
from Dealer_Car a
Join Dealer_Customer b
on a.Customer_Id=b.Customer_ID
where a.Store_Location='San Francisco'














































--List all the cars that customer #1 (Frank Adams) has bought
select 
a.Customer_ID,
a.LastName,
a.FirstName,
b.CarID,
b.Make,
b.Model,
b.price,
b.StoreLocation
from Car b
join CarCustomer a
on a.Customer_ID-b.CustomerID
where Customer_ID=1





--List the first name and the car make, model for all the customers who purchased cars from oakland.
