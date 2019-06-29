/*Code-along: apply HAVING to return rows with the aggregate values that meet your conditions (10 min)
Use HAVING to return rows whose aggregate meets a condition.
Use the Pronto schema.
Search for and discuss documentation and examples of HAVING.
Create a query that returns trip duration by station name for the month of July 2015.*/

SELECT from_station_name, count(*) AS num_trips
FROM da_pronto.trip
WHERE starttime BETWEEN '2015-07-01 00:00:00' AND '2015-07-31 23:59:59'
GROUP BY 1
ORDER BY num_trips;

--Look at only the from stations that had less than 100 rentals in July 2015.
SELECT from_station_name, count(*) AS num_trips
FROM da_pronto.trip
WHERE starttime BETWEEN '2015-07-01 00:00:00' AND '2015-07-31 23:59:59'
GROUP BY 1                                            
HAVING COUNT(*) < 100
ORDER BY num_trips;

--Add the average trip duration to the query.
SELECT from_station_name, count(*) AS num_trips, AVG(tripduration) AS avg_trip_duration
FROM da_pronto.trip
WHERE starttime BETWEEN '2015-07-01 00:00:00' AND '2015-07-31 23:59:59'
GROUP BY 1                                            
HAVING COUNT(*) < 100
ORDER BY num_trips;

--Add another condition to the HAVING clause—that the average trip duration is < 1000.
	SELECT from_station_name, count(*) AS num_trips, AVG(tripduration) AS avg_trip_duration
	FROM da_pronto.trip
	WHERE starttime BETWEEN '2015-07-01 00:00:00' AND '2015-07-31 23:59:59'
	GROUP BY 1                                            
	HAVING COUNT(*) < 100 AND AVG(tripduration) < 2000                        
	ORDER BY num_trips;

--The trip duration is in seconds. Update the query to return hours instead of seconds.
SELECT from_station_name, count(*) AS num_trips, AVG(tripduration)/60.0/60.0 AS avg_trip_duration_minutes
FROM da_pronto.trip
WHERE starttime BETWEEN '2015-07-01 00:00:00' AND '2015-07-31 23:59:59'
GROUP BY 1                                            
HAVING COUNT(*) < 100 AND AVG(tripduration/60.0) < 30                         
ORDER BY num_trips;   