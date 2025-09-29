 CREATE TABLE customers (
 customer_id SERIAL PRIMARY KEY,
 customer_name VARCHAR(100) NOT NULL,
 email VARCHAR(100) UNIQUE,
 phone VARCHAR(20),
 region VARCHAR(50) NOT NULL
 );



 CREATE TABLE employees (
 employee_id SERIAL PRIMARY KEY,
 employee_name VARCHAR(100) NOT NULL,
 role VARCHAR(50),
 region VARCHAR(20)
 );


 CREATE TABLE inventory (
 inventory_id SERIAL PRIMARY KEY,
 product_id INT NOT NULL UNIQUE,
 stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
 last_updated DATE DEFAULT CURRENT_DATE,
 CONSTRAINT fk_inventory_product FOREIGN KEY (product_id)
 REFERENCES products (product_id) ON DELETE CASCADE
 );


 CREATE TABLE suppliers (
 supllier_id SERIAL PRIMARY KEY,
 supplier_name VARCHAR(100) NOT NULL,
 contract VARCHAR(100),
 location VARCHAR(100) NOT NULL
 );


CREATE TABLE transactions (
transaction_id SERIAL PRIMARY KEY,
customer_id INT NOT NULL,
product_id INT NOT NULL,
employee_id INT NOT NULL,
sale_date DATE NOT NULL,
quantity INT DEFAULT 1 CHECK (quantity > 0),
amount NUMERIC (12,2) NOT NULL CHECK (amount >= 0),
CONSTRAINT fk_customer FOREIGN KEY (customer_id)
REFERENCES customers (customer_id) ON DELETE CASCADE,
CONSTRAINT fk_product FOREIGN KEY (product_id)
REFERENCES products (product_id) ON DELETE CASCADE,
CONSTRAINT fk_employee FOREIGN KEY (employee_id)
REFERENCES employees (employee_id) ON DELETE CASCADE
);




CREATE TABLE products (
product_id SERIAL PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(50),
price NUMERIC(10,2) NOT NULL CHECK (price > 0),
supplier_id INT NOT NULL,
CONSTRAINT fk_supplier FOREIGN KEY (supplier_id)
REFERENCES suppliers (supplier_id) ON DELETE CASCADE
);


