/* Select the TOP 3 accidents by damage cost and print every piece of information about them! */
SELECT *
FROM accidents
ORDER BY damage DESC LIMIT 3;

