CREATE TABLE test_results
(
  name         TEXT,
  student_id   INTEGER,
  birth_date   DATE,
  test_result  DECIMAL,
  grade        TEXT,
  passed       BOOLEAN
);

DROP TABLE test_results;

CREATE TABLE test_results
(
  name         TEXT,
  student_id   INTEGER   PRIMARY KEY,
  birth_date   DATE,
  test_result  DECIMAL   NOT NULL,
  grade        TEXT      NOT NULL,
  passed       BOOLEAN   NOT NULL
);

INSERT INTO test_results
VALUES
('Walt', 1, '1980-12-01', 95.50, 'A', TRUE);

SELECT * FROM test_results;

INSERT INTO test_results
VALUES
('Jesse', 2, '1988-02-11', 74.00, 'C', TRUE),
('Todd', 3, '1987-06-13', 60.00, 'D', TRUE),
('Tuco', 4, '1970-11-11', 15.50, 'F', FALSE),
('Gus', 5, '1975-08-08', 80.00, 'B', TRUE)
;

SELECT * FROM test_results;

COMMIT;

TRUNCATE TABLE test_results;

SELECT * FROM test_results;

SELECT * FROM test_results;

CREATE TABLE student_names
(
name TEXT
);

INSERT INTO student_names
(SELECT name FROM test_results);

SELECT * FROM student_names;

CREATE TABLE test_averages
(
test_average DECIMAL
);

INSERT INTO test_averages
(SELECT AVG(test_result) FROM test_results);

SELECT * FROM test_averages;

CREATE TABLE accidents
  (car_type TEXT,
   city TEXT,
   factory_id TEXT,
   accident_date DATE,
   accident_id INT,
   car_brand TEXT,
   country TEXT,
   reported BOOL,
   weather TEXT,
   time_of_the_day TEXT,
   damage INT);
   
COPY accidents FROM '/home/tamas/accidents.csv' WITH CSV HEADER DELIMITER',';

COMMIT;

SELECT *
FROM accidents
LIMIT 10;

COMMIT;
