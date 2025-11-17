/*
1633. Percentage of Users Attended a Contest

Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
Return the result table ordered by percentage in descending order.
In case of a tie, order it by contest_id in ascending order.
The result format is in the following example.


Table: Users
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| user_name   | varchar |
+-------------+---------+

Table: Register
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| contest_id  | int     |
| user_id     | int     |
+-------------+---------+

Input: 
  Users
  +---------+-----------+
  | user_id | user_name |
  +---------+-----------+
  | 6       | Alice     |
  | 2       | Bob       |
  | 7       | Alex      |
  +---------+-----------+

  Register
  +------------+---------+
  | contest_id | user_id |
  +------------+---------+
  | 215        | 6       |
  | 209        | 2       |
  | 208        | 2       |
  | 210        | 6       |
  | 208        | 6       |
  | 209        | 7       |
  | 209        | 6       |
  | 215        | 7       |
  | 208        | 7       |
  | 210        | 2       |
  | 207        | 2       |
  | 210        | 7       |
  +------------+---------+
*/


SELECT
    Register.contest_id, -- selects the contest ids from the Register table
    ROUND(COUNT(DISTINCT Register.user_id) * 100 / Combined.total, 2) AS percentage -- creates a column 'percentage' which is calculated as distinct user ids divided by total users
FROM Register
CROSS JOIN (SELECT COUNT(*) AS total FROM Users) Combined -- creates a table to get the total count of all users
GROUP BY Register.contest_id -- groups the results by contest id
ORDER BY percentage DESC, Register.contest_id ASC -- orders the participation per contest from highest to lowest and, in the event of a tie, orders contest id from smallest to largest


/*
Output: 
  +------------+------------+
  | contest_id | percentage |
  +------------+------------+
  | 208        | 100.0      |
  | 209        | 100.0      |
  | 210        | 100.0      |
  | 215        | 66.67      |
  | 207        | 33.33      |
  +------------+------------+
*/
