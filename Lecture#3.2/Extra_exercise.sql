/* Count the number of damages by damage costs! */ 
SELECT COUNT(damage),
       SUM(damage)
FROM accidents
GROUP BY damage
ORDER BY SUM(damage) DESC,
         COUNT(damage) DESC;

/* Alternative solution. */ 
SELECT damage,
       COUNT(*) AS count_accidents
FROM accidents
GROUP BY damage
ORDER BY damage;

