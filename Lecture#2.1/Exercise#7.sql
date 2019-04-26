/* Select the city, country, accident_date, damage and factory_id columns for every accident in which the damage was between 100 and 1000 - and the factory_id contains the string: 'LRJ'! */ 
SELECT city,
       country,
       accident_date,
       damage,
       factory_id
FROM accidents
WHERE damage > 100
AND   damage < 1000
AND   factory_id LIKE '%LRJ%';

/* Alternative solution. */
SELECT city,
       country,
       accident_date,
       damage,
       factory_id
FROM accidents
WHERE damage BETWEEN 100 AND 1000
AND   factory_id LIKE '%LRJ%'

