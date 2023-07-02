SELECT department.CodDept, ROUND(AVG(immobilier.ValFon / immobilier.SrfIm), 2) AS prix_m2
FROM immobilier
JOIN department ON department.id = immobilier.id_dept
GROUP BY department.CodDept
ORDER BY prix_m2 DESC
LIMIT 10;
