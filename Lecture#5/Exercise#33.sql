/* Joining tables. */
SELECT *
FROM accidents
JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id ;

/* Which 3 cities have the highest proportion of reported accidents? */
