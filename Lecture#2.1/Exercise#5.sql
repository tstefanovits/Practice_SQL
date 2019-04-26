/* Select the city, country, accident_date and damage columns for every accident in which the cost of the damage was between 100 and 1000! */
SELECT city,
       country,
       accident_date,
       damage
FROM accidents
WHERE damage > 100
AND   damage < 1000;

/* Alternative solution. */
SELECT city,
       country,
       accident_date,
       damage
FROM accidents
WHERE damage BETWEEN 100 AND 1000;

