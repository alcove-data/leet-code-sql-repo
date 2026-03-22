/*
626. Exchange Seats

Write a solution to swap the seat id of every two consecutive students.
If the number of students is odd, the id of the last student is not swapped.
Return the result table ordered by id in ascending order.

Table: Seat
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+


Input: 
  Seat:
  +----+---------+
  | id | student |
  +----+---------+
  | 1  | Abbot   |
  | 2  | Doris   |
  | 3  | Emerson |
  | 4  | Green   |
  | 5  | Jeames  |
  +----+---------+
*/


SELECT COALESCE(
    CASE
        WHEN id % 2 = 0 THEN id - 1  -- for even numbered seats, swaps the student in this seat with the adjacent one
        WHEN id % 2 = 1 AND id + 1 NOT IN(  -- for an odd number of seats, does not swap the final student
            SELECT id
            FROM Seat
        )
        THEN id
        ELSE id + 1  -- swaps the student in this seat with the adjacent one
    END
) AS id,
    student
FROM Seat
ORDER BY id ASC  -- orders the results ny ascending id


/*
Output:
  +----+---------+
  | id | student |
  +----+---------+
  | 1  | Doris   |
  | 2  | Abbot   |
  | 3  | Green   |
  | 4  | Emerson |
  | 5  | Jeames  |
  +----+---------+
*/
