/* Join the accidents and the covered_by_insurance tables and select the first 100 rows! Keep those accidents in the joined table too, where the damage cost is 0! */ 
SELECT *
FROM accidents
  FULL JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id 
LIMIT 100

