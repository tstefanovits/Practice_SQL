/* How much did the users pay in total through 2018-04-30? */ 
SELECT SUM(rev.per_user) AS revenue
FROM
  (SELECT userid, COUNT(*)-1 AS per_user
  FROM super_tree
  GROUP BY userid) as rev;
