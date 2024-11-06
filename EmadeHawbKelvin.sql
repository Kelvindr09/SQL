-- =============================================
-- Author:		Kelvin Oduwale
-- Create date: 05-8-2024
-- Description:	This code is to extract data from sql
--				Do more analysis on Table Customers.
--Revise Date: 06-10-2024
--Version:		v1.0
-- =============================================

CREATE TABLE EmadeCustomer									
([ID] int, 
[CustomerName] varchar(30), 
[CustomerNumber] varchar(10), 
[Address] varchar(30),
[City] varchar(30),
[State] varchar(2),
[Zip] varchar(10),
[Country] varchar(2),
[FamilyID] int)									
;									


INSERT INTO EmadeCustomer									
([ID], 
[CustomerName], 
[CustomerNumber],
[Address], 
[City],
[State], 
[Zip],
[Country], 
[FamilyID])	


VALUES									
('37925182','Bicycles R Us 1','C9879A3','16 Shore St.','Fort Lauderdale','FL','33308','US','1321'),									
('37925183','Globex Corporation NY','C6548A6','192 Cypress Lane','La Porte','NY','11741','US','6549'),									
('37925184','Hooli East Coast','C2367A5','200 West Purple Finch St.','Johnstown','NC','49509','US','9843'),									
('37925185','Ben Johnson','C3984A9','280 Oakland Rd.','Etobicoke','ON','L4C 6B9','CA',''),									
('37925186','Hooli West Coast','C3284A5','7233 South James Road','Fayetteville','CA','28303','US','9843'),									
('37925187','Globex Corporation CT','C8974A4','7375 Purple Finch Road','Derry','CT','03038','US','6549'),									
('37925188','Bicycles R Us 2','C1321A8','7387 Grant Drive','Valley Stream','NY','11580','US','1321'),									
('37925189','Hooli Northeast','C6543A7','7693 Marsh Dr.','Atwater','ME','04401','US','9843'),									
('37925190','Globex Corporation PA','C6894A3','77 Mayfair Dr.','Taunton','PA','02780','US','6549'),									
('37925193','Dylan Coopers','C4897A1','8107 Mayflower Street','Montreal','QC','H4P 1V5','CA','')									
;									
	
	
CREATE TABLE EmadeFamily									
([ID] int, 
[FamilyName] varchar(20), 
[FamilyNumber] varchar(10));	


INSERT INTO EmadeFamily									
([ID],
[FamilyName],
[FamilyNumber])	


VALUES									
('1321','Bicycles R Us','BIKES100'),									
('6549','Globex Corporation','GLOBCORP'),									
('9843','Hooli','HOOLI123');									
	
	
CREATE TABLE EmadeHawb									
([ID] int, 
[Hawb] varchar(10), 
[HawbDate] date,
[ServiceCodeID] int, 
[DueDate] date, 
[PODDate] date,
[AccountID] int, 
[ConsigneeID] int, 
[Revenue] decimal(10,2));	


INSERT INTO EmadeHawb									
([ID], 
[Hawb],
[HawbDate],
[ServiceCodeID],
[DueDate],
[PODDate],
[AccountID],
[ConsigneeID],
[Revenue])


VALUES									
('1656549987','H659124','01/13/2021','101','01/15/2021','01/16/2021','37925182','37925193','37.50'),									
('1656549988','H659125','05/21/2021','102','05/25/2021','05/23/2021','37925183','37925193','18.00'),									
('1656549989','H659126','06/14/2021','100','06/22/2021','06/21/2021','37925186','37925185','21.00'),									
('1656549990','H659127','05/16/2021','101','05/19/2021','05/19/2021','37925187','37925193','16.25'),									
('1656549991','H659128','06/30/2021','100','07/01/2021',NULL,'37925188','37925185','15.00'),									
('1656549992','H659129','05/25/2021','102','05/31/2021','06/01/2021','37925189','37925185','18.00'),									
('1656549993','H659130','08/22/2020','100','08/29/2020','08/29/2020','37925190','37925193','21.00'),									
('1656549994','H659131','02/26/2021','101','02/28/2021','02/27/2021','37925190','37925185','24.25'),									
('1656549995','H659132','05/28/2020','101','05/30/2020','05/30/2020','37925184','37925193','14.00'),									
('1656549996','H659133','12/24/2020','100','01/04/2021','01/03/2021','37925183','37925185','18.50'),									
('1656549997','H659134','05/01/2021','102','05/09/2021','05/08/2021','37925182','37925185','32.00'),									
('1656549998','H659135','07/15/2021','100','07/21/2021',NULL,'37925184','37925193','14.00'),									
('1656549999','H659136','05/02/2021','101','05/10/2021','05/09/2021','37925183','37925185','37.50'),									
('1656550000','H659137','03/15/2021','101','03/21/2021','03/27/2021','37925182','37925185','19.00'),									
('1656550001','H659138','04/03/2023','102','07/15/2024',NULL,'37925183','37925193','27.25');									
									
