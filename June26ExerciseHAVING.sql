/*Use the weather anomalies data table for this challenge.
1. Create a query that returns the minimum temperature in 2013 for each station for the year.
2. Modify the query to include just the stations with a latitude > 36.
3. Modify the query to return just the stations where the minimum temperature for the year is less than or equal to -10.
4. Optional: modify the query to return the minimum temperature in Fahrenheit and limit it 
to minimum temperatures that are less than 0 degrees Fahrenheit.*/

SELECT *
FROM da_weather.us_weather_anomalies
LIMIT 100

SELECT DISTINCT(station_name)
FROM da_weather.us_weather_anomalies
ORDER BY station_name


-- 1 Create a query that returns the minimum temperature in 2013 for each station for the year.
SELECT DISTINCT station_name, MIN(min_temp)
FROM da_weather.us_weather_anomalies
WHERE date_ymd BETWEEN '1-1-2013' AND '12-31-2013'
GROUP BY 1
ORDER BY station_name

--2. Modify the query to include just the stations with a latitude > 36.
SELECT DISTINCT station_name, latitude, MIN(min_temp)
FROM da_weather.us_weather_anomalies
WHERE date_ymd BETWEEN '1-1-2013' AND '12-31-2013'
GROUP BY 1,2
HAVING latitude > 36
ORDER BY latitude, station_name

-- 3. Modify the query to return just the stations where the minimum temperature for the year is less than or equal to -10.
SELECT DISTINCT station_name, latitude, MIN(min_temp)
FROM da_weather.us_weather_anomalies
WHERE date_ymd BETWEEN '1-1-2013' AND '12-31-2013'
GROUP BY 1,2
HAVING latitude > 36 AND MIN(min_temp)=-10
ORDER BY latitude, station_name