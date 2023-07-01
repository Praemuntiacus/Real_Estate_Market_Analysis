SELECT CodDept, Round (Avg(ValFon / SrfIm), 2) AS prix_m2
FROM immobilier
JOIN department ON department.id = immobilier.id
GROUP BY department.CodDept
ORDER BY prix_m2 DESC
LIMIT 10;
