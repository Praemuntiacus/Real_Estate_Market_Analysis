SELECT department.CodDept AS departement, immobilier.SrfIm AS surface_appart, immobilier.ValFon AS prix
FROM immobilier
JOIN department ON department.id = immobilier.id_dept
WHERE immobilier.TypIm = 'Appartement'
ORDER BY immobilier.ValFon DESC
LIMIT 10;
