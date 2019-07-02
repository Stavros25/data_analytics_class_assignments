/*Join with a WHERE clause
Exercise: use an INNER JOIN to combine tables with various conditions (20 min)
Notes:
Join tables to return the data that you need, and filter to just the data that you want returned.
Work in pairs.
Use the da_world schema.
Instructions:*/

-- 1. Create a query that returns the city populations by city name.
SELECT *
FROM da_world.city
LIMIT 100

SELECT name, population
FROM da_world.city

-- 2.Create a query that adds a column with country name and continent.
SELECT *
FROM da_world.country
LIMIT 100

SELECT DISTINCT continent
FROM da_world.country


SELECT co.continent, co.name, ci.name, ci.population 
FROM da_world.city ci
INNER JOIN da_world.country co ON co.code = ci.countrycode
ORDER BY ci.population DESC

-- 3.Restrict the query to cities in Africa.
SELECT ci.name, ci.population, co.name, co.continent
FROM da_world.city ci
INNER JOIN da_world.country co ON co.code = ci.countrycode
WHERE co.continent = 'Africa'	

-- 4.Restrict the cities to those that have populations > 1,000,000.
SELECT ci.name, ci.population, co.name, co.continent
FROM da_world.city ci
INNER JOIN da_world.country co ON co.code = ci.countrycode
WHERE co.continent = 'Africa'	
GROUP BY ci.name, ci.population, co.name, co.continent
HAVING ci.population > 1000000
ORDER BY ci.population