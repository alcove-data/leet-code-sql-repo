
#577. Employee Bonus

#Table: Employee
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| empId       | int     |
#| name        | varchar |
#| supervisor  | int     |
#| salary      | int     |
#+-------------+---------+

#Table: Bonus
#+-------------+------+
#| Column Name | Type |
#+-------------+------+
#| empId       | int  |
#| bonus       | int  |
#+-------------+------+

#Input: 
#  Employee table:
#  +-------+--------+------------+--------+
#  | empId | name   | supervisor | salary |
#  +-------+--------+------------+--------+
#  | 3     | Brad   | null       | 4000   |
#  | 1     | John   | 3          | 1000   |
#  | 2     | Dan    | 3          | 2000   |
#  | 4     | Thomas | 3          | 4000   |
#  +-------+--------+------------+--------+

#  Bonus table:
#  +-------+-------+
#  | empId | bonus |
#  +-------+-------+
#  | 2     | 500   |
#  | 4     | 2000  |
#  +-------+-------+

    
#Joins the Employee table with the Bonus table, then returns the name and bonus when less than 1000 or when null
SELECT Employee.name, Bonus.bonus
    FROM Employee
    LEFT JOIN Bonus ON Employee.empID = Bonus.empID
    WHERE Bonus.bonus < 1000 OR Bonus.bonus IS NULL

  
#Output: 
#  +------+-------+
#  | name | bonus |
#  +------+-------+
#  | Brad | null  |
#  | John | null  |
#  | Dan  | 500   |
#  +------+-------+
