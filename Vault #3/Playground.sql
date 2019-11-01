/* This is my playground file for store my playings which related to tables and queries in Vault #3. */

SELECT SUM(employees_number) AS total_employees
FROM (SELECT company_id,
             COUNT(company_id) AS employees_number
      FROM abtest_companies
      GROUP BY company_id
      HAVING COUNT(*) >= 20) AS employees_filtering;
SELECT *
FROM (SELECT abtest_companies.company_id,
             COUNT(company_id) AS employees_number
      FROM abtest_companies
      GROUP BY company_id
      HAVING COUNT(company_id) < 10) AS filtered;

SELECT 
       COUNT(company_id) AS employees_number
FROM abtest_companies
GROUP BY 
         abtest_companies.user_id
HAVING COUNT(*) < 10;

SELECT company_id,
             COUNT(company_id) AS employees_number
      FROM abtest_companies
      GROUP BY company_id
      HAVING COUNT(*) < 10;

SELECT abtest_users.segment,
       COUNT(abtest_purchases.user_id) / COUNT(DISTINCT (abtest_users.user_id))::FLOAT AS ppu
FROM (SELECT abtest_companies.company_id,
             COUNT(company_id) AS employees_number
      FROM abtest_companies
      GROUP BY company_id
      HAVING COUNT(company_id) < 10) AS filtered
  FULL JOIN abtest_purchases ON abtest_users.user_id = abtest_purchases.user_id
  FULL JOIN abtest_companies ON abtest_users.user_id = abtest_companies.user_id
GROUP BY segment
ORDER BY abtest_users.segment;

COMMIT;
