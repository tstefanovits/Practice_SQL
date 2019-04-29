/* Joining tables. */
SELECT *
FROM accidents
JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id;

/* Distribution of the accidents what are covered by insurance. */
SELECT *
FROM accidents
JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id
WHERE paid = 'true';

/* Distribution of the accidents what are covered by insurance in each country. */
SELECT country, COUNT(*)
FROM accidents
JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id
WHERE paid = 'true'
GROUP BY country
ORDER BY COUNT(*) DESC;

/* Which 3 cities have the highest proportion of reported accidents? */
