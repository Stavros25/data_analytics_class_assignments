# data_analytics_class_assignments
Galvanize SQL, Tableau and Excel for DA class
- SQL
- Excel
- Tableau

H1Test



skata


-ela tora

Emphasis, aka italics, with *asterisks* or _underscores_.

Strong emphasis, aka bold, with **asterisks** or __underscores__.

Combined emphasis with **asterisks and _underscores_**.

Strikethrough uses two tildes. ~~Scratch this.~~

6/19 SQL class excercise Shortest 500 trips
1. 
SELECT COUNT (*)
FROM da_pronto.trip

2. 
SELECT from_station_name,to_station_name
FROM da_pronto.trip
LIMIT 1000

3. 
SELECT DISTINCT from_station_name
FROM da_pronto.trip

4. 
SELECT DISTINCT from_station_name, to_station_name
FROM da_pronto.trip
ORDER BY from_station_name, to_station_name

5. 
SELECT tripduration, starttime as start_time, from_station_name,to_station_name
FROM da_pronto.trip
ORDER BY tripduration DESC
LIMIT 600
