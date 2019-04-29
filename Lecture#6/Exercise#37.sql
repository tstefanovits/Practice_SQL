/* Do we have paying users? */ 
SELECT userid,
       COUNT(*) AS super_tree_use
FROM super_tree
GROUP BY userid
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;
