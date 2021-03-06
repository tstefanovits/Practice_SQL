/* Creating covered_by_insurance table. */ 
CREATE TABLE covered_by_insurance 
(
  accident_id   INT,
  paid          BOOL
);

/* Data moving to table. */ 
COPY covered_by_insurance
FROM '/home/tamas/course/sql/datasets/covered_by_insurance.csv' WITH CSV HEADER DELIMITER ',';

/* Creating date_table. */ 
CREATE TABLE date_table 
(
  accident_date   DATE,
  dow             TEXT
);

/* Data moving to table. */ 
COPY date_table
FROM '/home/tamas/course/sql/datasets/date_table.csv' WITH CSV HEADER DELIMITER ',';

/* Commiting. */ 
COMMIT;

/* Join the accidents and the date_table tables and select the first 10 rows! */ 
SELECT *
FROM date_table
  JOIN accidents ON date_table.accident_date = accidents.accident_date 
LIMIT 10;

/* Alternative solution just to show one accident_date column in the joined tables.. */ 
SELECT date_table.accident_date,
       dow,
       car_type,
       city,
       factory_id,
       accident_id,
       car_brand,
       country,
       reported,
       weather,
       time_of_the_day,
       damage
FROM date_table
  JOIN accidents ON date_table.accident_date = accidents.accident_date 
LIMIT 10;

