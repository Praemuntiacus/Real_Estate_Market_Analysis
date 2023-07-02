# Real Estate Market Analysis in France
--------------------------------------------------------------
- SQL dump: [database.sql](Project2/database.sql)
## SQL project analysing the real estate makret in France during 2020

### The total number of apartments sold during the first semester of 2020
- SQL script: [query1.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query1.sql)

- The first line (*SELECT COUNT(DatMut) AS apparts_vendus*) selects the count of records from the mutations *DatMut* column and assigns it an alias *apparts_vendus*. The COUNT function is used to count the number of rows that meet the specified conditions.
- *FROM mutation*: This line specifies the table mutation from which the data will be retrieved.
- *JOIN immobilier ON immobilier.id = mutation.id"*: here I join the *immobilier* table with the *mutation* table based on the *id* column. This allows accessing additional information about the property being sold, which is stored in the *immobilier* table.
- *WHERE TypIm = 'Appartement' AND NatMut = 'Vente' AND DatMut BETWEEN '01-01-2020' AND '30-06-2020'*: here I specify the conditions that the records must meet in order to be included in the result.

- **Result**:
______________
**apparts_vendus**

         31378
______________

### The proportion of apartment sales based on the number of rooms
- SQL script: [query2.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query2.sql)


- *SELECT NbPiece AS pieces, COUNT(NbPiece) as apparts*: here I select two columns from the *immobilier* table. The first column is *NbPiece*, which represents the number of rooms in an apartment. The second column is the count of *NbPiece*, which represents the number of apartments with a specific number of rooms. It is given the alias *apparts*.
- *FROM immobilier*: here I specify the *immobilier* table from which the data will be retrieved. *WHERE TypIm = 'Appartement'*: specification of a condition to filter the records.
- *GROUP BY NbPiece*: here I group the records based on the *NbPiece* column, i.e. the result will be grouped by the number of rooms in an apartment.
- *ORDER BY NbPiece*: here I put in order the result in ascending order based on the *NbPiece* column.
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

- *SELECT CodDept, AVG(ValFon/SrfIm)::decimal(6,2) AS prix_m2*: I select two columns from the result set. The first column is *CodDept* from the *immobilier* table (department code). The second column is the average price per square meter (AVG(ValFon/SrfIm)) calculated by dividing the value of the property (ValFon) by its surface area (SrfIm). The *::decimal(6,2)* syntax specifies that the result should be cast as a decimal number with 6 total digits including 2 decimal places. It is assigned the alias *prix_m2*.
- *FROM immobilier* - the immobilier table from which the data will be retrieved.
- *JOIN department ON department.id = immobilier.id* - the join of the *department* table with the *immobilier* table based on the *id* column. This allows accessing the department information for each property.
- *GROUP BY department.CodDept*: I group the result set by the *CodDept* column of the *department* table to calculate the average price per square meter for each department.
- *ORDER BY prix_m2 DESC*: to order the result set in descending order based on the *prix_m2* column. The departments with the highest average price per square meter will appear first. *LIMIT 10*: to limit the result set to only include the top 10 departments with the highest average price per square meter.


### The average price per square meter for houses in selected departments
- SQL script: [query4.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query4.sql)

This query calculates the average price per square meter (prix_m2_maison_IDF) for houses (TypIm = 'Maison') in the Île-de-France region (specifically departments with codes '75', '77', '78', '91', '92', '93', '94', '95').

The query uses two subqueries (*tab1* and *tab2*) to calculate the necessary aggregates. The first subquery (*tab1*) calculates the total price (prix_m2_total) for each house (TypIm) in the specified departments, by summing the price (ValFon) from the *immobilier* table. The second subquery (*tab2*) calculates the total surface area (srf_total) for each house (TypIm) in the specified departments, by summing the surface area (SrfIm) from the *immobilier* table.

These two subqueries are joined using the JOIN statement, matching records with the same TypIm (house type). The result is a single row for each house type, with the average price per square meter calculated by dividing the total price by the total surface area, rounded to 2 decimal places.

The final result of the query is the average price per square meter (prix_m2_maison_IDF) for houses (TypIm = 'Maison') in the Île-de-France region.
