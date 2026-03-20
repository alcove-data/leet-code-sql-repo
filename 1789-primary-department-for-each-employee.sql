/*
1789. Primary Department for Each Employee

Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department.
Note that when an employee belongs to only one department, their primary column is 'N'.
Write a solution to report all the employees with their primary department.
For employees who belong to one department, report their only department.
Return the result table in any order.

Table: Employee
+---------------+---------+
| Column Name   |  Type   |
+---------------+---------+
| employee_id   | int     |
| department_id | int     |
| primary_flag  | varchar |
+---------------+---------+


Input: 
  Employee:
  +-------------+---------------+--------------+
  | employee_id | department_id | primary_flag |
  +-------------+---------------+--------------+
  | 1           | 1             | N            |
  | 2           | 1             | Y            |
  | 2           | 2             | N            |
  | 3           | 3             | N            |
  | 4           | 2             | N            |
  | 4           | 3             | Y            |
  | 4           | 4             | N            |
  +-------------+---------------+--------------+
*/


SELECT
    employee_id,
    department_id
FROM Employee
WHERE primary_flag = "Y"  -- if the primary flag is "Y", return this as the primary department id
UNION  -- combines the results of the previous test case with the following test case
SELECT
    employee_id,
    department_id
FROM Employee
GROUP BY employee_id  -- groups the data by employee id
HAVING COUNT(*) = 1 -- from these groups, returns employees with only one department id


/*
Output: 
  +-------------+---------------+
  | employee_id | department_id |
  +-------------+---------------+
  | 1           | 1             |
  | 2           | 1             |
  | 3           | 3             |
  | 4           | 3             |
  +-------------+---------------+
*/
