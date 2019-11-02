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

