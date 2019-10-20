/* Creating solar_losses table. */ 
CREATE TABLE solar_losses 
(
  model        TEXT,
  DATE DATE,
  hour         INTEGER,
  minute       INTEGER,
  error_code   TEXT,
  loss         FLOAT
);

/* Creating solar_teams table. */ 
CREATE TABLE solar_teams 
(
  error_code    TEXT,
  prio_team     TEXT,
  backup_team   TEXT
);

/* Load data to solar_losses table. */ 
COPY solar_losses
FROM '/home/jovyan/work/Vault#3/solar_losses.csv' WITH CSV HEADER DELIMITER ',';

/* Load data to solar_teams table. */ 
COPY solar_teams
FROM '/home/jovyan/work/Vault#3/solar_teams.csv' WITH CSV HEADER DELIMITER ',';

COMMIT;

/* Task 1: During which hours does the factory produce the different models (X1, X2, X3)? */ 
SELECT hour,
       COUNT(hour)
FROM solar_losses
WHERE model LIKE 'x1'
GROUP BY hour
ORDER BY hour;

SELECT hour,
       COUNT(hour)
FROM solar_losses
WHERE model LIKE 'x2'
GROUP BY hour
ORDER BY hour;

SELECT hour,
       COUNT(hour)
FROM solar_losses
WHERE model LIKE 'x1'
GROUP BY hour
ORDER BY hour;

SELECT model,
       hour,
       COUNT(hour)
FROM solar_losses
GROUP BY model,
         hour
ORDER BY model,
         hour;

COMMIT;

/* Alternative solution for Task 1. */ 
SELECT model,
       hour
FROM solar_losses
GROUP BY model,
         hour
ORDER BY hour;

/* Task 2: Which model is the most problematic one?  
Which one caused the most issues? Which one caused the highest total loss damage values (in $)? Which one caused the highest average loss damage values (in $) per issue? */ 
SELECT model,
       error_code,
       COUNT(error_code) AS error_code_number
FROM solar_losses
GROUP BY model,
         error_code
ORDER BY error_code_number DESC;

/* Which one caused the highest total loss damage values (in $)? */ 
SELECT model,
       error_code,
       SUM(loss) AS total_loss
FROM solar_losses
GROUP BY model,
         error_code
ORDER BY total_loss DESC;

/* Which one caused the highest average loss damage values (in $) per issue? */ 
SELECT model,
       error_code,
       SUM(loss) / COUNT(error_code) AS per_issue
FROM solar_losses
GROUP BY model,
         error_code
ORDER BY per_issue DESC;

COMMIT;

/* Alternative solutions for Task 2. */ 
SELECT model,
       COUNT(error_code) AS error_code_number,
       SUM(loss) AS total_loss,
       SUM(loss) / COUNT(error_code) AS per_issue
FROM solar_losses
GROUP BY model
ORDER BY error_code_number DESC,
         total_loss DESC,
         per_issue DESC;

SELECT model,
       COUNT(*) AS error_code_number,
       SUM(loss) AS total_loss,
       AVG(loss) AS per_issue
FROM solar_losses
GROUP BY model
ORDER BY error_code_number DESC,
         total_loss DESC,
         per_issue DESC;

COMMIT;

/* Task 3: Which error code is the most problematic one for the X3 model? */ 
SELECT model,
       error_code,
       COUNT(*) AS error_code_number
FROM solar_losses
WHERE model LIKE 'x3'
GROUP BY model,
         error_code
ORDER BY error_code_number DESC LIMIT 1;

COMMIT;

/* Alternative solutions for Task 3. */ 
SELECT model,
       error_code,
       COUNT(*) AS error_code_number,
       SUM(loss) AS total_loss,
       SUM(loss) / COUNT(error_code) AS per_issue
FROM solar_losses
WHERE model LIKE 'x3'
GROUP BY model,
         error_code
ORDER BY error_code_number DESC LIMIT 1;

SELECT error_code,
       COUNT(*) AS error_code_number,
       SUM(loss) AS total_loss,
       AVG(loss) AS per_issue
FROM solar_losses
WHERE model = 'x3'
GROUP BY error_code
ORDER BY error_code_number DESC;

COMMIT;

/* Task 4: List only those error codes for the X3 model that caused more than $300000 total loss damage! */ 
SELECT model,
       error_code,
       SUM(loss) AS total_loss
FROM solar_losses
WHERE model LIKE 'x3'
GROUP BY model,
         error_code
HAVING SUM(loss) > 300000
ORDER BY total_loss DESC;

COMMIT;

/* Alternative solutions for Task 4. */ 
SELECT error_code,
       SUM(loss) AS total_loss
FROM solar_losses
WHERE model = 'x3'
GROUP BY error_code
HAVING SUM(loss) > 300000;

COMMIT;

/* Task 5: Take the error codes from the previous task's results! List every minute of the day where these error codes occurred more than 45 times. (For all models - not only for X3!) */ 
SELECT hour,
       minute,
       COUNT(minute)
FROM solar_losses
WHERE error_code = '478Z2'
OR    error_code = 'L26T'
OR    error_code = 'CAMBERRA10'
GROUP BY hour,
         minute
HAVING COUNT(minute) > 45
ORDER BY hour,
         minute;

COMMIT;

/* Alternative solutions for Task 5. */ 
SELECT hour,
       minute,
       COUNT(*)
FROM solar_losses
WHERE error_code = 'CAMBERRA10'
OR    error_code = '478Z2'
OR    error_code = 'L26T'
GROUP BY hour,
         minute
HAVING COUNT(*) > 45
ORDER BY hour,
         minute;

COMMIT;
