/*
584. Find Customer Referee

Find the names of the customer that are either:
1. referred by any customer with id != 2.
2. not referred by any customer.
Return the result table in any order.
The result format is in the following example.


Table: Customer
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+

Input:
  Customer
  +----+------+------------+
  | id | name | referee_id |
  +----+------+------------+
  | 1  | Will | null       |
  | 2  | Jane | null       |
  | 3  | Alex | 2          |
  | 4  | Bill | null       |
  | 5  | Zack | 1          |
  | 6  | Mark | 2          |
  +----+------+------------+
*/
  

SELECT name -- selects the customer's name
  FROM Customer
  WHERE referee_id != 2 OR referee_id IS NULL -- include either customers whose referee id is not 2 or customers with no referee id


/*
Output: 
  +------+
  | name |
  +------+
  | Will |
  | Jane |
  | Bill |
  | Zack |
  +------+
*/
