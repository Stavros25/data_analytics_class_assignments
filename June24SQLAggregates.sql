SELECT COUNT (*)
FROM da_pronto.trip

SELECT COUNT (*), sum(tripduration)
FROM da_pronto.trip

SELECT to_station_name, COUNT (*), sum(tripduration) as SumTripDur
FROM da_pronto.trip
GROUP BY to_station_name


SELECT to_station_name, COUNT (*), sum(tripduration) as SumTripDur
FROM da_pronto.trip
GROUP BY to_station_name
ORDER BY SumTripDur ASC



SELECT unique_carrier, count (*)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier
ORDER BY unique_carrier

SELECT unique_carrier, count (flight_num)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier
ORDER BY count (flight_num) ASC

SELECT unique_carrier, SUM(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier

SELECT unique_carrier, AVG(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY unique_carrier
ORDER BY AVG(arrival_delay) DESC

SELECT origin, unique_carrier, AVG(arrival_delay),MIN(arrival_delay), MAX(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY origin, unique_carrier
ORDER BY AVG(arrival_delay) DESC

SELECT unique_carrier, MIN(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY origin, unique_carrier
ORDER BY MIN(arrival_delay) ASC


SELECT origin_city_name, origin, unique_carrier, AVG(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY origin_city_name, origin, unique_carrier
ORDER BY  origin_city_name,	origin, AVG(arrival_delay) ASC
