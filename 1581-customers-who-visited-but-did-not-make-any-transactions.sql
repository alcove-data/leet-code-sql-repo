/*
1581. Customer Who Visited but Did Not Make Any Transactions

Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
Return the result table sorted in any order.
The result format is in the following example.


Table: Visits
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+

Table: Transactions
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+

Input: 
  Visits
  +----------+-------------+
  | visit_id | customer_id |
  +----------+-------------+
  | 1        | 23          |
  | 2        | 9           |
  | 4        | 30          |
  | 5        | 54          |
  | 6        | 96          |
  | 7        | 54          |
  | 8        | 54          |
  +----------+-------------+

  Transactions
  +----------------+----------+--------+
  | transaction_id | visit_id | amount |
  +----------------+----------+--------+
  | 2              | 5        | 310    |
  | 3              | 5        | 300    |
  | 9              | 5        | 200    |
  | 12             | 1        | 910    |
  | 13             | 2        | 970    |
  +----------------+----------+--------+
*/


SELECT
  Visits.customer_id, -- selects the customer id from VIsits table
  COUNT(Visits.visit_id) AS count_no_trans -- counts the number of visits without any transactions
  FROM Visits
  LEFT JOIN Transactions ON Visits.visit_id = Transactions.visit_id -- joins Visits to Transactions on visit_id
  WHERE Transactions.transaction_id IS NULL -- keeps only visits without a corresponding transaction
  GROUP BY Visits.customer_id -- groups results by customer


/*
Output: 
  +-------------+----------------+
  | customer_id | count_no_trans |
  +-------------+----------------+
  | 54          | 2              |
  | 30          | 1              |
  | 96          | 1              |
  +-------------+----------------+
*/
