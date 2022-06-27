/*
YOUR NAME: OLAKUNLE ADEBOJE
Description: Please run your queries against the Adventureworks database
			 Please ensure that your query runs and you validated the result
*/
/*QUESTION 1  
Please return the [ProductID] ,[Name] ,[MakeFlag] ,[Color] ,[SafetyStockLevel] ,[ReorderPoint] ,[StandardCost],
[ListPrice],[Size]  from the [Production].[Product]
 only return records that have product name ending in Race
*/

select
		ProductID,
		Name,
		MakeFlag,
		Color,
		SafetyStockLevel,
		ReorderPoint,
		StandardCost,
		ListPrice,
		Size
from [Production].[Product]
where Name like '%race'
go




/*QUESTION 2 
Using you answer from question 1, please return only the record
that have days to manufacture as 0. Please remember that question two
is adding to the result from question 1
*/
select
		ProductID,
		Name,
		MakeFlag,
		Color,
		SafetyStockLevel,
		ReorderPoint,
		StandardCost,
		ListPrice,
		Size,
		DaysToManufacture
from [Production].[Product]
where Name like '%race' and DaysToManufacture = 0



/*QUESTION 3 
Please return the [SalesOrderID],[SalesOrderNumber],[PurchaseOrderNumber]
,[CustomerID],[SalesPersonID],[SubTotal],[TaxAmt],[TotalDue]
from the [Sales].[SalesOrderHeader] but only return records 
that have total due grater that 500 but tax amount less than 100.
Please validate your results.
*/



select
	SalesOrderID,
	SalesOrderNumber,
	SubTotal,
	PurchaseOrderNumber,
	CustomerID,
	SalesPersonID,
	TaxAmt,
	TotalDue
from  [Sales].[SalesOrderHeader]
where TotalDue > 500 and TaxAmt < 100


/*QUESTION 4 
Return the job title, birthdate, gender, and vacation hours
with job title containing the word 'sign' 
Tables involved: humanresources.employee
*/



select
	JobTitle,
	BirthDate,
	Gender,
	VacationHours
from  [HumanResources].[Employee]
where JobTitle like '%sign%'
 


/*QUESTION 5 
Return the Marital status, sick leave hours and the nationalID number
but limit your result to only return records that have sick leave
only the minimum sick leave hours grater than 50 and vacation hours less 
than 80
Tables involved: humanresources.employee
*/

select
	MaritalStatus,
	SickLeaveHours,
	NationalIDNumber,
	VacationHours
from [HumanResources].[Employee]
where SickLeaveHours > 50 and VacationHours < 80

/*QUESTION 6 
Due to so many compaint from customers, your manager wants
you to generate datasets that will display the scrap reason and Modified date
from the Production.ScrapReason table that contain the word failed. 
this will help them respond to the customers accordingly
*/

select
	ScrapReasonID,
	Name,
	ModifiedDate
	FROM[Production].[ScrapReason]
WHERE Name like '%failed%'


/*QUESTION 7 
Write a SQL query to return the product Description ID and product 
description from the Production.ProductDescription, but only
return records that have description starting with the word "Aluminum"
Please validate your result
*/

select
	ProductDescriptionID,
	Description
from   [Production].[ProductDescription]
where Description like 'Aluminum%'

/*QUESTION 8 
Please write a SQL query that will display the title, file name, 
document summary and documet from the Production.Document, but limit 
your result to only return records that have the file name ending in ".doc" the sort your result
by the title in ascending  order
*/

select
	Title,
	FileName,
	DocumentSummary,
	Document
from  [Production].[Document]
where FileName like '%doc'
order by Title asc


 /* QUESTION 9 
Your manager will like you to generate datasets that
will display the name, account number and credit rating
from the Purchasing.Vendor. Please sort your record using the name in
descending order
*/


select
	Name,
	AccountNumber,
	CreditRating
from [Purchasing].[Vendor]
order by Name desc


/* QUESTION 10 
Your manager forgot to add to the requirement in question 9, but have asked
you to only return records whose credit rating is above 2.
Please remember that question 10 is just adding to your result from 9.
*/

select
	Name,
	AccountNumber,
	CreditRating
from [Purchasing].[Vendor]
where CreditRating > 2
order by Name desc


