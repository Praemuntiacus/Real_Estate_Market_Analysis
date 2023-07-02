SELECT COUNT(immobilier.id) AS apparts_vendus
FROM immobilier
LEFT JOIN mutation ON mutation.id = immobilier.id
WHERE TypIm = 'Appartement' AND NatMut = 'Vente' AND DatMut BETWEEN '2020-01-01' AND '2020-06-30';
