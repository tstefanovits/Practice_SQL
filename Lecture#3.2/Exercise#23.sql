/* Calculate the average damage cost per country for the accidents in which the weather was 'Rainy' or 'Windy'! */
SELECT country,
       AVG(damage)
FROM accidents
WHERE weather = 'Rainy'
OR    weather = 'Windy'
GROUP BY country
ORDER BY country,
         AVG(damage);

/* Alternative solution. */
SELECT country,
       weather,
       AVG(damage)
FROM accidents
WHERE weather = 'Rainy'
OR    weather = 'Windy'
GROUP BY country, weather
ORDER BY country,
         AVG(damage);
