SELECT
  SUM(CASE WHEN DatMut BETWEEN '2020-01-01' AND '2020-03-31' THEN 1 ELSE 0 END) AS trimestre1,
  SUM(CASE WHEN DatMut BETWEEN '2020-04-01' AND '2020-06-30' THEN 1 ELSE 0 END) AS trimestre2,
  (
    WITH
      table1 AS (
        SELECT COUNT(DatMut) AS trim1
        FROM mutation
        WHERE DatMut BETWEEN '2020-01-01' AND '2020-03-31'
      ),
      table2 AS (
        SELECT COUNT(DatMut) AS trim2
        FROM mutation
        WHERE DatMut BETWEEN '2020-04-01' AND '2020-06-30'
      )
    SELECT (trim2 - trim1) * 100 / trim1 as taux_evolution
    FROM table1, table2
  )
FROM mutation
WHERE NatMut = 'Vente';
