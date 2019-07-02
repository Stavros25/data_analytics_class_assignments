/*Code-along: implement an INNER JOIN using a fact table and a dimension table that has primary keys (20 min)
Notes:Add station information to each row of the Pronto trip data.
Use the Pronto trip data.
Briefly discuss the concept of primary keys.
A table with primary keys must contain a column where each value must be unique.
Dimension tables typically but not always have a primary key column.
Instructions:
Use a query with an "=" condition with SELECT * to select all of the columns of each table, 
combining rows that have exact matches to the condition.*/

SELECT COUNT(DISTINCT station_id) AS num_distinct_stations, COUNT(station_id) AS num_stations
FROM da_pronto.station

SELECT trip.*, station.* 
FROM da_pronto.trip 
  JOIN da_pronto.station ON trip.from_station_id = station.station_id
LIMIT 100

--Modify the query to limit the columns to some from the first table and some from the second table. 
--(An INNER JOIN will only retrieve rows where there is a match in the from_station_id and the station.station_id. 
--If there isn't a match in the station table, a from station id won't be returned.)
SELECT trip.starttime, from_station_name, name, lat, long
FROM da_pronto.trip 
  JOIN da_pronto.station ON trip.from_station_id = station.station_id
LIMIT 100

--Demonstrate table name aliasing.
--Table aliases are recommended because they save keystrokes and makes join logic easier to see without the long table names.
-- In most cases, avoid short cryptic names in code because they make it harder for someone else to understand your SQL code, 
-- but in the case of join code, very short table aliases are preferred as they make the logic easier to follow.
SELECT t.starttime, from_station_name, s.name, lat, long
FROM da_pronto.trip t
  JOIN da_pronto.station s ON t.from_station_id = s.station_id
LIMIT 100

--Demonstrate that JOIN works equally well when retrieving aggregates.
SELECT DATE(DATE_TRUNC('day', starttime)) as date_ymd,
   from_station_name,
   s.name,
   sum(tripduration) AS sum_trip_duration
FROM da_pronto.trip t
  JOIN da_pronto.station s ON t.from_station_id = s.station_id
GROUP BY 1,2,3
LIMIT 100