---------------------------------------------------------------------------------------------------------
--Intermediate Problems----------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------

--Problem 1 ---------------------------------------------------------------------------------------------
SELECT b.CategoryName, COUNT(DISTINCT a.ProductID) AS TotalProduct
FROM Products AS a
	LEFT OUTER JOIN Categories AS b
	ON a.CategoryID = b.CategoryID
GROUP BY b.CategoryName
ORDER BY TotalProduct DESC 

--Problem 2 ---------------------------------------------------------------------------------------------
SELECT Country, City, COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM Customers
GROUP BY Country, City
ORDER BY TotalCustomers DESC

--Problem 3 ---------------------------------------------------------------------------------------------
SELECT ProductID, ProductName, UnitsInStock, ReorderLevel
FROM Products
WHERE UnitsInStock < ReorderLevel
ORDER BY ProductID

SELECT * FROM Products

--Problem 4 ---------------------------------------------------------------------------------------------
SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
FROM Products
WHERE (UnitsInStock + UnitsOnOrder <= ReorderLevel) AND Discontinued = 0

--Problem 5 ---------------------------------------------------------------------------------------------
SELECT CustomerID, CompanyName, Region
FROM Customers
ORDER BY ISNULL(Region, 'ZZZZZZZ')

--Problem 6 ---------------------------------------------------------------------------------------------
SELECT TOP 3 ShipCountry, AVG(Freight) AS AverageFreight
FROM Orders
GROUP BY ShipCountry
ORDER BY AverageFreight DESC

--Problem 7 ---------------------------------------------------------------------------------------------
SELECT TOP 3 ShipCountry, AVG(Freight) AS AverageFreight
FROM Orders
WHERE DATEPART(YEAR, OrderDate) = 1996
GROUP BY ShipCountry
ORDER BY AverageFreight DESC

--Problem 8 ---------------------------------------------------------------------------------------------
SELECT TOP 3 ShipCountry, AVG(Freight) AS AverageFreight
FROM Orders
WHERE OrderDate > DATEADD(MONTH, -12, (SELECT MAX(OrderDate) FROM Orders))
GROUP BY ShipCountry
ORDER BY AverageFreight DESC

--Problem 9 ---------------------------------------------------------------------------------------------
SELECT a.EmployeeID, d.LastName, a.OrderID, c.ProductName, b.Quantity
FROM Orders AS a
	LEFT OUTER JOIN [Order Details] AS b
	ON a.OrderID = b.OrderID
	LEFT OUTER JOIN Products AS c
	ON b.ProductID = c.ProductID
	LEFT OUTER JOIN Employees AS d
	ON a.EmployeeID = d.EmployeeID
ORDER BY a.OrderID, b.ProductID

--Problem 10 ---------------------------------------------------------------------------------------------
SELECT DISTINCT a.CustomerID
FROM Customers AS a
	LEFT OUTER JOIN Orders AS b
	ON a.CustomerID = b.CustomerID
WHERE b.CustomerID IS NULL

--Problem 11 ---------------------------------------------------------------------------------------------
SELECT DISTINCT a.CustomerID
FROM Customers AS a
	LEFT OUTER JOIN (SELECT CustomerID FROM Orders WHERE EmployeeID = 4) AS b
	ON a.CustomerID = b.CustomerID
WHERE b.CustomerID IS NULL