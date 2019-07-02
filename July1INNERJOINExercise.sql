/* Exercise: use an INNER JOIN to combine tables (15 min)Notes:
Join tables to return the data that you need.
Work in pairs.
Use the tables in the da_sales schema.
Examples of the data returned by the queries in this lesson are available in this  document.
Instructions:*/

SELECT *
FROM da_sales.purchases
LIMIT 100

SELECT *
FROM da_sales.customers
LIMIT 100

-- 1. Create a query that returns the customer ID, product ID, quantity, and date from the purchases table.
SELECT custid, prodid, quantity, date
FROM da_sales.purchases
ORDER BY custid


--2. Add the column "name" from the customers dimension table to the query using an INNER JOIN.
SELECT custid, prodid, quantity, date, "name"
FROM da_sales.purchases p
INNER JOIN da_sales.customers c ON p.custid = c.id
ORDER BY custid
