# Real Estate Market Analysis in France
--------------------------------------------------------------
- SQL dump: [database.sql](Project2/database.sql)
## SQL project analysing the real estate makret in France during 2020

### The total number of apartments sold during the first semester of 2020
- SQL script: [query1.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query1.sql)

The query counts the number of apartments (**apparts_vendus**) that were sold (**NatMut** = *'Vente'*) within a specific date range (DatMut BETWEEN '2020-01-01' AND '2020-06-30'). The SELECT statement uses the COUNT function to count the occurrences of *immobilier.id* and aliases it as *apparts_vendus*.

The query joins the *immobilier* table with the *mutation* table using a left join (LEFT JOIN) with the join condition *mutation.id = immobilier.id*. The WHERE clause filters the records to include only apartments (**TypIm** = *'Appartement'*), sales transactions (**NatMut** = *'Vente'*), and a specific date range (DatMut BETWEEN '2020-01-01' AND '2020-06-30').

The query calculates and returns the count of apartments (apparts_vendus) that were sold within the specified date range.






- **Result**:
______________
**apparts_vendus**

         31378
______________

### The proportion of apartment sales based on the number of rooms
- SQL script: [query2.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query2.sql)


The query provides information about the number of sold apartments grouped by the number of rooms (**NbPiece**). The SELECT statement retrieves the **NbPiece** column as pieces and counts the occurrences of each **NbPiece** value using COUNT(NbPiece) as **nombr_appart**.

The expression (COUNT(NbPiece) * 100 / (SELECT COUNT(id) FROM immobilier WHERE TypIm = 'Appartement')) calculates the percentage of apartments (**prsnt_appart**) for each number of rooms (NbPiece). It divides the count of apartments for a specific number of rooms by the total count of apartments, obtained from a subquery.

The WHERE clause filters the records to include only apartments (**TypIm** = *'Appartement'*). The GROUP BY clause groups the result by the number of rooms (**NbPiece**). The ORDER BY clause orders the result by the number of rooms (**NbPiece**).

The query presents the number of apartments (nombr_appart), grouped by the number of rooms (pieces), and also provides the percentage of apartments (prsnt_appart) for each number of rooms. The results are ordered based on the number of rooms.





- **Result**:
________________________
**pieces** | **apparts**

     0       30
     1     6739
     2     9783
     3     8966
     4     4460
     5     1114
     6      204
     7       54
     8       17
     9        8
    10        2
    11        1
______________________________

### The average price per square meter for real estate properties in each department
- SQL script: [query3.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query3.sql)

The query calculates the average price per square meter (**prix_m2**) for each department (**CodDept**) based on the price (**ValFon**) and surface area (**SrfIm**) data from the *immobilier* table. The join condition *department.id = immobilier.id_dept* ensures that the corresponding records are matched between the department and immobilier tables. The result is grouped by department (GROUP BY department.CodDept), and the AVG function calculates the average valuation per surface area for each department. The ROUND function is used to round the calculated average price per square meter to 2 decimal places. The results are then ordered in descending order of **prix_m2** using the ORDER BY clause. Finally, the LIMIT 10 clause is used to retrieve only the top 10 departments with the highest average price per square meter.

The query provides the top 10 departments with the highest average price per square meter based on the valuation and surface area data from the immobilier table.


### The average price per square meter for houses in selected departments
- SQL script: [query4.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query4.sql)

This query calculates the average price per square meter (prix_m2_maison_IDF) for houses (TypIm = 'Maison') in the Île-de-France region (specifically departments with codes '75', '77', '78', '91', '92', '93', '94', '95').

The query uses two subqueries (*tab1* and *tab2*) to calculate the necessary aggregates. The first subquery (*tab1*) calculates the total price (prix_m2_total) for each house (TypIm) in the specified departments, by summing the price (ValFon) from the *immobilier* table. The second subquery (*tab2*) calculates the total surface area (srf_total) for each house (TypIm) in the specified departments, by summing the surface area (SrfIm) from the *immobilier* table.

These two subqueries are joined using the JOIN statement, matching records with the same TypIm (house type). The result is a single row for each house type, with the average price per square meter calculated by dividing the total price by the total surface area, rounded to 2 decimal places.

The final result of the query is the average price per square meter (prix_m2_maison_IDF) for houses (TypIm = 'Maison') in the Île-de-France region.

### The top 10 most expensive apartments
- SQL script: [query5.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query5.sql)

The query retrieves information about the top 10 apartments (**Appartement**) based on their valuation (**ValFon**), including the department code (**CodDept**) and the surface area (**SrfIm**) of each apartment.

The SELECT statement selects the department code as *departement*, the surface area as *surface_appart*, and the price as *prix*. The query performs an INNER JOIN between the *immobilier* and *department* tables using the foreign key relationship (department.id = immobilier.id_dept) to match the records based on the department.

