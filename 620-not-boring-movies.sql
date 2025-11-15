/*
620. Not Boring Movies

Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
Return the result table ordered by rating in descending order.
The result format is in the following example.


Table: Cinema
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+

Input: 
  Cinema
  +----+------------+-------------+--------+
  | id | movie      | description | rating |
  +----+------------+-------------+--------+
  | 1  | War        | great 3D    | 8.9    |
  | 2  | Science    | fiction     | 8.5    |
  | 3  | irish      | boring      | 6.2    |
  | 4  | Ice song   | Fantacy     | 8.6    |
  | 5  | House card | Interesting | 9.1    |
  +----+------------+-------------+--------+
*/


SELECT id, movie, description, rating -- selects the movie's id, name, description, and rating
    FROM Cinema
    WHERE id % 2 <> 0 AND description != 'boring' -- includes films with an odd-numbered id and do not have a description of "boring" 
    GROUP BY rating -- groups the results by rating
    ORDER BY rating DESC -- orders the ratings from highest to lowest


/*
Output: 
  +----+------------+-------------+--------+
  | id | movie      | description | rating |
  +----+------------+-------------+--------+
  | 5  | House card | Interesting | 9.1    |
  | 1  | War        | great 3D    | 8.9    |
  +----+------------+-------------+--------+
*/
