/*
1251. Average Selling Price

Write a solution to find the average selling price for each product.
average_price should be rounded to 2 decimal places.
If a product does not have any sold units, its average selling price is assumed to be 0.
Return the result table in any order.
The result format is in the following example.


Table: Prices
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| start_date    | date    |
| end_date      | date    |
| price         | int     |
+---------------+---------+

Table: UnitsSold
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| purchase_date | date    |
| units         | int     |
+---------------+---------+

Input: 
  Prices
  +------------+------------+------------+--------+
  | product_id | start_date | end_date   | price  |
  +------------+------------+------------+--------+
  | 1          | 2019-02-17 | 2019-02-28 | 5      |
  | 1          | 2019-03-01 | 2019-03-22 | 20     |
  | 2          | 2019-02-01 | 2019-02-20 | 15     |
  | 2          | 2019-02-21 | 2019-03-31 | 30     |
  +------------+------------+------------+--------+

  UnitsSold
  +------------+---------------+-------+
  | product_id | purchase_date | units |
  +------------+---------------+-------+
  | 1          | 2019-02-25    | 100   |
  | 1          | 2019-03-01    | 15    |
  | 2          | 2019-02-10    | 200   |
  | 2          | 2019-03-22    | 30    |
  +------------+---------------+-------+
*/



/*
Output: 
+------------+---------------+
| product_id | average_price |
+------------+---------------+
| 1          | 6.96          |
| 2          | 16.96         |
+------------+---------------+
*/
