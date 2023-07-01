SELECT NbPiece AS pieces, COUNT(NbPiece) as apparts
FROM immobilier
WHERE TypIm = 'Appartement'
GROUP BY NbPiece
ORDER BY NbPiece;