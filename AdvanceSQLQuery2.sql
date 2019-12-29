USE ProductDb

SELECT * FROM Category
SELECT * FROM Products

SELECT * FROM Products
WHERE ProductId%2 = 0;

SELECT * FROM Products
WHERE ProductId%2 = 1;

SELECT Temp.* FROM
(SELECT ROW_NUMBER() OVER (ORDER BY ProductId) AS row_num,
Products.* FROM Products) Temp
WHERE ((Temp.row_num) % 2)  = 0

SELECT Temp.* FROM
(SELECT ROW_NUMBER() OVER (ORDER BY ProductId) AS row_num,
Products.* FROM Products) Temp
WHERE ((Temp.row_num) % 2)  = 1

SELECT COUNT(*) AS RecordCount FROM Products WHERE ProductId = 1

/*............ JOIN QUERY .............*/
/*............ INNER JOIN .............*/
SELECT * FROM Category
INNER JOIN Products
ON Category.CategoryId = Products.CategoryId
ORDER BY ProductId;

SELECT * FROM Category
INNER JOIN Products
ON Category.CategoryId = Products.CategoryId
ORDER BY ProductId DESC;

SELECT * FROM Products
INNER JOIN Category
ON Products.CategoryId = Category.CategoryId;

SELECT * FROM Category
INNER JOIN Products
ON Category.CategoryId = Products.CategoryId;

SELECT * FROM Category
INNER JOIN Products
ON Products.CategoryId = Category.CategoryId;

/*............ Implicit JOIN .............*/

SELECT * FROM Category,Products
WHERE Category.CategoryId = ProductS.CategoryId

/*............ LEFT JOIN .............*/
SELECT * FROM Category 
LEFT JOIN Products
ON Category.CategoryId = Products.CategoryId 

SELECT * FROM Products 
LEFT JOIN Category
ON Products.CategoryId = Category.CategoryId 

/*............ RIGHT JOIN .............*/

SELECT * FROM Category
RIGHT JOIN Products
ON Category.CategoryId = Products.CategoryId

/*............ FULL JOIN .............*/

SELECT * FROM Category
FULL JOIN Products
ON Category.CategoryId = Products.CategoryId

/*............ Average .............*/

SELECT AVG(Price) AS PriceAverage FROM Products

SELECT COUNT(ProductName) AS NoOfProduct FROM Products

SELECT MAX(Price) AS MaxPrice FROM Products

SELECT MIN(Price) AS MinPrice FROM Products

SELECT SUM(Qty) AS Tital_Products FROM Products

SELECT UPPER(ProductName) AS PRODUCTS FROM Products

SELECT LOWER(ProductName) AS Products FROM Products

SELECT ProductId,ProductName, Qty*Price Total_Cost
FROM Products
ORDER BY Qty*Price DESC;

/*...List all columns of all tables in a database...*/
  
SELECT sys.objects.name AS TableName,
sys.columns.name AS ColumnName  
FROM sys.columns  
INNER JOIN sys.objects    
ON sys.columns.object_id=sys.objects.object_id   
and type_desc = 'USER_TABLE'  
ORDER BY sys.objects.name,sys.columns.column_id 