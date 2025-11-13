#1280. Students and Examinations

#Table: Students
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| student_id    | int     |
#| student_name  | varchar |
#+---------------+---------+

#Table: Subjects
#+--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| subject_name | varchar |
#+--------------+---------+

#Table: Examinations
#+--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| student_id   | int     |
#| subject_name | varchar |
#+--------------+---------+

#Input: 
#  Students:
#  +------------+--------------+
#  | student_id | student_name |
#  +------------+--------------+
#  | 1          | Alice        |
#  | 2          | Bob          |
#  | 13         | John         |
#  | 6          | Alex         |
#  +------------+--------------+
  
#  Subjects:
#  +--------------+
#  | subject_name |
#  +--------------+
#  | Math         |
#  | Physics      |
#  | Programming  |
#  +--------------+
  
#  Examinations:
#  +------------+--------------+
#  | student_id | subject_name |
#  +------------+--------------+
#  | 1          | Math         |
#  | 1          | Physics      |
#  | 1          | Programming  |
#  | 2          | Programming  |
#  | 1          | Physics      |
#  | 1          | Math         |
#  | 13         | Math         |
#  | 13         | Programming  |
#  | 13         | Physics      |
#  | 2          | Math         |
#  | 1          | Math         |
#  +------------+--------------+

  
#Joins all combinations of Students table and Subjects table using CROSS JOIN, then LEFT JOINs Examinations table on student ID
#Returns a table with the count of attended exams by all students and the subject of the exam(s); handles NULL as no attendance
SELECT Students.student_id, Students.student_name, Subjects.subject_name, COUNT(Examinations.subject_name) AS attended_exams
    FROM Students
    CROSS JOIN Subjects
    LEFT JOIN Examinations ON Students.student_id = Examinations.student_id AND Subjects.subject_name = Examinations.subject_name
    GROUP BY student_id, student_name, subject_name
    ORDER BY student_id, subject_name


#Output:
#  +------------+--------------+--------------+----------------+
#  | student_id | student_name | subject_name | attended_exams |
#  +------------+--------------+--------------+----------------+
#  | 1          | Alice        | Math         | 3              |
#  | 1          | Alice        | Physics      | 2              |
#  | 1          | Alice        | Programming  | 1              |
#  | 2          | Bob          | Math         | 1              |
#  | 2          | Bob          | Physics      | 0              |
#  | 2          | Bob          | Programming  | 1              |
#  | 6          | Alex         | Math         | 0              |
#  | 6          | Alex         | Physics      | 0              |
#  | 6          | Alex         | Programming  | 0              |
#  | 13         | John         | Math         | 1              |
#  | 13         | John         | Physics      | 1              |
#  | 13         | John         | Programming  | 1              |
#  +------------+--------------+--------------+----------------+
