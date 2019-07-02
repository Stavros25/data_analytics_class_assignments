SELECT 
		origin_city_name,
		state,
		population, 
		AVG(arrival_delay) 
FROM public.airline_on_time_west_coast a
  
  INNER JOIN da_world.city c 
  ON Substring(origin_city_name, 1,Position(',' in origin_city_name) -1) = c.name
  
  INNER JOIN da_world.states s
  ON RIGHT(origin_city_name, 2) = s.abbr 
  	AND c.district = s.state
  
WHERE 
	c.countrycode = 'USA'
GROUP BY 1,2,3
ORDER BY 1

/*SELECT DISTINCT origin_city_name
FROM public.airline_on_time_west_coast 
ORDER BY origin_city_name*/