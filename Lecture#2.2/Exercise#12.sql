/* How much did the 3 most expensive accidents in Barcelona cost? */ 
SELECT city,
       damage
FROM accidents
WHERE city = 'BARCELONA'
GROUP BY damage,
         city
ORDER BY damage DESC LIMIT 3;

/* Alternative solution. */ 
SELECT damage,
       city
FROM accidents
WHERE city = 'BARCELONA'
ORDER BY damage DESC LIMIT 3;

