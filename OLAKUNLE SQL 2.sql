/*

YOUR NAME:  OLAKUNLE ADEBOJE

Description: Please run your queries against the Adventureworks database
			 Please ensure that your query runs and you validated the result
*/

/*QUESTION 1 
Write a query to return the customer ID from Sales.SalesOrderHeader table
*/


SELECT 
		CustomerID
FROM  [Sales].[SalesOrderHeader]
GO


/*QUESTION 2 
Using your response from question 1, add a derived column called
CustCount that will count the occurrence of the customer ID
*/

SELECT 
		CustomerID,
		COUNT(*)  'CustCount' 
FROM [Sales].[SalesOrderHeader]
GROUP BY CustomerID
GO



/*QUESTION 3 
Using your answer from question 2, only return the customer ID
that appears more than once.
*/

SELECT 
		CustomerID,
		COUNT(*)  'CustCount' 
FROM [Sales].[SalesOrderHeader]
GROUP BY CustomerID
HAVING count(*) > 1
GO

/*QUESTION 4 
Write a query to retrieve the highest tax amount from the Sales.SalesOrderHeader 
table.
*/


select max(TaxAmt)
from[Sales].[SalesOrderHeader]
go


/*QUESTION 5 
Write a query that will return the latest ship date from the
Sales.SalesOrderHeader table.
*/

select max(ShipDate)
from [Sales].[SalesOrderHeader]
go


/*QUESTION 6
Using your answer from question 5, add the customer ID that
have those ship date.
*/


select max(ShipDate),
	 CustomerID
from [Sales].[SalesOrderHeader]
group by CustomerID
go




/*QUESTION 7 
Write a query that will extract the first two characters from the 
Purchase Order Number on the Sales.SalesOrderHeader table.
Example for a Purchase Order Number or PO18386167654 return PO.
*/


select
	Left(PurchaseOrderNumber,2)
from  [Sales].[SalesOrderHeader]
go


/*QUESTION 8 
Write a query that will display the order Date, Due date, ship data, 
online order flag, account number, customer ID, and tax amount from the 
Sales.SalesOrderHeader table.
*/


Select
		OrderDate,
		DueDate,
		ShipDate,
		OnlineOrderFlag,
		AccountNumber,
		CustomerID,
		TaxAmt
from [Sales].[SalesOrderHeader]
go

/*QUESTION 9
Due to confusion on the way the online order flag was reported,
you have been asked to modify the result from question 8.
Add a derived column called OrderStatus, and this column should
contain the following information.
If the online order flag is 0, display "In-Store," and if the 
online order flag is 1 display "Online."
*/

select
		OrderDate,
		DueDate,
		ShipDate,
		OnlineOrderFlag,
		AccountNumber,
		CustomerID,
		TaxAmt,
case
when OnlineOrderFlag = 0 then 'In -Store' 
when OnlineOrderFlag = 1 then 'Online'
End as OrderStatus
from [Sales].[SalesOrderHeader]
go


/*QUESTION 10 
Return the maximum Line total from the 
[Sales].[SalesOrderDetail]
*/

select max(LineTotal)
from  [Sales].[SalesOrderDetail]
go

/*QUESTION 11  
Return the job title, birthdate, gender, and vacation hours, sick leave hours.
Add a derived column called FlagCheck that meets the below condition
If the salaried Flag is 1, then Employee else contractor.
*/


SELECT	
		CASE
		WHEN SalariedFlag = 1 THEN 'Employee'
		ELSE 'Contractor'
		End as FlagCheck,
		SalariedFlag,
		JobTitle,
		BirthDate,
		Gender,
		VacationHours,
		SickLeaveHours
		from[HumanResources].[Employee]
		go


/*QUESTION 12 
Using answer from question 11 create a derived column VacationCheck
 that meets the condition below:
If Marital status is M AND Vacation hours grater than 40 and sick 
leave hours grater than 60 then return "Approved" 
else every other thing should say considered.
*/

