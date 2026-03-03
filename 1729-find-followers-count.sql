/*
1729. Find Followers Count

Write a solution that will, for each user, return the number of followers.
Return the result table ordered by user_id in ascending order.
The result format is in the following example.


Table: Followers
+-------------+------+
| Column Name | Type |
+-------------+------+
| user_id     | int  |
| follower_id | int  |
+-------------+------+


Input:
Followers:
  +---------+-------------+
  | user_id | follower_id |
  +---------+-------------+
  | 0       | 1           |
  | 1       | 0           |
  | 2       | 0           |
  | 2       | 1           |
  +---------+-------------+
*/


SELECT
  DISTINCT user_id,  -- selects user_id's w/o duplicates
  COUNT(follower_id) as followers_count  -- returns the count of follower_id
FROM Followers
GROUP BY user_id  -- groups the results by user_id
ORDER BY user_id ASC  -- orders the results by ascending user_id


/*
Output: 
  +---------+----------------+
  | user_id | followers_count|
  +---------+----------------+
  | 0       | 1              |
  | 1       | 1              |
  | 2       | 2              |
  +---------+----------------+
*/
