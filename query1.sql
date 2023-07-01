SELECT COUNT(DatMut) AS apparts_vendus
FROM mutation
JOIN immobilier ON immobilier.id = mutation.id
WHERE TypIm = 'Appartement' AND NatMut = 'Vente' AND DatMut BETWEEN '01-01-2020' AND '30-06-2020'
;