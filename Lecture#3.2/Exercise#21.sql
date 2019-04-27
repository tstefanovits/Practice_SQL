/* A) Calculate the total damage cost for each car_brand! */
SELECT DISTINCT (car_brand),
       SUM(damage)
FROM accidents
GROUP BY car_brand;

/* B) Calculate the average total damage cost for each car_brand! List the top 10 brands by average total damage cost. */ 
SELECT DISTINCT (car_brand),
       AVG(damage)
FROM accidents
GROUP BY car_brand
ORDER BY AVG(damage) DESC
LIMIT 10;

/* Alternative solution for 'A' task. */
SELECT car_brand,
       SUM(damage) AS sum_damage
FROM accidents
GROUP BY car_brand;

/* Alternative solution for 'B' task. */
SELECT car_brand,
       AVG(damage) AS avg_damage
FROM accidents
GROUP BY car_brand
ORDER BY avg_damage DESC LIMIT 10;

