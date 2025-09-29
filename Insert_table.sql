SELECT * FROM customers;
customer_id | customer_name    |   email            |   phone       |  region
1           |  Amina Umutoni   | amina.u@example.com| 0788002222    |East
2           | Paul Nsengiyumva |paul.n@example.com  |0788003333     |West
3           | Grace Mukamana   |grace.m@example.com |0788004444     |North
4           |Eric Habimana     |eric.h@example.com  |0788005555     |Kigali
5           |Claire Uwimana    |claire.u@example.com|0788006666     |South
6           |James K           |james.k@example.com |0788007777     |East

SELECT * FROM employees;
employee_id |employee_name     | role         |region
1           |Alice Uwase       | Cashier      | Kigali
2           |Brian Niyonzima   | Sales Agent  | East
3           |Carine Ishimwe    |  Cashier     |West
4           |David Mugenzi     | Manager      |North
5           |Esther Umurerwa   |Sales Agent   |South
 

SELECT * FROM suppliers;
supplier_id    |supplier_name         |contract                |location
1              |BeautyCare Ltd        | beautycare@example.com |Kigali
2              |AfroHair Distributors |afrohair@example.com    |East
3              |Natural Glow Supplies |naturalglow@example.com |West


SELECT * FROM products;
product_id     |product_name      |category       |price     |supplier_id
1              |Shampoo A         |Shampoo        |1200.00   |1
2              |Conditioner B     |Conditioner    |1500.00   |1
3              |Hair Oil          | Oil           |2000.00   |2
4              |Hair Mask         |Treatment      |1800.00   |2
5              |Serum             |Serum          |2500.00   |3
6              |Comb              | Accessory     |300.00    |3


SELECT * FROM transactions;
transaction_id |  customer_id |   product_id |   employee_id |     sale_date | quantity |    amount
11                    1       |       1      |       1       |    2024-01-10 |    2     |    2400.00
12                    2               2              2       |    2024-01-12 |    1     |    1500.00
13                    3               3              3       |    2024-01-15 |    1     |    2000.00
14                    4               1              4       |    2024-01-20 |    3     |    3600.00
15                    5               5              1       |    2024-02-05 |    1     |    2500.00



SELECT * FROM inventory;
inventory_id |product_id |stock_quantity |last_updated
1                 1          100          2024-01-01
2                 2           80          2024-01-01
3                 3           60          2024-01-01
4                 4           50          2024-01-01
5                 5           40          2024-01-01
6                 6           200         2024-01-01