CREATE TABLE EmadeServiceType									
([ID] int, 
[ServiceCode] varchar(5), 
[ServiceDescription] varchar(15),
[ServiceCategoryName] varchar(10));		


INSERT INTO EmadeServiceType									
([ID],
[ServiceCode],
[ServiceDescription],
[ServiceCategoryName])	


VALUES									
('100','S200','Express','Courier'),									
('101','S400','Canada LTL','LTL'),									
('102','S300','Ground','Courier');


SELECT * FROM EmadeCustomer
SELECT * FROM EmadeFamily
SELECT * FROM EmadeHawb
SELECT * FROM EmadeServiceType


use SQLTraining




--Question 1: Calculate the delivery days for each Hawb with Service Code "S200".  Be sure to account for Hawbs that are still en-route.
--date diff syntax - DATEDIFF(DATEPART, STARTDATE, ENDDATE)
--DATEPART IS THE PART OF THE DATE YOU WANT TO USE I.E DAY, MONTH, YEAR
--USE CAST OR CONVERT TO CHANGE FROM DATE TO VARCHAR OR VICE VERRSA..IT WILL CHANGE
--COALESCE USED HERE, IF DATEDIFF(DAY, a.HawbDate, a.PODDate) IS NULL IT WILL RETURN 0 

SELECT 
A.ID,
a.Hawb, 
a.HawbDate, 
a.DueDate, 
a.PODDate, 
COALESCE(DATEDIFF(DAY, a.HawbDate, a.PODDate), 0) as DeliveryDays
FROM EmadeHawb a
JOIN EmadeServiceType B
ON A.ServiceCodeID = B.ID
WHERE B.ServiceCode = 'S200';


/**
Question 2	: For all shipments related to Hooli and Globex Corporation, write a query that shows the
Family Name, Hawb, Revenue, a column with the total Revenue per Family, and another column with the % of Family revenue.
Hint: Use a SQL window function to calculate the family revenue column if you know how.
**/

/**
NOTE: 
SYNTAX <window_function>() OVER ([PARTITION BY columnname] [ORDER BY columnname])
functions include sum, count, avg, row_number, rank, dense_rank etc
Partition defines how the rows are grouped(partioned) for the function, works almost like group by

OVER allow you to calculate the same types of results 
but keep each row's data intact, without grouping them into one.

Round helps to change the format of the percentage, basically to round up the decimal places
ROUND(EXPRESSION, LENGTH)

ALSO USED CAST HERE TO REMOVE THE TRAILING ZEROS AFTER THE PERCENTAGE CALCULATIONS
SYNTAX: CAST (expression AS new_data_type)
**/

SELECT
C.FamilyName,
B.Hawb,
B.Revenue,
SUM(B.REVENUE) OVER (PARTITION BY C.FAMILYNAME) AS 'TOTAL REVENUE',
CAST(ROUND((B.REVENUE *100)/SUM(B.REVENUE) OVER (PARTITION BY C.FAMILYNAME),2) AS DECIMAL(10,2)) AS 'REVENUE PERCENTAGE'
FROM EmadeCustomer A
JOIN EmadeHawb B
ON A.ID=B.AccountID
JOIN EmadeFamily C
ON A.FamilyID=C.ID
WHERE c.FamilyName IN ('Hooli', 'Globex Corporation')
GROUP BY
C.FamilyName,
B.Hawb,
B.Revenue
ORDER BY 
[REVENUE PERCENTAGE];


