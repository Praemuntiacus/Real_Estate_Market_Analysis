SELECT CodDept as departement, SrfIm as surface_appart, ValFon as prix
FROM immobilier
JOIN department ON department.id = immobilier.id
WHERE TypIm = 'Appartement'
ORDER BY ValFon DESC
LIMIT 10;