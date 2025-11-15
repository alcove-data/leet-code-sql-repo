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


SELECT
    Prices.product_id, -- selects product id from the Prices table
    COALESCE(ROUND(SUM(Prices.price * UnitsSold.units) / SUM(UnitsSold.units), 2), 0) AS average_price -- calculates average selling price for each product, handling "no units sold" as having an average selling price of 0 
FROM Prices
LEFT JOIN UnitsSold ON Prices.product_id = UnitsSold.product_id -- joins the UnitsSold table and Prices table on product_id
  AND UnitsSold.purchase_date BETWEEN Prices.start_date AND Prices.end_date -- only considers sales of a product between the start and end date of it's price
GROUP BY Prices.product_id -- groups the results by product_id


/*
Output: 
  +------------+---------------+
  | product_id | average_price |
  +------------+---------------+
  | 1          | 6.96          |
  | 2          | 16.96         |
  +------------+---------------+
*/
