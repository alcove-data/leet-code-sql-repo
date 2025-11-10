#584. Find Customer Referee

#Table: Customer
#+-------------+---------+
#| Column Name | Type    |
#+-------------+---------+
#| id          | int     |
#| name        | varchar |
#| referee_id  | int     |
#+-------------+---------+

#Input: 
#+----+------+------------+
#| id | name | referee_id |
#+----+------+------------+
#| 1  | Will | null       |
#| 2  | Jane | null       |
#| 3  | Alex | 2          |
#| 4  | Bill | null       |
#| 5  | Zack | 1          |
#| 6  | Mark | 2          |
#+----+------+------------+

  
#Selects name of customer not referred by id=2 or not referred by any customer
  SELECT name
    FROM Customer
    WHERE referee_id != 2 OR referee_id IS NULL;


#Output: 
#+------+
#| name |
#+------+
#| Will |
#| Jane |
#| Bill |
#| Zack |
#+------+
