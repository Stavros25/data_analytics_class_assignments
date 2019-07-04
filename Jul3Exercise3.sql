/* More join practice
Exercise: use more than one join type in a query (40 min)
Notes: Use the readychef data.
Instructions:*/

SELECT *
FROM da_readychef.events
LIMIT 100

SELECT *
FROM da_readychef.meals
--LIMIT 100

SELECT *
FROM da_readychef.referrals
LIMIT 100

SELECT *
FROM da_readychef.users
LIMIT 100

SELECT *
FROM da_readychef.visits
LIMIT 100

--1. Create a query that returns all of the distinct event types and the number of times that an 
-- event has occurred for each event value.
SELECT DISTINCT(e.event), COUNT (*)
FROM da_readychef.events e
GROUP BY e.event

--2. Add the meal_id and meal type to the query to return the distinct events, 
-- the meal_id, the meal type and the count of the number of rows for each distinct event, meal_id, and meal type.
SELECT e.event, m.meal_id, m.type,  COUNT (e.event)
FROM da_readychef.events e
LEFT JOIN da_readychef.meals m ON e.meal_id = m.meal_id
GROUP BY e.event, m.meal_id, m.type

-- 3. Modify this query to list only the users who have not been referred.
SELECT e.event, m.meal_id, m.type, COUNT (e.event)
FROM da_readychef.events e
LEFT JOIN da_readychef.meals m ON e.meal_id = m.meal_id
LEFT JOIN da_readychef.referrals r ON e.userid = r.referred_by
WHERE r.referred_by IS NULL
GROUP BY e.event, m.meal_id, m.type

-- 4. Verify if there are any events that didn't have matches for meal IDs in the meals table.
SELECT e.event, m.meal_id, m.type, COUNT (e.event)
FROM da_readychef.events e
LEFT JOIN da_readychef.meals m ON e.meal_id = m.meal_id
-- LEFT JOIN da_readychef.referrals r ON e.userid = r.referred_by
--WHERE r.referred_by IS NULL
WHERE m.mead_id IS NULL
GROUP BY e.event, m.meal_id, m.type

SELECT e.event, m.meal_id, m.type, COUNT (e.event)
FROM da_readychef.events e
FULL OUTER JOIN da_readychef.meals m ON e.meal_id = m.meal_id
-- LEFT JOIN da_readychef.referrals r ON e.userid = r.referred_by
--WHERE r.referred_by IS NULL
WHERE m.meal_id IS NULL
GROUP BY e.event, m.meal_id, m.type

--5. Verify if there are any meal IDs in the meals table that don't have a match in the events table.
SELECT e.event, m.meal_id, m.type, COUNT (e.event)
FROM da_readychef.events e
FULL OUTER JOIN da_readychef.meals m ON e.meal_id = m.meal_id
WHERE e.event IS NULL
GROUP BY e.event, m.meal_id, m.type

-- Submit your queries below.