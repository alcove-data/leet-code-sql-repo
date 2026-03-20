/*
610. Triangle Judgement

Report for every three line segments whether they can form a triangle.
Return the result table in any order.

Table: Triangle
+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+


Input:
  Triangle:
  +----+----+----+
  | x  | y  | z  |
  +----+----+----+
  | 13 | 15 | 30 |
  | 10 | 20 | 15 |
  +----+----+----+
*/


SELECT *,
    CASE WHEN x+y > z AND x+z > y AND y+z > x THEN "Yes" ELSE "No" END AS triangle -- uses the triangle inequality theorem to return "Yes" only if it meets all criteria, otherwise returns "No"
FROM Triangle


/*
Output:
  +----+----+----+----------+
  | x  | y  | z  | triangle |
  +----+----+----+----------+
  | 13 | 15 | 30 | No       |
  | 10 | 20 | 15 | Yes      |
  +----+----+----+----------+
*/
