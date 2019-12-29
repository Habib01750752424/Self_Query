USE SmallBusinessManagementSystem

CREATE TABLE StockIn(
Id INT IDENTITY(1,1) PRIMARY KEY,
SupplierPurchaseId INT,
Category VARCHAR(50),
Product VARCHAR(50),
Quantity FLOAT,
PurchaseCode VARCHAR(50)
)
SELECT * FROM StockIn
SELECT * FROM StockIn
DELETE StockIn
DROP TABLE StockIn



CREATE VIEW StockInView1
AS 
SELECT SUM(Quantity) AS NoOfProduct,s.Date FROM StockIn
INNER JOIN SupplierPurchase AS s ON s.Id = StockIn.SupplierPurchaseId
GROUP BY s.Date
SELECT * FROM StockInView1
DROP VIEW StockInView1


CREATE VIEW StockInView2
AS 
SELECT PurchaseCode,Category,Product,sp.Date FROM StockIn
INNER JOIN SupplierPurchase AS sp ON sp.Id = StockIn.SupplierPurchaseId
SELECT * FROM StockInView2
DROP VIEW StockInView2



CREATE VIEW StockInView3
AS 
SELECT PurchaseCode,Category,Product,NoOfProduct,StockInView2.Date FROM StockInView2
INNER JOIN StockInView1 ON StockInView1.Date = StockInView2.Date
SELECT * FROM StockInView3
DROP VIEW StockInView3







CREATE TABLE SoldIn(
Id INT IDENTITY(1,1) PRIMARY KEY,
SaleId INT,
Category VARCHAR(50),
Product VARCHAR(50),
Quantity FLOAT
)
SELECT * FROM SoldIn
USE SmallBusinessManagementSystem
DELETE SoldIn
DROP TABLE SoldIn


CREATE VIEW SoldInView1
AS 
SELECT SUM(Quantity) AS NoOfProduct,s.Date FROM SoldIn
INNER JOIN Sale AS s ON s.Id = SoldIn.SaleId
GROUP BY s.Date
SELECT * FROM SoldInView1
DROP VIEW SoldInView1


CREATE VIEW SoldInView2
AS 
SELECT Category,Product,s.Date FROM SoldIn
INNER JOIN Sale AS s ON s.Id = SoldIn.SaleId
SELECT * FROM SoldInView2
DROP VIEW SoldInView2
USE SmallBusinessManagementSystem



CREATE VIEW SoldInView3
AS 
SELECT Category,Product,NoOfProduct,SoldInView2.Date FROM SoldInView2
INNER JOIN SoldInView1 ON SoldInView1.Date = SoldInView2.Date
SELECT * FROM SoldInView3
DROP VIEW SoldInView3








CREATE VIEW StockInView3
AS 
SELECT PurchaseCode,Category,Product,NoOfProduct,StockInView2.Date FROM StockInView2
INNER JOIN StockInView1 ON StockInView1.Date = StockInView2.Date
SELECT * FROM StockInView3
DROP VIEW StockInView3

CREATE VIEW SoldInView3
AS 
SELECT Category,Product,NoOfProduct,SoldInView2.Date FROM SoldInView2
INNER JOIN SoldInView1 ON SoldInView1.Date = SoldInView2.Date
SELECT * FROM SoldInView3
DROP VIEW SoldInView3


SELECT * FROM StockIn
SELECT * FROM SoldIn

CREATE VIEW FinalStockView
AS 
SELECT stk.Category,stk.Product,sp.Date AS PurchaseDate,s.Date AS SoldDate,stk.Quantity AS Out,sld.Quantity AS Sold,
stk.Quantity -  sld.Quantity AS ClosingBalance FROM StockIn AS stk
INNER JOIN SoldIn AS sld ON sld.Product = stk.Product
INNER JOIN Sale AS s ON s.Id = sld.SaleId
INNER JOIN SupplierPurchase AS sp ON sp.Id = stk.SupplierPurchaseId


SELECT * FROM FinalStockView
DROP VIEW FinalStockView

USE SmallBusinessManagementSystem
















CREATE VIEW FinalStockView
AS 
SELECT stk3.Category,stk3.Product,stk3.NoOfProduct AS StockIN,sld3.NoOfProduct AS StockOut,
stk3.NoOfProduct -  sld3.NoOfProduct AS ClosingBalance,stk3.Date FROM StockInView3 AS stk3
INNER JOIN SoldInView3 AS sld3 ON sld3.Product = stk3.Product


SELECT * FROM FinalStockView
DROP VIEW FinalStockView

SELECT DISTINCT a, c
FROM table_c
