/* Select the city, country, accident_date and damage columns for every accident in which the damage was NOT between 100 and 1000! */ 
SELECT city,
       country,
       accident_date,
       damage
FROM accidents
WHERE damage < 100
OR    damage > 1000;

/* Alternative solution. */ 
SELECT city,
       country,
       accident_date,
       damage
FROM accidents
WHERE damage NOT BETWEEN 100 AND 1000
LIMIT 100;

