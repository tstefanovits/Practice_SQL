/* 3 most expensive accidents reported to police. */ 
SELECT *
FROM accidents
WHERE reported = 'TRUE'
ORDER BY damage DESC LIMIT 3;

/* Were the 3 most expensive accidents reported to the police? */ 
SELECT *
FROM accidents
ORDER BY damage DESC LIMIT 3;

/* Alternative solution. */ 
SELECT city, reported
FROM accidents
ORDER BY damage DESC LIMIT 3;

