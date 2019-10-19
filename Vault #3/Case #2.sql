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
