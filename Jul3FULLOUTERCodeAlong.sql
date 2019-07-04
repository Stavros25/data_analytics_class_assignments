/* Code-along: implement queries using FULL OUTER JOIN (10 min)
Notes:
Use the airline_on_time data and the da_world.city table.
Retrieve city information for each of the origin cities in the airline_on_time data and the cities in the da_world.city 
table that don't have a match in the airline_on_time data. As well, add all of the cities in the airline_on_time data 
that don't have a match in the da_world.city data.
Instructions:
Start with the following query that you created in the Inner Joins lesson, which combines data from the 
airline_on_time data with the da_world.city data and returns 181 rows where there is a match between 
the origin city and state, and the da_world.city city name and district.*/

SELECT origin_city_name,
   c.population,
   AVG(arrival_delay) as avg_arrival_delay   
FROM public.airline_on_time_west_coast a                                  
JOIN da_world.states s ON RIGHT(a.origin_city_name, -strpos(a.origin_city_name, ',') - 1) = s.abbr
JOIN da_world.city c on LEFT(origin_city_name, strpos(origin_city_name,',') - 1) = c.name
   AND c.district = s.state
GROUP BY 1,2


--Replace the INNER JOIN with a FULL OUTER JOIN to see what origin city names had no matches in the 
--da_world.city data and which da_world.city data city names don't have a match to a airline_on_time origin city names.

SELECT origin_city_name,
   c.name,
   c.population,
   AVG(arrival_delay) as avg_arrival_delay   
FROM public.airline_on_time_west_coast a                                  
   JOIN da_world.states s ON RIGHT(a.origin_city_name, -strpos(a.origin_city_name, ',') - 1) = s.abbr
   FULL JOIN da_world.city c on LEFT(origin_city_name, strpos(origin_city_name,',') - 1) = c.name
      AND c.district = s.state
GROUP BY 1,2,3


/*Click on the Message tab in the data panel and see that the query returned 4,292 rows.
Inspect the data returned and see that there are many airline_on_time origin cities that don't have a 
match in the da_world.city data.
Scroll down farther in the returned data and see that there are also world city names returned 
that aren't in the airline_on_time data.
