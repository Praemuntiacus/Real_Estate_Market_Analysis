# Real Estate Market Analysis in France
--------------------------------------------------------------
## SQL project analysing the real estate makret in France during 2020
 
- SQL script: [query1.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query1.sql)

**This SQL code retrieves the total number of apartments sold during the first semester of 2020**. The first line (*SELECT COUNT(DatMut) AS apparts_vendus*) selects the count of records from the mutations *DatMut* column and assigns it an alias *apparts_vendus*. The COUNT function is used to count the number of rows that meet the specified conditions. *FROM mutation*: This line specifies the table mutation from which the data will be retrieved. *JOIN immobilier ON immobilier.id = mutation.id"*: here I join the *immobilier* table with the *mutation* table based on the *id* column. This allows accessing additional information about the property being sold, which is stored in the *immobilier* table. *WHERE TypIm = 'Appartement' AND NatMut = 'Vente' AND DatMut BETWEEN '01-01-2020' AND '30-06-2020'*: here I specify the conditions that the records must meet in order to be included in the result.

- SQL dump: [database.sql](Project2/database.sql)
- **Result**:
______________
**apparts_vendus**
______________
         31378
______________

- SQL script: [query2.sql](https://github.com/Praemuntiacus/Real_Estate_Market_Analysis/blob/main/query2.sql)

**This SQL code calculates the proportion of apartment sales based on the number of rooms.** *SELECT NbPiece AS pieces, COUNT(NbPiece) as apparts*: here I select two columns from the *immobilier* table. The first column is *NbPiece*, which represents the number of rooms in an apartment. The second column is the count of *NbPiece*, which represents the number of apartments with a specific number of rooms. It is given the alias *apparts*. *FROM immobilier*: here I specify the *immobilier* table from which the data will be retrieved. *WHERE TypIm = 'Appartement'*: specification of a condition to filter the records. *GROUP BY NbPiece*: here I group the records based on the *NbPiece* column, i.e. the result will be grouped by the number of rooms in an apartment. *ORDER BY NbPiece*: here I put in order the result in ascending order based on the *NbPiece* column.
- **Result**:

**pieces**  **apparts**
------  -------
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

