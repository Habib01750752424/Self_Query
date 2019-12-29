CREATE DATABASE CoffeeShop

USE CoffeeShop

CREATE TABLE Items(
ID INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50),
Price FLOAT
)

DROP TABLE Items

INSERT INTO Items (Name, Price) Values ('Black', 120)
INSERT INTO Items (Name, Price) Values ('Regular', 80)
INSERT INTO Items (Name, Price) Values ('Cold', 100)
INSERT INTO Items (Name, Price) Values ('Hot', 90)

SELECT * FROM Items

CREATE TABLE Customers
(
Id INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50),
[Address] VARCHAR(200),
Contact VARCHAR(50),
)

DROP TABLE Customers

INSERT INTO Customers VALUES ('Ali', 'Dhaka' ,'01311369369')
INSERT INTO Customers VALUES ('Hasan', 'Sylhet' ,'01711369369')
INSERT INTO Customers VALUES ('Rafi', 'BNorisal' ,'01811369369')

SELECT * FROM Items

SELECT * FROM Customers

CREATE TABLE Orders
(
Id INT IDENTITY(1,1) PRIMARY KEY,
CustomerId INT FOREIGN KEY REFERENCES Customers(Id),
ItemId INT FOREIGN KEY REFERENCES Items(ID),
Quantity INT,
TotalPrice FLOAT
)

DROP TABLE Orders

INSERT INTO Orders VALUES (1, 1 , 5, 600)
INSERT INTO Orders VALUES (1, 2 , 3, 240)
INSERT INTO Orders VALUES (1, 3 , 2, 200)

INSERT INTO Orders VALUES (2, 2 , 2, 160)
INSERT INTO Orders VALUES (2, 3 , 3, 300)
INSERT INTO Orders VALUES (2, 4 , 4, 400)

INSERT INTO Orders VALUES (3, 2 , 4, 400)

DELETE FROM Customers WHERE ID = 3

DELETE FROM Orders WHERE ID = 10

SELECT * FROM Orders

DELETE Orders

SELECT Quantity*Price AS TotalPrice FROM Orders
INNER JOIN Items
ON Orders.ItemId = Items.ID;

CREATE VIEW ORderView
AS
SELECT o.Id,c.Name AS CustomerName,i.Name AS ItemName,Quantity,i.Price,TotalPrice
FROM Orders AS o INNER JOIN Customers AS c ON o.CustomerId = c.Id
INNER JOIN Items AS i ON o.ItemId = i.ID

CREATE VIEW ORderView
AS
SELECT o.Id,c.Name AS CustomerName,i.Name AS ItemName,Quantity,i.Price,Quantity*Price AS TotalPrice
FROM Orders AS o INNER JOIN Customers AS c ON o.CustomerId = c.Id
INNER JOIN Items AS i ON o.ItemId = i.ID

SELECT * FROM ORderView

DROP VIEW ORderView


SELECT o.Id,o.CustomerId,c.Name,ItemId,i.Name,Quantity,TotalPrice FROM Orders AS o
LEFT JOIN Customers AS c ON c.Id = o.CustomerId
LEFT JOIN Items AS i ON i.ID = o.ItemId

