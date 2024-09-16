--Fact TABLE (Sales)

CREATE TABLE Factsales(
OrderDate TEXT,
StockDate TEXT,
OrderNumber TEXT PRIMARY KEY,
ProductKey INTEGER,
CustomerKey INTEGER,
TerritoryKey INTEGER,
OrderLineItem INTEGER,
OrderQuantity INTEGER,
FOREIGN KEY(ProductKey)
REFERENCES Products(ProductKey),
FOREIGN KEY (CustomerKey)
REFERENCES Customers (CustomerKey),
FOREIGN KEY (TerritoryKey)
REFERENCES Territories(SalesTerritoryKey)
);

CREATE TABLE Factreturns (
ReturnDate TEXT,
TerritoryKey INTEGER,
ProductKey INTEGER,
FOREIGN KEY (TerritoryKey)
REFERENCES Territories (SalesTerritoryKey),
FOREIGN KEY (ProductKey)
REFERENCES Products(ProductKey)
);

--Dimensional TABLE

CREATE TABLE products (
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
REFERENCES Products_Subcategories (ProductSubcategoryKey)
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


CREATE TABLE products_Subcategories (
ProductSubcategoryKey INTEGER PRIMARY KEY,
SubcategoryName TEXT,
ProductCategoryKey INTEGER,
FOREIGN KEY (ProductCategoryKey)
REFERENCES Product_categories (ProductCategoryKey)
);

CREATE TABLE Product_categories (
ProductCategoryKey INTEGER PRIMARY KEY,
CategoryName TEXT
);


