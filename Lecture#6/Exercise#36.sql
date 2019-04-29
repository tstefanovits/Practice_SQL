/* Which source brought the most super_tree sends? */ 
SELECT source,
       COUNT(*)
FROM registrations
  JOIN super_tree ON registrations.userid = super_tree.userid
GROUP BY source
ORDER BY COUNT(*) DESC;

