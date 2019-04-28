/* Which day of the week had the greatest total damage cost overall? */ 
SELECT dow,
       SUM(damage) AS total_damage
FROM date_table
  JOIN accidents ON date_table.accident_date = accidents.accident_date
GROUP BY dow
ORDER BY total_damage DESC
LIMIT 1;

/* Alternative solution. */
SELECT dow,
       SUM(damage) AS sum_accidents
FROM accidents
  JOIN date_table ON accidents.accident_date = date_table.accident_date
GROUP BY dow
ORDER BY sum_accidents DESC
LIMIT 1;

/* Alternative solution with number of total accidents in each day of the week. */
SELECT dow,
       SUM(damage) AS total_damage,
       COUNT(*) as total_accidents
FROM date_table
  JOIN accidents ON date_table.accident_date = accidents.accident_date
GROUP BY dow
ORDER BY total_damage DESC;
