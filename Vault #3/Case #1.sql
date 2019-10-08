/* Creating abtest_users table. */ 
CREATE TABLE abtest_users
(
   user_id  integer,
   segment  text
);

/* Creating abtest_purchases table. */ 
CREATE TABLE abtest_purchases
(
   user_id integer,
   purchase_id  text
);

/* Creating abtest_purchases table. */ 
CREATE TABLE abtest_companies
(
   user_id integer,
   phone_type  text,
   company_id  text
);
