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

/* Task 1: How many Android and how many iPhone users do we have? */ 
SELECT phone_type,
       COUNT(phone_type) AS phones_number
FROM abtest_companies
GROUP BY phone_type;

COMMIT;

/* Task 2: List every company that has more than 20 employees! */ 
SELECT company_id,
       COUNT(*) AS employees_number
FROM abtest_companies
GROUP BY company_id
HAVING COUNT(*) >= 20
ORDER BY employees_number DESC;

COMMIT;

/* Alternative solutions for Task 2. */ 
SELECT company_id,
       COUNT(company_id) AS employees_number
FROM abtest_companies
GROUP BY company_id
HAVING (COUNT(company_id) >= 20)
ORDER BY employees_number DESC;

SELECT abtest_companies.company_id,
       CAST(COUNT(company_id) AS INT) AS employees_number
FROM abtest_companies
GROUP BY company_id
HAVING COUNT(company_id) >= 20
ORDER BY employees_number DESC;

COMMIT;

/* Task 3: Take all the companies that have more than 20 employees? How many employees do they have in total? */ 
SELECT SUM(employees_number) AS total_employees
FROM (SELECT company_id,
             COUNT(*) AS employees_number
      FROM abtest_companies
      GROUP BY company_id
      HAVING COUNT(*) >= 20) AS employees_filtering;

COMMIT;

/* Alternative solutions for Task 3. */ 
SELECT SUM(employees_number) AS total_employees
FROM (SELECT company_id,
             COUNT(company_id) AS employees_number
      FROM abtest_companies
      GROUP BY company_id
      HAVING COUNT(*) >= 20) AS employees_filtering;

SELECT SUM(employees_number) AS total_employees
FROM (SELECT abtest_companies.company_id,
             CAST(COUNT(company_id) AS INT) AS employees_number
      FROM abtest_companies
      GROUP BY company_id
      HAVING COUNT(company_id) >= 20) AS employees_number;

CREATE VIEW total_employees 
AS
SELECT SUM(employees_number) AS total_employees
FROM (SELECT company_id,
             COUNT(*) AS employees_number
      FROM abtest_companies
      GROUP BY company_id
      HAVING COUNT(*) >= 20) AS employees_filtering;

SELECT SUM(total_employees)
FROM total_employees;

COMMIT;

/* Task 4: How many blue and how many red pens were sold during the A/B test? */ 
SELECT segment,
       COUNT(segment)
FROM abtest_users
  JOIN abtest_purchases ON abtest_users.user_id = abtest_purchases.user_id
GROUP BY segment;

COMMIT;

/* Alternative solutions for Task 4. */ 
SELECT segment,
       COUNT(*)
FROM abtest_users
  JOIN abtest_purchases ON abtest_users.user_id = abtest_purchases.user_id
GROUP BY segment;

COMMIT;

/* Task 5: Which pen won the A/B test: the red or the blue? */ 
SELECT segment,
       COUNT(*) AS total_purchases,
       COUNT(abtest_purchases.user_id) / COUNT(DISTINCT (abtest_users.user_id))::FLOAT AS ppu
FROM abtest_users
  FULL JOIN abtest_purchases ON abtest_users.user_id = abtest_purchases.user_id
WHERE segment LIKE 'red'
GROUP BY segment;

SELECT segment,
       COUNT(*) AS total_purchases,
       COUNT(abtest_purchases.user_id) / COUNT(DISTINCT (abtest_users.user_id))::FLOAT AS ppu
FROM abtest_users
  FULL JOIN abtest_purchases ON abtest_users.user_id = abtest_purchases.user_id
WHERE segment LIKE 'blue'
GROUP BY segment;

COMMIT;
