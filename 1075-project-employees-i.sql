/*
1075. Project Employees I

Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
Return the result table in any order.
The query result format is in the following example.


Table: Project
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+

Table: Employee
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+

Input: 
  Project
  +-------------+-------------+
  | project_id  | employee_id |
  +-------------+-------------+
  | 1           | 1           |
  | 1           | 2           |
  | 1           | 3           |
  | 2           | 1           |
  | 2           | 4           |
  +-------------+-------------+

  Employee
  +-------------+--------+------------------+
  | employee_id | name   | experience_years |
  +-------------+--------+------------------+
  | 1           | Khaled | 3                |
  | 2           | Ali    | 2                |
  | 3           | John   | 1                |
  | 4           | Doe    | 2                |
  +-------------+--------+------------------+
*/


SELECT
    Project.project_id, -- selects the project id
    COALESCE(ROUND(SUM(Employee.experience_years) / COUNT(Project.employee_id), 2), 0) AS average_years -- calculates average years of experience per employee by employee_id
FROM Project
LEFT JOIN Employee on Project.employee_id = Employee.employee_id -- joins the Employee table with the Project table on employee_id
GROUP BY Project.project_id -- groups results by project id


/*
Output: 
  +-------------+---------------+
  | project_id  | average_years |
  +-------------+---------------+
  | 1           | 2.00          |
  | 2           | 2.50          |
  +-------------+---------------+
*/
