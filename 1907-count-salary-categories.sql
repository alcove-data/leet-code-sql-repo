/*
1907. Count Salary Categories

Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:
"Low Salary": All the salaries strictly less than $20000.
"Average Salary": All the salaries in the inclusive range [$20000, $50000].
"High Salary": All the salaries strictly greater than $50000.
The result table must contain all three categories. If there are no accounts in a category, return 0.
Return the result table in any order.

Table: Accounts
+-------------+------+
| Column Name | Type |
+-------------+------+
| account_id  | int  |
| income      | int  |
+-------------+------+


Input: 
  Accounts:
  +------------+--------+
  | account_id | income |
  +------------+--------+
  | 3          | 108939 |
  | 2          | 12747  |
  | 8          | 87709  |
  | 6          | 91796  |
  +------------+--------+
*/


SELECT "Low Salary" AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000  -- defines the "Low Salary" category as below 20000

UNION ALL  -- creates a union with all columns from the Accounts table

SELECT "Average Salary" AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income >= 20000 AND income <= 50000  -- defines the "Average Salary" category as between 20000 and 50000

UNION ALL  -- creates a union with all columns from the Accounts table

SELECT "High Salary" AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income > 50000  -- defines the "High Salary" category as above 50000


/*
Output: 
  +----------------+----------------+
  | category       | accounts_count |
  +----------------+----------------+
  | Low Salary     | 1              |
  | Average Salary | 0              |
  | High Salary    | 3              |
  +----------------+----------------+
*/
