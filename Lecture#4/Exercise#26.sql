/* Which day of the week had the most accidents overall? */ 
SELECT dow,
       COUNT(dow)
FROM date_table
  JOIN accidents ON date_table.accident_date = accidents.accident_date
GROUP BY dow
ORDER BY COUNT(dow) DESC 
LIMIT 1;

/* Alternative solution. */ 
SELECT dow,
       COUNT(*) AS count_accidents
FROM accidents
  JOIN date_table ON accidents.accident_date = date_table.accident_date
GROUP BY dow
ORDER BY count_accidents DESC 
LIMIT 1;