select
		cASE
		WHEN Maritalstatus = 'M' AND VacationHours > 40 and SickLeaveHours > 60 THEN 'Approved'
		ELSE 'Considered'
		END as  VacationCheck ,
		MaritalStatus,
		VacationHours,
		SickLeaveHours,
		CASE
		WHEN SalariedFlag = 1 THEN 'Employee'
		ELSE 'Contractor'
		End as FlagCheck,
		SalariedFlag,
		JobTitle,
		BirthDate,
		Gender
from  [HumanResources].[Employee]
go


/*QUESTION 13 
Please return the top 6 currency from the [Sales].[Currency] by their
modified date
*/

SELECT *
FROM [Sales].[Currency]
order by ModifiedDate asc
Offset 0 ROWS FETCH NEXT 6 ROWS ONLY
go


/* QUESTION 14 
Return the Category,StartDate,End Date,minimum quantity,maximum from the
[Sales].[SpecialOffer] where the category is a reseller and the 
minimum quantity is greater than or equal to 0 and maximum quantity is KNOWN
*/



select 
		Category,
		StartDate,
		EndDate,
		MinQty,
		MaxQty
FROM [Sales].[SpecialOffer]
WHERE   Category = 'Reseller' and MinQty >= 0  and MaxQty IS NOT NULL
go


/*QUESTION 15 
The monthly report for your company is due, and your manager wants
you to write a query against the [Sales].[Customer] that
returns count of the StoreID's that are less than 2.
*/

select
	StoreID,
	COUNT(*) 'NoOfOcc'
FROM  [Sales].[Customer] 
GROUP BY StoreID
having count(*) < 2
go


/*QUESTION 16 
Calculate total sum of [UnitPrice] against the UnitPrice
from the Sales.SalesOrderDetail
*/

select sum(UnitPrice)
from [Sales].[SalesOrderDetail]
go
		


/*QUESTION 17
Return the [FirstName] [MiddleName] and [LastName] from the Person.Person table
but limit your result to only employees whose middle names are UNKNOWN
*/


select
		FirstName,
		MiddleName,
		LastName
from [Person].[Person]
WHERE MiddleName IS NOT NULL
go
		


/*QUESTION 18
Write a query to return the count of each [SalesOrderID]
from the [Sales].[SalesOrderDetail]
*/


select
		SalesOrderID,
		COUNT(*) 'NoOfOcc'
from    [Sales].[SalesOrderDetail]
Group by SalesOrderID
go

/*QUESTION 19 
Using your answer question 18, please return
the [SalesOrderID] that is less than 2
*/
select
		SalesOrderID,
		COUNT(*) 'NoOfOcc'
from    [Sales].[SalesOrderDetail]
Group by SalesOrderID
having count(*) < 2
go


  
/*QUESTION 20 
Write a SQL query that will generate datasets that 
display the first name, last name, and a 
derived column called FirstThree that will show the first three characters of 
the first name from the person.Person table.
*/
]

select
	    FirstName,
		LastName,
	    Left(FirstName, 3) as FirstThree
from  [Person].[Person]
go


SELECT

SUBSTRING(FirstName, 1, 3) AS FirstThree
FROM  [Person].[Person]
go


/* QUESTION 21 
Write a SQL query that will generate datasets that display's the 
[JobTitle],[BirthDate],[HireDate].
Write derived columns
Write derived column name statusCheck to display the following
	If the marital status is "S" the return "single"
	if the marital status is "M", then return "Married" 
	from the humanresource.Employee
*/



	
SELECT 
		CASE
		When MaritalStatus = 'S' THEN 'Single'
		When MaritalStatus = 'M' THEN 'Married'
		END AS StatusCheck,
		JobTitle,
		BirthDate,
		HireDate
 FROM  [HumanResources].[Employee]
 go


/*QUESTION 22  
Write a SQL query that will display the first name and last name from the 
Person.Person table
*/

select
	FirstName,
	LastName
from  [Person].[Person]
go

/*QUESTION 23 
Using the answer from question 22, 
add a derived column called full name. this derived column
 should hold the combination of the last name and first name
*/

select
	FirstName as 'First Name',
	LastName as 'Last Name',
CONCAT(FirstName, ' ' , LastName) as FullName
from  [Person].[Person]
go



/*QUESTION 24 
Using your result from question 23, your manager will like you to have a 
delimiter on the full name the delimiter should be a dash so meaning every full name should 
have a dash (-) in between the last name and first name
*/

