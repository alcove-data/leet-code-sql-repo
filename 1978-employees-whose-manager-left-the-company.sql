/*
1978. Employees Whose Manager Left the Company

Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company.
When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.
Return the result table ordered by employee_id.

Table: Employees
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| manager_id  | int      |
| salary      | int      |
+-------------+----------+


Input:
  Employees:
  +-------------+-----------+------------+--------+
  | employee_id | name      | manager_id | salary |
  +-------------+-----------+------------+--------+
  | 3           | Mila      | 9          | 60301  |
  | 12          | Antonella | null       | 31000  |
  | 13          | Emery     | null       | 67084  |
  | 1           | Kalel     | 11         | 21241  |
  | 9           | Mikaela   | null       | 50937  |
  | 11          | Joziah    | 6          | 28485  |
  +-------------+-----------+------------+--------+
*/


SELECT employee_id
FROM Employees
WHERE salary < 30000  -- sets the condition that salary must be less than 30000
AND manager_id NOT IN(  -- subquery that identifies managers who are no longer employed by the company
    SELECT employee_id
    FROM Employees
)
ORDER by employee_id  -- orders the results by employee id's


/*
Output:
  +-------------+
  | employee_id |
  +-------------+
  | 11          |
  +-------------+
*/
