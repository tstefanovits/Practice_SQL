/* Select all the unique car_brand names that start with 'F'! */
SELECT DISTINCT(car_brand)
FROM accidents
WHERE car_brand LIKE 'F%';
