/* Select every accident with a cost! */ 
SELECT *
FROM accidents
WHERE damage > 0;

/* Select the city, accident_date and damage columns for every accident with a cost! */ 
SELECT city,
       accident_date,
       damage
FROM accidents
WHERE damage > 0;