/* QUESTION 11 
Please write a SQL query that will product ID,  Standard price, MinOrderQty
from the Purchasing.ProductVendor, but limit your result to return
records that Standard price between 20 and 35.
*/

select
		ProductID,
		StandardPrice,
		MinOrderQty
from [Purchasing].[ProductVendor]
where StandardPrice between 20 and 35
order by StandardPrice asc

/* QUESTION 12 
Write a query to generate dataset that will display the 
Category,StartDate,EndDate,MinQty,MaxQty from the Sales.SpecialOffer table
that have category as reseller and the minimum quantity
are grater than 0 
*/

select
		Category,
		StartDate,
		EndDate,
		MinQty,
		MaxQty
from  [Sales].[SpecialOffer]
where Category = 'Reseller' and MinQty > 0


/*QUESTION 13 
You work for a manufacturing company and the directors are about
to make a decision on designing of a new product, 
they will like you to return the Name as ProductName, color as ProductColor,
list price as ProductPrice from the production.Product. Sort your result by 
the name in a descending order.

*/

select
		Name as ProductName,
		Color as ProductColor,
		ListPrice as ProductPrice
from [Production].[Product]
order by Name desc




/* QUESTION 15 
You work as a senior data analyst and you are called to look at the below
query written by a junior analyst. Can you tell why the query is wrong
and provide a fix please.
*/

select ProductID
from production.TransactionHistory
ORDER BY ProductID DESC
GROUP BY ProductID

------The Query is wrong because it does not follow the logical process of from, where, groupby, having ,select and order by

select ProductID
from production.TransactionHistory
GROUP BY ProductID
ORDER BY ProductID DESC


/* QUESTION 16 
Extract the CreditCardID, CardNumber, CardType, ExpMonth, ExpYear
from the Sales.CreditCard. Sort your result to display 
in an Alphabatical order of the card type.
*/

select
	CreditCardID,
	CardNumber,
	CardType,
	ExpMonth,
	ExpYear
from [Sales].[CreditCard]
order by CardType asc


/*QUESTION 17 
Using your answer from question 15, please only display records that 
the CardType is NOT Vista
*/

select
	CreditCardID,
	CardNumber,
	CardType,
	ExpMonth,
	ExpYear
from [Sales].[CreditCard]
where CardType != 'vista'
order by CardType asc

/* QUESTION 18 
Write a query to return the Rate, PayFrequency, BusinessEntityID
FROM the HumanResources.EmployeePayHistory table, but display only records
that have grater than 10 or PayFrequency and BusinessEntityID is between 50 and 150
*/

select
	Rate,
	PayFrequency,
	BusinessEntityID
from  [HumanResources].[EmployeePayHistory]
where Rate > 10 OR PayFrequency between 50 and 150 and BusinessEntityID between 50 and 150


/*QUESTION 19 
Write a SQL code that will return the TerritoryID, Bonus, 
CommissionPct, SalesYTD and SalesLastYear from the Sales.SalesPerson. 
Sort your record by Territory ID  in Ascending order.
*/

select
		TerritoryID,
		Bonus,
		CommissionPct,
		SalesYTD,
		SalesLastYear
from [Sales].[SalesPerson]
order by TerritoryID asc

/*QUESTION 20 
Using your result from question 19, please return only the records that
have the SalesYTD less than the SalesLastYear.
Please remember that question 20 is to add to the result from question 19
*/

select
		TerritoryID,
		Bonus,
		CommissionPct,
		SalesYTD,
		SalesLastYear
from [Sales].[SalesPerson]
where SalesYTD < SalesLastYear
order by TerritoryID asc


/*QUESTION 21  
In your own words, please provide the meaning of the below questions.
What is a Primary Key? give example
A primary key is a column -- or a group of columns -- in a table that uniquely identifies the rows in that
table. For example, CustomerNo, which displays the ID number assigned to different
customers, is the primary key. CUSTOMERS. CustomerNo.


What is a Foreign key? give examp - Foreign key is a column used in a relational database to link data between tables.
For example,we have two tables called product and order. We can use foreign key to create a relationship between them.In the
other table we create a key that references customer in the oher table called customerID. CustomerID in the order
table becomes the foreign key.


What is a schema? 
A Schema is a collection of database objects associated with a database. The username of a database is called 
a Schema. Schema always belong to a single database whereas a database can have single or multiple schemas.


What is the difference between an attribute and a column
Attributes collect information about an entity and columns collect information about a table.
For example, after you create the CUSTOMER entity, you can begin to define the individual pieces of information
you want to track for each customer, including Name, Address, and Phone Number. Each of these pieces of 
information is saved as an attribute of the CUSTOMER entity. In the physical model, attributes equate to 
columns in a table.

*/

