/*Code-along: create new columns calculated from other columns (30 min)**
Notes:Create new columns that contain mathematical or other combinations of values in other columns. Start by creating a 
column with a numerical calculation. Then create a new column using the || operator to combine text from other columns. 
Use CAST to change the data type of a date column so that you can concatenate that with string values. Finally, extract d
ate and time parts from a timestamp.Use the weather anomalies data.
Instructions:Create a query using CASE that calculates the difference between two other columns and places the 
results in a new column. Look at the columns available in this table:*/

  SELECT *
  FROM da_weather.us_weather_anomalies
  LIMIT 1000;

--Calculate the difference between the max_temp and min_temp values in each row and place the results in a new column.
  SELECT date_ymd, station_name, max_temp, min_temp, max_temp - min_temp AS temp_difference
  FROM da_weather.us_weather_anomalies
  LIMIT 1000;    

--Find the 500 rows with the most difference between the min and the max.
  SELECT date_ymd, station_name, max_temp, min_temp,
 max_temp - min_temp AS temp_difference
  FROM da_weather.us_weather_anomalies
  ORDER BY temp_difference DESC
  LIMIT 500;

-- Create a query using the '||' operator that combines text from other columns and places it in a new column.
--Here  's || function documentation.
--Combine the station name and station_id into a single string and add to a new column.

SELECT station_name, station_id, 
station_name || station_id AS station_name_id
FROM da_weather.us_weather_anomalies
LIMIT 1000;

--Add a separation character to the concatenated string.

  SELECT station_name, station_id, 
  station_name || '-' || station_id AS station_name_id
  FROM da_weather.us_weather_anomalies
  LIMIT 1000;

--Create a query using the CAST operator to change data types.
/*Here  's CAST documentation.
Try to make a new field that's a concatenation of the data_ymd and the station name.*/

SELECT date_ymd, station_name,
date_ymd || '-' || station_id AS station_name_id
FROM da_weather.us_weather_anomalies
LIMIT 1000;

--Explicitly convert date_ymd to a string to make the query more universal across other SQL flavors. (PostgreSQL is very forgiving with its || function. However, in many SQL flavors this query fails because the || function in those implementations accepts only strings.)
--Here  's PostgreSQL data types documentation.

SELECT date_ymd, station_name,
    CAST(date_ymd  as text) || '_' || station_id AS station_name_id
FROM da_weather.us_weather_anomalies
LIMIT 1000;

--In a query, change the data types of several columns and show the resulting data types returned.

  SELECT date_ymd, CAST(date_ymd as TEXT) AS date_ymd_text,
      CAST(date_ymd as TIMESTAMP) AS date_time_ymd,
      max_temp, CAST(max_temp as INTEGER) AS max_temp_integer,
      serial_id, CAST(serial_id as TEXT) as serial_id_text
  FROM da_weather.us_weather_anomalies
  LIMIT 1000;

--Extract Year, month, and day from a date with DATE_PART.
-- Date and time functions documentation  .

SELECT date_ymd,
    DATE_PART('year', date_ymd) AS year,
    DATE_PART('month', date_ymd) AS month,
    DATE_PART('day', date_ymd) AS day
FROM da_weather.us_weather_anomalies
LIMIT 1000;
Use some of the other functions in the date and time functions documentation.