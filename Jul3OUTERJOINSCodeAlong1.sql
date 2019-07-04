-- The users table has more distinct user IDs than the events table.
-- ... because some users have never had an event.
Select count(distinct userid) 
FROM da_readychef.users -- returns a count of 5.524

Select count(distinct userid) 
FROM da_readychef.events -- returns a count of 5,348

-- Retrieve the users table userid, and any meal_ids from events that they had.
-- If a user doesn't have any meal events, return the user table userid anyway.
SELECT u.userid, e.userid, meal_id
FROM da_readychef.users u
  LEFT JOIN da_readychef.events e ON u.userid = e.userid
ORDER BY u.userid
Limit 2000
-- Return the rows that have a user ID but don't have a matching user ID in the meals table.
SELECT u.userid, e.userid, meal_id
FROM da_readychef.users u
  LEFT JOIN da_readychef.events e ON u.userid = e.userid
Where e.userid IS NULL
ORDER BY u.userid, meal_id
Limit 2000

-- Continue to return the user IDs from each table, but add an aggregate.
-- Note that there are no rows for users who had no event in the events table.
SELECT u.userid, e.userid, count(meal_id) as num_meal_ids
FROM da_readychef.users u
  LEFT JOIN da_readychef.events e ON u.userid = e.userid
GROUP BY 1,2
ORDER BY num_meal_ids
Limit 2000
-- Compare results with a nearly identical query of an INNER JOIN instead of a LEFT JOIN.
-- Note that there are no rows for users who had no event in the events table.
SELECT u.userid, e.userid, count(meal_id) as num_meal_ids
FROM da_readychef.users u
  INNER JOIN da_readychef.events e ON u.userid = e.userid
GROUP BY 1,2
ORDER BY num_meal_ids
Limit 2000

-- Compare the results of the LEFT JOIN query to the RIGHT JOIN query below.
SELECT u.userid, e.userid, count(meal_id) as num_meal_ids
FROM da_readychef.users u
  RIGHT JOIN da_readychef.events e ON u.userid = e.userid
GROUP BY 1,2
ORDER BY num_meal_ids
Limit 2000

-- Here is the LEFT JOIN query implemented as a RIGHT JOIN query.
-- You can do everything that you want to do with LEFT JOIN, but a RIGHT JOIN is provided for convenience.
SELECT u.userid, e.userid, count(meal_id) as num_meal_ids 
FROM da_readychef.events e
  RIGHT JOIN da_readychef.users u ON e.userid = u.userid
GROUP BY 1,2
ORDER BY num_meal_ids
LIMIT 2000