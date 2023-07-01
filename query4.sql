SELECT CodDept, AVG(ValFon/SrfIm)::decimal(6,2) AS prix_m2
FROM immobilier
JOIN department ON department.id = immobilier.id
WHERE TypIm = 'Maison'
GROUP BY department.CodDept
HAVING CodDept IN ('75', '77', '78', '91', '92', '93', '94', '95');