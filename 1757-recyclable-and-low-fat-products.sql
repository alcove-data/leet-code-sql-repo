/*
1757. Recyclable and Low Fat Products

Write a solution to find the ids of products that are both low fat and recyclable.
Return the result table in any order.
The result format is in the following example.


Table: Products
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| low_fats    | enum    |
| recyclable  | enum    |
+-------------+---------+

Input:
  Products
  +-------------+----------+------------+
  | product_id  | low_fats | recyclable |
  +-------------+----------+------------+
  | 0           | Y        | N          |
  | 1           | Y        | Y          |
  | 2           | N        | Y          |
  | 3           | Y        | Y          |
  | 4           | N        | N          |
  +-------------+----------+------------+
*/


SELECT product_id --selects the product id from the Products table
    FROM Products
    WHERE low_fats = 'Y' AND recyclable = 'Y' -- only includes products that are both low fat and recyclable


/*
Output: 
  +-------------+
  | product_id  |
  +-------------+
  | 1           |
  | 3           |
  +-------------+
*/
