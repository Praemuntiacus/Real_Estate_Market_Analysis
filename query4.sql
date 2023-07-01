SELECT Round(( tab1.prix_m2_total / tab2.srf_total ), 2) AS prix_m2_maison_IDF
FROM (SELECT TypIm, Sum(ValFon) AS prix_m2_total FROM immobilier LEFT JOIN department ON immobilier.id_dept = department.id WHERE TypIm = 'Maison' AND CodDept IN ( '75', '77', '78', '91', '92', '93', '94', '95' )
GROUP BY immobilier.typim) AS tab1,
(SELECT TypIm, Sum(SrfIm) AS srf_total FROM immobilier LEFT JOIN department ON immobilier.id_dept = department.id WHERE TypIm = 'Maison' AND CodDept IN ( '75', '77', '78', '91', '92', '93', '94', '95' )
GROUP BY immobilier.typim) AS tab2;
