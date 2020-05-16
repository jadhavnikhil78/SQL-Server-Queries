---------------------------------------------------------------------------
--EASY PROBLEMS------------------------------------------------------------
---------------------------------------------------------------------------


--Problem 1 ---------------------------------------------------------------
Select * 
From Shippers

--Problem 2 ---------------------------------------------------------------
Select CategoryName, Description 
From Categories

--Problem 3 ---------------------------------------------------------------
Select FirstName, LastName, HireDate 
From Employees 
Where Title = 'Sales Representative'

--Problem 4 ---------------------------------------------------------------
Select FirstName, LastName, HireDate 
From Employees 
Where Title = 'Sales Representative' AND Country ='USA'

--Problem 5 ---------------------------------------------------------------
Select OrderID, OrderDate
From Orders
Where EmployeeID = 5

--Problem 6 ---------------------------------------------------------------
Select SupplierID, ContactName, ContactTitle
From Suppliers
Where NOT ContactTitle = 'Marketing Manager' /* ContactTitle != 'Marketing Manager' */

--Problem 7 ---------------------------------------------------------------
Select ProductID, ProductName
From Products
Where ProductName LIKE '%queso%'

--Problem 8 ---------------------------------------------------------------
Select OrderID, CustomerID, ShipCountry
From Orders
Where ShipCountry IN ('France', 'Belgium')

--Problem 9 ---------------------------------------------------------------
Select OrderID, CustomerID, ShipCountry
From Orders
Where ShipCountry IN ('Brazil', 'Mexico', 'Argentina', 'Venezuela')

--Problem 10 ---------------------------------------------------------------
Select FirstName, LastName, Title, BirthDate
From Employees
Order By BirthDate

--Problem 11 ---------------------------------------------------------------
Select FirstName, LastName, Title, CONVERT(Date, BirthDate) AS BirthDate
From Employees
Order By BirthDate

--Problem 12 ---------------------------------------------------------------
Select FirstName, LastName, CONCAT(FirstName, ' ', LastName) AS FullName
FROM Employees

--Problem 13 ---------------------------------------------------------------
Select OrderID, ProductID, UnitPrice, Quantity, UnitPrice * Quantity AS TotalPrice
FROM [Order Details]
Order By OrderID, ProductID

--Problem 14 ---------------------------------------------------------------
SELECT COUNT(CustomerID) AS TotalCustomers
FROM Customers

--Problem 15 ---------------------------------------------------------------
SELECT MIN(OrderDate) AS FirstOrderDate
FROM Orders

--Problem 16 ---------------------------------------------------------------
SELECT DISTINCT Country
FROM Customers

--OR

SELECT Country
FROM Customers
GROUP BY Country

--Problem 17 ---------------------------------------------------------------
SELECT ContactTitle, Count(ContactTitle) AS TotalContactTitles
FROM Customers
GROUP BY ContactTitle
ORDER BY TotalContactTitles DESC

--Problem 18 ---------------------------------------------------------------
SELECT a.ProductID, a.ProductName, b.CompanyName
FROM Products AS a
	LEFT OUTER JOIN Suppliers AS b
	ON a.SupplierID = b.SupplierID
ORDER BY a.ProductID

--Problem 7 ---------------------------------------------------------------
SELECT a.OrderID, a.OrderDate, b.CompanyName
FROM Orders AS a
	LEFT OUTER JOIN Shippers AS b
	ON a.ShipVia = b.ShipperID
WHERE a.OrderID < 10300
ORDER BY a.OrderID