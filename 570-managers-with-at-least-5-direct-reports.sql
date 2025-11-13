#570. Managers with at Least 5 Direct Reports

#Table: Employee
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| id          | int     |
#| name        | varchar |
#| department  | varchar |
#| managerId   | int     |
#+-------------+---------+

#Input: 
#  Employee:
#  +-----+-------+------------+-----------+
#  | id  | name  | department | managerId |
#  +-----+-------+------------+-----------+
#  | 101 | John  | A          | null      |
#  | 102 | Dan   | A          | 101       |
#  | 103 | James | A          | 101       |
#  | 104 | Amy   | A          | 101       |
#  | 105 | Anne  | A          | 101       |
#  | 106 | Ron   | B          | 101       |
#  +-----+-------+------------+-----------+


#Creates a new table, Managers, which isolates manager IDs than are not NULL, then joins with Employee table on employee ID
#Returns the name(s) of managers with at least five direct reports
SELECT Employee.name
    FROM Employee
    JOIN(
        SELECT managerID, COUNT(id) AS direct_report
        FROM Employee
        WHERE managerId IS NOT NULL
        GROUP BY managerId
    )
    AS Manager ON Employee.id = Manager.managerId
    WHERE Manager.direct_report >= 5
  
  
#Output: 
#  +------+
#  | name |
#  +------+
#  | John |
#  +------+
