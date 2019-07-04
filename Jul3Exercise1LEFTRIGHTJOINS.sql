/*Exercise: join two tables with LEFT JOIN and RIGHT JOIN (15 min)
Notes:
Join tables using LEFT OUTER JOIN and RIGHT OUTER JOIN.
Work in pairs.
Use the da_sales tables for this challenge.
Examples of the data returned by the queries in this lesson are available in this  document.
Instructions:*/

-- Check tables
SELECT *
FROM da_sales.customers
LIMIT 100

SELECT *
FROM da_sales.purchases
LIMIT 100

--1.Create a query that returns the unique (distinct) IDs in the customers table. Note how many are returned.
--check
SELECT DISTINCT(c.id), COUNT (*)
FROM da_sales.customers c
GROUP BY c.id 
-- returns count of 7


SELECT COUNT(DISTINCT c.id) AS num_distinct_IDs
FROM da_sales.customers c
-- returns count of 7

-- 2. Create a query that returns the unique (distinct) IDs in the customers table when joined to the purchases table
--with an INNER JOIN. Note how many are returned.
SELECT COUNT (DISTINCT c.id)
FROM da_sales.customers c
  INNER JOIN da_sales.purchases p ON c.id = p.custid
  -- count of 3


SELECT DISTINCT(c.id), COUNT (*)
FROM da_sales.customers c
  INNER JOIN da_sales.purchases p ON c.id = p.custid
GROUP BY c.id
-- 3. Create a query that returns the unique (distinct) IDs in the customers table when joined to the purchases table
--with a LEFT JOIN. Note how many are returned.
SELECT COUNT (DISTINCT c.id)
FROM da_sales.customers c
  LEFT JOIN da_sales.purchases p ON c.id = p.custid
  -- count of 7

SELECT DISTINCT(c.id), COUNT (*)
FROM da_sales.customers c
  LEFT JOIN da_sales.purchases p ON c.id = p.custid
GROUP BY c.id

-- 4. Create a query that returns the unique (distinct) IDs in the customers table when joined to the purchases table 
--with a RIGHT JOIN. Note how many are returned.
SELECT COUNT (DISTINCT c.id)
FROM da_sales.customers c
  RIGHT JOIN da_sales.purchases p ON c.id = p.custid
  -- count of 3

SELECT DISTINCT(c.id), COUNT (*)
FROM da_sales.customers c
  RIGHT JOIN da_sales.purchases p ON c.id = p.custid
GROUP BY c.id
-- 5. Submit the query that produced the most unique customer IDs and a count of the unique IDs returned.