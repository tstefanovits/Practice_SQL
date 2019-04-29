/* Joining tables. */ 
SELECT *
FROM accidents
  JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id;

/* Distribution of the accidents what are covered by insurance. */ 
SELECT *
FROM accidents
  JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id
WHERE paid = 'true';

/* Distribution of the accidents what are covered by insurance in each cities. */ 
SELECT city,
       COUNT(*)
FROM accidents
  JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id
WHERE paid = 'true'
GROUP BY city
ORDER BY COUNT(*) DESC;

/* Distribution of the accidents what are covered by insurance in each cities. */ 
SELECT *
FROM (SELECT city,
             COUNT(*)
      FROM accidents
      JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id
      WHERE paid = 'true'
      GROUP BY city
      ORDER BY COUNT(*) DESC) AS covered;

/* Distribution of the accidents what are covered or not in each cities. */ 
SELECT *
FROM (SELECT city,
             paid,
             COUNT(*)
      FROM accidents
      JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id
      WHERE paid = 'true'
      OR paid = 'false'
      GROUP BY city, paid
      ORDER BY COUNT(*) DESC) AS covered;

/* Distribution of the accidents what are covered by insurance. */ 
SELECT *
FROM (SELECT city,
             COUNT(*)
      FROM accidents
      JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id
      WHERE paid = 'true'
      OR paid = 'false'
      GROUP BY city
      ORDER BY COUNT(*) DESC) AS covered;  
      
/* Distribution of cities by number of accidents. */   
SELECT city,
       COUNT(*)
FROM accidents
WHERE reported = 'true'
GROUP BY city
ORDER BY COUNT(*) DESC;

/* Which 3 cities have the highest proportion of reported accidents? */

/* Alternative solution. */
