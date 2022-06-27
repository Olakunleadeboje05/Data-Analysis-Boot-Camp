/*
YOUR NAME: OLAKUNLE ADEBOJE

Description: Please run your queries against the Adventureworks database
			 Please ensure that your query runs and you validated the result
*/

/*QUESTION 1 
Return the job title, birthdate, gender, and vacation hours
with job title containing the word 'sign' 
Tables involved: humanresources.employee
*/
select
	BirthDate,
	Gender,
	VacationHours,
	JobTitle
from [HumanResources].[Employee]
where JobTitle like '%sign%'

/*QUESTION 2 
Retrun the Marital status, sick leave hours and the nationalID number
but limit your result to only return records that have sick leave
hours grater than 50 and vacation hours less 
than 80
Tables involved: humanresources.employee
*/
select
	MaritalStatus,
	SickLeaveHours,
	NationalIDNumber
from [HumanResources].[Employee]
where SickLeaveHours >50 and VacationHours < 80


 /* QUESTION 3 
write a SQL statement to return all the account number which name starts with
the word "A" from the Purchasing.Vendor
*/
select
	AccountNumber
from [Purchasing].[Vendor]
where AccountNumber like 'A%'

/*QUESTION 4 
Write a SQL Statement to display the first name, last name and a derived column called DervName
that will display the first three characters of  the first name.
*/

select
	FirstName,
	LastName,
	substring(FirstName,1,3) as DervName
from  [Person].[Person]


/*QUESTION 5 
Write query to retrieve the email address and then add a derived column labeled @Location that return the position 
of the @ sign in the email address column
Table: [Person].[EmailAddress]
HINT: CHARINDEX
SEE SAMPLE OUTPUT BELOW
EmailAddress					@Location
a0@adventure-works.com				3
a1@adventure-works.com				3
aaron0@adventure-works.com			7
aaron1@adventure-works.com			7
...									...
...									...
...									...
aaron10@adventure-works.com			8
aaron11@adventure-works.com			8
aaron12@adventure-works.com			8
 */

select
		EmailAddress,
		charindex('@',EmaiLAddress) as '@Location'
from [Person].[EmailAddress]



 /* QUESTION 6  
Using answer from question 5. Remember that you have to get 5 right 
to get 6 right. 
Write a derived column labeled dotLocation that will find the position of 
the "." in the @Location column
Table: [Person].[EmailAddress]
HINT: CHARINDEX
*/

select
		EmailAddress,
		charindex('@',EmaiLAddress) as '@Location',
		charindex('.',EmaiLAddress) as 'dotLocation'
from [Person].[EmailAddress]


 /* QUESTION 7 
Write a SQL statement that will display the first name, last and a derived column
called FNspaceRem that will remove the trailing and leading spaces on the First Name
and another derived column LNSpaceRem that will remove all the trailing and leading spaces on the last name
using the [Person].[Person]. 

*/
select
	FirstName,
	LastName,
     LTRIM(RTRIM(FirstName))FNspaceRem,
    LTRIM(RTRIM(LastName)) LNSpaceRem 
from [Person].[Person]


 /* QUESTION 8 
Using your answer from number 7, please write another derived column called 
FNUPPER that will transform the first name to display all UPPER case

*/

select
	FirstName,
	LastName,
     LTRIM(RTRIM(FirstName))FNspaceRem,
	LTRIM(RTRIM(LastName)) LNSpaceRem ,
	upper(FirstName) as FNUPPER
from [Person].[Person]



 /* QUESTION 9 
Using your answer from number 8, please write another derived column called
 LNLOWER that will transform the last name to display all lower case

*/
select
	FirstName,
	LastName,
     LTRIM(RTRIM(FirstName))FNspaceRem,
    LTRIM(RTRIM(LastName)) LNSpaceRem ,
	upper(FirstName) as FNUPPER,
	lower(LastName) as LNLOWER
from [Person].[Person]


/*QUESTION 10 
Write a query to retrieve the birth date from the employee's table.

*/
select
BirthDate
from[HumanResources].[Employee]


/*QUESTION 11 
Using your answer from question 10, add a derived column called BithMonth
that will extract the MONTH of the birth date of each employee.
*/
select
	BirthDate,
	Datename(month, BirthDate) as BithMonth
from[HumanResources].[Employee]

/*QUESTION 12 
Using your answer from question 11, add a derived column called BithYear
that will extract the YEAR of the birth date of each employee.
*/
select
	BirthDate,
	Datename(month, BirthDate) as BithMonth,
	Datename(year, BirthDate) as BithYear
from[HumanResources].[Employee]


/*QUESTION 13 
Using your answer from question 12, add a derived column called BithDay
that will extract the DAY of the birth date of each employee.
*/
select
	BirthDate,
	Datename(month, BirthDate) as BithMonth,
	Datename(year, BirthDate) as BithYear,
	Datename(day, BirthDate) as BithDay
from[HumanResources].[Employee]


