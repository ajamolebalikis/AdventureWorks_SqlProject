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
Below is the Entity Relationship diagram for the data star schema relationship between the tables.
![here](![ER Diagram](user-attachments/assets/5e184740-54d0-401f-b924-10105a1ba77e)









    










    
### ER Diagram.
![ER Diagram]![ER Diagram](https://github.com/user-attachments/assets/407c1a53-a9be-41be-97ff-b5b03ac2acc9)


    


