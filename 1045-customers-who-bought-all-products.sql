/*
1045. Customers Who Bought All Products

Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
Return the result table in any order.
The result format is in the following example.

Table: Customer
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+

Table: Customer
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+


Input: 
  Customer:
  +-------------+-------------+
  | customer_id | product_key |
  +-------------+-------------+
  | 1           | 5           |
  | 2           | 6           |
  | 3           | 5           |
  | 3           | 6           |
  | 1           | 6           |
  +-------------+-------------+

  Product:
  +-------------+
  | product_key |
  +-------------+
  | 5           |
  | 6           |
  +-------------+
*/


SELECT
    DISTINCT c.customer_id AS customer_id -- selects only unique customer_id's
FROM Customer c
JOIN Product p  -- joins Customer table with Product table
ON c.product_key = p.product_key  -- completes the join on product_key column
GROUP BY c.customer_id  -- groups the results by customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(*) FROM Product)  -- results have to meet the criteria that count of product_key is identical in both Customer and Product 


/*
Output: 
  +-------------+
  | customer_id |
  +-------------+
  | 1           |
  | 3           |
  +-------------+
*/
