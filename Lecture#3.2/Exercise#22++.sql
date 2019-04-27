/* In which city is the average damage cost the highest? */ 
SELECT city, AVG(damage)
FROM accidents
GROUP BY city
ORDER BY AVG(damage)DESC
LIMIT 1;
