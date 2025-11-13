/*
1148. Article Views I

Write a solution to find all the authors that viewed at least one of their own articles.
Return the result table sorted by id in ascending order.
The result format is in the following example.


Table: Views
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+

Input:
  Views
  +------------+-----------+-----------+------------+
  | article_id | author_id | viewer_id | view_date  |
  +------------+-----------+-----------+------------+
  | 1          | 3         | 5         | 2019-08-01 |
  | 1          | 3         | 6         | 2019-08-02 |
  | 2          | 7         | 7         | 2019-08-01 |
  | 2          | 7         | 6         | 2019-08-02 |
  | 4          | 7         | 1         | 2019-07-22 |
  | 3          | 4         | 4         | 2019-07-21 |
  | 3          | 4         | 4         | 2019-07-21 |
  +------------+-----------+-----------+------------+
*/


SELECT DISTINCT author_id AS id -- selects unique author ids and renames the column to 'id'
    FROM Views
    WHERE author_id = viewer_id -- filters rows where author viewed their own article
    ORDER BY author_id ASC; -- sort results by author id in ascending order


/*
Output: 
  +------+
  | id   |
  +------+
  | 4    |
  | 7    |
  +------+
*/
