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
