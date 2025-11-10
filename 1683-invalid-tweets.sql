#1683. Invalid Tweets

#Table: Tweets
#+----------------+---------+
#| Column Name    | Type    |
#+----------------+---------+
#| tweet_id       | int     |
#| content        | varchar |
#+----------------+---------+

#Input:
#+----------+-----------------------------------+
#| tweet_id | content                           |
#+----------+-----------------------------------+
#| 1        | Let us Code                       |
#| 2        | More than fifteen chars are here! |
#+----------+-----------------------------------+


#Selects the IDs of Tweets with greater than 15 characters, then returns the IDs as invalid
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;

  
#Output: 
#+----------+
#| tweet_id |
#+----------+
#| 2        |
#+----------+
