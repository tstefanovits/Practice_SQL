/* Select all the columns for the accidents in Greece where:
the weather was 'Rainy' OR The time_of_the_day was 'Night'! */
SELECT *
FROM accidents
WHERE (country = 'Greece' AND weather = 'Rainy')
OR    (country = 'Greece' AND time_of_the_day = 'Night');

/* Alternative solution. */ 
SELECT *
FROM accidents
WHERE (weather = 'Rainy' OR time_of_the_day = 'Night')
AND   country = 'Greece';

