CREATE DATABASE InventoryManagement

USE InventoryManagement

CREATE TABLE Registration(
Id INT IDENTITY(1,1) PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
UserName VARCHAR(50),
Password VARCHAR(50),
Email VARCHAR(50),
Contact VARCHAR(50)
)

DROP TABLE Registration

SELECT * FROM Registration

INSERT INTO Registration(FirstName, LastName,UserName,Password,Email,Contact) Values ('Habibur', 'Rahman','Habib','12345','h@gmail.com','01750752424')
INSERT INTO Registration(FirstName, LastName,UserName,Password,Email,Contact) Values ('Masud', 'Rana','Masud','12345','m@gmail.com','01750751814')
INSERT INTO Registration(FirstName, LastName,UserName,Password,Email,Contact) Values ('Ejab', 'Uddin','Ejabuddin','12345','e@gmail.com','01750752270')
INSERT INTO Registration(FirstName, LastName,UserName,Password,Email,Contact) Values ('kawsar', 'Ali','kawsar Ali','12345','k@gmail.com','01750752425')
INSERT INTO Registration(FirstName, LastName,UserName,Password,Email,Contact) Values ('Hasan', 'Ali','Hasan Ali','12345','hasan@gmail.com','01750752461')

CREATE TABLE tblUnit(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Units VARCHAR(50),
)

DROP TABLE tblUnit

SELECT * FROM tblUnit

INSERT INTO tblUnit(units) Values ('KG')
INSERT INTO tblUnit(units) Values ('Grams')

SELECT * FROM DealarInfo

USE InventoryManagement

CREATE TABLE tblPurchase(
Id INT IDENTITY(1,1) PRIMARY KEY,
ProductName VARCHAR(50),
ProductQty INT,
ProductUnit VARCHAR(50),
ProductPrice FLOAT,
ProductTotal FLOAT,
PurchaseDate VARCHAR(50),
PurchasePartyName VARCHAR(50),
PurchaseType VARCHAR(50),
ExpireDate VARCHAR(50),
Profit FLOAT
)

DROP TABLE tblPurchase

SELECT * FROM tblPurchase

DELETE tblPurchase

INSERT INTO tblPurchase(ProductName, ProductQty,ProductUnit,ProductPrice,ProductTotal,PurchaseDate,PurchasePartyName,PurchaseType,ExpireDate) Values ('Habibur', 'Rahman','Habib','12345','h@gmail.com','01750752424')


USE InventoryManagement

SELECT * FROM Products

SELECT * FROM DealarInfo

SELECT DealerName FROM DealarInfo


CREATE TABLE tblStock(
Id INT IDENTITY(1,1) PRIMARY KEY,
ProductName VARCHAR(50),
ProductQty INT,
ProductUnit VARCHAR(50),
)

DROP TABLE tblStock

SELECT * FROM tblStock

SELECT * FROM tblStock WHERE ProductName LIKE 'Rice%'

SELECT * FROM tblPurchase

DELETE tblStock


USE InventoryManagement

CREATE TABLE OrderUser(
Id INT IDENTITY(1,1) PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
BillType VARCHAR(50),
PurchaseDate VARCHAR(50)
)

SELECT * FROM OrderUser

CREATE TABLE OrderItem(
Id INT IDENTITY(1,1) PRIMARY KEY,
OrderId INT,
Product VARCHAR(50),
Price FLOAT,
Quantity INT,
Total FLOAT
)

SELECT * FROM OrderItem