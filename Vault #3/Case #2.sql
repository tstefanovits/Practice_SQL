/* Creating solar_losses table. */ 
CREATE TABLE solar_losses 
(
  model        text,
  date         date,
  hour         integer,
  minute       integer,
  error_code   text,
  loss         float
);

/* Creating solar_teams table. */ 
CREATE TABLE solar_teams 
(
  error_code    text,
  prio_team     text,
  backup_team   text
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

SELECT hour,
       minute,
       COUNT(minute)
FROM solar_losses
WHERE error_code IN ('CAMBERRA10','478Z2','L26T')
GROUP BY hour,
         minute
HAVING COUNT(minute) > 45
ORDER BY hour,
         minute;

SELECT hour,
       minute,
       COUNT(minute)
FROM solar_losses
WHERE error_code IN (SELECT error_code
                     FROM solar_losses
                     WHERE model LIKE 'x3'
                     GROUP BY model,
                              error_code
                     HAVING SUM(loss) > 300000)
GROUP BY hour,
         minute
HAVING COUNT(minute) > 45
ORDER BY hour,
         minute;

COMMIT;

/* Task 6: Take the error codes from TASK #4's results! How many minutes were there in the day where these error codes occurred more than 45 times? (For all models - not only for X3!) */ 
SELECT COUNT(min_on_day)
FROM (SELECT hour,
             minute,
             COUNT(minute) AS min_on_day
      FROM solar_losses
      WHERE error_code = '478Z2'
      OR    error_code = 'L26T'
      OR    error_code = 'CAMBERRA10'
      GROUP BY hour,
               minute
      HAVING COUNT(minute) > 45
      ORDER BY hour,
               minute) AS minutes_on_day;

COMMIT;

/* Alternative solutions for Task 6. */ 
SELECT COUNT(*)
FROM (SELECT hour,
             minute,
             COUNT(*)
      FROM solar_losses
      WHERE error_code = 'CAMBERRA10'
      OR    error_code = '478Z2'
      OR    error_code = 'L26T'
      GROUP BY hour,
               minute
      HAVING COUNT(*) > 45) AS subquery;

SELECT COUNT(DISTINCT (hour::integer || ':' || minute::integer)::TIME) AS clock
FROM (SELECT hour,
             minute,
             COUNT(minute) AS min_on_day
      FROM solar_losses
      WHERE error_code = '478Z2'
      OR    error_code = 'L26T'
      OR    error_code = 'CAMBERRA10'
      GROUP BY hour,
               minute
      HAVING COUNT(minute) > 45
      ORDER BY hour,
               minute) AS minutes_on_day;

SELECT COUNT(whattimeisit) AS clock
FROM (SELECT DISTINCT (hour::integer || ':' || minute::integer)::TIME AS clock
      FROM (SELECT hour,
                   minute,
                   COUNT(minute)
            FROM solar_losses
            WHERE error_code IN (SELECT error_code
                                 FROM solar_losses
                                 WHERE model LIKE 'x3'
                                 GROUP BY model,
                                          error_code
                                 HAVING SUM(loss) > 300000)
            GROUP BY hour,
                     minute
            HAVING COUNT(minute) > 45
            ORDER BY hour,
                     minute) AS minutes_on_day
      GROUP BY clock) AS whattimeisit;

SELECT COUNT(whattimeisit) AS clock
FROM (SELECT DISTINCT (hour::integer || ':' || minute::integer)::TIME AS clock
      FROM (SELECT hour,
                   minute,
                   COUNT(minute) AS min_on_day
            FROM solar_losses
            WHERE error_code = '478Z2'
            OR    error_code = 'L26T'
            OR    error_code = 'CAMBERRA10'
            GROUP BY hour,
                     minute
            HAVING COUNT(minute) > 45
            ORDER BY hour,
                     minute) AS minutes_on_day
      GROUP BY clock) AS whattimeisit;

COMMIT;

SELECT COUNT(whattimeisit) AS clock
FROM (SELECT DISTINCT (HOUR::integer || ':' || minute::INTEGER)::TIME AS clock
      FROM (SELECT HOUR,
                   MINUTE,
                   COUNT(MINUTE)
            FROM solar_losses
            WHERE error_code IN ('CAMBERRA10','478Z2','L26T')
            GROUP BY HOUR,
                     MINUTE
            HAVING COUNT(MINUTE) > 45
            ORDER BY HOUR,
                     MINUTE) AS minutes_on_day
      GROUP BY clock) AS whattimeisit;

COMMIT;

SELECT COUNT(whattimeisit) AS clock
FROM (SELECT (HOUR::INTEGER|| ':' ||MINUTE::INTEGER)::TIME AS clock
      FROM (SELECT HOUR,
                   MINUTE,
                   COUNT(MINUTE)
            FROM solar_losses
            WHERE error_code IN ('CAMBERRA10','478Z2','L26T')
            GROUP BY HOUR,
                     MINUTE
            HAVING COUNT(MINUTE) > 45
            ORDER BY HOUR,
                     MINUTE) AS minutes_on_day
      GROUP BY clock) AS whattimeisit;

COMMIT;

/* Task 7: Each main team (aka prio_team) fixed ~30% of the issues and won back exactly 30% of the loss damages that happened during the day.
Calculating with this 30% value: Which main team (prio_team) won back the most damage losses (in $) and how much did they win back exactly? */
SELECT prio_team,
       error_code,
       SUM(issues) AS original_issues,
       ((SUM(issues)) * 0.3) AS issues_what_fixed,
       (SUM(issues) - ((SUM(issues)) * 0.3)) AS difference_in_issues,
       SUM(original_dmg) AS original_dmg,
       ((SUM(original_dmg)) * 0.3) AS total_dmg_what_fixed,
       (SUM(original_dmg) -((SUM(original_dmg)) * 0.3)) AS difference_in_dmg
FROM (SELECT prio_team,
             solar_teams.error_code,
             SUM(loss) AS original_dmg,
             COUNT(solar_losses.error_code) AS issues
      FROM solar_losses
        JOIN solar_teams ON solar_teams.error_code = solar_losses.error_code
      GROUP BY prio_team,
               solar_teams.error_code) AS filtering
GROUP BY error_code,
         prio_team
ORDER BY total_dmg_what_fixed DESC;

COMMIT;

/* Alternative solutions for Task 7. */ 
SELECT prio_team,
       error_code,
       SUM(issues) AS original_issues,
       ((SUM(issues)) * 0.3) AS issues_what_fixed,
       (SUM(issues) - ((SUM(issues)) * 0.3)) AS difference_in_issues,
       SUM(original_dmg) AS original_dmg,
       ((SUM(original_dmg)) * 0.3) AS total_dmg_what_fixed,
       (SUM(original_dmg) -((SUM(original_dmg)) * 0.3)) AS difference_in_dmg
FROM (SELECT prio_team,
             solar_teams.error_code,
             SUM(loss) AS original_dmg,
             COUNT(solar_losses.error_code) AS issues
      FROM solar_losses
        JOIN solar_teams ON solar_teams.error_code = solar_losses.error_code
      GROUP BY prio_team,
               solar_teams.error_code) AS filtering
GROUP BY error_code,
         prio_team
ORDER BY total_dmg_what_fixed DESC
LIMIT 1;

SELECT prio_team,
       error_code,
       SUM(issues) AS original_issues,
       ((SUM(issues)) * 0.3) AS issues_what_fixed,
       (SUM(issues) - ((SUM(issues)) * 0.3)) AS difference_in_issues,
       SUM(original_dmg) AS original_dmg,
       ((SUM(original_dmg)) * 0.3) AS total_dmg_what_fixed,
       (SUM(original_dmg) -((SUM(original_dmg)) * 0.3)) AS difference_in_dmg
FROM (SELECT prio_team,
             solar_losses.error_code,
             SUM(loss) AS original_dmg,
             COUNT(solar_losses.error_code) AS issues
      FROM solar_losses
        JOIN solar_teams ON solar_teams.error_code = solar_losses.error_code
      GROUP BY prio_team,
               solar_losses.error_code) AS filtering
GROUP BY error_code,
         prio_team
ORDER BY total_dmg_what_fixed DESC
LIMIT 1;

SELECT prio_team,
       SUM(loss)* 0.3 AS issues_what_fixed
FROM solar_losses
  JOIN solar_teams
  ON solar_teams.error_code = solar_losses.error_code
GROUP BY prio_team
ORDER BY issues_what_fixed DESC
LIMIT 1;

COMMIT;

/* Task 8: Additional to their main-team duties, every team works as a backup team, too - where they won back an additional 10% of the damage losses.
Taking a look at the teams' combined performance as a main and backup team - which team won back the most damage losses (in $) and how much did they win back exactly? */ 
SELECT prio_team,
       backup_team,
       error_code,
       SUM(issues) AS original_issues,
       ((SUM(issues)) * 0.3) AS issues_what_fixed_the_main_team,
       ((SUM(issues)) * 0.1) AS issues_what_fixed_the_backup_team,
       (SUM(issues) - ((SUM(issues)) * 0.4)) AS difference_in_the_issues,
       SUM(original_dmg) AS original_dmg,
       ((SUM(original_dmg)) * 0.3) AS total_dmg_what_the_main_team,
       ((SUM(original_dmg)) * 0.1) AS total_dmg_what_fixed_the_backup_team,
       (SUM(original_dmg) -((SUM(original_dmg)) * 0.4)) AS difference_in_the_dmg
FROM (SELECT prio_team,
             backup_team,
             solar_losses.error_code,
             SUM(loss) AS original_dmg,
             COUNT(solar_losses.error_code) AS issues
      FROM solar_losses
        JOIN solar_teams ON solar_teams.error_code = solar_losses.error_code
      GROUP BY prio_team,
               backup_team,
               solar_losses.error_code) AS filtering
GROUP BY error_code,
         prio_team,
         backup_team
ORDER BY difference_in_the_dmg DESC;
