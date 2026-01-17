/*
596. Classes With at Least 5 Students

Write a solution to find all the classes that have at least five students.
Return the result table in any order.
The result format is in the following example.


Table: Courses
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+

Input:
  Courses
  +---------+----------+
  | student | class    |
  +---------+----------+
  | A       | Math     |
  | B       | English  |
  | C       | Math     |
  | D       | Biology  |
  | E       | Math     |
  | F       | Computer |
  | G       | Math     |
  | H       | Math     |
  | I       | Math     |
  +---------+----------+
*/


SELECT class -- selects the name of the class
FROM Courses
GROUP BY class -- groups the results by class name
HAVING COUNT(student) >= 5 -- returns only classes with at least 5 students


/*
Output: 
  +---------+
  | class   |
  +---------+
  | Math    |
  +---------+
*/
