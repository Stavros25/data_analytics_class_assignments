/* For the prompts 1, and 2 use the Pronto Bike share trip table.
For prompts 3, 4, and 5 use the airline on-time data.
Examples of the data returned by the queries in this exercise are available in this  document.
Instructions:
1. Using the Pronto Bike share trip table, create a query that returns the columns start time, from_station, to_station, 
and trip_duration for July 1, 2014.*/

SELECT starttime,from_station_name, to_station_name, tripduration 
FROM da_pronto.trip
WHERE CAST (starttime as date) = '2015-07-01'


-- 2. Add a column "stations_match" that designates whether the from_ and to_stations are the same.
SELECT starttime, from_station_name, to_station_name, tripduration,
CASE
	WHEN from_station_name =  to_station_name THEN 'True'
       ELSE 'false'
		END AS stations_match
FROM da_pronto.trip
WHERE CAST (starttime as date) = '2015-07-01'


-- Return a value of 1 when they match and a 0 when they don't match.
	SELECT starttime, from_station_name, to_station_name, tripduration,
	CASE
		WHEN from_station_name =  to_station_name THEN 1
		   ELSE 2
			END AS stations_match
	FROM da_pronto.trip
	WHERE CAST (starttime as date) = '2015-07-01'

-- 3. Using the airline on-time data, create a query that returns the fl_date, carrier, and average arr_delay for December 2014.
SELECT *
FROM public.airline_on_time_west_coast
LIMIT 1000

SELECT flight_date, carrier, AVG(arrival_delay)
FROM public.airline_on_time_west_coast
WHERE flight_date BETWEEN '2014-12-01' AND '2014-12-31'
GROUP BY flight_date, carrier
	

-- 4. Add a boolean column that is TRUE if the origin_city name is in New York (state), Colorado, California, 
-- Washington, or Arizona. Make it FALSE when it is any other city.

SELECT origin_city_name, flight_date, carrier, AVG(arrival_delay),
CASE
	WHEN RIGHT(origin_city_name,2) IN ('NY', 'CO','WA','AZ') THEN TRUE
	ELSE FALSE
	END
FROM public.airline_on_time_west_coast
WHERE flight_date BETWEEN '2014-12-01' AND '2014-12-31'
GROUP BY origin_city_name,flight_date, carrier