/*QUESTION 14 
Your company is in the process of rewarding it's customers and they have asked you to generate
a query that will return the order date, due date and ship date and the SalesOrderHeader tables.
Due to the employment situation the company have decided to do a forgiving program.
They want you to add a column called ExtendedDueDate. This date column should 
extend the day of the due date to 30 days.
*/
select
	OrderDate,
	DueDate,
	ShipDate,
	dateadd(DAY,30,DueDate) as ExtendedDueDate
from [Sales].[SalesOrderHeader]

/*QUESTION 15 
Your data set from question 14 is good but there have been a little confusion
and your manager will like you to add a derived called ExtendShipDt this column
should add 2 months to the ship date

*/
select
	OrderDate,
	DueDate,
	ShipDate,
	dateadd(DAY,30,DueDate) as ExtendedDueDate,
	dateadd(MONTH,2,ShipDate) as ExtendShipDt
from [Sales].[SalesOrderHeader]


/*QUESTION 16 
Using your result from question 15, add a derived column called DtDiff, this column 
should find the difference in month between the order date and ship date.
*/
select
	OrderDate,
	DueDate,
	ShipDate,
	dateadd(DAY,30,DueDate) as ExtendedDueDate,
	dateadd(MONTH,2,ShipDate) as ExtendShipDt,
	DATEDIFF(month,OrderDate,ShipDate)
from [Sales].[SalesOrderHeader]



/*QUESTION 18 
Write a query against the Employee table to display the job title, birth date and 
marital status, hire date, vacation hours and sick leave hours
Now, add a derived column called Age. This column should hold the the age of the employee when
when there where employeed. 
Note: Remember this is a little tricky you just have to think outside the box.
Hint: DateDiff 
*/
select
	JobTitle,
	BirthDate,
	MaritalStatus,
	HireDate,
	VacationHours,
	SickLeaveHours,
	datediff(year, BirthDate, HireDate) as Age
from [HumanResources].[Employee]





/* QUESTION 19 
Write a SQL query against the customer table to generate dataset that will display the store ID,
Territory ID and account number. Add a derived column called SubNumber that will return every
values after the AW on the account number
*/

SELECT
     StoreID,
	 TerritoryID,
	 AccountNumber,
	 --LEFT(AccountNumber,2) FIRST2,
	 REPLACE(AccountNumber,LEFT(AccountNumber,2),' ') FinalAns,
	 RIGHT(AccountNumber, 8) AS SubNumber
FROM Sales.Customer


/*QUESTION 20 
Your company is about a make a business decision and they need to know what sales territory 
has hit their target based on the last year sales and the salesYTD (year to date). They
want you to Write a query to retrieve relievant information(Please pick columns that you will like to see in a normal reporting)
 from the SalesTerritory table  and then add a derived column called 'Target' that will display the following:
    If the territory's SalesLastYear exceeds salesYTD , display 'Not met'
	 else display 'Met'.
*/
select
	TerritoryID
	SalesLastYear,
	SalesYTD,
	case  
	when SalesLastYear > salesYTD then 'Not met'
	else 'Met'
	end as Target
from [Sales].[SalesTerritory]


/*QUESTION 21 
Wirte SQL Query to retrieve the job title and birthday.
Create a derived column called Age that will hold the age of all the employees 
as of the day you are writing the query. 
Note: You will have to use the current data and the birth date to find the age
*/

select
	JobTitle,
	BirthDate,
	(GETDATE()) as 'Current data',
	datediff(year, BirthDate, GETDATE()) as 'Age'
from [HumanResources].[Employee]



/*QUESTION 22 
Write a SQL query to retrieve the phone number and modified date from the Person.PersonPhone
*/

select
		PhoneNumber,
		ModifiedDate
from [Person].[PersonPhone]



/* QUESTION 23 
You manager noticed that the dataset you generated in question 22, have the modified data 
displaying both date and time and he/she wants you to only display date and not time on the modified date
*/

select
		PhoneNumber,
		ModifiedDate,
		cast(ModifiedDate as date) ModifiedDate
from [Person].[PersonPhone]

/*QUESTION 24 
Using your result from question 23, please add a derived column called Last4Phone
 that will retrieve the last four value of the phone number
*/
select
		PhoneNumber,
		ModifiedDate,
		cast(ModifiedDate as date) ModifiedDate,
		right(PhoneNumber,4) Last4Phone
from [Person].[PersonPhone]



/*QUESTION 25 
Using your result from question 23, add a column called asterisk and this
column should generate 8 asterisk (*)
*/

select
		PhoneNumber,
		ModifiedDate,
		cast(ModifiedDate as date) ModifiedDate,
		right(PhoneNumber, 4) as Last4,
		replicate('*',8) as Asterik
from [Person].[PersonPhone]


/*QUESTION 26 
Using your result from question 25, add a column called MaskPhone and this
column should mask the phone number and only displaying the last four 
while the rest will return *. See expected output below.
If phone number is 697-555-0142 then MaskPhone should be ********0142
*/

select
		PhoneNumber,
		ModifiedDate,
		cast(ModifiedDate as date) ModifiedDate,
		right(PhoneNumber, 4) as Last4,
		replicate('*',8) as Asterik,
		concat(replicate('*',8),right(PhoneNumber, 4))  MaskedPhone
from [Person].[PersonPhone]
go