/*QUESTION 22 
Using answer from question 11 create a derived column VacationCheck
 that meets the condition below:
If Marital status is M AND Vacation hours grater than 40 and sick 
leave hours grater than 60 then return "Approved" 
else every other thing should say considered.
*/

----QUESTION 22 and question 11 are not related. so i skipped it







/*QUESTION 
The monthly report for your company is due, and your manager wants
you to write a query against the [Sales].[Customer] that
returns count of the StoreID's that are less than 2.
*/

select
		StoreID	,
		count(*)
from [Sales].[Customer]
Group by StoreID
having count(*) < 2


/*QUESTION 24 
Calculate total sum of [UnitPrice] against the UnitPrice
from the Sales.SalesOrderDetail
*/

select sum(UnitPrice), UnitPrice
from [Sales].[SalesOrderDetail]
group by UnitPrice


/*QUESTION 25 
Write a SQL query that will generate datasets that 
display the first name, last name, and a 
derived column called FirstThree that will show the first three characters of 
the first name from the person.Person table.
*/

select
	FirstName,
	LastName,
	SUBSTRING(FirstName,1,3) as 'FirstThree'
from  [Person].[Person]

/*QUESTION 25 
Write a SQL query that will generate datasets that display's the 
[JobTitle],[BirthDate],[HireDate].
Write derived columns
Write derived column name statusCheck to display the following
	If the marital status is "S" the return "single"
	if the marital status is "M", then return "Married" 
	from the humanresource.Employee
*/


select
		JobTitle,
		BirthDate,
		HireDate,
		MaritalStatus ,
		CASE
		When MaritalStatus = 'S' THEN 'Single'
		When MaritalStatus = 'M' THEN 'Married'
		END AS StatusCheck
 FROM  [HumanResources].[Employee]

/*QUESTION 27  
Write a SQL query that will display the first name and last name from the 
Person.Person table
*/

select
	firstName,
	LastName
from[Person].[Person]


/*QUESTION 23
Using the answer from question 22, 
add a derived column called full name. this derived column
 should hold the combination of the last name and first name
*/

select
	firstName,
	LastName,
	concat(FirstName,' ', LastName) as FullName
from[Person].[Person]


/*QUESTION 28 
Using your result from question 27, your manager will like you to have a 
delimiter on the full name the delimiter should be a dash so meaning every full name should 
have a dash (-) in between the last name and first name
*/

select
	firstName,
	LastName,
	CONCAT(FirstName, ' - ' ,LastName) as FullName
from[Person].[Person]


/*QUESTION 29 
Write a query against SalesOrderHeader to generate a dataset that will return
the three-ship countries with the highest average freight 
*/

select
	avg(Freight)
FROM SALES.SalesOrderHeader
Group by Freight
order by Freight
offset 0 rows fetch next 3 row only

/*QUESTION 30 
Your company is about to send information to employees who may be losing their vacation hours due
to the end-of-year cut of vacation hours. You have been a task to generate a dataset against 
the employee's table to display the job title, marital status, gender, vacation hours, and sick leave.
*/

select
	JobTitle,
	MaritalStatus,
	Gender,
	VacationHours,
	SickLeaveHours
from [HumanResources].[Employee]

/*QUESTION 31  
Using your dataset from Question 26, the business will like you to add a derived column called 
VacHoursCheck this column should have the below information
	1. If the vacation hours is greater than 70, display "Send Email"
	2. If the vacation hours are less than or equal to 70, display "Safe"
*/

select
		JobTitle,
		BirthDate,
		HireDate,
		MaritalStatus,
		VacationHours,
		CASE
		When MaritalStatus = 'S' THEN 'Single'
		When MaritalStatus = 'M' THEN 'Married'
		END AS StatusCheck,
		CASE
		When VacationHours > 70 THEN 'Send Email'
		When VacationHours <  70 THEN 'Safe'
		END AS VacHoursCheck
 FROM  [HumanResources].[Employee]
 go



