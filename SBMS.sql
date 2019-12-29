CREATE DATABASE SmallBusinessManagementSystem

USE SmallBusinessManagementSystem

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

CREATE TABLE Category(
Id INT IDENTITY(1,1) PRIMARY KEY,
Code VARCHAR(50),
Name VARCHAR(50)
)

SELECT * FROM Category

ALTER TABLE Category ADD SL VARCHAR(20) NULL ;

DELETE Category WHERE Id = 13

DROP TABLE Category

CREATE TABLE Products(
Id INT IDENTITY(1,1) PRIMARY KEY,
CategoryId INT,
Code VARCHAR(50),
Name VARCHAR(50),
ReorderLevel VARCHAR(50),
Description VARCHAR(250)
)

SELECT * FROM Products 

SELECT MAX(Id) FROM Products 

DELETE Products

USE SmallBusinessManagementSystem

SELECT Id,CategoryId,Name FROM Products WHERE CategoryId = 14 ORDER BY Id DESC

SELECT Name AS SL,Name FROM Products

CREATE VIEW ProductView
AS
SELECT c.Id AS Serial,p.Id,c.Name AS Category ,p.Code,p.Name AS Product ,p.ReorderLevel,p.Description FROM Products AS p
INNER JOIN Category AS c ON p.CategoryId = c.Id


SELECT * FROM ProductView

////Not possible to insert into view
INSERT INTO ProductView(Category, Code,Product,ReorderLevel,Description) Values ('Mobile',1200,'Nokia-3200',10,'nice')


SELECT Id,Name FROM Category
WHERE CategoryId = 14;

DROP VIEW ProductView


CREATE TABLE Customers(
SL VARCHAR(30),
Id INT IDENTITY(1,1) PRIMARY KEY,
Code VARCHAR(50),
Name VARCHAR(50),
Address VARCHAR(100),
Email VARCHAR(50),
Contact VARCHAR(50),
LoyaltyPoint int
)

SELECT * FROM Customers

DELETE Customers WHERE Id = 1

DROP TABLE Customers

CREATE TABLE Supplier(
SL VARCHAR(30),
Id INT IDENTITY(1,1) PRIMARY KEY,
Code VARCHAR(50),
Name VARCHAR(50),
Address VARCHAR(100),
Email VARCHAR(50),
Contact VARCHAR(50),
ContactPerson VARCHAR(50)
)

SELECT * FROM Supplier



CREATE TABLE Purchase(
Id INT IDENTITY(1,1) PRIMARY KEY,
Date VARCHAR(50),
BillNo VARCHAR(50),
SupplierId INT FOREIGN KEY REFERENCES Supplier(Id),
CategoryId INT FOREIGN KEY REFERENCES Category(Id),
ProductId INT FOREIGN KEY REFERENCES Products(Id),
Code VARCHAR(50),
AvailableQuantity FLOAT,
ManufacturedDate VARCHAR(50),
ExpireDate VARCHAR(50),
Remarks VARCHAR(250),
Quantity FLOAT,
UnitPrice FLOAT,
TotalPrice FLOAT,
PreviousUnitPrice FLOAT,
PreviousMRP FLOAT,
MRP FLOAT
)

SELECT * FROM Purchase

DELETE Purchase

SELECT TOP 1 UnitPrice FROM Purchase WHERE ProductId = 2

USE SmallBusinessManagementSystem

CREATE VIEW PurchaseView
AS
SELECT pr.Id AS SL,pu.Id,pr.Name AS Product,ManufacturedDate,ExpireDate,Quantity,UnitPrice,TotalPrice,MRP,Remarks
FROM Purchase AS pu
INNER JOIN Products AS pr ON pu.ProductId = pr.Id

INSERT INTO PurchaseView(Product, ManufacturedDate,ExpireDate,Quantity,UnitPrice,TotalPrice,MRP,Remarks)
 Values ('Huwei', '18-12-19','10-10-20','12345',20,100,2000,10,'Very nice product')

SELECT * FROM PurchaseView

CREATE TABLE PurchaseSupplier(
SL VARCHAR(50),
Id INT IDENTITY(1,1) PRIMARY KEY,
Date VARCHAR(50),
BillNo VARCHAR(50),
SupplierId VARCHAR(50)
)

SELECT * FROM PurchaseSupplier

DROP TABLE PurchaseSupplier


CREATE TABLE PurchaseDetails(
SL VARCHAR(50),
Id INT IDENTITY(1,1) PRIMARY KEY,
BillNo VARCHAR(50),
CategoryId INT,
ProductId INT,
Code VARCHAR(50),
Category VARCHAR(50),
Product VARCHAR(50),
ManufacturedDate date,
ExpireDate date,
Quantity FLOAT,
UnitPrice FLOAT,
TotalPrice FLOAT,
MRP FLOAT,
Remarks VARCHAR(250)
)

SELECT TOP 1 UnitPrice FROM PurchaseDetails WHERE ProductId = 2

SELECT * FROM PurchaseDetails

DELETE PurchaseDetails

SELECT COUNT(*) FROM PurchaseDetails

SELECT SUM(Quantity),product FROM PurchaseDetails GROUP BY Product HAVING (ManufacturedDate) >= '1/1/19' AND (ManufacturedDate) <=  '1/11/19'

SELECT Category, Code, SUM(Quantity), product FROM PurchaseDetails GROUP BY Product

SELECT SUM(Quantity),product
FROM PurchaseDetails
GROUP BY Product;

DELETE PurchaseDetails

DROP TABLE PurchaseDetails

CREATE TABLE Stock(
Id INT IDENTITY(1,1) PRIMARY KEY,
Code VARCHAR(50),
Product VARCHAR(50),
Category VARCHAR(50),
ManufacturedDate date,
Quantity FLOAT,
UnitPrice FLOAT,
MRP FLOAT,
Profit FLOAT
)

