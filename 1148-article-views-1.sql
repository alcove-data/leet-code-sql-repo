#1148. Article Views I

#Table: Views
#+---------------+---------+
#| Column Name   | Type    |
#+---------------+---------+
#| article_id    | int     |
#| author_id     | int     |
#| viewer_id     | int     |
#| view_date     | date    |
#+---------------+---------+

#Input: 
#  +------------+-----------+-----------+------------+
#  | article_id | author_id | viewer_id | view_date  |
#  +------------+-----------+-----------+------------+
#  | 1          | 3         | 5         | 2019-08-01 |
#  | 1          | 3         | 6         | 2019-08-02 |
#  | 2          | 7         | 7         | 2019-08-01 |
#  | 2          | 7         | 6         | 2019-08-02 |
#  | 4          | 7         | 1         | 2019-07-22 |
#  | 3          | 4         | 4         | 2019-07-21 |
#  | 3          | 4         | 4         | 2019-07-21 |
#  +------------+-----------+-----------+------------+


#selects the ID of all authors that viewed their own articles at least once
SELECT DISTINCT author_id AS id
    FROM Views
    WHERE author_id = viewer_id
    ORDER BY author_id ASC;


#Output: 
#  +------+
#  | id   |
#  +------+
#  | 4    |
#  | 7    |
#  +------+
