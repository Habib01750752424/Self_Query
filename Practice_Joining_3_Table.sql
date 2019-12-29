CREATE DATABASE Practice
USE Practice

CREATE TABLE Item(
 ID INT IDENTITY(1,1),
 Name VARCHAR(30),
 Price FLOAT
)

SELECT * FROM Item

INSERT INTO Item(Name,Price)VALUES('HOT',100)
INSERT INTO Item(Name,Price)VALUES('COLD',90)
INSERT INTO Item(Name,Price)VALUES('AVERAGE',80)
INSERT INTO Item(Name,Price)VALUES('BLACK',120)

CREATE TABLE Customer(
 ID INT IDENTITY(1,1),
 Name VARCHAR(30),
 Address VARCHAR(30),
 Contact VARCHAR(30)
)

SELECT * FROM Customer

INSERT INTO Customer(Name,Address,Contact)VALUES('Habib','Dhaka-1215','01750752424')
INSERT INTO Customer(Name,Address,Contact)VALUES('Azimuddin','Thakurgaon-5131','01750758585')
INSERT INTO Customer(Name,Address,Contact)VALUES('Ejabuddin','Dinajpur','01750757070')
INSERT INTO Customer(Name,Address,Contact)VALUES('Kawsar Ali','Thakurgaon','01750752525')
INSERT INTO Customer(Name,Address,Contact)VALUES('Masud Rana','Rajshahi','01750751814')


CREATE TABLE Orders(
 ID INT IDENTITY(1,1),
 CustomerID INT,
 ItemID INT,
 Quantity INT,
)

SELECT * FROM Orders

INSERT INTO Orders(CustomerID,ItemID,Quantity)VALUES(4,2,5)
INSERT INTO Orders(CustomerID,ItemID,Quantity)VALUES(1,1,10)
INSERT INTO Orders(CustomerID,ItemID,Quantity)VALUES(3,4,7)
INSERT INTO Orders(CustomerID,ItemID,Quantity)VALUES(5,2,15)
INSERT INTO Orders(CustomerID,ItemID,Quantity)VALUES(2,3,30)
INSERT INTO Orders(CustomerID,ItemID,Quantity)VALUES(1,4,2)

DELETE Orders

DROP TABLE Orders


SELECT * FROM Item
SELECT * FROM Customer
SELECT * FROM Orders

SELECT Customer.Name,Item.Name,Quantity,Item.Price
       FROM Orders INNER JOIN Customer
	   ON Orders.ID = Customer.ID
	   INNER JOIN Item 
	   ON Orders.ID = Item.ID
