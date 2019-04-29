/* Which source brought the most registrations? */
SELECT source,
       COUNT(*)
FROM registrations
GROUP BY source
ORDER BY COUNT(*) DESC;

