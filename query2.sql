SELECT NbPiece AS pieces, Count(NbPiece) AS nombr_appart, ( Count(NbPiece) * 100 / (SELECT Count(id) FROM immobilier WHERE TypIm = 'Appartement') ) AS prsnt_appart
FROM immobilier
WHERE TypIm = 'Appartement'
GROUP BY NbPiece
ORDER BY NbPiece;