The WHERE clause filters the records to include only apartments (**TypIm** = *'Appartement'*). The ORDER BY clause arranges the result in descending order based on the valuation (**ValFon**), so the apartments with the highest valuations will appear first. The LIMIT 10 clause limits the result to only the top 10 apartments with the highest valuations.

The query retrieves the department code, surface area, and valuation for the top 10 apartments based on their valuation, with the apartments sorted in descending order of valuation.

### Rate of change in the number of sales between the first and second quarters of 2020
- SQL script: [query6.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query6.sql)

This query calculates various statistics related to property sales (**NatMut** = *'Vente'*) during two selected quarters of the year.

The first two SUM(CASE ... END) expressions calculate the number of sales (1) that occurred within the specified date ranges for the first quarter (**trimestre1**) and the second quarter (**trimestre2**).

The subsequent WITH clause defines two *subqueries*, **table1** and **table2**, which calculate the number of sales (COUNT(DatMut)) within the respective date ranges for the first and second quarters. The last query retrieves the difference in the number of sales between the second and first quarters (**trim2 - trim1**), calculates the percentage change (**(trim2 - trim1) * 100 / trim1**), and aliases it as *taux_evolution*.

The query provides information about the number of sales in the first and second quarters, as well as the percentage change in sales between the two quarters.


### List of municipalities where the number of sales increased by at least 20% between the first and the second quarter of 2020
- SQL script: [query7.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query7.sql)


This query calculates the percentage change in the number of mutations (property transactions) between two quarters, specifically between January 1, 2020, and March 31, 2020 (first quarter), and between April 1, 2020, and June 30, 2020 (second quarter). It focuses on communes (municipalities) and includes only those where the percentage change in mutations is greater than or equal to 20%.

The query starts with two common table expressions (CTEs), *table1* and *table2*, which calculate the number of mutations (COUNT(DatMut)) for each commune in the respective quarters. The main query then joins *table1* and *table2* based on the commune names (table2.nom_de_commune = table1.nc1). It selects the commune name (**nom_de_commune**) and calculates the percentage change in mutations between the two quarters as **(trim2-trim1)*100/trim1** and aliases it as *taux_evolution*.

The WHERE clause filters the result to include only communes where the percentage change is greater than or equal to 20%. The result is ordered in descending order based on the percentage change (taux_evolution).

The query identifies the communes with a significant percentage increase in mutations between two specific quarters and presents the commune name and the corresponding percentage change in descending order.



# Interprétation des résultats obtenus (FR)

- Au cours du premier semestre 2020, dans le contexte d’un développement d'une pandémie, on note sur le marché immobilier au niveau national une augmentation des ventes de 3% (*requête 6*). Cette croissance peut hypothétiquement être associée aux attentes anxieuses et pessimistes de la population, avec une démarche visant à protéger son épargne en l'investissant dans l'immobilier, ou à disposer d’un logement en milieu périphérique des zones à forte densité de population.
- Les appartements de deux et trois pièces, qui n'étaient pas assez spacieux pour une famille avec enfants, étaient particulièrement demandés sur le marché, car constituaient la meilleure option pour investir dans l'immobilier (*requête 2*).
- Les prix de l'immobilier les plus élevés sont observés dans les départements à climat méditerranéen (Aude, Ariège, Vaucluse, Ardèche) ou atlantique doux (Landes, Charente‐Maritime, Corrèze), ainsi que dans le sud de la Loire (Allier, Saône‐et‐Loire), où il existe de bonnes infrastructures de transport, ainsi que dans le Val‐d'Oise, au nord de Paris (*requête 3*).
- Au niveau des communes, une augmentation significative (plusieurs fois) des ventes est à noter dans les communes aux infrastructures bien développées, situées à proximité des grandes métropoles, mais en dehors des agglomérations urbaines denses (*requête 7*).

# Interpretation of the obtained results (EN)

- During the first semester of 2020, in the context of a developing pandemic, a 3% increase in real estate sales is observed in the national market (*query 6*). This growth can hypothetically be associated with the anxious and pessimistic expectations of the population, with an approach aimed at protecting their savings by investing in real estate, or having a residence in the outskirts of densely populated areas.
- Two and three-bedroom apartments, which were not spacious enough for families with children, were particularly in demand in the market as they represented the best option for real estate investment (*query 2*).
- The highest real estate prices are observed in departments with a Mediterranean climate (Aude, Ariège, Vaucluse, Ardèche) or a mild Atlantic climate (Landes, Charente-Maritime, Corrèze), as well as south of Loire (Allier, Saône-et-Loire), where there are good transportation infrastructures, and in Val-d'Oise, north of Paris (*query 3*).
- At the municipal level, a significant increase (several times) in sales is notable in municipalities with well-developed infrastructures, located near major metropolitan areas but outside dense urban agglomerations (*query 7*).


