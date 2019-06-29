--Code-along: apply COUNT() with GROUP BY (10 min)

SELECT * 
FROM da_sales.customers 
LIMIT 100

/* Point out the NULL values in the birthyear column.
Explain what a NULL is (refer to an online description).
Look at the row counts as you group them by dimension 
columns; create and run a query using COUNT(*) with no other columns. This is a count of the total rows in the table.*/

SELECT COUNT(*)
FROM da_sales.customers

/*Add the name column to the SELECT statement along with COUNT(*). But if there is an aggregate 
and a non-aggregate in the SELECT statement, the non-aggregate columns need to be listed in a 
GROUP BY clause. Run the query below and show how it fails since it has no GROUP BY clause.*/
-- Correct the query by adding a GROUP BY clause and re-run it. Note that the query now returns row counts for each prodid.
SELECT prodid, COUNT(*)
FROM da_sales.purchases
GROUP BY prodid

/*Add multiple columns to the SELECT statement with COUNT(*).*/

SELECT custid, prodid, quantity, date, COUNT(*)
FROM da_sales.purchases
GROUP BY custid, prodid, quantity, date

-- See how COUNT() behaves with NULLS; create a new query that counts the number of values in each column.

SELECT COUNT(name), COUNT(birthyear), COUNT(city), COUNT(state), COUNT(*)
FROM da_sales.customers
-- no non-aggregates in the SELECT statement with the aggregates so no need for GROUP BY
