/* Iteration #1: 
Select all the columns for the first 100 accidents where:
- the car_type is 'Electric'
- the accident happened after 2002-12-31
- and the country name starts with 'S'! */ 
SELECT *
FROM accidents
WHERE car_type = 'Electric'
AND   accident_date > '2001-01-01'
AND   country LIKE 'S%'
LIMIT 100;

/* Iteration #2:
Select all the columns for the first 100 accidents where:
- the car_type is 'Electric'
- the accident happened in 2003
- and the country name starts with 'S'! */ 
SELECT *
FROM accidents
WHERE car_type = 'Electric'
AND   accident_date BETWEEN '2003-01-01' AND '2003-12-31'
AND   country LIKE 'S%'
LIMIT 100;

/* Iteration #3:
Select all the columns for the first 100 accidents where:
- the car_type is 'Electric'
- the accident happened NOT in 2003
- and the country name starts with 'S'! */ 
SELECT *
FROM accidents
WHERE car_type = 'Electric'
AND   accident_date NOT BETWEEN '2003-01-01' AND '2003-12-31'
AND   country LIKE 'S%'
LIMIT 100;

/* Alternative solution. */ 
SELECT *
FROM accidents
WHERE car_type = 'Electric'
AND   (accident_date <= '2002-12-31' OR accident_date >= '2004-01-01')
AND   country LIKE 'S%'
LIMIT 100;

