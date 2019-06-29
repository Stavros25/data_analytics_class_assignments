/* Exercise: create new columns calculated from other columns (20 min)
Notes:Create new columns from data in other columns.
Work in pairs. Use the Pronto trip table data.
Examples of the data returned by the queries in this exercise are available in this  document.
Instructions:*/

-- 1. Create a query that extracts the hour and minute of a the starttime and puts them in new columns.
SELECT *
FROM da_pronto.trip
LIMIT 10

SELECT starttime,	
	DATE_PART('hour', starttime) AS hour,
	DATE_PART('minute', starttime) AS minute
FROM da_pronto.trip
 
 
--2. Create a query that concatenates the from station id with the from station name and places in a new column.
SELECT from_station_id, from_station_name,
	from_station_id || '_' || from_station_name as station_id_name
FROM da_pronto.trip

--3. Create a query with the from_station name to station name and and the average trip duration in hours. 
--(According to the data dictionary the tripduration fields is in seconds.)
SELECT from_station_name, to_station_name, AVG(tripduration/3600) as TripDurationHRs
FROM da_pronto.trip
GROUP BY from_station_name, to_station_name
ORDER BY TripDurationHRs Desc

-- Optional: modify the previous query to also return a date field. Consider using the DATE_TRUNC PostgreSQL date and time function.
-- Submit your queries in the field below.

