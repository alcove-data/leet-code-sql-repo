/*
602. Friend Requests II: Who Has the Most Friends

Write a solution to find the people who have the most friends and the most friends number.
The test cases are generated so that only one person has the most friends.

Table: RequestAccepted
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+

Input:
  RequestAccepted:
  +--------------+-------------+-------------+
  | requester_id | accepter_id | accept_date |
  +--------------+-------------+-------------+
  | 1            | 2           | 2016/06/03  |
  | 1            | 3           | 2016/06/08  |
  | 2            | 3           | 2016/06/08  |
  | 3            | 4           | 2016/06/09  |
  +--------------+-------------+-------------+
*/


SELECT
    id,
    COUNT(*) AS num  -- counts the number of friends a person has
FROM(
    SELECT requester_id AS id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id
    FROM RequestAccepted
) AS merged  -- creates a table using a union to reference requester id's and accepter id's individually
GROUP BY id  -- groups the data by requester id
ORDER BY num DESC  -- orders the results by number of friends in descending order
LIMIT 1  -- restricts the results after calculations to only the top result


/*
Output: 
  +----+-----+
  | id | num |
  +----+-----+
  | 3  | 3   |
  +----+-----+
*/
