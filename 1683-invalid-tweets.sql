#1683. Invalid Tweets

#Table: Tweets
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| tweet_id       | int     |
#| content        | varchar |
#+----------------+---------+

# Selects the IDs of Tweets with greater than 15 characters and returns them as invalid
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15; 

#Input:
#+----------+-----------------------------------+
#| tweet_id | content                           |
#+----------+-----------------------------------+
#| 1        | Let us Code                       |
#| 2        | More than fifteen chars are here! |
#+----------+-----------------------------------+

#Output: 
#+----------+
#| tweet_id |
#+----------+
#| 2        |
#+----------+
