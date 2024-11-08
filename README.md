# AdventureWorks_SqlProject
This respository contains SQL scripts for database management
## Overview
This project contain the SQL scripts and documentation for a star schema designed for a sales database that seperates the fact table and dimension table.It also covers the data cleaning processes and ER diagram.

**-Disclaimer_**:_The datasets used are purely for demonstration purposes and do not represent any specific company, institution or country, but just a practice datasetto demonstrate the capabilities of SQL_.

## Data Schema
The database is structured using a **Star Schema** with one fact table(Sales) and multiple dimensional table (Products, Customers, Territories, ProductSubcategory, ProductCategory).

### Fact Table (Sales)
The sales table stores transactional data about customer purchases.

### Dimension Tables
### Products Table
The products table contains details, subcategories and categories about the product being sold.

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
Below is the Entity Relationship diagram for the data star schema relationship between the tables.

![AdventureWorks_Project ER Diagram drawio](https://github.com/user-attachments/assets/45bc762c-8df0-4be4-a852-164a8a79234d)




## Conclusion
This project demonstrates the power of structured data management using a star schema and efficient data cleaning techniques. By organizing data into fact and dimension tables. Dive into the scripts,explore the ER diagram and use this framework to supercharge your data driven decison-making!.

**THANK YOU!**


