# SQL Subqueries Practice

This repository contains my MySQL practice queries based on subqueries, including single-row subqueries, multi-row subqueries, correlated subqueries, and subqueries with different SQL clauses.

## Database

- Database: `company`
- SQL Database: MySQL

## SQL Topics Covered

- Subqueries
- Single-Row Subqueries
- Multi-Row Subqueries
- Correlated Subqueries
- Subqueries with `WHERE`
- Subqueries with `IN`
- Subqueries with `ANY`
- Subqueries with `ALL`
- Subqueries with `EXISTS`
- Subqueries with `NOT EXISTS`
- Subqueries with `FROM`
- Subqueries with `SELECT`
- Aggregate Functions with Subqueries
- Nested Subqueries

## Practice Areas

### Single-Row Subqueries

Practice queries where a subquery returns a single value and is compared with the outer query.

Examples:
- Employees earning more than the average salary
- Employee with the highest salary
- Employee with the lowest salary

### Multi-Row Subqueries

Practice queries where a subquery returns multiple values.

Examples:
- Employees working in departments that meet a specific condition
- Employees whose salary matches values returned by a subquery
- Using `IN`, `ANY`, and `ALL`

### Correlated Subqueries

Practice queries where the inner query depends on the current row of the outer query.

Examples:
- Finding employees earning more than their department average
- Comparing an employee's salary with the average salary of their department

### EXISTS and NOT EXISTS

Practice checking whether matching records exist in another table.

### Aggregate Functions with Subqueries

Practice using functions such as:

- `COUNT()`
- `SUM()`
- `AVG()`
- `MAX()`
- `MIN()`

with subqueries.

## Technologies Used

- MySQL
- MySQL Workbench
- GitHub

## Purpose

This repository is part of my SQL learning and practice journey. It demonstrates my understanding of subqueries and how they can be used to solve complex SQL problems.

## Repository Contents

The main SQL file contains database setup, sample data, and practice queries related to SQL subqueries.
