# My Portfolio
--------------------------------------------------------------
## Project 1: Analysis of World Chicken Market (Python: clustering, PCA, Geopandas)

Description: This is my Python project showcasing my skills in data analysis.

- Python script: [Code and visualisations](Project1/analysis.py](https://github.com/Praemuntiacus/Roman_Portfolio/blob/main/CROITOR_Roman_1_html_062022.html))
- Dataset: [data.csv](Project1/data.csv)
---------------------------------------------------------------
## Project 2: SQL Project

**DESCRIPTION**: A SQL project analysing the real estate makret in France during 2020.
 
- SQL script: [queries.sql]([Project2/queries.sql](https://github.com/Praemuntiacus/Roman_Portfolio/blob/main/query1.sql))

**This SQL code retrieves the total number of apartments sold during the first semester of 2020**. The first line (*SELECT COUNT(DatMut) AS apparts_vendus*) selects the count of records from the mutations *DatMut* column and assigns it an alias *apparts_vendus*. The COUNT function is used to count the number of rows that meet the specified conditions. *FROM mutation*: This line specifies the table mutation from which the data will be retrieved. *JOIN immobilier ON immobilier.id = mutation.id"*: here I join the *immobilier* table with the *mutation* table based on the *id* column. This allows accessing additional information about the property being sold, which is stored in the *immobilier* table. *WHERE TypIm = 'Appartement' AND NatMut = 'Vente' AND DatMut BETWEEN '01-01-2020' AND '30-06-2020'*: here I specify the conditions that the records must meet in order to be included in the result.

- SQL dump: [database.sql](Project2/database.sql)
- **Result**:
**apparts_vendus**
______________
         31378

- SQL script: [queries.sql]([Project2/queries.sql]([https://github.com/Praemuntiacus/Roman_Portfolio/blob/main/query2.sql])
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



## Project 3: Analysis of Accessibility to Drinking Water in the World (Tableau)

DESCRIPTION: A Tableau visualization project showcasing an in-depth analysis of global drinking water resources. The analysis spans across the global, regional, and national levels, encompassing factors such as geopolitical stability, water resource availability, epidemiological and demographic situations, water stress index, and infrastructure development. The project incorporates a chronological filter that enables tracking the evolution and dynamics of demographics and geopolitical stability worldwide over the past 20 years. Additionally, at the regional level, the filters allow for assessing water stress characteristics specific to each part of the world. At the national level, the filters provide insights into the demographic situation, access to water resources, and the effectiveness of water policies for individual countries. It further facilitates monitoring the evolution of selected parameters over the last two decades.

![Project Image](https://github.com/Praemuntiacus/Roman_Portfolio/blob/main/Roman%20CROITOR%20(OpenClassrooms%2C%202022).png)
This is an analytical scheme to organize the questions for analysis. Employed a color-coded system to enhance information structuring.

- Tableau workbook: [Etude sur l'eau potable](https://public.tableau.com/app/profile/roman4891/viz/Croitorwateraccessproject8/STORY)
- Data sources: [FAO](https://www.fao.org/faostat/en/#data), [World Resource Institute](https://www.wri.org/aqueduct)


