/* Select the car_type and the country columns for every accident that happened in a city with a name containing 'ALA'! */
SELECT car_type,
       country
FROM accidents
WHERE city LIKE '%ALA%';


