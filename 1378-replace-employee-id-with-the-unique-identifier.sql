#1378. Replace Employee ID With The Unique Identifier

#Table: Employees
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| id            | int     |
#| name          | varchar |
#+---------------+---------+

#Table: EmployeeUNI
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| id            | int     |
#| unique_id     | int     |
#+---------------+---------+

#Input: 
#Employees:
#+----+----------+
#| id | name     |
#+----+----------+
#| 1  | Alice    |
#| 7  | Bob      |
#| 11 | Meir     |
#| 90 | Winston  |
#| 3  | Jonathan |
#+----+----------+

#EmployeeUNI:
#+----+-----------+
#| id | unique_id |
#+----+-----------+
#| 3  | 1         |
#| 11 | 2         |
#| 90 | 3         |
#+----+-----------+

  
#Selects employee ID and name, then returns the unique ID of each employee; otherwise null
SELECT EmployeeUNI.unique_id, Employees.name
FROM EmployeeUNI
RIGHT JOIN Employees
ON EmployeeUNI.id = Employees.id

  
#Output: 
#+-----------+----------+
#| unique_id | name     |
#+-----------+----------+
#| null      | Alice    |
#| null      | Bob      |
#| 2         | Meir     |
#| 3         | Winston  |
#| 1         | Jonathan |
#+-----------+----------+
