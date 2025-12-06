/*
1141. User Activity for the Past 30 Days I

Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively.
A user was active on someday if they made at least one activity on that day.
Return the result table in any order.
The result format is in the following example.
Note: Any activity from ('open_session', 'end_session', 'scroll_down', 'send_message') will be considered valid activity for a user to be considered active on a day.


Table: Activity
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| session_id    | int     |
| activity_date | date    |
| activity_type | enum    |
+---------------+---------+

Input: 
  Activity
  +---------+------------+---------------+---------------+
  | user_id | session_id | activity_date | activity_type |
  +---------+------------+---------------+---------------+
  | 1       | 1          | 2019-07-20    | open_session  |
  | 1       | 1          | 2019-07-20    | scroll_down   |
  | 1       | 1          | 2019-07-20    | end_session   |
  | 2       | 4          | 2019-07-20    | open_session  |
  | 2       | 4          | 2019-07-21    | send_message  |
  | 2       | 4          | 2019-07-21    | end_session   |
  | 3       | 2          | 2019-07-21    | open_session  |
  | 3       | 2          | 2019-07-21    | send_message  |
  | 3       | 2          | 2019-07-21    | end_session   |
  | 4       | 3          | 2019-06-25    | open_session  |
  | 4       | 3          | 2019-06-25    | end_session   |
  +---------+------------+---------------+---------------+
*/


SELECT
    activity_date AS day, -- returns the date a user was active
    COUNT(DISTINCT user_id) AS active_users -- returns the total number of active users on a given date
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27' -- only considers 30 days leading up to and including 2019-07-29
GROUP BY activity_date -- groups the results by activity date (ascending)


/*
Output: 
  +------------+--------------+ 
  | day        | active_users |
  +------------+--------------+ 
  | 2019-07-20 | 2            |
  | 2019-07-21 | 2            |
  +------------+--------------+ 
*/
