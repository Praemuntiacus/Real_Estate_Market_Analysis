# Real Estate Market Analysis in France

## SQL project analysing the real estate makret in France during 2020

The project was carried out during my study at **OpenClassroom** in 2021. The data comes from [data.gouv.fr](https://www.data.gouv.fr) and contains real estate transactions in France during the first half of 2020. To implement the project, I created a database using **Power Architect** and **PostgreSQL**.

- Here is the structure of database:
  
**Table: immobilier**
| Column    | Data Type |
|-----------|-----------|
| id        | Primary Key |
| NbPiece   | INTEGER   |
| TypIm     | VARCHAR   |
| ValFon    | INTEGER   |
| SrfIm     | DECIMAL   |
| id_com    | Foreign Key (commune.id) |
| id_dept   | Foreign Key (department.id) |

**Table: mutation**
| Column    | Data Type |
|-----------|-----------|
| id        | Primary Key |
| NatMut    | VARCHAR   |
| DatMut    | DATE      |
| id_im     | Foreign Key (immobilier.id) |
| id_com    | Foreign Key (commune.id) |

**Table: commune**
| Column    | Data Type |
|-----------|-----------|
| id        | Primary Key |
| NomCom    | VARCHAR     |
| id_dept   | Foreign Key (department.id) |

**Table: department**
| Column    | Data Type |
|-----------|-----------|
| id        | Primary Key |
| CodDept   | VARCHAR     |

______________________________________________________

### The total number of apartments sold during the first semester of 2020
- SQL script: [query1.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query1.sql)

The query counts the number of apartments (**apparts_vendus**) that were sold (**NatMut** = *'Vente'*) within a specific date range (DatMut BETWEEN '2020-01-01' AND '2020-06-30'). The SELECT statement uses the COUNT function to count the occurrences of *immobilier.id* and aliases it as *apparts_vendus*.

The query joins the *immobilier* table with the *mutation* table using a left join (LEFT JOIN) with the join condition *mutation.id = immobilier.id*. The WHERE clause filters the records to include only apartments (**TypIm** = *'Appartement'*), sales transactions (**NatMut** = *'Vente'*), and a specific date range (DatMut BETWEEN '2020-01-01' AND '2020-06-30').

The query calculates and returns the count of apartments (apparts_vendus) that were sold within the specified date range:

| apparts_vendus |
|----------------|
|   31378        |

__________________________________________________________

### The proportion of apartment sales based on the number of rooms
- SQL script: [query2.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query2.sql)


The query provides information about the number of sold apartments grouped by the number of rooms (**NbPiece**). The SELECT statement retrieves the **NbPiece** column as pieces and counts the occurrences of each **NbPiece** value using COUNT(NbPiece) as **nombr_appart**.

The expression (COUNT(NbPiece) * 100 / (SELECT COUNT(id) FROM immobilier WHERE TypIm = 'Appartement')) calculates the percentage of apartments (**prsnt_appart**) for each number of rooms (NbPiece). It divides the count of apartments for a specific number of rooms by the total count of apartments, obtained from a subquery.

The WHERE clause filters the records to include only apartments (**TypIm** = *'Appartement'*). The GROUP BY clause groups the result by the number of rooms (**NbPiece**). The ORDER BY clause orders the result by the number of rooms (**NbPiece**).

The query presents the number of apartments (nombr_appart), grouped by the number of rooms (pieces), and also provides the percentage of apartments (prsnt_appart) for each number of rooms. The results are ordered based on the number of rooms:

| pieces    | nombr_appart | prsnt_appart |
|-----------|--------------|--------------|
|    0      |        30    |       0      |
|     1     |      6739    |      21      |
|     2     |      9783    |      31      |
|     3     |      8966    |      28      |
|     4     |      4460    |      14      |
|     5     |      1114    |       3      |
|     6     |       204    |       0      |
|     7     |        54    |       0      |
|     8     |        17    |       0      |
|     9     |         8    |       0      |
|    10     |         2    |       0      |
|    11     |         1    |       0      |

_________________________________________

### The average price per square meter for real estate properties in each department
- SQL script: [query3.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query3.sql)

The query calculates the average price per square meter (**prix_m2**) for each department (**CodDept**) based on the price (**ValFon**) and surface area (**SrfIm**) data from the *immobilier* table. The join condition *department.id = immobilier.id_dept* ensures that the corresponding records are matched between the department and immobilier tables. The result is grouped by department (GROUP BY department.CodDept), and the AVG function calculates the average valuation per surface area for each department. The ROUND function is used to round the calculated average price per square meter to 2 decimal places. The results are then ordered in descending order of **prix_m2** using the ORDER BY clause. Finally, the LIMIT 10 clause is used to retrieve only the top 10 departments with the highest average price per square meter.

The query provides the top 10 departments with the highest average price per square meter based on the valuation and surface area data from the immobilier table:

| coddept | prix_m2 |
|---------|---------|
| 11      | 9166.67 |
| 17      | 6381.25 |
| 95      | 6130.43 |
| 84      | 5872.09 |
|  9      | 5865.94 |
|  3      | 5538.46 |
| 19      | 5238.10 |
| 71      | 5232.13 |
|  7      | 5038.46 |
| 40      | 4888.89 |

____________________________________________________________________________

### The average price per square meter for houses in selected departments
- SQL script: [query4.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query4.sql)

This query calculates the average price per square meter (prix_m2_maison_IDF) for houses (TypIm = 'Maison') in the Île-de-France region (specifically departments with codes '75', '77', '78', '91', '92', '93', '94', '95').

The query uses two subqueries (*tab1* and *tab2*) to calculate the necessary aggregates. The first subquery (*tab1*) calculates the total price (prix_m2_total) for each house (TypIm) in the specified departments, by summing the price (ValFon) from the *immobilier* table. The second subquery (*tab2*) calculates the total surface area (srf_total) for each house (TypIm) in the specified departments, by summing the surface area (SrfIm) from the *immobilier* table.

These two subqueries are joined using the JOIN statement, matching records with the same TypIm (house type). The result is a single row for each house type, with the average price per square meter calculated by dividing the total price by the total surface area, rounded to 2 decimal places.

The final result of the query is the average price per square meter (**prix_m2_maison_IDF**) for houses (TypIm = 'Maison') in the Île-de-France region:

| prix_m2_maison_IDF |
|--------------------|
|     3904.07        |

_________________________________________________________________________________________

### The top 10 most expensive apartments
- SQL script: [query5.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query5.sql)

The query retrieves information about the top 10 apartments (**Appartement**) based on their valuation (**ValFon**), including the department code (**CodDept**) and the surface area (**SrfIm**) of each apartment.

The SELECT statement selects the department code as *departement*, the surface area as *surface_appart*, and the price as *prix*. The query performs an INNER JOIN between the *immobilier* and *department* tables using the foreign key relationship (department.id = immobilier.id_dept) to match the records based on the department.

The WHERE clause filters the records to include only apartments (**TypIm** = *'Appartement'*). The ORDER BY clause arranges the result in descending order based on the valuation (**ValFon**), so the apartments with the highest valuations will appear first. The LIMIT 10 clause limits the result to only the top 10 apartments with the highest valuations.

The query retrieves the department code, surface area, and valuation for the top 10 apartments based on their valuation, with the apartments sorted in descending order of valuation:

| appartment_id | surface_appart            | prix    | department |
|---------------|---------------------------|---------|------------|
|   3           | VITROLLES                 | 720000  |     3      |
|   87          | CHATEAUNEUF-LES-MARTIGUES | 640000  |    91      |
|   57          | GRAVESON                  | 580450  |    58      |
|   16          | SAINT-QUENTIN-DE-BARON    | 561550  |    17      |
|   30          | CADAUJAC                  | 486415  |    30      |
|   44          | LEGE-CAP-FERRET           | 475150  |    44      |
|   68          | MARQUETTE-LES-LILLE       | 465660  |    71      |
|   17          | WATTRELOS                 | 358000  |    18      |
|   60          | WASQUEHAL                 | 352300  |    61      |
|   50          | SAINT-ANDRE DE LA ROCHE   | 332500  |    50      |


__________________________________________________________________________________________

### Rate of change in the number of sales between the first and second quarters of 2020
- SQL script: [query6.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query6.sql)

This query calculates various statistics related to property sales (**NatMut** = *'Vente'*) during two selected quarters of the year.

The first two SUM(CASE ... END) expressions calculate the number of sales (1) that occurred within the specified date ranges for the first quarter (**trimestre1**) and the second quarter (**trimestre2**).

The subsequent WITH clause defines two *subqueries*, **table1** and **table2**, which calculate the number of sales (COUNT(DatMut)) within the respective date ranges for the first and second quarters. The last query retrieves the difference in the number of sales between the second and first quarters (**trim2 - trim1**), calculates the percentage change (**(trim2 - trim1) * 100 / trim1**), and aliases it as *taux_evolution*.

The query provides information about the number of sales in the first and second quarters, as well as the percentage change in sales between the two quarters:

| trimestre1 | trimestre2 | taux_evolution |
|------------|------------|----------------|
| 16776      | 17393      | 3              |

______________________________________________________________________________________

### List of municipalities where the number of sales increased by at least 20% between the first and the second quarter of 2020
- SQL script: [query7.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query7.sql)

This query calculates the percentage change in the number of mutations (property transactions) between two quarters, specifically between January 1, 2020, and March 31, 2020 (first quarter), and between April 1, 2020, and June 30, 2020 (second quarter). It focuses on communes (municipalities) and includes only those where the percentage change in mutations is greater than or equal to 20%.

The query starts with two common table expressions (CTEs), *table1* and *table2*, which calculate the number of mutations (COUNT(DatMut)) for each commune in the respective quarters. The main query then joins *table1* and *table2* based on the commune names (table2.nom_de_commune = table1.nc1). It selects the commune name (**nom_de_commune**) and calculates the percentage change in mutations between the two quarters as **(trim2-trim1)*100/trim1** and aliases it as *taux_evolution*.

The WHERE clause filters the result to include only communes where the percentage change is greater than or equal to 20%. The result is ordered in descending order based on the percentage change (taux_evolution).

The query identifies the communes with a significant percentage increase in mutations between two specific quarters and presents the commune name and the corresponding percentage change in descending order:

| nom_de_commune          | taux_evolution |
|-------------------------|----------------|
| SAINTE MENEHOULD        | 900            |
| FERRAY-EN-EVELINES (LE) | 800            |
| ROUEN                   | 716            |
| RAMONVILLE ST AGNE      | 700            |
| ROSCOFF                 | 600            |
| VERNON                  | 550            |
| HESGIGNEUL-LES-BETHUNE  | 512            |
| PLOUGASNOU              | 500            |
| VOREPPE                 | 450            |
| VIVIERS                 | 450            |

________________________________________________________________________________________________

### Percentage difference in price per square meter between a 2 room apartment and a 3 room apartment
- SQL script: [query8.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query8.sql)

This query calculates and compares the average price per square meter (**prix_m2**) for apartments with 2 rooms (**NbPiece** = 2) and 3 rooms (**NbPiece** = 3). It also calculates the percentage difference (**prct_dif**) between these two average prices.

The query uses two subqueries (**T2** and **T3**) to calculate the average price per square meter for each room configuration. The subquery **T2** calculates the average price per square meter (**prix_m2_t2**) for apartments with 2 rooms, while the subquery **T3** calculates the average price per square meter (**prix_m2_t3**) for apartments with 3 rooms.

The main query selects the calculated average prices per square meter (**T2.prix_m2_t2** and **T3.prix_m2_t3**) from the subqueries. It also calculates the percentage difference between the average prices using the formula (**(T2.prix_m2_t2 - T3.prix_m2_t3) / T2.prix_m2_t2 * 100)::decimal(6,2)** and aliases it as **prct_dif**.

The query compares the average prices per square meter for apartments with 2 rooms and 3 rooms and calculates the percentage difference between them. The results provide insights into the price variation between these two room configurations:

| prix_m2_t2 | prix_m2_t3 | prct_dif |
|------------|------------|----------|
| 4763.41    | 4228.27    | 11.23    |

___________________________________________________________________________

###  Average land values for the top 3 municipalities in departments 6, 13, 33, 59 and 69
- SQL script: [query9.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query9.sql)

This query retrieves the top 3 communes with the highest average property values (val_fon_M) in each of the specified departments. It focuses on the departments with the codes '6', '13', '33', '59', and '69'. The query consists of multiple subqueries that use the UNION operator to combine the results. Each subquery retrieves the average property values per commune in a specific department. It performs left joins between the *immobilier*, *commune*, and *department* tables to get the necessary data. Within each subquery, the results are grouped by commune name (**NomCom**) and department code (**CodDept**). The average property values are calculated using AVG(ValFon) and are cast to decimal(8,2).

The **ORDER BY val_fon_M DESC** clause sorts the results within each subquery in descending order based on the average property values. The LIMIT 3 clause ensures that only the top 3 communes with the highest average values are returned in each subquery.

The outermost query combines the results of all the subqueries using UNION and orders the combined results by the department code (departements). The query retrieves the top 3 communes with the highest average property values in each of the specified departments and presents the results in ascending order of the department code:


| val_fon_m | communes                  | departments |
|-----------|---------------------------|-------------|
| 710418.08 | VITROLLES                 |     13      |
| 350952.31 | CHATEAUNEUF-LES-MARTIGUES |     13      |
| 288783.10 | GRAVESON                  |     13      |
| 321013.16 | SAINT-QUENTIN-DE-BARON    |     33      |
| 401427.10 | CADAUJAC                  |     33      |
| 308410.33 | LEGE-CAP-FERRET           |     33      |
| 316674.69 | MARQUETTE-LES-LILLE       |     59      |
| 384581.19 | WATTRELOS                 |     59      |
| 402124.80 | WASQUEHAL                 |     59      |
| 418647.66 | SAINT-ANDRE DE LA ROCHE   |      6      |
| 534390.19 | LA ROQUETTE SUR SIQGNE    |      6      |
| 518982.24 | ROQUEBRUNE CAP MARTIN     |      6      |
| 220134.07 | SAINT LAURENT D'AGNY      |     69      |
| 283191.67 | SATHONAY-CAMP             |     69      |
| 239600.00 | SAINT-PIERRE-DE-CHANDIEU  |     69      |

________________________________________________________________________________________

https://user-images.githubusercontent.com/125415799/250949983-ab739c25-fca3-4888-abce-b1bd5f80c8d9.png
# Interprétation des résultats obtenus

- Au cours du premier semestre 2020, dans le contexte d’un développement d'une pandémie, on note sur le marché immobilier au niveau national une augmentation des ventes de 3% (*requête 6*). Cette croissance peut hypothétiquement être associée aux attentes anxieuses et pessimistes de la population, avec une démarche visant à protéger son épargne en l'investissant dans l'immobilier, ou à disposer d’un logement en milieu périphérique des zones à forte densité de population.
- Les appartements de deux et trois pièces, qui n'étaient pas assez spacieux pour une famille avec enfants, étaient particulièrement demandés sur le marché, car constituaient la meilleure option pour investir dans l'immobilier (*requête 2*).
- Les prix de l'immobilier les plus élevés sont observés dans les départements à climat méditerranéen (Aude, Ariège, Vaucluse, Ardèche) ou atlantique doux (Landes, Charente‐Maritime, Corrèze), ainsi que dans le sud de la Loire (Allier, Saône‐et‐Loire), où il existe de bonnes infrastructures de transport, ainsi que dans le Val‐d'Oise, au nord de Paris (*requête 3*).
- Au niveau des communes, une augmentation significative (plusieurs fois) des ventes est à noter dans les communes aux infrastructures bien développées, situées à proximité des grandes métropoles, mais en dehors des agglomérations urbaines denses (*requête 7*).

https://user-images.githubusercontent.com/125415799/250949859-2a1d2422-cab4-4d99-b737-ca419fd85372.png
# Interpretation of the obtained results

- During the first semester of 2020, in the context of a developing pandemic, a 3% increase in real estate sales is observed in the national market (*query 6*). This growth can hypothetically be associated with the anxious and pessimistic expectations of the population, with an approach aimed at protecting their savings by investing in real estate, or having a residence in the outskirts of densely populated areas.
- Two and three-bedroom apartments, which were not spacious enough for families with children, were particularly in demand in the market as they represented the best option for real estate investment (*query 2*).
- The highest real estate prices are observed in departments with a Mediterranean climate (Aude, Ariège, Vaucluse, Ardèche) or a mild Atlantic climate (Landes, Charente-Maritime, Corrèze), as well as south of Loire (Allier, Saône-et-Loire), where there are good transportation infrastructures, and in Val-d'Oise, north of Paris (*query 3*).
- At the municipal level, a significant increase (several times) in sales is notable in municipalities with well-developed infrastructures, located near major metropolitan areas but outside dense urban agglomerations (*query 7*).

__________________________________________________________________________________________________________________________
