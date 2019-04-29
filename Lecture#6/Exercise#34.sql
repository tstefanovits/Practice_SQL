/* Create two new SQL tables! Then download and import the new csv files into them! */ /* Creating Registrations Table */ 
CREATE TABLE registrations 
(
  day                 TEXT,
  reg_date            DATE,
  reg_time            TIME,
  userID              INTEGER,
  event_type          TEXT,
  year_of_the_birth   INTEGER,
  phone               TEXT,
  country             TEXT,
  source              TEXT
);

/* Moving data from .csv to registrations table. */ 
COPY registrations
FROM '/home/tamas/course/sql/registrations/all_data_registrations.csv' DElIMITER ' ';

/* Creating Super_Tree Table */ 
CREATE TABLE super_tree 
(
  day          TEXT,
  reg_date     DATE,
  userID       INTEGER,
  event_type   TEXT
);

/* Moving data from .csv to registrations table. */ 
COPY super_tree
FROM '/home/tamas/course/sql/super_tree/all_data_super_tree.csv' DElIMITER ' ';

