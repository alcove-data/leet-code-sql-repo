/*
1164. Product Price at a Given Date

Initially, all products have price 10.
Write a solution to find the prices of all products on the date 2019-08-16.
Return the result table in any order.

Table: Products
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+


Input: 
  Products:
  +------------+-----------+-------------+
  | product_id | new_price | change_date |
  +------------+-----------+-------------+
  | 1          | 20        | 2019-08-14  |
  | 2          | 50        | 2019-08-14  |
  | 1          | 30        | 2019-08-15  |
  | 1          | 35        | 2019-08-16  |
  | 2          | 65        | 2019-08-17  |
  | 3          | 20        | 2019-08-18  |
  +------------+-----------+-------------+
*/


SELECT DISTINCT P1.product_id,  -- selects only unique product id's
    CASE  -- pulls product price changes until 2019-08-16 then returns the latest price otherwise price = 10
        WHEN MAX(CASE WHEN P1.change_date <= "2019-08-16" THEN P1.change_date END) IS NOT NULL  -- nested case to change dates pulled in beyond the cutoff date
        THEN (
            SELECT P2.new_price
            FROM Products P2
            WHERE P2.product_id = P1.product_id AND P2.change_date <= "2019-08-16"  -- matches product id's in P1 & P2, then selects the latest date until the curoff date
            ORDER BY P2.change_date DESC  -- orders the dates in descending order (most recent to least)
            LIMIT 1 -- limits the results to only one, based on the above criteria
        )
          ELSE 10  -- catch-all for products that do not have an updated price
          END AS price
FROM Products P1
GROUP BY P1.product_id  -- groups the data by product id


/*
Output: 
  +------------+-------+
  | product_id | price |
  +------------+-------+
  | 2          | 50    |
  | 1          | 35    |
  | 3          | 10    |
  +------------+-------+
*/
