/* What was the smallest damage cost of an accident (that is not 0)? */ 
SELECT MIN(damage)
FROM accidents
WHERE damage > 0;
