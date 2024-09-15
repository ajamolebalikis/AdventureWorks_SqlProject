CREATE TABLE FactSales (
	"OrderDate"	TEXT,
	"StockDate"	TEXT,
	"OrderNumber" TEXT,
	"ProductKey" INTEGER,
	"CustomerKey" INTEGER,
	"TerritoryKey" INTEGER,
	"OrderLineItem" INTEGER,
	"OrderQuantity" INTEGER,
	PRIMARY KEY (OrderNumber, OrderLineItem)
);

INSERT INTO FactSales(OrderDate,StockDate, OrderNumber, ProductKey, CustomerKey, TerritoryKey, OrderLineItem, OrderQuantity)
SELECT OrderDate,StockDate, OrderNumber, ProductKey, CustomerKey, TerritoryKey, OrderLineItem, OrderQuantity
FROM AdventureWorks_Sales_2015;

INSERT INTO FactSales(OrderDate,StockDate, OrderNumber, ProductKey, CustomerKey, TerritoryKey, OrderLineItem, OrderQuantity)
SELECT OrderDate,StockDate, OrderNumber, ProductKey, CustomerKey, TerritoryKey, OrderLineItem, OrderQuantity
FROM AdventureWorks_Sales_2016;

INSERT INTO FactSales(OrderDate,StockDate, OrderNumber, ProductKey, CustomerKey, TerritoryKey, OrderLineItem, OrderQuantity)
SELECT OrderDate,StockDate, OrderNumber, ProductKey, CustomerKey, TerritoryKey, OrderLineItem, OrderQuantity
FROM AdventureWorks_Sales_2017;

ALTER TABLE AdventureWorks_Returns RENAME TO FactReturns;
ALTER TABLE AdventureWorks_Calendar RENAME TO DimCalendar;
ALTER TABLE AdventureWorks_Customers RENAME TO DimCustomer;
ALTER TABLE AdventureWorks_Product_Categories RENAME TO DimProductCategories;
ALTER TABLE AdventureWorks_Product_Subcategories RENAME TO DimProduct_Subcategories;
ALTER TABLE AdventureWorks_Products RENAME TO DimProducts;
ALTER TABLE AdventureWorks_Territories RENAME TO Dimterritorries;

CREATE TABLE DimCalendars(
	"OrderDate" TEXT,
	"Year" TEXT,
	"Month" TEXT,
	PRIMARY KEY (OrderDate)
	);
	
INSERT INTO DimCalendars(OrderDate, Year, Month)
SELECT DATE,
CAST(substr(DATE,-4)as INTEGER) as Year,
CAST(substr(DATE,1,2)as INTEGER) as Month
FROM DimCalendar;

CREATE TABLE Dimproducts (
ProductKey INTEGER PRIMARY KEY,
ProductSubcategoryKey INTEGER,
ProductSKU TEXT,
ProductName TEXT,
ModelName TEXT,
ProductDescription TEXT,
ProductColor TEXT,
ProductSize TEXT,
ProductStyle TEXT,
ProductCost REAL,
ProductPrice REAL,
FOREIGN KEY (ProductSubcategoryKey)
REFERENCES DimProduct_Subcategories (ProductSubcategoryKey)
);

CREATE TABLE Customers (
CustomerKey INTEGER PRIMARY KEY,
Prefix TEXT,
FirstName TEXT,
LastName TEXT,
BirthDate TEXT,
MaritalStatus TEXT,
Gender TEXT,
EmailAddress TEXT,
AnnualIncome REAL,
TotalChildren INTEGER,
EducationLevel TEXT,
Occupation TEXT,
HomeOwner TEXT
);

CREATE TABLE Territories (
SalesTerritoryKey INTEGER PRIMARY KEY,
Region TEXT,
Country TEXT,
Continent TEXT
);

CREATE TABLE DimProduct_Subcategories(
ProductSubcategoryKey INTEGER PRIMARY KEY,
SubcategoryName TEXT,
ProductCategoryKey INTEGER,
FOREIGN KEY (ProductCategoryKey)
REFERENCES DimProductCategories (ProductCategoryKey)
);

CREATE TABLE DimProductCategories (
ProductCategoryKey INTEGER PRIMARY KEY,
CategoryName TEXT
);


--JOIN Factsales AND Dimproducts Tables:

SELECT Factsales.OrderNumber, Dimproducts.ProductName, Factsales.OrderQuantity
FROM Factsales
JOIN Dimproducts ON Factsales.ProductKey=Dimproducts.ProductKey;

--JOIN Factsales, Customers, AND Territories:

SELECT Factsales.OrderNumber, Dimcustomer.FirstName, Dimcustomer.LastName, Dimterritorries.Region
FROM Factsales
JOIN Dimcustomer ON Factsales.CustomerKey=Dimcustomer.CustomerKey
JOIN Dimterritorries ON Factsales.TerritoryKey=Dimterritorries.SalesTerritoryKey;

--DATA CLEANING
REMOVE DUPLICATES:
DELETE FROM Dimproducts WHERE ROWID NOT IN (
SELECT MIN(ROWID) FROM Dimproducts GROUP BY ProductSKU
);

DELETE FROM Dimcustomer WHERE ROWID NOT IN (
SELECT MIN (ROWID)FROM Dimcustomer GROUP BY EmailAddress
);

UPDATE Factsales SET OrderQuantity=0
WHERE OrderQuantity IS NULL;

UPDATE Dimproducts SET ProductPrice=(SELECT AVG(ProductPrice)FROM Dimproducts WHERE ProductPrice IS NOT NULL)
WHERE ProductPrice IS NULL;

UPDATE Factsales SET ProductKey =0
WHERE ProductKey IS NULL;

UPDATE Factsales SET CustomerKey=0
WHERE ProductKey IS NULL;

UPDATE Dimcustomer SET EmailAddress =LOWER (EmailAddress);



