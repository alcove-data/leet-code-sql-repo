/*
1211. Queries Quality and Percentage

We define query quality as:
  The average of the ratio between query rating and its position.

We also define poor query percentage as:
  The percentage of all queries with rating less than 3.

Write a solution to find each query_name, the quality and poor_query_percentage.
Both quality and poor_query_percentage should be rounded to 2 decimal places.
Return the result table in any order.
The result format is in the following example.


Table: Queries
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+

Input: 
  Queries
  +------------+-------------------+----------+--------+
  | query_name | result            | position | rating |
  +------------+-------------------+----------+--------+
  | Dog        | Golden Retriever  | 1        | 5      |
  | Dog        | German Shepherd   | 2        | 5      |
  | Dog        | Mule              | 200      | 1      |
  | Cat        | Shirazi           | 5        | 2      |
  | Cat        | Siamese           | 3        | 3      |
  | Cat        | Sphynx            | 7        | 4      |
  +------------+-------------------+----------+--------+
*/


SELECT
    query_name, -- selects the query names
    ROUND(AVG(rating / position), 2) AS quality, -- selects "quality" as defined by the average of the ratio between query rating and its position
    ROUND(100 * SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) / COUNT(*), 2) AS poor_query_percentage -- selects "poor_query_percentage" as defined by the percentage of all queries with rating less than 3
FROM Queries
GROUP BY query_name -- groups the results by query_name


/*
Output: 
  +------------+---------+-----------------------+
  | query_name | quality | poor_query_percentage |
  +------------+---------+-----------------------+
  | Dog        | 2.50    | 33.33                 |
  | Cat        | 0.66    | 33.33                 |
  +------------+---------+-----------------------+
*/
