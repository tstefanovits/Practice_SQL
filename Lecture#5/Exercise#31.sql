/* How many cities had less than 40 incidents? */ 
SELECT city,
       COUNT(city)
FROM accidents
GROUP BY accidents.city
HAVING COUNT(city) < 40
ORDER BY COUNT(city) DESC;

/* How many cities had less than 40 incidents? (Solve it by using a subquery.) */
SELECT *,
       COUNT(city)
FROM (SELECT city 
      FROM accidents) AS cities
GROUP BY cities.city
HAVING COUNT(city) < 40
ORDER BY COUNT(city) DESC;

/* Alternative solution. */
SELECT COUNT(*) AS number_of_cities
FROM (SELECT city, 
             COUNT(*) AS number_of_accidents 
      FROM accidents
GROUP BY city 
HAVING COUNT(*) < 40 ) AS cities
ORDER BY COUNT(*) DESC;

/* Alternative solution 2. */
SELECT COUNT(*) AS count_lines
FROM (SELECT city,
             COUNT(*) AS count_accidents
      FROM accidents
      GROUP BY city) AS accidents_by_city
WHERE accidents_by_city.count_accidents < 40;

/* Alternative solution 3. */
SELECT COUNT(*)
FROM (SELECT city,
             COUNT(*) AS count_accidents
      FROM accidents
      GROUP BY city
      HAVING COUNT(*) < 40) AS accidents_by_city;

