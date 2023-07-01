SELECT
SUM(CASE WHEN DatMut BETWEEN '01-01-2020' AND '31-03-2020' THEN 1 ELSE 0 END) AS trimestre1,
SUM(CASE WHEN DatMut BETWEEN '01-04-2020' AND '30-06-2020' THEN 1 ELSE 0 END) AS trimestre2,
(WITH
table1 AS (
SELECT COUNT(DatMut) AS trim1
FROM mutation
WHERE DatMut BETWEEN '01-01-2020' AND '31-03-2020'),
table2 AS (
SELECT COUNT(DatMut) AS trim2
FROM mutation
WHERE DatMut BETWEEN '01-04-2020' AND '30-06-2020')
SELECT (trim2-trim1)*100/trim1 as taux_evolution
FROM table1, table2)
FROM mutation
WHERE NatMut = 'Vente';
