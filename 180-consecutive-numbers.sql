/*
180. Consecutive Numbers

Find all numbers that appear at least three times consecutively.
Return the result table in any order.

Table: Logs
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+


Input: 
  Logs:
  +----+-----+
  | id | num |
  +----+-----+
  | 1  | 1   |
  | 2  | 1   |
  | 3  | 1   |
  | 4  | 2   |
  | 5  | 1   |
  | 6  | 2   |
  | 7  | 2   |
  +----+-----+
*/


WITH CN AS (
    SELECT
        CASE WHEN num = LEAD(num, 1) OVER (ORDER BY id) AND num = LAG(num, 1) OVER (ORDER BY id) THEN num ELSE NULL END AS ConsecutiveNums
    FROM Logs
) -- creates a table of consecutive numbers by comparing current number to adjacent leading and lagging values while preserving id order
SELECT DISTINCT ConsecutiveNums
FROM CN
WHERE ConsecutiveNums IS NOT NULL -- since ELSE case created NULL values, omits these from the output


/*
Output:
  +-----------------+
  | ConsecutiveNums |
  +-----------------+
  | 1               |
  +-----------------+
*/
