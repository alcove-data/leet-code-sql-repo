/*
1667. Fix Names in a Table

Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.
Return the result table ordered by user_id.

Table: Users
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| name           | varchar |
+----------------+---------+

Input: 
  Users:
  +---------+-------+
  | user_id | name  |
  +---------+-------+
  | 1       | aLice |
  | 2       | bOB   |
  +---------+-------+
*/


SELECT
    user_id,
    CONCAT(UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name, 2))) as name  -- casts the first character of a string to upper case & casts the following characters to lower case
FROM Users
ORDER BY user_id  -- orders the results by user id


/*
Output:
  +---------+-------+
  | user_id | name  |
  +---------+-------+
  | 1       | Alice |
  | 2       | Bob   |
  +---------+-------+
*/
