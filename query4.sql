SELECT ROUND((tab1.prix_m2_total / tab2.srf_total), 2) AS prix_m2_maison_IDF
FROM
  (SELECT TypIm, SUM(ValFon) AS prix_m2_total
   FROM immobilier
   LEFT JOIN department ON immobilier.id_dept = department.id
   WHERE TypIm = 'Maison' AND CodDept IN ('75', '77', '78', '91', '92', '93', '94', '95')
   GROUP BY immobilier.TypIm) AS tab1
JOIN
  (SELECT TypIm, SUM(SrfIm) AS srf_total
   FROM immobilier
   LEFT JOIN department ON immobilier.id_dept = department.id
   WHERE TypIm = 'Maison' AND CodDept IN ('75', '77', '78', '91', '92', '93', '94', '95')
   GROUP BY immobilier.TypIm) AS tab2
ON tab1.TypIm = tab2.TypIm;

