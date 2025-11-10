#1581. Customer Who Visited but Did Not Make Any Transactions

#Table: Visits
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| visit_id    | int     |
#| customer_id | int     |
#+-------------+---------+

#Table: Transactions
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| transaction_id | int     |
#| visit_id       | int     |
#| amount         | int     |
#+----------------+---------+

#Input: 
#  Visits
#  +----------+-------------+
#  | visit_id | customer_id |
#  +----------+-------------+
#  | 1        | 23          |
#  | 2        | 9           |
#  | 4        | 30          |
#  | 5        | 54          |
#  | 6        | 96          |
#  | 7        | 54          |
#  | 8        | 54          |
#  +----------+-------------+

#  Transactions
#  +----------------+----------+--------+
#  | transaction_id | visit_id | amount |
#  +----------------+----------+--------+
#  | 2              | 5        | 310    |
#  | 3              | 5        | 300    |
#  | 9              | 5        | 200    |
#  | 12             | 1        | 910    |
#  | 13             | 2        | 970    |
#  +----------------+----------+--------+

  
#Joins Visits table with Transactions table, then returns the IDs of users who visited without making any transactions along with the number of times this event occurred
SELECT Visits.customer_id, COUNT(Visits.visit_id) AS count_no_trans
  FROM Visits
  LEFT JOIN Transactions ON Visits.visit_id = Transactions.visit_id
  WHERE Transactions.transaction_id IS NULL
  GROUP BY Visits.customer_id;


#Output: 
#  +-------------+----------------+
#  | customer_id | count_no_trans |
#  +-------------+----------------+
#  | 54          | 2              |
#  | 30          | 1              |
#  | 96          | 1              |
#  +-------------+----------------+
