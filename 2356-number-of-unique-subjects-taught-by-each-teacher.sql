/*
2356. Number of Unique Subjects Taught by Each Teacher

Write a solution to calculate the number of unique subjects each teacher teaches in the university.
Return the result table in any order.
The result format is shown in the following example.


Table: Teacher
+-------------+------+
| Column Name | Type |
+-------------+------+
| teacher_id  | int  |
| subject_id  | int  |
| dept_id     | int  |
+-------------+------+

Input: 
  Teacher
  +------------+------------+---------+
  | teacher_id | subject_id | dept_id |
  +------------+------------+---------+
  | 1          | 2          | 3       |
  | 1          | 2          | 4       |
  | 1          | 3          | 3       |
  | 2          | 1          | 1       |
  | 2          | 2          | 1       |
  | 2          | 3          | 1       |
  | 2          | 4          | 1       |
  +------------+------------+---------+
*/


SELECT
    teacher_id, -- selects the teacher's id from the Teacher table
    COUNT(DISTINCT subject_id) AS cnt -- selects all unique subjects taught by the teacher
FROM Teacher
GROUP BY teacher_id -- groups results by the teachers' id


/*
Output:  
  +------------+-----+
  | teacher_id | cnt |
  +------------+-----+
  | 1          | 2   |
  | 2          | 4   |
  +------------+-----+
*/
