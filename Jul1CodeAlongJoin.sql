/*Code-along: INNER JOIN a fact table and a secondary table that has keys with more than one occurrence in the table (20 min)
Notes:
Perform inner joins with conditions other than "=".
Use the airline on time and the da_world.city tables.
Instructions:
Perform a one-to-many INNER JOIN and demonstrate the multiple rows produced for each event.
Return all of the products that each customer has purchased.*/

-- Try this query, but it fails
SELECT id, name, prodid
FROM da_sales.customers c
   JOIN da_sales.purchases p ON c.id = p.custid
ORDER BY id
LIMIT 100
SELECT custid, name, prodid
   FROM da_sales.customers c
JOIN da_sales.purchases p ON c.id = p.custid
ORDER BY custid
LIMIT 100

--Given how a single row in one table can result in multiple rows after joining to another table, 
--be conscious of the size of the tables that you are returning in one-to-many joins and many-to-many joins.
--Use other conditions for INNER JOIN.
--A valid join condition is any condition that returns a TRUE or FALSE for each row when evaluated.
-- Try using LIKE() in a join condition to add city population from the da_world schema to the airline on time flight information. Along the way, see if you can improve the speed of the query to reduce the processing needed to return the results that you want.
-- Look at the city names columns that you can use to join the da_world.city table to the airline_on time_west_coast table. The column origin_city_name contains values that contain the city and the state separated by a comma, such as...
SELECT origin_city_name, 
FROM public.airline_on_time_west_coast
LIMIT 100
SELECT name
FROM da_world.city
LIMIT 100
-- Retrieve the population and average arrival delay
--   for each city value in each row of the da_pronto.trip data.
SELECT origin_city_name, population, AVG(arrival_delay)
FROM public.airline_on_time_west_coast a
   JOIN da_world.city c on a.origin_city_name LIKE('%' || c.name || '%')
GROUP BY 1,2 
LIMIT 100
--This query appears to require a lot of processing since it runs for a long time. Stop it in the 
--pgAdmin SQL editor by clicking the stop button to cancel the query.
--Speed up the query by limiting the cities in the da_world.city table to only cities in the United States. 
--(If only one person runs this query at a time, it takes about 30 seconds.)

SELECT origin_city_name, population, AVG(arrival_delay)
FROM public.airline_on_time_west_coast a
   JOIN da_world.city c on a.origin_city_name LIKE('%' || c.name || '%')
WHERE c.countrycode = 'USA'
GROUP BY 1,2 
LIMIT 100

--Seed up the query even more by extracting only the city name from the origin_city_name and comparing that to the da_world.city.name column.
--Search the web to see how to retrieve the substring left of a character using SQL. 
--A search for "SQL left of character" returns information similar to this  .
-- If you try a query using CHARINDEX, it fails with an error that indicates that the function CHARINDEX is not recognized by the PostgreSQL database.

SELECT CHARINDEX(',', origin_city_name) - 1 AS char_position
FROM public.airline_on_time_west_coast a
LIMIT 100   

--A search for "PostgreSQL charindex" returns information similar to this  . 
--(Much better. In this case, the query returns in 2 seconds.)

SELECT origin_city_name, population, c.name as _world_city, 
  strpos(origin_city_name,',') - 1 AS char_position, AVG(arrival_delay),
  LEFT(origin_city_name, strpos(origin_city_name,',') - 1) as short_origin_city,
  AVG(arrival_delay) as acg_trip_duration
FROM public.airline_on_time_west_coast a
  JOIN da_world.city c on LEFT(origin_city_name, strpos(origin_city_name,',') - 1) = c.name
WHERE c.countrycode = 'USA'
GROUP BY 1,2,3,4

--Remove the extra columns that you added when developing your query. This creates the final query that returns the data that you want.
SELECT origin_city_name,
   population, 
   c.name as _world_city, 
   AVG(arrival_delay) as avg_trip_duration
FROM public.airline_on_time_west_coast a
   JOIN da_world.city c on LEFT(origin_city_name, strpos(origin_city_name,',') - 1) = c.name
WHERE c.countrycode = 'USA'
GROUP BY 1,2,3
LIMIT 100