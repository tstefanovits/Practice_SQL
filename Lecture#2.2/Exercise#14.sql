/* Select the top 10 accidents ordered by damage cost where:
the city name starts with:
- "Z"
- or "MA"
and accident_date was:
- in 2007
- or after */ 
SELECT *
FROM accidents
WHERE (city LIKE 'Z%' OR city LIKE 'MA%')
AND   (accident_date BETWEEN '2007-01-01' AND '2007-12-31' OR accident_date >= '200-12-31')
ORDER BY damage DESC 
LIMIT 10;

/* Alternative solution. */ 
SELECT *
FROM accidents
WHERE (city LIKE 'Z%' OR city LIKE 'MA%')
AND   accident_date > '2006-12-31'
ORDER BY damage DESC 
LIMIT 10;

