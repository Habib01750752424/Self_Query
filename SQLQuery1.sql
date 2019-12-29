CREATE DATABASE ProductDb
USE ProductDb
/*CRUD Category table Created Below*/
/*Category table*/

CREATE TABLE Category(
CategoryId int IDENTITY(1,1),
CategoryName varchar(30)
)

SELECT * FROM Category

INSERT INTO Category (CategoryName) VALUES ('Stationery')
INSERT INTO Category (CategoryName) VALUES ('Computer') 
INSERT INTO Category (CategoryName) VALUES ('Mobile Phone') 
INSERT INTO Category (CategoryName) VALUES ('Freezes')
INSERT INTO Category (CategoryName) VALUES ('TV')  

DROP TABLE Category

DELETE Category
WHERE CategoryId = 5;

UPDATE Category
SET
CategoryName = 'Tab'
WHERE CategoryId = 4


/*CRUD Category table Created Below With Alter*/
/*Product table*/

CREATE TABLE Products(
ProductId int IDENTITY(1,1),
CategoryId int,
ProductName varchar(30),
Qty int,
Price float,
Description varchar(100)
)

SELECT * FROM Category
SELECT * FROM Products

INSERT INTO Products (CategoryId,ProductName,Qty,Price,Description) VALUES (1,'Pen',10,15,'Good pen for exam')
INSERT INTO Products (CategoryId,ProductName,Qty,Price,Description) VALUES (1,'Pencil',100,5,'Good pencil for drawing')
INSERT INTO Products (CategoryId,ProductName,Qty,Price,Description) VALUES (1,'Notebook',50,25,'Notebook for primary students')
INSERT INTO Products (CategoryId,ProductName,Qty,Price,Description) VALUES (1,'Fullscape',200,15,'Fullscape for higer secondary students')
INSERT INTO Products (CategoryId,ProductName,Qty,Price,Description) VALUES (1,'Eraser',1000,1.50,'Eraser for KG Students')
INSERT INTO Products (CategoryId,ProductName,Qty,Price,Description) VALUES (2,'Mouse',20,200,'USB 2.0 Mouse')
INSERT INTO Products (CategoryId,ProductName,Qty,Price,Description) VALUES (2,'Keyboard',20,250,'USB 3.0 Keyboard')
INSERT INTO Products (CategoryId,ProductName,Qty,Price,Description) VALUES (2,'USB Stick',1000,450,'4 GB Pendrives') 
INSERT INTO Products (CategoryId,ProductName,Qty,Price,Description) VALUES (3,'USB Stick',1000,450,'4 GB Pendrives')
INSERT INTO Products (CategoryId,ProductName,Qty,Price,Description) VALUES (4,'USB Stick',1000,450,'4 GB Pendrives')
INSERT INTO Products (CategoryId,ProductName,Qty,Price,Description) VALUES (6,'USB Stick',1000,450,'4 GB Pendrives')

ALTER TABLE Product
ALTER COLUMN Price float /*Price field changes int to float*/

ALTER TABLE Product
ALTER COLUMN Description varchar(100) /*Changes Description field Length 30 to 100*/


sp_rename 'Product.Quantity', 'Qty', 'COLUMN';/*Changes Column name*/

sp_rename 'Product.Dscription', 'Description', 'COLUMN';/*Changes Column name*/

sp_rename 'Product', 'Products';/*Changes Table name*/

DELETE Products  /*Delete All Products*/

DROP TABLE Products

SELECT productName,Qty,Price FROM Products

SELECT productName,Qty,Price FROM Products
WHERE ProductId = 1;

SELECT * FROM Products
WHERE ProductId = 1;

SELECT ProductName,Price FROM Products
WHERE ProductName = 'Mouse'

SELECT *FROM Products
WHERE ProductId = CategoryId;

SELECT *FROM Products
WHERE Price>150

SELECT *FROM Products
WHERE ProductId between 4 and 8

SELECT *FROM Products
WHERE ProductName in ('Mouse','Keyboard','USB Stick')  

SELECT *FROM Products
WHERE ProductId in (1,2,3)

SELECT *FROM Products
WHERE ProductName like 'K%'

SELECT *FROM Products
WHERE ProductName like '%K'


USE ProductDb

SELECT *FROM Products
WHERE ProductName like '[EF]%'


SELECT *FROM Products
WHERE ProductName like '[^EF]%'

SELECT (ProductName+SPACE(1)+CONVERT(VARCHAR, Qty)) AS ProductWithQty FROM Products

SELECT (ProductName+SPACE(2)+CONVERT(VARCHAR, Qty)) AS ProductWithQty FROM Products  WHERE Qty = 20 

SELECT (ProductName+SPACE(2)+CONVERT(VARCHAR, Qty)) AS ProductWithQty FROM Products 
WHERE ProductName in('Pen','Pencil','keyboard')

SELECT (ProductName+SPACE(2)+CONVERT(VARCHAR, Qty)) AS ProductWithQty FROM Products 
WHERE ProductName like '%K'



SELECT * FROM Products WHERE Description IS NOT NULL

SELECT * FROM Products WHERE Description IS NULL


SELECT * FROM ProductS ORDER BY ProductId DESC

SELECT * FROM ProductS ORDER BY ProductId ASC   /*Here ASC is not Mandatory*/

SELECT * FROM ProductS ORDER BY ProductName ASC

SELECT DISTINCT CategoryId FROM Products

SELECT TOP 5 * FROM Products


SELECT MAX(ProductId) AS MaxProductId FROM Products;

SELECT MAX(Price) AS MaxPrice FROM Products;

SELECT MIN(ProductId) AS MinProductId FROM Products;

SELECT MIN(Price) AS MinPrice FROM Products;

SELECT MAX(Qty) AS MaxPrice FROM Products;
SELECT MIN(Qty) AS MaxPrice FROM Products;

SELECT * FROM Products