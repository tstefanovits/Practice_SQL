/* Find the total damage costs by country! */ 
SELECT country, SUM(damage) AS total_damage
FROM accidents
GROUP BY country
ORDER BY total_damage DESC;

/* Total damage. */
SELECT SUM(damage)
FROM accidents;

/* COUNT 1% percent of total damage. */
SELECT SUM(damage) / 100 AS percent1
FROM accidents;

/* COUNT all damage and / 100 */
SELECT SUM(damage),
       SUM(damage) / 100 AS percent1
FROM accidents;

/* 1% of damage / countries. */
SELECT country,
       SUM(damage),
       SUM(damage) / 100 AS percent1
FROM accidents
GROUP BY country;

/* Total damage from most damaged country / 100. */
SELECT country,
       SUM(damage),
       SUM(damage) / 100 AS percent1
FROM accidents
GROUP BY country
ORDER BY SUM(damage) DESC
LIMIT 1;

/* Then take all these total-by-country damage values and calculate the ratio of the highest total damage cost (one country) to the total damage cost for all countries. 
Express this ratio as a percentage! (You should compose this in one query, and get one number as the result!) */
