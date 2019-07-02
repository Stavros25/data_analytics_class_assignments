/*Join tables using multiple ON conditions.
Examples of the data returned by the queries in this lesson are available in this document.
In an earlier query you joined the da_world.city table to the airline_on_time_west_coast in order to 
add city population to a query of the on-time performance by origin city.*/

SELECT 
		origin_city_name,
		population, 
		AVG(arrival_delay) 
FROM public.airline_on_time_west_coast a
  INNER JOIN da_world.city c ON
  Substring(origin_city_name, 1,Position(',' in origin_city_name) -1) = c.name
WHERE 
	c.countrycode = 'USA'
GROUP BY 1,2
LIMIT 100       


SELECT 
	a.origin_city_name,
   c.population, 
   c.name as world_city, 
   AVG(arrival_delay) as avg_trip_duration
FROM public.airline_on_time_west_coast a
   JOIN da_world.city c on LEFT(origin_city_name, strpos(origin_city_name,',') - 1) = c.name
WHERE c.countrycode = 'USA'
GROUP BY 1,2,3
LIMIT 100   
--You only joined this by city name. Unfortunately, the world city data has data on multiple cities that have 
--the same names as other cities in different countries. To ensure that you match only on the exact city and country, 
-- add a country match condition to the join condition and specify the country as well.
--Instructions:
--The airlines on time origin_city_name values contain two-letter United States state abbreviations. Develop an initial query that inner joins the abbreviation in origin_city_name with the abbr column of the da_world.state table.

SELECT origin_city_name, RIGHT(a.origin_city_name, -strpos(a.origin_city_name, ','))
 FROM public.airline_on_time_west_coast a                                         
    JOIN da_world.states s ON RIGHT(a.origin_city_name, -strpos(a.origin_city_name, ',') - 1) = s.abbr


--Continue to build the query by joining the da_world.city table to the da_world.states table. 
-- This provides a connection from the city table through the states table to the airlines_on_time_west_coast table.

SELECT origin_city_name,
 RIGHT(a.origin_city_name, -strpos(a.origin_city_name, ',') - 1),
  s.abbr as state_abbr,
  LEFT(origin_city_name,strpos(origin_city_name,',') - 1),
  c.name as world_city
FROM public.airline_on_time_west_coast a  
   JOIN da_world.states s ON RIGHT(a.origin_city_name, -strpos(a.origin_city_name, ',') - 1) = s.abbr
   JOIN da_world.city c on LEFT(origin_city_name, strpos(origin_city_name,',') - 1) = c.name


--Add the population and average arrival_delay to the previous query.

SELECT origin_city_name,
RIGHT(a.origin_city_name, -strpos(a.origin_city_name, ',') - 1),
   s.abbr as state_abbr,
LEFT(origin_city_name,strpos(origin_city_name,',') - 1),
   c.name as world_city,
   c.population,
   AVG(arrival_delay) AS average_arrival_delay     
FROM public.airline_on_time_west_coast a                                          
   JOIN da_world.states s ON RIGHT(a.origin_city_name, -strpos(a.origin_city_name, ',') - 1) = s.abbr
   JOIN da_world.city c on LEFT(origin_city_name, strpos(origin_city_name,',') - 1) = c.name
GROUP BY 1,2,3,4,5,6


--Remove the unnecessary fields so that you retrieve origin city name, population, and average flight delay.
SELECT 
 	a.origin_city_name,
    c.population,
    AVG(arrival_delay) as avg_arrival_delay   
 FROM public.airline_on_time_west_coast a                                         
    JOIN da_world.states s ON RIGHT(a.origin_city_name, -strpos(a.origin_city_name, ',') - 1) = s.abbr
    JOIN da_world.city c on LEFT(origin_city_name, strpos(origin_city_name,',') - 1) = c.name
 GROUP BY 1,2
 
 SELECT 
 	a.origin_city_name,
    c.population,
    AVG(arrival_delay) as avg_arrival_delay   
 FROM public.airline_on_time_west_coast a                                         
    JOIN da_world.states s ON RIGHT(a.origin_city_name, -strpos(a.origin_city_name, ',') - 1) = s.abbr
    JOIN da_world.city c on LEFT(origin_city_name, strpos(origin_city_name,',') - 1) = c.name
 GROUP BY 1,2


--The previous query retrieved three rows for Springfield, IL, each with different population values and three 
--rows for Springfield, MO. Add a da_world.district column to see what's going on.

 SELECT origin_city_name,c.name, c.district,
    c.population,
    AVG(arrival_delay) as avg_arrival_delay   
 FROM public.airline_on_time_west_coast a                                         
    JOIN da_world.states s ON RIGHT(a.origin_city_name, -strpos(a.origin_city_name, ',') - 1) = s.abbr
    JOIN da_world.city c on LEFT(origin_city_name, strpos(origin_city_name,',') - 1) = c.name
 GROUP BY 1,2,3,4

--Scroll down to Springfield. You have six Springfield rows because you're matching city names. da_world.city has 
--multiple rows for the city name "Springfield" because it has rows for Springfield, Illinois, Springfield, Massacusetts, 
-- and Springfield, Missouri. da_world.city.name is not a primary key. Rather, da_world.city.name and da_world.city.district 
--are both needed to define unique matches to the da_world.city data. So, add a match to district in your join to retrieve 
-- the data that you want.
-- Add join conditions to match world district to the state in the airlines on time data. The result is that you match to unique combinations of city name and state name. With that change, you expect to return only one row for each unique city in the airlines on time data.

SELECT origin_city_name,
   c.population,
   AVG(arrival_delay) as avg_arrival_delay   
FROM public.airline_on_time_west_coast a                                  
JOIN da_world.states s ON RIGHT(a.origin_city_name, -strpos(a.origin_city_name, ',') - 1) = s.abbr
JOIN da_world.city c on LEFT(origin_city_name, strpos(origin_city_name,',') - 1) = c.name
   AND c.district = s.state
GROUP BY 1,2


--Add a country match to the da_world.country table to return data on the region.

SELECT origin_city_name,
  region,
  c.population,
  AVG(arrival_delay) as avg_arrival_delay   
FROM public.airline_on_time_west_coast a  
JOIN da_world.states s ON RIGHT(a.origin_city_name, -strpos(a.origin_city_name, ',') - 1) = s.abbr
JOIN da_world.city c on LEFT(origin_city_name, strpos(origin_city_name,',') - 1) = c.name
  AND c.district = s.state
JOIN da_world.country co on co.code = 'USA'
GROUP BY 1,2,3

--If you also want to show origin cities that have no match to the world data city and state then your query has an issue because it doesn't return those. That's the purpose of inner joins—to return only rows that have matches between tables. To include the origin cities with no matches in the world city data you need to use other join types, which are explored in the next lesson.