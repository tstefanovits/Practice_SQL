/* Which country had the most accidents where the damage was covered by insurance? */
SELECT country,
       COUNT(*),
       covered_by_insurance.paid
FROM accidents
  FULL JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id
WHERE covered_by_insurance.paid = 'true'
GROUP BY accidents.country,
         covered_by_insurance.paid
ORDER BY COUNT(*) DESC 
LIMIT 1;


