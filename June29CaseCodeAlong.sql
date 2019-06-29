SELECT *
FROM da_weather.us_weather_anomalies
LIMIT 10

SELECT DISTINCT type
FROM da_weather.us_weather_anomalies;

-- Create a new column whose values are hot or cold depending on the type column value.

SELECT type,
    CASE
       WHEN type LIKE('%Cold') THEN 'Cold'
        ELSE 'Hot'
    END AS temperature_category
FROM da_weather.us_weather_anomalies
LIMIT 100;