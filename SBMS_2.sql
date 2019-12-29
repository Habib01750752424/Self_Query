USE SmallBusinessManagementSystem

CREATE TABLE Sale(
Id INT IDENTITY(1,1) PRIMARY KEY,
CustomerId int,
Date date,
LoyalityPoint FLOAT,
)

SELECT * FROM Sale
SELECT TOP 1 LoyalityPoint FROM Sale WHERE CustomerId = 3 ORDER BY Id DESC

DELETE Sale
DROP TABLE Sale

CREATE TABLE TemporaryLoyalityPoint(
Id INT IDENTITY(1,1) PRIMARY KEY,
CustomerId int,
LoyalityPoint FLOAT,
)

INSERT INTO TemporaryLoyalityPoint(CustomerId, LoyalityPoint) Values (2, 10)

SELECT * FROM TemporaryLoyalityPoint
SELECT TOP 1 LoyalityPoint FROM Sale WHERE CustomerId = 3 ORDER BY Id DESC

DELETE TemporaryLoyalityPoint
DROP TABLE TemporaryLoyalityPoint

USE SmallBusinessManagementSystem

CREATE TABLE SaleDetails(
Id INT IDENTITY(1,1) PRIMARY KEY,
Code VARCHAR(50),
SaleId INT,
CategoryId INT,
ProductId INT,
Category VARCHAR(50),
Product VARCHAR(50),
AvailableQuantity FLOAT,
Quantity FLOAT,
MRP FLOAT,
TotalMRP FLOAT,
UnitPrice FLOAT,
Profit FLOAT
)

SELECT * FROM SaleDetails
DELETE SaleDetails WHERE Id = 5
DROP TABLE SaleDetails

USE SmallBusinessManagementSystem

SELECT p.Id AS SL,sd.Id,p.Name AS Product FROM SaleDetails AS sd
INNER JOIN Products AS p ON sd.ProductId = p.Id

CREATE VIEW SalesView
AS
SELECT c.Id AS SL,sd.Id,s.Date,sd.Code,c.Name AS Category,sd.Product AS Product,sd.Quantity AS SoldQty,sd.MRP,sd.TotalMRP,sd.UnitPrice AS CP,sd.Profit FROM SaleDetails AS sd
INNER JOIN Sale AS s ON sd.SaleId = s.Id
INNER JOIN Category AS c ON sd.CategoryId = c.Id
INNER JOIN Stock AS st ON sd.ProductId = st.Id

USE SmallBusinessManagementSystem

SELECT * FROM SalesView

DROP VIEW SalesView



