# AdventureWorks_SqlProject
This respository contains SQL scripts for database management
## Overview
This project contain the SQL scripts and documentation for a star schema designed for a sales database that seperates the fact table and dimension table.It also covers the data cleaning processes and ER diagram.
**Disclaimer**:The datasets used are purely for demonstration purposes and do not represent any specific company, institution or country, but just a practice datasetto demonstrate the capabilities of SQL.

## Data Schema
The database is structured using a **Star Schema** with one fact table(Sales) and multiple dimensional table (Products, Customers, Territories, ProductSubcategory, ProductCategory).

### Fact Table (Sales)
The sales table stores transactional data about customer purchases.

### Dimension Tables
### Products Table
The products table contains details, subcatrgories and catgories about the product being sold.

### Customers Tables
The customers table contains customer information.

### Territories Table
The territories table contains geographical sales region.

### Join Tables
Joined the fact table sales to dimensional table product,customer,territories using a foreign key to references each table.

### Data Cleaning Process
**Handle Missing Values**
   Replace or remove rows with NULL values, depending on the context of the column.
   
**Remove Duplicates**
    Ensure no duplicate entries exist in critical tables.
### ER Diagram
![]("C:\Users\USER\Downloads\AdventureWorks_Project ER Diagram.drawio.png").
    