select
	FirstName as 'First Name',
	LastName 'Last NAME',
	CONCAT(FirstName, ' - ' ,LastName) as FullName
from  [Person].[Person]
go

/*QUESTION 25 
Write a query against SalesOrderHeader to generate a dataset that will return
the three-ship countries with the highest average freight 
*/

SELECT AVG (Freight)
FROM Sales.SalesOrderHeader
group by Freight
order by freight desc
offset 0 rows fetch next 3 row only
go


/*QUESTION 26 
Your company is about to send information to employees who may be losing their vacation hours due
to the end-of-year cut of vacation hours. You have been a task to generate a dataset against 
the employee's table to display the job title, marital status, gender, vacation hours, and sick leave.
*/

SELECT
		JobTitle,
		MaritalStatus,
		Gender,
		VacationHours,
		SickLeaveHours
FROM   [HumanResources].[Employee]
GO

/*QUESTION 27 
Using your dataset from Question 26, the business will like you to add a derived column called 
VacHoursCheck this column should have the below information
	1. If the vacation hours is greater than 70, display "Send Email"
	2. If the vacation hours are less than or equal to 70, display "Safe"
*/

select
case 
when VacationHours >70 THEN 'Send Email' 
else 'safe'
End as VacHoursCheck,
        JobTitle,
		MaritalStatus,
		Gender,
		VacationHours,
		SickLeaveHours	
from [HumanResources].[Employee]
go



/*QUESTION 28 
Using your dataset from question 27, the business will like you to add another derived column called.
MaxReached?. This column should have the following information.
	1. If the sum of the vacation hours and the sick leave hours is greater than 150, then display "Yes"
	2. If the sum of the vacation hours and the sick leave hours is less than 150 but greater than
		70 return "No"
Anything else should return NULL.  
*/
SELECT
	CASE
	WHEN SUM(VacationHours + SickLeaveHours) > 150 Then 'Yes'
	WHEN SUM(VacationHours + SickLeaveHours) < 150 AND SUM(VacationHours + SickLeaveHours) > 70 THEN 'NO'
	ELSE NULL
	END AS MaxReached,
	CASE 
	WHEN VacationHours > 70 THEN 'Send Email' 
	ELSE 'safe'
	END AS VacHoursCheck,
        JobTitle,
		MaritalStatus,
		Gender,
		VacationHours,
		SickLeaveHours	
FROM [HumanResources].[Employee]
GROUP BY VacationHours,SickLeaveHours,JobTitle,MaritalStatus,Gender
GO



/*QUESTION 29 
Write a query against the product table that will display the product name, the product name and color
from the production.product table.
*/




select 
	Name as 'Prodcut Name',
	Color
from [Production].[Product]
go


/*QUESTION 30 
Your manager just reviewed your report on question 29, and he is concerned about the NULL values he saw on the
color column. You have been a task to write a derived column called AddColorInfo. The AddColorInfo column should
replace all the NULL's on the color column to read "unknown" so it will be easy to present to the business.
*/



SELECT 
		Name as 'Product Name',
		Color,
		ISNULL(Color, 'unknown') AS 'AddColorInfo'
FROM [Production].[Product]
go


/*QUESTION 31 
Write a query against the SalesOrderDetail that will return duplicate product ID
*/


SELECT ProductID, COUNT(ProductID)
FROM [Sales].[SalesOrderDetail]
GROUP BY ProductID
HAVING COUNT(ProductID) > 1
GO


/*QUESTION 32 
Write a query against the Employee table to display the job title, birth date, and marital status.
Also, add a derived column called FirstWord. This column should hold the first word of the job title.
For example, when the job title is "Chief Executive Officer," we should see "Chief",
when the job title is "Vice President of Engineering," we should see "Vice," and when the
the job title is "Engineering Manager" we should see "Engineering" etc

*/

SELECT 
JobTitle,
BirthDate,
MaritalStatus,
CHARINDEX(' ',JobTitle) AS POSITION,
SUBSTRING(JobTitle,1,CHARINDEX(' ',JobTitle)) AS FirstWord
FROM HumanResources.Employee
GO
