-- =====================================================
-- SQL SUBQUERIES PRACTICE
-- =====================================================
-- Database: MySQL
-- Focus: Single-row, multi-row, IN/NOT IN, EXISTS/NOT EXISTS
-- and related subquery practice
-- =====================================================

-- =========================================
-- 1. CREATE DATABASE
-- =========================================

CREATE DATABASE subquerydb;
USE subquerydb;


-- =========================================
-- 2. EMPLOYEES TABLE
-- =========================================

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    manager_id INT,
    hire_year INT
);

INSERT INTO employees
(emp_id, emp_name, department, salary, manager_id, hire_year)
VALUES
(101, 'Alice Johnson', 'IT',        72000, NULL, 2018),
(102, 'Bob Smith',    'IT',        65000, 101,  2019),
(103, 'Carol White',  'HR',        58000, NULL, 2017),
(104, 'David Brown',  'HR',        54000, 103,  2020),
(105, 'Eva Green',    'Finance',   80000, NULL, 2016),
(106, 'Frank Black',  'Finance',   75000, 105,  2018),
(107, 'Grace Lee',    'IT',        68000, 101,  2021),
(108, 'Henry Wilson', 'Marketing', 60000, NULL, 2017),
(109, 'Ivy Turner',   'Marketing', 56000, 108,  2022),
(110, 'Jack Davis',   'Finance',   70000, 105,  2019),
(111, 'Karen Moore',  'IT',        63000, 101,  2020),
(112, 'Leo Harris',   'HR',        50000, 103,  2021),
(113, 'Mia Clark',    'Marketing', 62000, 108,  2018),
(114, 'Nate Lewis',   'Finance',   78000, 105,  2019),
(115, 'Olivia Walker','IT',        71000, 101,  2017),
(116, 'Paul Hall',    'HR',        53000, 103,  2020),
(117, 'Quinn Young',  'Marketing', 59000, 108,  2021),
(118, 'Rachel King',  'Finance',   82000, 105,  2016),
(119, 'Sam Scott',    'IT',        66000, 101,  2022),
(120, 'Tina Adams',   'HR',        55000, 103,  2019);


-- =========================================
-- 3. ORDERS TABLE
-- =========================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    status VARCHAR(20)
);

INSERT INTO orders
(order_id, customer_id, product_id, amount, order_date, status)
VALUES
(1001, 201, 301, 1500, '2024-01-05', 'Delivered'),
(1002, 202, 302, 2300, '2024-01-12', 'Delivered'),
(1003, 203, 303,  800, '2024-02-03', 'Delivered'),
(1004, 201, 304, 3200, '2024-02-14', 'Delivered'),
(1005, 204, 301, 1100, '2024-03-01', 'Pending'),
(1006, 205, 302, 4500, '2024-03-15', 'Delivered'),
(1007, 202, 303,  950, '2024-03-22', 'Cancelled'),
(1008, 206, 304, 2100, '2024-04-05', 'Delivered'),
(1009, 203, 301, 1750, '2024-04-18', 'Pending'),
(1010, 207, 302, 3300, '2024-04-30', 'Delivered'),
(1011, 204, 303,  680, '2024-05-10', 'Cancelled'),
(1012, 208, 304, 2900, '2024-05-22', 'Delivered'),
(1013, 205, 301, 1200, '2024-06-08', 'Delivered'),
(1014, 201, 302, 2700, '2024-06-15', 'Pending'),
(1015, 209, 303,  500, '2024-06-28', 'Delivered'),
(1016, 206, 304, 3800, '2024-07-07', 'Delivered'),
(1017, 207, 301, 1600, '2024-07-19', 'Delivered'),
(1018, 210, 302, 4100, '2024-07-25', 'Delivered'),
(1019, 208, 303,  720, '2024-08-02', 'Cancelled'),
(1020, 209, 304, 2200, '2024-08-14', 'Delivered');


-- =========================================
-- 4. PRODUCTS TABLE
-- =========================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price INT,
    stock_qty INT
);

