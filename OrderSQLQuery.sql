USE CoffeeShop

CREATE TABLE Orders(
  ID INT IDENTITY(1,1),
  CustomerName VARCHAR(30),
  ItemName VARCHAR(30),
  Price FLOAT,
  Quantity INT
)

SELECT * FROM Orders

SELECT ID,CustomerName,ItemName,Price,Quantity,Quantity*Price AS TotalCost FROM Orders

SELECT * FROM Orders WHERE CustomerName = 'Masud' OR ItemName = 'Black'