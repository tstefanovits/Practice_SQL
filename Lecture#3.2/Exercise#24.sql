/* In which 3 cities were the accidents reported to the police the most in 2008? */ 
SELECT city,
       COUNT(reported)
FROM accidents
WHERE reported = 'True'
AND   (accident_date BETWEEN '2008-01-01' AND '2008-12-31')
GROUP BY city
ORDER BY COUNT(reported) DESC LIMIT 3;

/* Alternative solution. */ 
SELECT city,
       COUNT(*) AS count_lines
FROM accidents
WHERE accident_date >= '2008-01-01'
AND   accident_date <= '2008-12-31'
AND   reported = 'true'
GROUP BY city
ORDER BY count_lines DESC LIMIT 3;

