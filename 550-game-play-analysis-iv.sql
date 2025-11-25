/*
550. Game Play Analysis IV

Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places.
In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.


Table: Activity
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+

Input:
  Activity
  +-----------+-----------+------------+--------------+
  | player_id | device_id | event_date | games_played |
  +-----------+-----------+------------+--------------+
  | 1         | 2         | 2016-03-01 | 5            |
  | 1         | 2         | 2016-03-02 | 6            |
  | 2         | 3         | 2017-06-25 | 1            |
  | 3         | 1         | 2016-03-02 | 0            |
  | 3         | 4         | 2018-07-03 | 5            |
  +-----------+-----------+------------+--------------+
*/


SELECT
    ROUND(COUNT(DISTINCT d2.player_id) / COUNT(*), 2) AS fraction -- selects only distinct player ids and divides them by the total number of players
FROM
    (SELECT player_id, MIN(event_date) AS login -- returns the date of the player's initial login
    FROM Activity GROUP BY player_id) AS d1 -- creates a table of initial login dates for all players
LEFT JOIN Activity AS d2 ON d1.player_id = d2.player_id AND DATEDIFF(d2.event_date, d1.login) = 1 -- joins the table of inital player logins with a table of player logins the following day


/*
Output: 
  +-----------+
  | fraction  |
  +-----------+
  | 0.33      |
  +-----------+
*/
