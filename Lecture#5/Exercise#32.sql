/* Find the total damage costs by country! */ 
SELECT country, SUM(damage) AS total_damage
FROM accidents
GROUP BY country
ORDER BY total_damage DESC;
;
/* Then take all these total-by-country damage values and calculate the ratio of the highest total damage cost (one country) to the total damage cost for all countries. 
Express this ratio as a percentage! (You should compose this in one query, and get one number as the result!) */
