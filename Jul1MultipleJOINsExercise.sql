/*Query with multiple JOINs
Exercise: join multiple tables with two or more JOINs (15 min)
Notes: Work in groups of three.
Use the PostgreSQL Shell terminal to restore the text file readychef.sql  file using the "/i filename".
Instructions:*/

-- tables
SELECT * 
FROM da_readychef.events
LIMIT 100

SELECT * 
FROM da_readychef.meals
LIMIT 100

SELECT * 
FROM da_readychef.referrals
LIMIT 100

SELECT * 
FROM da_readychef.users
LIMIT 100

SELECT * 
FROM da_readychef.visits
LIMIT 100

--1. Create a query that returns the count of the visits for each userID.
SELECT userid, COUNT(*)
FROM da_readychef.visits 
GROUP BY userid
ORDER BY 2

--2. Add to the query so that the user's name is returned instead of the userID.
SELECT u.campaign_id, COUNT(v.userid)
FROM da_readychef.visits v
INNER JOIN da_readychef.users u ON v.userid = u.userid
GROUP BY campaign_id
ORDER BY 2


--3.Modify the query so that only users that had an event are returned.

SELECT u.campaign_id, event, COUNT(v.userid)
FROM da_readychef.visits v
	INNER JOIN da_readychef.users u ON v.userid = u.userid
	INNER JOIN da_readychef.events e ON v.userid = e.userid
GROUP BY campaign_id, event
ORDER BY 1