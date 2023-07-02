SELECT NbPiece AS pieces, COUNT(NbPiece) AS nombr_appart, (COUNT(NbPiece) * 100 / (SELECT COUNT(id) FROM immobilier WHERE TypIm = 'Appartement')) AS prsnt_appart
FROM immobilier
WHERE TypIm = 'Appartement'
GROUP BY NbPiece
ORDER BY NbPiece;
