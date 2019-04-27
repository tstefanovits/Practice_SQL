/* In which city is the total damage cost the highest? */
SELECT city, SUM(damage)
FROM accidents
GROUP BY city
ORDER BY SUM(damage)DESC
LIMIT 1;
