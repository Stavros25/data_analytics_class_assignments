-- Run the query below and look at the table that it returns.

SELECT date, custid, prodid, quantity
FROM da_sales.purchases

--Add a condition to that query that allows only rows with dates greater than January 2017.

SELECT date, custid, prodid, quantity
FROM da_sales.purchases
WHERE date >= '2017-02-01';

--Update the WHERE clause by adding an additional condition using AND. 
--Add parentheses around the conditions to get used to the syntax.

SELECT date, custid, prodid, quantity
FROM da_sales.purchases
WHERE (date >= '2017-02-01') 
	AND (custid IN (1003, 1006));

--Add a third condition to the WHERE clause using OR. Show the effects of moving the parentheses for different logical groupings. The effect on logic is similar to using parentheses in an Excel formula.
SELECT date, custid, prodid, quantity
FROM da_sales.purchases
WHERE date >= '2017-02-01' 
	AND custid IN (1003, 1006) 
	OR prodid = 9001;

SELECT date, custid, prodid, quantity
FROM da_sales.purchases
WHERE date >= '2017-02-01' AND (custid IN (1003, 1006) OR prodid = 9001);

--Show that a column can be in the WHERE clause without being in the SELECT statement. 
--There's no requirement that it be in the SELECT statement.

SELECT date, custid, quantity
FROM da_sales.purchases
WHERE date >= '2017-02-01' 
	AND (custid IN (1003, 1006) OR prodid = 9001);

-- Use the Pronto trip table to demonstrate the use of LIKE in a WHERE condition. 
-- Search and refer to online documentation and examples (being able to do effective searches on query syntax is important for success as a data analyst).

SELECT from_station_name, AVG(tripduration) AS avg_trip_duration
FROM da_pronto.trip
GROUP BY 1;

--You can save some typing by using the column's position number from the SELECT query in lieu
--   of using the column name in the GROUP BY clause!

SELECT *
FROM da_pronto.trip
WHERE  from_station_name LIKE('%12th%')
LIMIT 100;

SELECT DISTINCT from_station_name
FROM da_pronto.trip
ORDER BY from_station_name

SELECT from_station_name, AVG(tripduration) AS avg_trip_duration
FROM da_pronto.trip
WHERE from_station_name LIKE('12th%')
GROUP BY 1;

SELECT from_station_name, AVG(tripduration) AS avg_trip_duration
FROM da_pronto.trip
WHERE from_station_name LIKE('%12th%')  -- note the effect of the wildcard text change
GROUP BY 1;  