INSERT INTO products
(product_id, product_name, category, price, stock_qty)
VALUES
(301, 'Laptop',           'Electronics',     55000,  30),
(302, 'Smartphone',       'Electronics',     22000,  80),
(303, 'Headphones',       'Electronics',      3500, 120),
(304, 'Monitor',          'Electronics',     18000,  45),
(305, 'Keyboard',         'Accessories',      1500, 200),
(306, 'Mouse',            'Accessories',       900, 250),
(307, 'Desk Chair',       'Furniture',        8500,  40),
(308, 'Standing Desk',    'Furniture',       22000,  15),
(309, 'Webcam',            'Electronics',      4200,  70),
(310, 'USB Hub',           'Accessories',      1200, 180),
(311, 'Notebook',         'Stationery',        150, 500),
(312, 'Pen Set',          'Stationery',        250, 600),
(313, 'Printer',          'Electronics',     12000,  25),
(314, 'Scanner',          'Electronics',      9000,  20),
(315, 'External SSD',     'Electronics',      7500,  60),
(316, 'Lamp',             'Furniture',        2200,  90),
(317, 'Whiteboard',       'Office Supplies',  3800,  35),
(318, 'Cable Organiser',  'Accessories',       600, 300),
(319, 'Power Bank',       'Electronics',      2800, 100),
(320, 'Smart Watch',      'Electronics',     15000,  55);


-- =========================================
-- 5. CUSTOMERS TABLE
-- =========================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    country VARCHAR(30),
    join_year INT
);

INSERT INTO customers
(customer_id, customer_name, city, country, join_year)
VALUES
(201, 'Aarav Mehta',       'Mumbai',      'India', 2021),
(202, 'Priya Sharma',      'Delhi',       'India', 2020),
(203, 'Rohan Gupta',       'Pune',        'India', 2022),
(204, 'Sunita Patel',      'Ahmedabad',   'India', 2021),
(205, 'Vikram Rao',        'Bangalore',   'India', 2019),
(206, 'Neha Singh',        'Chennai',     'India', 2023),
(207, 'Arjun Kumar',       'Hyderabad',   'India', 2020),
(208, 'Deepa Nair',        'Kochi',       'India', 2022),
(209, 'Sanjay Joshi',      'Jaipur',      'India', 2021),
(210, 'Meera Iyer',        'Coimbatore',  'India', 2023),
(211, 'Ravi Verma',        'Lucknow',     'India', 2020),
(212, 'Anita Das',         'Kolkata',     'India', 2019),
(213, 'Kiran Reddy',       'Vizag',       'India', 2022),
(214, 'Pooja Shah',        'Surat',       'India', 2021),
(215, 'Amit Bose',         'Nagpur',      'India', 2023),
(216, 'Tara Menon',        'Trivandrum',  'India', 2020),
(217, 'Nikhil Kulkarni',   'Nashik',      'India', 2022),
(218, 'Swati Chatterjee',  'Bhopal',      'India', 2019),
(219, 'Rahul Pandey',      'Patna',       'India', 2021),
(220, 'Divya Tiwari',      'Indore',      'India', 2023);


-- =========================================
-- 6. DEPARTMENTS TABLE
-- =========================================

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30),
    budget INT,
    location VARCHAR(30),
    head_id INT
);

INSERT INTO departments
(dept_id, dept_name, budget, location, head_id)
VALUES
(1, 'IT',        500000, 'Bangalore', 101),
(2, 'HR',        200000, 'Mumbai',    103),
(3, 'Finance',   600000, 'Delhi',     105),
(4, 'Marketing', 300000, 'Chennai',   108);


-- =========================================
-- 7. CHECK ALL TABLES
-- =========================================

SELECT * FROM employees;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM departments;
-- ....................................................................................

-- =====================================================
-- VERIFY ALL TABLES
-- =====================================================

SELECT * FROM employees;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM departments;


-- =====================================================
-- PART 1: SINGLE-ROW SUBQUERIES
-- =====================================================

-- Q1. Find employees whose salary is higher than the average salary of all employees.
SELECT emp_name, department, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)
ORDER BY salary DESC;

-- Q2. Find the employee(s) with the highest salary.
SELECT emp_id, emp_name, department, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- Q3. Find the employee(s) with the lowest salary.
SELECT emp_id, emp_name, department, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

-- Q4. Find employees who were hired in the same year as Rachel King, excluding Rachel King.
SELECT emp_name, department, hire_year
FROM employees
WHERE hire_year = (
    SELECT hire_year
    FROM employees
    WHERE emp_name = 'Rachel King'
)
AND emp_name <> 'Rachel King';

-- Q5. Find products whose price is higher than the average product price.
SELECT product_name, category, price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
)
ORDER BY price DESC;

-- Q6. Find the product(s) with the highest price.
SELECT product_id, product_name, category, price
FROM products
WHERE price = (
    SELECT MAX(price)
    FROM products
);

-- Q7. Find the product(s) with the lowest price.
SELECT product_id, product_name, category, price
FROM products
WHERE price = (
    SELECT MIN(price)
    FROM products
);

