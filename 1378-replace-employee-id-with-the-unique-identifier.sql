/*
1378. Replace Employee ID With The Unique Identifier

Write a solution to show the unique ID of each user.
If a user does not have a unique ID replace just show null.
Return the result table in any order.
The result format is in the following example.


Table: Employees
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+

Table: EmployeeUNI
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| unique_id     | int     |
+---------------+---------+

Input: 
  Employees
  +----+----------+
  | id | name     |
  +----+----------+
  | 1  | Alice    |
  | 7  | Bob      |
  | 11 | Meir     |
  | 90 | Winston  |
  | 3  | Jonathan |
  +----+----------+

  EmployeeUNI
  +----+-----------+
  | id | unique_id |
  +----+-----------+
  | 3  | 1         |
  | 11 | 2         |
  | 90 | 3         |
  +----+-----------+
*/


SELECT
  EmployeeUNI.unique_id, -- selects the unique id from from EmployeeUNI table
  Employees.name -- selects the employee's name from Employees table
FROM EmployeeUNI
RIGHT JOIN Employees ON EmployeeUNI.id = Employees.id -- joins Employees to EmployeeUNI on id to match employees with their unique ids


/*
Output: 
  +-----------+----------+
  | unique_id | name     |
  +-----------+----------+
  | null      | Alice    |
  | null      | Bob      |
  | 2         | Meir     |
  | 3         | Winston  |
  | 1         | Jonathan |
  +-----------+----------+
*/
