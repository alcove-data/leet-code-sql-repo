/*
577. Employee Bonus

Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.
Return the result table in any order.
The result format is in the following example.


Table: Employee
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| empId       | int     |
| name        | varchar |
| supervisor  | int     |
| salary      | int     |
+-------------+---------+

Table: Bonus
+-------------+------+
| Column Name | Type |
+-------------+------+
| empId       | int  |
| bonus       | int  |
+-------------+------+

Input: 
  Employee
  +-------+--------+------------+--------+
  | empId | name   | supervisor | salary |
  +-------+--------+------------+--------+
  | 3     | Brad   | null       | 4000   |
  | 1     | John   | 3          | 1000   |
  | 2     | Dan    | 3          | 2000   |
  | 4     | Thomas | 3          | 4000   |
  +-------+--------+------------+--------+

  Bonus
  +-------+-------+
  | empId | bonus |
  +-------+-------+
  | 2     | 500   |
  | 4     | 2000  |
  +-------+-------+
*/

    
SELECT Employee.name, Bonus.bonus -- selects employee names and their bonus amount
    FROM Employee
    LEFT JOIN Bonus ON Employee.empID = Bonus.empID -- includes all employees with any bonus tied to their employee id
    WHERE Bonus.bonus < 1000 OR Bonus.bonus IS NULL -- returns only employees with a bonus less than 1000 or a value of NULL


/*
Output: 
  +------+-------+
  | name | bonus |
  +------+-------+
  | Brad | null  |
  | John | null  |
  | Dan  | 500   |
  +------+-------+
*/
