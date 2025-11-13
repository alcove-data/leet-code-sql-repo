/*
1280. Students and Examinations

Write a solution to find the number of times each student attended each exam.
Return the result table ordered by student_id and subject_name.
The result format is in the following example.


Table: Students
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+

Table: Subjects
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| subject_name | varchar |
+--------------+---------+

Table: Examinations
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| subject_name | varchar |
+--------------+---------+

Input: 
  Students:
  +------------+--------------+
  | student_id | student_name |
  +------------+--------------+
  | 1          | Alice        |
  | 2          | Bob          |
  | 13         | John         |
  | 6          | Alex         |
  +------------+--------------+
  
  Subjects:
  +--------------+
  | subject_name |
  +--------------+
  | Math         |
  | Physics      |
  | Programming  |
  +--------------+
  
  Examinations:
  +------------+--------------+
  | student_id | subject_name |
  +------------+--------------+
  | 1          | Math         |
  | 1          | Physics      |
  | 1          | Programming  |
  | 2          | Programming  |
  | 1          | Physics      |
  | 1          | Math         |
  | 13         | Math         |
  | 13         | Programming  |
  | 13         | Physics      |
  | 2          | Math         |
  | 1          | Math         |
  +------------+--------------+
*/

  
SELECT
  Students.student_id, -- selects the student's id
  Students.student_name, -- selects the student's name
  Subjects.subject_name, -- selects the subject name
  COUNT(Examinations.subject_name) AS attended_exams -- counts how many times the student attended an exam in for this subject
    FROM Students -- table containing student names and ids
    CROSS JOIN Subjects -- creates every possible combination of student with and subject
    LEFT JOIN Examinations ON Students.student_id = Examinations.student_id AND Subjects.subject_name = Examinations.subject_name -- matches exams to the correct student and subject
    GROUP BY student_id, student_name, subject_name -- groups by student and subject
    ORDER BY student_id, subject_name -- sorts by student id, then by subject name


/*
Output:
  +------------+--------------+--------------+----------------+
  | student_id | student_name | subject_name | attended_exams |
  +------------+--------------+--------------+----------------+
  | 1          | Alice        | Math         | 3              |
  | 1          | Alice        | Physics      | 2              |
  | 1          | Alice        | Programming  | 1              |
  | 2          | Bob          | Math         | 1              |
  | 2          | Bob          | Physics      | 0              |
  | 2          | Bob          | Programming  | 1              |
  | 6          | Alex         | Math         | 0              |
  | 6          | Alex         | Physics      | 0              |
  | 6          | Alex         | Programming  | 0              |
  | 13         | John         | Math         | 1              |
  | 13         | John         | Physics      | 1              |
  | 13         | John         | Programming  | 1              |
  +------------+--------------+--------------+----------------+
*/
