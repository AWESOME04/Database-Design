-- What are Joins in PostgreSQL:


-- Joins in PostgreSQL are used to combine data from two or more tables based on a common column or condition. The result of a join operation is a new table that contains all the columns from both tables, where the rows that meet the specified condition are combined.

-- In PostgreSQL, you can use various types of joins such as INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, and CROSS JOIN to combine data from multiple tables.

-- An INNER JOIN returns only the rows from both tables that match the specified condition. A LEFT JOIN returns all rows from the left table and matching rows from the right table, and NULL values for non-matching rows. A RIGHT JOIN returns all rows from the right table and matching rows from the left table, and NULL values for non-matching rows. A FULL OUTER JOIN returns all rows from both tables and NULL values for non-matching rows. A CROSS JOIN returns the Cartesian product of the two tables, which means all possible combinations of rows from both tables.

-- Joins in PostgreSQL are a powerful feature that enables you to extract meaningful insights and information from multiple tables with a single query.



-- Types of Joins:
-- PostgreSQL supports several types of joins that allow you to combine data from two or more tables in different ways. The following are the most common types of joins in PostgreSQL:

--     INNER JOIN: Returns all rows from both tables where the join condition is true.
--     LEFT JOIN (or LEFT OUTER JOIN): Returns all rows from the left table and matching rows from the right table, and NULL values for non-matching rows.
--     RIGHT JOIN (or RIGHT OUTER JOIN): Returns all rows from the right table and matching rows from the left table, and NULL values for non-matching rows.
--     FULL OUTER JOIN: Returns all rows from both tables and NULL values for non-matching rows.
--     CROSS JOIN (or CARTESIAN JOIN): Returns the Cartesian product of the two tables, which means all possible combinations of rows from both tables.

-- Note that there are also other types of joins such as NATURAL JOIN, SELF JOIN, and ANTI JOIN that are supported by PostgreSQL, but they are less commonly used.



-- How Joins are implemented:
-- Joins are implemented in PostgreSQL by comparing values in the columns of the tables that you want to combine. The join operation is performed based on a specific condition that specifies how the tables should be combined.

-- To demonstrate how joins are implemented, consider two sample tables, "customers" and "orders". The customers table contains information about customers, and the orders table contains information about orders placed by these customers.

-- Here's an example of a query that uses an INNER JOIN to combine data from the customers and orders tables based on the "customer_id" column:


-- INNER JOIN
SELECT customers.customer_name, orders.order_date, orders.order_amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

-- In this example, the query uses the "ON" keyword to specify the join condition, which is that the "customer_id" column in the customers table must match the "customer_id" column in the orders table. The result of this query will be a table that contains three columns: "customer_name", "order_date", and "order_amount".

-- The INNER JOIN in this example returns only the rows that match the join condition. If you wanted to include all rows from the customers table, including those that have no matching rows in the orders table, you could use a LEFT JOIN instead:


-- LEFT JOIN
SELECT customers.customer_name, orders.order_date, orders.order_amount
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

-- This query returns all rows from the customers table, and the matching rows from the orders table. If there is no matching row in the orders table, the values for "order_date" and "order_amount" will be NULL.



-- Here is an example of how to create two tables and insert 5 values in each using PostgreSQL syntax:

-- Create the customers table
CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  customer_name VARCHAR(50),
  customer_email VARCHAR(50)
);

SELECT * FROM customers;

-- Insert 5 values into the customers table
INSERT INTO customers (customer_name, customer_email) VALUES
  ('John Doe', 'johndoe@example.com'),
  ('Jane Smith', 'janesmith@example.com'),
  ('Bob Johnson', 'bobjohnson@example.com'),
  ('Samantha Williams', 'samanthaw@example.com'),
  ('Chris Lee', 'chrisl@example.com');


-- Create the orders table
CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(customer_id),
  order_date DATE,
  order_amount DECIMAL(10,2)
);

SELECT * FROM orders;

-- Insert 5 values into the orders table
INSERT INTO orders (customer_id, order_date, order_amount) VALUES
  (1, '2022-01-01', 100.00),
  (1, '2022-01-15', 200.00),
  (2, '2022-02-01', 150.00),
  (3, '2022-02-15', 50.00),
  (4, '2022-03-01', 300.00);
  
-- In this example, we first create the "customers" table with three columns: "customer_id", "customer_name", and "customer_email". The "customer_id" column is set as the primary key, and it is set to auto-increment using the SERIAL data type.
-- Then, we insert 5 rows of data into the "customers" table using the INSERT INTO statement.
-- Next, we create the "orders" table with four columns: "order_id", "customer_id", "order_date", and "order_amount". The "customer_id" column is set as a foreign key that references the "customer_id" column in the "customers" table.
-- Finally, we insert 5 rows of data into the "orders" table using the INSERT INTO statement. The values for the "customer_id" column in the "orders" table correspond to the values in the "customer_id" column in the "customers" table.


