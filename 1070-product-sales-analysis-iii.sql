/*
1070. Product Sales Analysis III

Write a solution to find all sales that occurred in the first year each product was sold.
For each product_id, identify the earliest year it appears in the Sales table.
Return all sales entries for that product in that year.
Return a table with the following columns: product_id, first_year, quantity, and price.
Return the result in any order.


Table: Sales
+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+

Input: 
  Sales
  +---------+------------+------+----------+-------+
  | sale_id | product_id | year | quantity | price |
  +---------+------------+------+----------+-------+ 
  | 1       | 100        | 2008 | 10       | 5000  |
  | 2       | 100        | 2009 | 12       | 5000  |
  | 7       | 200        | 2011 | 15       | 9000  |
  +---------+------------+------+----------+-------+
*/


SELECT
    product_id, -- selects the product name
    year AS first_year, -- selects the year a product was sold
    quantity, -- selects the quantity of the product sold
    price -- selects the price of the product sold
FROM Sales
WHERE (product_id, year) IN (SELECT product_id, MIN(year) -- subquery that selects only instances where a product has sales in its first production year
  FROM Sales
  GROUP BY product_id -- groups the results by their product id
)

/*
Output: 
  +------------+------------+----------+-------+
  | product_id | first_year | quantity | price |
  +------------+------------+----------+-------+ 
  | 100        | 2008       | 10       | 5000  |
  | 200        | 2011       | 15       | 9000  |
  +------------+------------+----------+-------+
*/
