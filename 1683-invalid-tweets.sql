/*
1683. Invalid Tweets

Write a solution to find the IDs of the invalid tweets.
The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
Return the result table in any order.
The result format is in the following example.


Table: Tweets
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| tweet_id       | int     |
| content        | varchar |
+----------------+---------+

Input:
  Tweets
  +----------+-----------------------------------+
  | tweet_id | content                           |
  +----------+-----------------------------------+
  | 1        | Let us Code                       |
  | 2        | More than fifteen chars are here! |
  +----------+-----------------------------------+
*/


SELECT tweet_id -- selects the id of the tweet
FROM Tweets
WHERE LENGTH(content) > 15; -- keep only tweets of length strictly greater than 15 characters


/*
Output: 
  +----------+
  | tweet_id |
  +----------+
  | 2        |
  +----------+
*/
