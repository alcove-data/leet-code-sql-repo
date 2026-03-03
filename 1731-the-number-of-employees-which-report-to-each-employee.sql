/*
1731. The Number of Employees Which Report to Each Employee

For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
Return the result table ordered by employee_id.


Table: Employees
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| reports_to  | int      |
| age         | int      |
+-------------+----------+


Example 1:
Input:
  Employees:
  +-------------+---------+------------+-----+
  | employee_id | name    | reports_to | age |
  +-------------+---------+------------+-----+
  | 9           | Hercy   | null       | 43  |
  | 6           | Alice   | 9          | 41  |
  | 4           | Bob     | 9          | 36  |
  | 2           | Winston | null       | 37  |
  +-------------+---------+------------+-----+

Example 2:
Input:
  Employees:
  +-------------+---------+------------+-----+ 
  | employee_id | name    | reports_to | age |
  |-------------|---------|------------|-----|
  | 1           | Michael | null       | 45  |
  | 2           | Alice   | 1          | 38  |
  | 3           | Bob     | 1          | 42  |
  | 4           | Charlie | 2          | 34  |
  | 5           | David   | 2          | 40  |
  | 6           | Eve     | 3          | 37  |
  | 7           | Frank   | null       | 50  |
  | 8           | Grace   | null       | 48  |
  +-------------+---------+------------+-----+ 
*/


SELECT
    e_one.employee_id,
    e_one.name,
    COUNT(e_two.employee_id) AS reports_count,  -- returns the number of employees that report to a manager
    ROUND(AVG(e_two.age), 0) AS average_age  -- rounds the average age of all direct reports to the nearest whole number
FROM Employees e_one
JOIN Employees e_two ON e_one.employee_id = e_two.reports_to  -- self-joins the Employee table on employee_id and reports_to
GROUP BY e_one.employee_id  -- groups the results by employee_id
ORDER BY e_one.employee_id  -- orders the results by employee_id


/*
Example 1:
Output:
  +-------------+-------+---------------+-------------+
  | employee_id | name  | reports_count | average_age |
  +-------------+-------+---------------+-------------+
  | 9           | Hercy | 2             | 39          |
  +-------------+-------+---------------+-------------+

Example 2:
Output:
  +-------------+---------+---------------+-------------+
  | employee_id | name    | reports_count | average_age |
  | ----------- | ------- | ------------- | ----------- |
  | 1           | Michael | 2             | 40          |
  | 2           | Alice   | 2             | 37          |
  | 3           | Bob     | 1             | 37          |
  +-------------+---------+---------------+-------------+
*/
