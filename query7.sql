WITH
  table1 AS (
    SELECT NomCom AS nc1, COUNT(DatMut) AS trim1
    FROM commune
    JOIN mutation ON commune.id = mutation.id_com
    WHERE DatMut BETWEEN '2020-01-01' AND '2020-03-31'
    GROUP BY nc1
  ),
  table2 AS (
    SELECT NomCom AS nom_de_commune, COUNT(DatMut) AS trim2
    FROM commune
    JOIN mutation ON commune.id = mutation.id_com
    WHERE DatMut BETWEEN '2020-04-01' AND '2020-06-30'
    GROUP BY nom_de_commune
  )
SELECT nom_de_commune, (trim2-trim1)*100/trim1 AS taux_evolution
FROM table2
JOIN table1 ON table2.nom_de_commune = table1.nc1
WHERE (trim2-trim1)*100/trim1 >= 20
ORDER BY taux_evolution DESC;
