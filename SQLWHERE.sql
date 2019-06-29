/* You generally want to control which rows are returned from a table, since you probably only want to look at certain dates, 
regions, or other dimension values. Because of this, most of your queries will contain a WHERE clause. In this exercise, 
you practice controlling what is returned with WHERE.*/

SELECT flight_date, flight_num, carrier, origin
FROM public.airline_on_time_west_coast
LIMIT 1000;


SELECT flight_date, flight_num, carrier, origin
FROM public.airline_on_time_west_coast
Where Origin = 'SEA'
LIMIT 1000;



/* Use WHERE with multiple conditions
Exercise: implement a WHERE clause with two or more conditions using AND and OR (25 min)*/

SELECT origin_city_name, dest_city_name, carrier, AVG(arrival_delay), MIN(arrival_delay), MAX(arrival_delay)
FROM public.airline_on_time_west_coast
GROUP BY origin_city_name, dest_city_name, carrier

SELECT origin_city_name, dest_city_name, carrier, AVG(arrival_delay), MIN(arrival_delay), MAX(arrival_delay)
FROM public.airline_on_time_west_coast
WHERE origin IN ('DEN', 'LAX', 'SFO', 'SEA', 'PHX')
GROUP BY origin_city_name, dest_city_name, carrier