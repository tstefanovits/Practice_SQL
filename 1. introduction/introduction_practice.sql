/* Creating test_results table. */ 
CREATE TABLE test_results 
(
  name          TEXT,
  student_id    INTEGER,
  birth_date    DATE,
  test_result   DECIMAL,
  grade         TEXT,
  passed        BOOLEAN
);

/* Dropping test_results- */ 
DROP TABLE test_results;

/* Creating test_results table. */ 
CREATE TABLE test_results 
(
  name          TEXT,
  student_id    INTEGER PRIMARY KEY,
  birth_date    DATE,
  test_result   DECIMAL NOT NULL,
  grade         TEXT NOT NULL,
  passed        BOOLEAN NOT NULL
);

/* Inssert data to test_result table. */ 
INSERT INTO test_results
VALUES
(
  'Walt',
  1,
  '1980-12-01',
  95.50,
  'A',
  TRUE
);

/* Test. */ 
SELECT *
FROM test_results;

/* Inssert data to test_result table. */ 
INSERT INTO test_results
VALUES
(
  'Jesse',
  2,
  '1988-02-11',
  74.00,
  'C',
  TRUE
),
(
  'Todd',
  3,
  '1987-06-13',
  60.00,
  'D',
  TRUE
),
(
  'Tuco',
  4,
  '1970-11-11',
  15.50,
  'F',
  FALSE
),
(
  'Gus',
  5,
  '1975-08-08',
  80.00,
  'B',
  TRUE
);

/* Test. */ 
SELECT *
FROM test_results;

/* Drop data from test_result table. */ 
TRUNCATE TABLE test_results;

/* Test. */ 
SELECT *
FROM test_results;

/* Creating student_names table. */ 
CREATE TABLE student_names 
(
  name   TEXT
);

/* Test. */ 
SELECT *
FROM student_names;

/* Creating test_averages table. */ 
CREATE TABLE test_averages 
(
  test_average   DECIMAL
);

/* Test. */ 
SELECT *
FROM test_averages;

/* Creating accidents table. */ 
CREATE TABLE accidents 
(
  car_type          TEXT,
  city              TEXT,
  factory_id        TEXT,
  accident_date     DATE,
  accident_id       INT,
  car_brand         TEXT,
  country           TEXT,
  reported          BOOL,
  weather           TEXT,
  time_of_the_day   TEXT,
  damage            INT
);

/* Inssert data to accidents table. */ 
COPY accidents
FROM '/home/tamas/accidents.csv' WITH CSV HEADER DELIMITER ',';

/* Test. */ 
SELECT *
FROM accidents
LIMIT 10;

