/*  Introduction: In Case #3 I haven't got an actual dataset only hypothetical. So basically this file will contain my future solutions of a whiteboard interview. */

/* Task 1: From which source does Dilan get the most first reads? */
SELECT source,
       COUNT(*)
FROM first_read
GROUP BY source
ORDER BY source DESC;

COMMIT;

/* Alternative solutions for Task 1. */
SELECT source,
       COUNT(*)
FROM first_read
GROUP BY source
LIMIT 1;

SELECT source,
       COUNT(*)
FROM first_read
GROUP BY source
ORDER BY source DESC 
LIMIT 1;

COMMIT;

/* Task 2: From which source does Dilan get the most purchases? */
SELECT source,
       COUNT(*)
FROM first_read
  JOIN buy ON first_read.user_id = buy.user_id
WHERE buy.event = "buy"
GROUP BY source
ORDER BY source DESC
LIMIT 1;

COMMIT;

/* Alternative solutions for Task 2. */
SELECT source,
       COUNT(*)
FROM first_read
  JOIN buy ON first_read.user_id = buy.user_id
GROUP BY source
ORDER BY source DESC
LIMIT 1;

COMMIT;

/* Task 3: From which source does Dilan get the highest revenue/user ratio from? */
SELECT source,
       SUM(buy.price) / COUNT(*) AS revenue
FROM first_read
  FULL JOIN buy ON first_read.user_id = buy.user_id
GROUP BY source
ORDER BY revenue DESC 
LIMIT 1;

COMMIT;

/* Alternative solutions for Task 3. */
SELECT source,
       SUM(price) / COUNT(*)
FROM first_read
  FULL JOIN buy ON first_read.user_id = buy.user_id
GROUP BY source
ORDER BY revenue DESC 
LIMIT 1;

COMMIT;

/* Task 4: List all days where Dilan had 100+ purchases for the $8 product! */
SELECT my_day,
       COUNT(*) AS darab
FROM buy
WHERE price = '8'
AND   darab > 100 
GROUP my_day 
ORDER my_day DESC;

COMMIT;

/* Alternative solutions for Task 4. */
SELECT my_day,
       COUNT(*)
FROM buy
WHERE price = 8
GROUP BY my_day
HAVING COUNT(*) > 100
ORDER BY my_day;

COMMIT;

/* Task 5: How many $1000+ income days has Dilan had so far? */
SELECT COUNT(*)
FROM (SELECT my_day,
             SUM(price)
      FROM buy
      GROUP BY my_day
      HAVING SUM(price) > 1000
      ORDER BY my_day) AS filtering;
      
COMMIT;

/* Alternative solutions for Task 5. */
SELECT COUNT(*)
FROM (SELECT my_day,
             SUM(price)
      FROM buy
      GROUP BY my_day
      HAVING SUM(price) > 1000) AS filterin;

COMMIT;
