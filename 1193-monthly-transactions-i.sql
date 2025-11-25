/*
1193. Monthly Transactions I

Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.
Return the result table in any order.
The query result format is in the following example.


Table: Transactions
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+

Input: 
  Transactions
  +------+---------+----------+--------+------------+
  | id   | country | state    | amount | trans_date |
  +------+---------+----------+--------+------------+
  | 121  | US      | approved | 1000   | 2018-12-18 |
  | 122  | US      | declined | 2000   | 2018-12-19 |
  | 123  | US      | approved | 2000   | 2019-01-01 |
  | 124  | DE      | approved | 2000   | 2019-01-07 |
  +------+---------+----------+--------+------------+
*/


SELECT
    LEFT(trans_date, 7) AS month, -- selects a substring of trans_date (YYYY-MM)
    country, -- selects the country that made the transaction(s)
    COUNT(DISTINCT id) AS trans_count, -- for each distinct id, counts the number of transactions
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count, -- for each distinct id, counts the number of approved transactions
    SUM(amount) AS trans_total_amount, -- returns the total amount of all transactions
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount -- returns the total amount of only approved transactions
FROM Transactions
GROUP BY
    month, -- groups the results by month (YYYY-MM)
    country -- groups the results by country


/*
Output: 
  +----------+---------+-------------+----------------+--------------------+-----------------------+
  | month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
  +----------+---------+-------------+----------------+--------------------+-----------------------+
  | 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
  | 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
  | 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
  +----------+---------+-------------+----------------+--------------------+-----------------------+
*/
