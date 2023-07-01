WITH
table1 AS
(SELECT NomCom nc1, COUNT(DatMut) AS trim1
FROM commune
JOIN mutation on commune.id = mutation.id_com
WHERE DatMut BETWEEN '01-01-2020' AND '31-03-2020'
GROUP BY nc1),
table2 AS
(SELECT NomCom nom_de_commune, COUNT(DatMut) AS trim2
FROM commune
JOIN mutation on commune.id = mutation.id_com
WHERE DatMut BETWEEN '01-04-2020' AND '30-06-2020'
GROUP BY nom_de_commune)
SELECT nom_de_commune,
(trim2-trim1)*100/trim1 AS taux_evolution
FROM table2
JOIN table1 on table2.nom_de_commune = table1.nc1
WHERE (trim2-trim1)*100/trim1 >= 20
ORDER BY taux_evolution DESC
;