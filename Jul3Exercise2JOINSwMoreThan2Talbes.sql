/*JOINs with more than two tables
Exercise: join more than two tables with LEFT JOIN and RIGHT JOIN (20 min)
Notes:
Retrieve a list of customers and the products that each customer bought. If the customer hasn't bought anything, 
--still include them in the table returned.
To accomplish this you need to combine data from three tables.
Work in groups of three.
Use data from the da_sales tables.
Tip: First decide what tables need to be joined together to retrieve the columns you want to return. 
Then decide on the fields (columns) to join on and the type of joins to use. 
After you have the conditions working finish out the SELECT statement, and filters.
Instructions:*/

-- Check tables
SELECT *
FROM da_sales.customers
LIMIT 100

SELECT *
FROM da_sales.purchases
LIMIT 100

SELECT *
FROM da_sales.products
LIMIT 100

-- 1. Create a query that returns all customer names and any product names of the products that the customers bought.
SELECT c.name, pr.name
FROM da_sales.customers c
  LEFT JOIN da_sales.purchases pu ON c.id = pu.custid
  LEFT JOIN da_sales.products pr ON pu.prodid = pr.id 


-- 2. Modify the query to sort by customer name and product.
SELECT c.name, pr.name
FROM da_sales.customers c
  LEFT JOIN da_sales.purchases pu ON c.id = pu.custid
  LEFT JOIN da_sales.products pr ON pu.prodid = pr.id
  ORDER BY c.name, pr.name
  
-- 3.Submit your query below.