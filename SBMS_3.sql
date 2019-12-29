
USE SmallBusinessManagementSystem

CREATE TABLE SupplierPurchase(
Id INT IDENTITY(1,1) PRIMARY KEY,
Date date,
BillNo VARCHAR(50),
SupplierId int
)

SELECT * FROM SupplierPurchase

SELECT SUM(SupplierId) AS Total FROM SupplierPurchase WHERE Date BETWEEN '2019-10-30' AND '2019-10-30';

DELETE SupplierPurchase
DROP TABLE SupplierPurchase

USE SmallBusinessManagementSystem

CREATE TABLE SupplierPurchaseDetails(
Id INT IDENTITY(1,1) PRIMARY KEY,
SupplierPurchaseId INT,
CategoryId INT,
ProductId INT,
Product VARCHAR(50),
PurchaseCode VARCHAR(50),
Code VARCHAR(50),
AvailableQuantity FLOAT,
ManufacturedDate date,
ExpireDate date,
Remarks VARCHAR(250),
Quantity FLOAT,
UnitPrice FLOAT,
TotalPrice FLOAT,
PreviousUnitPrice FLOAT,
PreviousMRP FLOAT,
MRP FLOAT
)

SELECT * FROM SupplierPurchaseDetails

SELECT SUM(Quantity) AS NoOfProduct,s.Date FROM SupplierPurchaseDetails
INNER JOIN SupplierPurchase AS s ON s.Id = SupplierPurchaseDetails.SupplierPurchaseId
GROUP BY s.Date

DELETE SupplierPurchaseDetails

DROP TABLE SupplierPurchaseDetails

USE SmallBusinessManagementSystem


CREATE VIEW PurchaseModuleView
AS
SELECT spd.PurchaseCode AS Code,p.Name AS Name,c.Name AS Category,sp.Date,spd.AvailableQuantity AS StockQty,spd.UnitPrice AS CP,spd.MRP AS SalesPrice,spd.MRP - spd.UnitPrice AS Profit FROM SupplierPurchaseDetails AS spd
INNER JOIN SupplierPurchase AS sp ON sp.Id = spd.SupplierPurchaseId
INNER JOIN Category AS c ON spd.CategoryId = c.Id
INNER JOIN Products AS p ON spd.ProductId = p.Id

USE SmallBusinessManagementSystem

SELECT * FROM PurchaseModuleView

DROP VIEW PurchaseModuleView


CREATE VIEW StockModuleView
AS
SELECT sp.Id AS SL,spd.Id,spd.PurchaseCode AS Code,spd.Product AS Name,sd.Category AS Category,sp.Date,spd.AvailableQuantity AS InQty,
sd.AvailableQuantity AS OutQty,spd.AvailableQuantity - sd.AvailableQuantity AS ClosingBalance FROM SupplierPurchaseDetails AS spd
INNER JOIN SupplierPurchase AS sp ON sp.Id = spd.SupplierPurchaseId
INNER JOIN SaleDetails AS sd ON spd.Product = sd.Product

SELECT * FROM StockModuleView

DROP VIEW StockModuleView

SELECT * FROM SupplierPurchaseDetails
SELECT * FROM SaleDetails

