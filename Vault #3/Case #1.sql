/* Creating abtest_users table. */ 
CREATE TABLE abtest_users 
(
  user_id   INTEGER,
  segment   TEXT
);

/* Creating abtest_purchases table. */ 
CREATE TABLE abtest_purchases 
(
  user_id       INTEGER,
  purchase_id   TEXT
);

/* Creating abtest_purchases table. */ 
CREATE TABLE abtest_companies 
(
  user_id      INTEGER,
  phone_type   TEXT,
  company_id   TEXT
);

/* Load data to abtest_users table. */ 
COPY abtest_users
FROM '/home/jovyan/work/Vault#3/abtest_users.csv' WITH CSV HEADER DELIMITER ',';

/* Load data to abtest_purchases table. */ 
COPY abtest_purchases
FROM '/home/jovyan/work/Vault#3/abtest_purchases.csv' WITH CSV HEADER DELIMITER ',';

/* Load data to abtest_companies table. */ 
COPY abtest_companies
FROM '/home/jovyan/work/Vault#3/abtest_companies.csv' WITH CSV HEADER DELIMITER ',';

COMMIT;
