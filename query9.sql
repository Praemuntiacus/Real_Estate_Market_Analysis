(
  (SELECT AVG(ValFon)::decimal(8,2) AS val_fon_M, NomCom AS communes, CodDept AS departements
  FROM immobilier
  LEFT JOIN commune ON immobilier.id_com = commune.id
  LEFT JOIN department ON department.id = commune.id_dept
  WHERE CodDept = '6'
  GROUP BY NomCom, CodDept
  ORDER BY val_fon_M DESC
  LIMIT 3)
  UNION
  (SELECT AVG(ValFon)::decimal(8,2) AS val_fon_M, NomCom AS communes, CodDept AS departements
  FROM immobilier
  LEFT JOIN commune ON immobilier.id_com = commune.id
  LEFT JOIN department ON department.id = commune.id_dept
  WHERE CodDept = '13'
  GROUP BY NomCom, CodDept
  ORDER BY val_fon_M DESC
  LIMIT 3)
  UNION
  (SELECT AVG(ValFon)::decimal(8,2) AS val_fon_M, NomCom AS communes, CodDept AS departements
  FROM immobilier
  LEFT JOIN commune ON immobilier.id_com = commune.id
  LEFT JOIN department ON department.id = commune.id_dept
  WHERE CodDept = '33'
  GROUP BY NomCom, CodDept
  ORDER BY val_fon_M DESC
  LIMIT 3)
  UNION
  (SELECT AVG(ValFon)::decimal(8,2) AS val_fon_M, NomCom AS communes, CodDept AS departements
  FROM immobilier
  LEFT JOIN commune ON immobilier.id_com = commune.id
  LEFT JOIN department ON department.id = commune.id_dept
  WHERE CodDept = '59'
  GROUP BY NomCom, CodDept
  ORDER BY val_fon_M DESC
  LIMIT 3)
  UNION
  (SELECT AVG(ValFon)::decimal(8,2) AS val_fon_M, NomCom AS communes, CodDept AS departements
  FROM immobilier
  LEFT JOIN commune ON immobilier.id_com = commune.id
  LEFT JOIN department ON department.id = commune.id_dept
  WHERE CodDept = '69'
  GROUP BY NomCom, CodDept
  ORDER BY val_fon_M DESC
  LIMIT 3)
)
ORDER BY departements;
