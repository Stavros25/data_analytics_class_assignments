/*
1. Create a query that returns the flight date, flight number, carrier, and origin columns. Remember to limit the rows returned.
2. Add a WHERE clause to the previous query so that the new query returns only rows that have SEA as the origin column value.
3. Create another query that returns average arrival_delay for each carrier for December 2014 only. 
Search for the SQL condition operator BETWEEN and use that in the WHERE clause condition of this query.*/

SELECT flight_date, flight_num, carrier, origin
FROM public.airline_on_time_west_coast
LIMIT 100;
 
SELECT flight_date, flight_num, carrier, origin
FROM public.airline_on_time_west_coast
Where Origin = 'SEA'
LIMIT 100;

SELECT COUNT (DISTINCT(carrier))
FROM public.airline_on_time_west_coast	

SELECT DISTINCT(carrier)
FROM public.airline_on_time_west_coast	

SELECT carrier, AVG(arrival_delay)
FROM public.airline_on_time_west_coast
Where flight_date BETWEEN '12-1-2014' AND '12-31-2014'
GROUP BY carrier

-- date format that is usually accepted
SELECT carrier, AVG(arrival_delay)
FROM public.airline_on_time_west_coast
Where flight_date BETWEEN '2014-12-01' AND '2014-12-31'
GROUP BY carrier

SELECT carrier,flight_date, AVG(arrival_delay)
FROM public.airline_on_time_west_coast
Where flight_date BETWEEN '12-1-2014' AND '12-31-2014' 
GROUP BY carrier,flight_date


/* Use the airline_on_time_west_coast data table in the public schema.
1. Create a query that returns the average, minimum, and maximum arrival_delay by origin city, destination city, and carrier.
2. Modify the query to only allow the origin airports DEN, LAX, SFO, SEA, and PHX.
3. Modify the query to include just the destination cities in California.
4. Modify the query to include just the destination cities in California and New York. */
	
SELECT *
FROM public.airline_on_time_west_coast	
LIMIT 100;

--1.Create a query that returns the average, minimum, and maximum arrival_delay by origin city, destination city, and carrier
SELECT origin_city_name, dest_city_name, carrier, AVG(arrival_delay), MIN(arrival_delay), MAX(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY origin_city_name, dest_city_name, carrier;

--2.Modify the query to only allow the origin airports DEN, LAX, SFO, SEA, and PHX.
SELECT origin_city_name, dest_city_name, carrier, AVG(arrival_delay), MIN(arrival_delay), MAX(arrival_delay)
FROM public.airline_on_time_west_coast
WHERE origin IN ('DEN', 'LAX', 'SFO', 'SEA', 'PHX')
GROUP BY origin_city_name, dest_city_name, carrier;

--3.Modify the query to include just the destination cities in California.

-- To check RIGHT formula
SELECT DISTINCT dest_city_name
FROM public.airline_on_time_west_coast
WHERE RIGHT(dest_city_name, 2) = 'CA'
LIMIT 100;

SELECT origin_city_name, dest_city_name, carrier, AVG(arrival_delay), MIN(arrival_delay), MAX(arrival_delay)
FROM public.airline_on_time_west_coast
WHERE origin IN ('DEN', 'LAX', 'SFO', 'SEA', 'PHX') AND RIGHT(dest_city_name, 2) = 'CA'
GROUP BY origin_city_name, dest_city_name, carrier;

-- Micah's way
SELECT origin_city_name, dest_city_name, carrier, AVG(arrival_delay), MIN(arrival_delay), MAX(arrival_delay)
FROM public.airline_on_time_west_coast
WHERE origin IN ('DEN', 'LAX', 'SFO', 'SEA', 'PHX') AND dest_city_name LIKE ('%, CA')
GROUP BY origin_city_name, dest_city_name, carrier;

-- 4. Modify the query to include just the destination cities in California and New York.
SELECT origin_city_name, dest_city_name, carrier, AVG(arrival_delay), MIN(arrival_delay), MAX(arrival_delay)
FROM public.airline_on_time_west_coast
WHERE origin IN ('DEN', 'LAX', 'SFO', 'SEA', 'PHX') AND (RIGHT(dest_city_name, 2) = 'CA' OR RIGHT(dest_city_name, 2) = 'NY')
GROUP BY origin_city_name, dest_city_name, carrier;
