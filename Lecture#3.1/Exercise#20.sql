/* What was the median damage cost of all accidents that incurred a cost? */ 
SELECT PERCENTILE_DISC(0.5) within group(ORDER BY damage)
FROM accidents
WHERE damage > 0;

/* Alternative solution. */
SELECT PERCENTILE_CONT(0.5) within group(ORDER BY damage)
FROM accidents
WHERE damage > 0;

/* Another alternative solution. */
SELECT damage
FROM accidents
WHERE damage > 0
ORDER BY damage LIMIT 2 
OFFSET (SELECT COUNT(*) / 2 FROM accidents WHERE damage > 0);