INSERT INTO Stock(Code, Product,Quantity) Values ('21300', 'Samsung80',9)
INSERT INTO Stock(Code, Product,Quantity) Values ('45202', 'huwei LDN LX-2',4)
INSERT INTO Stock(Code, Product,Quantity) Values ('52888', 'Product TitleArctic King 1.1 cu ft Upright Freezer',3)
INSERT INTO Stock(Code, Product,Quantity) Values ('12365', 'Hamilton Iron',1)
INSERT INTO Stock(Code, Product,Quantity) Values ('47896', 'Iron50',1)

USE SmallBusinessManagementSystem
SELECT * FROM Stock

SELECT Code,Product,Category,ManufacturedDate,Quantity,UnitPrice,MRP,Profit FROM Stock WHERE ManufacturedDate BETWEEN '01-07-2019' AND '26-10-2019'

DELETE Stock 

DROP TABLE Stock

USE SmallBusinessManagementSystem

CREATE TABLE PurchaseDetailed(
SL VARCHAR(50),
Id INT IDENTITY(1,1) PRIMARY KEY,
BillNo VARCHAR(50),
CategoryId INT,
ProductId INT,
Code VARCHAR(50),
Product VARCHAR(50),
ManufacturedDate FLOAT,
ExpireDate VARCHAR(50),
Quantity FLOAT,
UnitPrice FLOAT,
TotalPrice FLOAT,
MRP FLOAT,
Remarks VARCHAR(250)
)

INSERT INTO PurchaseDetailed(BillNo, CategoryId,ProductId,Code,Product,ManufacturedDate,ExpireDate,Quantity,UnitPrice,TotalPrice,MRP,Remarks)
Values ('15230', 13,18,'12345','Pen',1/10/19,'2/10/20',10,120,1200,130,'Nice Pen')
INSERT INTO PurchaseDetailed(BillNo, CategoryId,ProductId,Code,Product,ManufacturedDate,ExpireDate,Quantity,UnitPrice,TotalPrice,MRP,Remarks)
Values ('152135', 14,2,'22222','Pencil',1/20/19,'2/10/20',1,12,12,15,'Nice Pencil')
INSERT INTO PurchaseDetailed(BillNo, CategoryId,ProductId,Code,Product,ManufacturedDate,ExpireDate,Quantity,UnitPrice,TotalPrice,MRP,Remarks)
Values ('15210', 13,2,'55555','Eraser',2/1/19,'2/10/20',10,10,100,12,'Nice Eraser')
INSERT INTO PurchaseDetailed(BillNo, CategoryId,ProductId,Code,Product,ManufacturedDate,ExpireDate,Quantity,UnitPrice,TotalPrice,MRP,Remarks)
Values ('85234', 13,18,'12044','Book',2/10/19,'2/10/20',5,22,110,25,'Nice Book')
INSERT INTO PurchaseDetailed(BillNo, CategoryId,ProductId,Code,Product,ManufacturedDate,ExpireDate,Quantity,UnitPrice,TotalPrice,MRP,Remarks)
Values ('89647', 14,18,'78965','Bag',3/10/19,'2/10/20',7,17,149,20,'Nice Bag')

SELECT * FROM PurchaseDetailed

SELECT * FROM PurchaseDetailed WHERE ManufacturedDate BETWEEN 1/10/19 AND 1/10/19

SELECT COUNT(*) FROM PurchaseDetailed

DELETE PurchaseDetailed

DROP TABLE PurchaseDetailed

USE SmallBusinessManagementSystem



CREATE TABLE Sales(
Id INT IDENTITY(1,1) PRIMARY KEY,
CustomerId INT FOREIGN KEY REFERENCES Customers(Id),
Date VARCHAR(50),
LoyalityPoint FLOAT,
CategoryId INT FOREIGN KEY REFERENCES Category(Id),
ProductId INT FOREIGN KEY REFERENCES Products(Id),
AvailableQuantity FLOAT,
Quantity FLOAT,
MRP FLOAT,
TotalMRP FLOAT
)

SELECT * FROM Sales

DELETE Sales

USE SmallBusinessManagementSystem 

CREATE TABLE Sales_Details( 
SL VARCHAR(50),                            
Id INT IDENTITY(1,1) PRIMARY KEY,
CustomerId INT,
Date VARCHAR(50),
LoyalityPoint FLOAT,
CategoryId INT,
ProductId INT,
SalesCode VARCHAR(50),
Product VARCHAR(50),
AvailableQuantity FLOAT,
Quantity FLOAT,
MRP FLOAT,
SalePrice FLOAT,
Profit FLOAT,
TotalMRP FLOAT
)

SELECT * FROM Sales_Details

DROP TABLE Sales_Details

DELETE Sales_Details

USE SmallBusinessManagementSystem 

CREATE TABLE Sales_Stock( 
SL VARCHAR(50),                            
Id INT IDENTITY(1,1) PRIMARY KEY,
Code VARCHAR(50),
Product VARCHAR(50),
Category VARCHAR(50),
Date VARCHAR(50),
SoldQuantity FLOAT,
CP FLOAT,
SalesPrice FLOAT,
Profit FLOAT
)

SELECT * FROM Sales_Stock

DROP TABLE Sales_Stock

CREATE TABLE Sales_Amount(
Id INT IDENTITY(1,1) PRIMARY KEY,
CategoryId INT,
ProductId INT,
GrandTotal FLOAT,
Discount FLOAT,
DiscountAmount FLOAT,
PayableAmount FLOAT
)

SELECT * FROM Sales_Amount

DROP TABLE Sales_Amount