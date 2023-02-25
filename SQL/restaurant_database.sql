--Create Restaurant Database
--contain 5 Tables
--1 Fact, 4dimensions
--Write 3 Queries to analyze data
--Use 1 subquey/with

-- FACT table
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  customer_id INT,
  menu_code VARCHAR(20),
  amount INT,
  admin_id INT,
  payment_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    FOREIGN KEY (menu_code) REFERENCES menus(menu_code)
    FOREIGN KEY (admin_id) REFERENCES admins(admin_id)
    FOREIGN KEY (payment_id) REFERENCES payment(payment_id)
);

INSERT INTO orders values
  (1, '2022-08-01',06, 'J01', 2, 22, 01),
  (2, '2022-08-04',07, 'K01', 1, 21, 02),
  (3, '2022-08-04',07, 'K02', 1, 21, 02),
  (4, '2022-08-05',01, 'J02', 3, 23, 01),
  (5, '2022-08-05',02, 'C01', 2, 21, 01),
  (6, '2022-08-05',03, 'J02', 2, 21, 01),
  (7, '2022-08-05',07, 'K01', 1, 21, 02),
  (8, '2022-08-06',04, 'K03', 1, 22, 01);

-- DIM1 table
CREATE TABLE menus(
  menu_code VARCHAR(20) PRIMARY KEY,
  food VARCHAR(50),
  category TEXT,
  price REAL
);
INSERT INTO menus values
  ('J01', 'Salmon Sashimi','Japanese', 350),
  ('J02', 'Tamako', 'Japanese', 80),
  ('K01', 'Fried Chicken','Korean', 199),
  ('K02', 'Tokbokki', 'Korean', 125),
  ('K03', 'Bibimbap', 'Korean', 320),
  ('C01', 'Dumpling', 'Chinese', 99);

-- DIM2 table
CREATE TABLE customers(
  customer_id INT PRIMARY KEY,
  firstname VARCHAR(50),
  lastname VARCHAR(50),
  gender CHAR(1)
);

INSERT INTO customers values
  (01, 'Namjoon', 'Kim', 'M'),
  (02, 'Seokjin', 'Kim', 'M'),
  (03, 'Yoongi', 'Min', 'M'),
  (04, 'Hoseok', 'Jung', 'M'),
  (05, 'Jimin', 'Park', 'M'),
  (06, 'Taehyung', 'Kim', 'M'),
  (07, 'Jungkook', 'Jeon', 'M');

-- DIM3 table
CREATE TABLE admins (
  admin_id INT PRIMARY KEY,
  admin_name VARCHAR(20),
  position VARCHAR(30),
  salary REAL
);

INSERT INTO admins values
  (11, 'Mint', 'Owner', 45000),
  (12, 'Mind', 'Chef', 30000),
  (21, 'Praew', 'Staff', 12000),
  (22, 'Mook', 'Staff', 12000),
  (23, 'Jane', 'Staff', 12000);

-- DIM4 table
CREATE TABLE payment (
   payment_id INT PRIMARY KEY,
   type VARCHAR(20)
);

INSERT INTO payment VALUES
  (01, 'CASH'),
  (02, 'CREDIT CARD');
  
  
.mode markdown
.header on
  -- Use this 2 commands before select to create data frame--
/*---------------------------------------------------------------*/

--Queries--
--Show orders details
WITH suborder AS (
  SELECT * 
  FROM orders AS ord
  JOIN customers AS c ON ord.customer_id = c.customer_id
  JOIN menus AS m ON ord.menu_code = m.menu_code
  JOIN payment AS p ON ord.payment_id = p.payment_id
)
SELECT
order_date AS date,
firstname || ' ' || lastname AS name,
food,
type,
price*amount AS total,
type AS paid

FROM suborder
GROUP BY 2,3;

  -- The Best Selling Menu
SELECT
 food,
 sum(amount) AS sum
FROM orders AS ord
JOIN menus AS m ON ord.menu_code = m.menu_code
GROUP by food
ORDER BY sum desc
LIMIT 1;

-- Choose only Korean foods orders

SELECT
firstname,
food,
category,
sum(amount) as n_total
FROM orders AS ord
JOIN menus AS m ON ord.menu_code = m.menu_code
JOIN customers AS c ON ord.customer_id = c.customer_id
WHERE category = 'Korean'
GROUP BY 1,2;

-- 
