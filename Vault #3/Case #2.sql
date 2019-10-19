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
SELECT model, hour
FROM solar_losses
GROUP BY model, hour
ORDER BY hour;
