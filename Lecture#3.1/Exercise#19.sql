/* A) What was the mean damage cost of all accidents? */ 
SELECT AVG(damage)
FROM accidents;

/* B) What was the mean damage cost of all accidents that incurred a cost? */
SELECT AVG(damage)
FROM accidents
WHERE damage > 0;
