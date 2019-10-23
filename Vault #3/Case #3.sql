/*  Introduction: In Case #3 I haven't got an actual dataset only hypothetical. So basically this file will contain my future solutions of a whiteboard interview. */

/* Task 1: From which source does Dilan get the most first reads? */
SELECT source,
       COUNT(*)
FROM first_read
GROUP BY source
ORDER BY source DESC;

COMMIT;