-- Q8. Find orders whose amount is higher than the average order amount.
SELECT order_id, customer_id, amount
FROM orders
WHERE amount > (
    SELECT AVG(amount)
    FROM orders
)
ORDER BY amount DESC;

-- Q9. Find the order(s) with the highest order amount.
SELECT order_id, customer_id, amount, order_date
FROM orders
WHERE amount = (
    SELECT MAX(amount)
    FROM orders
);

-- =====================================================
-- PART 2: IN / NOT IN AND MULTI-ROW SUBQUERIES
-- =====================================================

-- Q10. Find customers who have placed at least one order.
SELECT customer_id, customer_name, city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
)
ORDER BY customer_id;

-- Q11. Find customers who have never placed an order.
SELECT customer_id, customer_name, city
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM orders
)
ORDER BY customer_id;

-- Q12. Find products that have been ordered at least once.
SELECT product_id, product_name, category, price
FROM products
WHERE product_id IN (
    SELECT product_id
    FROM orders
);

-- Q13. Find products that have never been ordered.
SELECT product_id, product_name, category, price
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM orders
);

-- Q14. Find employees who belong to the Finance department.
SELECT emp_name, salary
FROM employees
WHERE department IN (
    SELECT dept_name
    FROM departments
    WHERE dept_name = 'Finance'
)
ORDER BY salary DESC;

-- Q15. Find employees whose salary is lower than the minimum Finance department salary.
SELECT emp_name, department, salary
FROM employees
WHERE salary < (
    SELECT MIN(salary)
    FROM employees
    WHERE department = 'Finance'
)
ORDER BY salary DESC;

-- Q16. Find the department(s) with the highest budget.
SELECT dept_name, budget, location
FROM departments
WHERE budget = (
    SELECT MAX(budget)
    FROM departments
);

-- Q17. Find customers who have placed exactly one order.
SELECT customer_id, customer_name, city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) = 1
);

-- Q18. Find customers who have placed two or more orders.
SELECT customer_id, customer_name, city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) >= 2
)
ORDER BY customer_id;

-- Q19. Find products priced higher than every product in the Accessories category.
SELECT product_name, category, price
FROM products
WHERE price > (
    SELECT MAX(price)
    FROM products
    WHERE category = 'Accessories'
)
ORDER BY price DESC;

-- Q20. Find orders placed by customers who joined in 2021.
SELECT order_id, customer_id, amount, order_date
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE join_year = 2021
)
ORDER BY order_date;

-- =====================================================
-- PART 3: EXISTS / NOT EXISTS SUBQUERIES
-- =====================================================

-- Q21. Find employees who manage at least one other employee.
SELECT e.emp_id, e.emp_name, e.department
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees x
    WHERE x.manager_id = e.emp_id
)
ORDER BY e.emp_name;

-- Q22. Find employees who do not manage any other employee.
SELECT e.emp_id, e.emp_name, e.department
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM employees x
    WHERE x.manager_id = e.emp_id
)
ORDER BY e.emp_id;

-- Q23. Find customers who have at least one order using EXISTS.
SELECT c.customer_id, c.customer_name, c.city
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
)
ORDER BY c.customer_id;

-- Q24. Find customers who have no orders using NOT EXISTS.
SELECT c.customer_id, c.customer_name, c.city
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
)
ORDER BY c.customer_id;

-- Q25. Find products that have at least one order using EXISTS.
SELECT p.product_id, p.product_name, p.category
FROM products p
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.product_id = p.product_id
)
ORDER BY p.product_id;

-- =====================================================
-- PART 4: RELATED SUBQUERY PRACTICE
-- =====================================================

-- Q26. Find employees who work in the same department as employee 105, excluding employee 105.
SELECT emp_name, department, salary
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE emp_id = 105
)
AND emp_id <> 105
ORDER BY salary DESC;

-- Q27. Find the most recent order.
SELECT order_id, customer_id, amount, order_date
FROM orders
WHERE order_date = (
    SELECT MAX(order_date)
    FROM orders
);

-- Q28. Find the earliest order.
SELECT order_id, customer_id, amount, order_date
FROM orders
WHERE order_date = (
    SELECT MIN(order_date)
    FROM orders
);

-- Q29. Find employees whose salary is higher than the highest salary in HR.
SELECT emp_name, department, salary
FROM employees
WHERE salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE department = 'HR'
)
ORDER BY salary DESC;

-- Q30. Find delivered orders whose amount is higher than the average delivered order amount.
SELECT order_id, customer_id, amount, status
FROM orders
WHERE status = 'Delivered'
AND amount > (
    SELECT AVG(amount)
    FROM orders
    WHERE status = 'Delivered'
)
ORDER BY amount DESC;