--3: Write a query that retrieves the number of late delivery days and associated revenue grouped by Family Name and Consignee State.
--THE CONSIGNEEID IN HAWB TABLE HAS FAMILY ID AS 0 IN CUSTOMER TABLE
--SO THERES NOTHING TO RETURN AS THE FAMILY NAME AND THIS MAKES THE RESULT COME BACK EMPTY

SELECT 
B.FamilyName,
A.STATE,
C.PODDate,
C.DueDate,
CASE 
WHEN DATEDIFF(DAY, C.PODDate, C.DueDate)>0 THEN DATEDIFF(DAY, C.DueDate, C.PODDate)
END AS 'LATE DELIVERY DAYS',
SUM(C.REVENUE) AS 'TOTAL REVENUE'
FROM EmadeCUSTOMER A
JOIN EmadeHawb C
ON A.ID=C.ConsigneeID 
JOIN EmadeFamily B
ON B.ID=A.FamilyID
WHERE C.PODDate IS NOT NULL
GROUP BY
B.FamilyName,
A.STATE, 
C.PODDate,
C.DueDate;


/**
WHEN THE JOIN FOR FAMILY TABLE AND THE COLUMNS ARE TAKEN OUT, WE GET A RESULT THAT SEEMS CORRECT JUST WITHOUT THE FAMILY NAME.
IN THIS I INCLUDED THE CUSTOMER NAME AND ID SO WE CAN SEE WHAT CUSTOMER THE DELIVERY IS ASSOCIATED TO.
AND IF YOU CHECK THE FAMILY ID FOR THESE CUSTOMERS, IT IS 0

THE CASE STATEMENT HERE IS TO RETURN THE DATEDIFF, WHEN THE DATEDIFF IS > 0 AND RETURN 0 IF IT IS LESS
**/

SELECT 
A.ID, 
A.CustomerName,
C.DueDate,
C.PODDate,
CASE 
WHEN DATEDIFF(DAY, C.DueDate, C.PODDate)>0 THEN DATEDIFF(DAY, C.DueDate, C.PODDate)
ELSE 0
END AS 'LATE DELIVERY DAYS',
SUM(C.Revenue) AS TOTAL_REVENUE
FROM EmadeCUSTOMER A
JOIN EmadeHawb C
ON A.ID=C.ConsigneeID 
WHERE C.PODDate IS NOT NULL
GROUP BY
A.ID, 
A.CustomerName,
C.PODDate, 
C.DueDate
ORDER BY
[LATE DELIVERY DAYS] DESC;


--4: Create a pivot with the Service Code concatenated with Service Category Name as the column headers,
--Delivery Days as the data values, and grouped by consignee name.
--Only include shipments already delivered.
/**
NOTE: CONCATENATE MEANS TO COMBINE TWO OR MORE STRING VALUES INTO ONE 
SYNTAX: CONCAT(COLUMN1, ' ', COLUMN2) AS NEW_COLUMNNAME     
OR USING THE + SIGN  
SELECT COLUMN1 + ' ' + COLUMN2 AS NEW_COLUMN

I WENT WITH MAX HERE TO SHOW THE MAXIMUM DELIVERY DAYS FOR EACH COURIER BECAUSE USING SUM WAS ADDING THE DELIVERY DAYS
AND USING COUNT WAS NOT RETURNING THE DELIVERY DAYS LIKE THE QUESTION ASKED, IT WAS COUNTING IT 

SK CAN GO INTO THIS MORE FOR US IN CLASS
**/

select *
from
(
	select 
	B.CustomerName AS CONSIGNEE_NAME,
	DATEDIFF(DAY, A.DueDate, A.PODDate) AS DELIVERY_DAYS,
	CONCAT(C.ServiceCode, '_', C.ServiceCategoryName) AS 'SERVICE DETAILS'
	from EmadeHawb A
	JOIN EmadeCustomer B
	ON A.ConsigneeID = B.ID
	JOIN EmadeServiceType C
	ON A.ServiceCodeID=C.ID
	WHERE A.PODDate IS NOT NULL 
)x
pivot(
MAX(DELIVERY_DAYS)
for [SERVICE DETAILS] in ([S200_Courier], [S300_Courier], [S400_LTL])
)as Service_Pivot;
