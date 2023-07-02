SELECT T2.prix_m2_t2, T3.prix_m2_t3, ((T2.prix_m2_t2 - T3.prix_m2_t3) / T2.prix_m2_t2 * 100)::decimal(6,2) AS prct_dif
FROM 
  (SELECT NbPiece, TypIm, (SUM(ValFon) / SUM(SrfIm))::decimal(6,2) AS prix_m2_t2
  FROM immobilier
  WHERE NbPiece = 2 AND TypIm = 'Appartement'
  GROUP BY NbPiece, TypIm) AS T2,
  (SELECT NbPiece, TypIm, (SUM(ValFon) / SUM(SrfIm))::decimal(6,2) AS prix_m2_t3
  FROM immobilier
  WHERE NbPiece = 3 AND TypIm = 'Appartement'
  GROUP BY NbPiece, TypIm) AS T3;
