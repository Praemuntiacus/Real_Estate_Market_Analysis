SELECT Count(immobilier.id) AS apparts_vendus 
FROM immobilier
LEFT JOIN mutation ON mutation.id = immobilier.id
WHERE TypIm = 'Appartement' AND NatMut = 'Vente' AND DatMut BETWEEN '01-01-2020' AND '30-06-2020';
