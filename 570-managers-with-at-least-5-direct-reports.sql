/*
570. Managers with at Least 5 Direct Reports

Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.
Return the result table in any order.
The result format is in the following example.


Table: Employee
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+

Input: 
  Employee
  +-----+-------+------------+-----------+
  | id  | name  | department | managerId |
  +-----+-------+------------+-----------+
  | 101 | John  | A          | null      |
  | 102 | Dan   | A          | 101       |
  | 103 | James | A          | 101       |
  | 104 | Amy   | A          | 101       |
  | 105 | Anne  | A          | 101       |
  | 106 | Ron   | B          | 101       |
  +-----+-------+------------+-----------+
*/


SELECT Employee.name -- selects the manager's name
    FROM Employee
    JOIN(
        SELECT managerID, COUNT(id) AS direct_report -- counts how many employees report to each manager
        FROM Employee
        WHERE managerId IS NOT NULL -- only considers employees who have a manager
        GROUP BY managerId -- groups by manager id to compute direct report counts
    )
    AS Manager ON Employee.id = Manager.managerId -- matches each manager to their aggregated count of direct reports
    WHERE Manager.direct_report >= 5 -- only keeps managers with 5 or more direct reports


/* 
Output: 
  +------+
  | name |
  +------+
  | John |
  +------+
*/
