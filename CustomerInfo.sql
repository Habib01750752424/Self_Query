CREATE DATABASE CustomerInfo

USE CustomerInfo

CREATE TABLE Districts(
ID INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50),
)

DROP TABLE Districts

INSERT INTO Districts (Name) Values ('Thakurgaon')
INSERT INTO Districts (Name) Values ('Rangpur')
INSERT INTO Districts (Name) Values ('Sylhet')
INSERT INTO Districts (Name) Values ('Dhaka')

SELECT * FROM Districts

CREATE TABLE Customers
(
Id INT IDENTITY(1,1) PRIMARY KEY,
Code VARCHAR(50),
Name VARCHAR(50),
Address VARCHAR(50),
Contact VARCHAR(50),
DistrictId INT FOREIGN KEY REFERENCES Districts(ID)
)

DROP TABLE Customers

INSERT INTO Customers(Code,Name,Address,Contact,DistrictId) VALUES ('1242', 'Habib' ,'Dhaka','01750752424',4)
INSERT INTO Customers(Code,Name,Address,Contact,DistrictId) VALUES ('1010', 'Masud' ,'Thakugaon','01750751814',2)
INSERT INTO Customers(Code,Name,Address,Contact,DistrictId) VALUES ('1212', 'Hossain' ,'Dhaka','01750751215',1)
INSERT INTO Customers(Code,Name,Address,Contact,DistrictId) VALUES ('8585', 'Kawsar Ali' ,'Dinajpur','01750752425',1)
INSERT INTO Customers(Code,Name,Address,Contact,DistrictId) VALUES ('2023', 'Hasan Ali' ,'Dinajpur','01750752461',3)

SELECT * FROM Districts

SELECT * FROM Customers

SELECT c.Id,Code,c.Name,d.Name,Address,Contact FROM Customers AS c
inner join Districts AS d ON d.ID = c.DistrictId WHERE Code = '1212' OR c.Name = 'Hossain'