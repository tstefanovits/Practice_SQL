/* In which cities did the most accidents occur? */ 
SELECT DISTINCT (city),
       COUNT(*)
FROM accidents
GROUP BY city
ORDER BY COUNT DESC;

/* Alternative solution. */ 
SELECT city,
       COUNT(*) AS count_accidents
FROM accidents
GROUP BY city
ORDER BY count_accidents DESC;

