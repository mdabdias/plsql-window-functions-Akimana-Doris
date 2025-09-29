# plsql-window-functions-Akimana-Doris

#Hair Products Sales Analysis Using Functions

1.1 Business

A small retail company that sells hair care products such as shampoo, different conditioners, oils and accessories needs to take care of the hair. Its operations are within the beauty and personal care industry and the sales department is particularly interested in understanding the customers, knowing product performances and customer trends across different regions.

1.2 Pain point/Data challenges

The company sales department collects data daily but it is difficult to know which hair products are consistently performing well and to understand customers' spending behavior. In addition,it’s a struggle tracking monthly sales growth and loyalty programs for customers.

1.3 Expected outcome

The wanted outcome is to generate an insight on the best selling hair products by region and monthly, understand customer spending behaviours, and understand monthly sales trends and growth rates. Those insights will be used to guide the company’s sales and marketing team in decision making on promotion, stocked product and customer rewards.


Success Criteria


2.1 Identify Top Products 

Here we are going to know what are the top 5 products sold per region adn monthly. This will help the sales department to know which items are most popular on the market across different areas so that they can plan promotions and stock.

2.2 Track running totals

To know how sales accumulate over time, we are going to calculate the running monthly sales totals per region. As the company wants to understand long term growth and performance this will help them to do that.

2.3 Monitor Month–over–month Growth

By percentage change in sales of the previous month for each region, we help the management  to highlight where sales are declining or improving so as to make changes in product to put on the market accordingly.

2.4 Customer segments

To understand the customer well, classifying them into top spenders,high, medium and low spenders based on their total purchases. To allow the company to design targeted loyalty programs.

2.5 Three Month moving average

Calculate a three-month moving average of sales per region to smooth out monthly fluctuations and reveal the overall sales trend.


Schema and ER Diagram

3.1 Database Schema

This database have six related tables:
A. Customer

Customer information
Customer_id, Customer_name, Email,Phone,  Region


B. Products

Products information
Product_id(PK),Product_name, Categoryt,Price, supplier_id(FK)


C. Transactions

Transsactios records
Transaction_id,customer_id(FK),Product_id(FK),Employee_id(FK),Sale_date,Quantity,Amount


D. Employees
Employees details
Employee-id(PK),Employee_name,Role,Region


E. Suppliers
Suppliers information


Supplier_id(PK),Supplier_name,Contact,Location


F. Inventory

Inventory history 
Inventory_id(PK),Product_id(FK),Stock_quantity,Last_updated


ER- Diagram

Each number presents the table and its Explanations:

1. One customer can make many transactions - 1 to many relationships with transactions.
2. -One product can be in many transaction - 1 to many relationship with transactions,
   -Many products comes from one supplier - many to 1 relationship with suppliers,
   -One product has one inventory record - 1 to 1 relationship with inventory.
3. - The transaction relationship 
- links to the customers table who bought,
- Links to products table what was bought, and
- Links to employees who processed the sales
4. As one employee can handle multiple transactions - 1 to many with transactions.
5. One supplier provides many products - 1 to many with products.
6. One product has one inventory  record - 1 to 1 relationship with products.


## SQL Script
- Create_table.sql: It contains the scripts used to create all six tables.
- Insert_table.sql: It contains the scripts used to insert information from customers,employees, etc and the other.
- Queries.sql: this contains the script used to find the ranking, aggreage, etc of our information to know how we solved the issue of knowing the right information  from customer to our product.

## Results 
1. Descriptive: sales reached a good point in the month of February across most region with shampoo A and Conditioner B. Customers spendings showed small group of buyers had the most revenue.
2. Diagnostic: Due to the promotion of February of Valentin's day, the sales reached a pick and all went down in march and leads to slowe growth.
3. Prescriptive: The promotions should not be in Fecruary but also in each month on a well known dates.

## References
- PostgreSQL Documentation
- Window Functions in SQL
- GitHub Guides
- SQL Style Guide
- DataCamp SQL Window Functions Tutorial
- W3Schools SQL Reference
- Oracle SQL Documentation
- Mode Analytics SQL Window Functions
- GeeksforGeeks SQL Window Functions
- Stack Overflow Discussions

“All sources were properly cited. Implementations and analysis represent original work. No AIgenerated content was copied without attribution or adaptation.”
