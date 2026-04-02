/*
1341. Movie Rating

Write a solution to:
> Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
> Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.


Table: Movies
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+

Table: Users
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+

Table: MovieRating
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+


Input:
  Movies:
  +-------------+--------------+
  | movie_id    |  title       |
  +-------------+--------------+
  | 1           | Avengers     |
  | 2           | Frozen 2     |
  | 3           | Joker        |
  +-------------+--------------+

  Users:
  +-------------+--------------+
  | user_id     |  name        |
  +-------------+--------------+
  | 1           | Daniel       |
  | 2           | Monica       |
  | 3           | Maria        |
  | 4           | James        |
  +-------------+--------------+

  MovieRating:
  +-------------+--------------+--------------+-------------+
  | movie_id    | user_id      | rating       | created_at  |
  +-------------+--------------+--------------+-------------+
  | 1           | 1            | 3            | 2020-01-12  |
  | 1           | 2            | 4            | 2020-02-11  |
  | 1           | 3            | 2            | 2020-02-12  |
  | 1           | 4            | 1            | 2020-01-01  |
  | 2           | 1            | 5            | 2020-02-17  | 
  | 2           | 2            | 2            | 2020-02-01  | 
  | 2           | 3            | 2            | 2020-03-01  |
  | 3           | 1            | 3            | 2020-02-22  | 
  | 3           | 2            | 4            | 2020-02-25  | 
  +-------------+--------------+--------------+-------------+
*/


(
    SELECT u.name AS results
    FROM MovieRating r
    JOIN Users u ON r.user_id = u.user_id  -- joins the Users and MovieRating table on common column user_id
    GROUP BY r.user_id  -- groups the data by user_id
    ORDER BY COUNT(r.movie_id) DESC, u.name ASC  -- orders the results by descending movie count, then by ascending name (A to Z)
    LIMIT 1  -- returns the first result from this query
)

UNION ALL

(
    SELECT m.title AS results
    FROM MovieRating r
    JOIN Movies m ON r.movie_id = m.movie_id  -- joins the Movies and MovieRating table on common column movie_id
    WHERE r.created_at BETWEEN "2020-02-01" AND "2020-02-29"  -- restricts the date range to February of 2020
    GROUP BY r.movie_id  -- groups the data by movie_id
    ORDER BY AVG(r.rating) DESC, m.title ASC  -- orders the results by descending average movie rating, then by ascending movie title (A to Z)
    LIMIT 1  -- returns the first result from this query
)


/*
Output:
  +--------------+
  | results      |
  +--------------+
  | Daniel       |
  | Frozen 2     |
  +--------------+
*/
