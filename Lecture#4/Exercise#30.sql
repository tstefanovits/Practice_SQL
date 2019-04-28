/* What day of the week had the most accidents covered by insurance? */ 
SELECT date_table.dow,
       COUNT(*),
       covered_by_insurance.paid
FROM accidents
  JOIN covered_by_insurance ON accidents.accident_id = covered_by_insurance.accident_id
  JOIN date_table ON date_table.accident_date = accidents.accident_date
WHERE covered_by_insurance.paid = 'true'
GROUP BY date_table.dow, 
         covered_by_insurance.paid
ORDER BY COUNT(*) DESC
LIMIT 1;

