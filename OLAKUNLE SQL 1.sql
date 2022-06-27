/*--==========================================================
Name: OLAKUNLE ADEBOJE

Please run your query against the AdventureWorks2014 or AdventureWorks2014 database, 
and please ensure that your query run and able to return record.
--============================================================*/

/*Question 1 
Please return all the records in the [Person].[Person] table
*/
SELECT *
FROM Person.Person      
GO


/* Question 2
Using your answer from question 1, please return the first name, last name
and middle name from the person.person
*/
SELECT
	FirstName ,
	MiddleName ,
	LastName
FROM Person.Person   
GO



/*Question 3
Return all the records from the [Person].[CountryRegion] where
the name is Australia and order your result by CountryRegionCode 
in a descending order
*/


SELECT *
FROM[Person].[CountryRegion]
WHERE NAME = 'Australia'
ORDER BY CountryRegionCode desc  
GO


/* Question 4
 As a data analyst you have been task by your 
 manager to return the currencycode and name from 
 the [Sales].[Currency] table. It is important that 
 as part of the request that you return only the name
 names that is Naira
*/
 
 SELECT *
 FROM [Sales].[Currency]
 WHERE NAME = 'NAIRA'  
 GO

/* Question 5
Please return all the records from the person.address table
*/

SELECT *
FROM [Person].[Address]            
GO

/* Question 6 
Using your code from question 5, please return only the city, postal code,
and the address ID
*/

SELECT
     City ,
	 Postalcode ,
	 AddressID
FROM [Person].[Address]     
GO

/* Question 7 
It is the holiday season and your manager wants you to write a code
that will return all the records from the humanresource.employees table.
*/

SELECT *
FROM [HumanResources].[Employee]     
GO


/* Question 8 
Using the answer you got from question 7, your manager now wants you to
only display the jobtitle, the birthdate, the vacation hours
and their sick leave hours of the employees.
  */
  
SELECT
     Jobtitle ,
	 BirthDate ,
	 Vacationhours ,
	 sickleavehours
FROM [HumanResources].[Employee]   
GO


 /*Question 9 
Return the JobTitle ,BirthDate ,MaritalStatus, Gender from the
humanresource.employees table that are married and gender is female 
*/


SELECT
      JobTitle ,
      BirthDate ,
	  MaritalStatus ,
	  Gender
FROM [HumanResources].[Employee]
WHERE MaritalStatus = 'M' and Gender = 'f'
GO 

	 
/*Question 10 
You have been task to write a query that will return the 
SalesOrderID,SalesOrderNumber,PurchaseOrderNumber
,CustomerID,SalesPersonID,SubTotal,TaxAmt,TotalDue
from the sales.SalesOrderHeader table for those that have
total due grater than 500
*/


SELECT
      SalesOrderID ,
	  SalesOrderNumber ,
	  PurchaseOrderNumber ,
	  CustomerID ,
	  SalesPersonID ,
      SubTotal ,
	  TaxAmt ,
	  TotalDue 
FROM[Sales].[SalesOrderHeader]
WHERE TotalDue > 500        
GO

/* Question 11  
You work for a manufacturing company and the directors are about
to make a decision on designing of a new product, 
they will like you to check in the production.product table to see if the 
product names listed below exists in the database
	Chainring Nut
	Chain Stays
	Touring End Caps
	Flat Washer 1
*/

SELECT *
FROM [Production].[Product]
WHERE Name IN ( 'Chainring Nut' , 'Chain Stays' , 'Touring End Caps' , 'Flat Washer 1' )      
GO


/*Question 12 CORRECT
The festive period is here and your company will like you to 
keep track of the inventory of the company. Your manager wants
 you to generate a dataset that will display the product ID, 
 shelf and quantity from the product.productinventory table. 
*/


SELECT
      ProductID ,
	  Shelf ,
	  Quantity
FROM [Production].[ProductInventory]    
Go


