#1068. Product Sales Analysis I

#Table: Sales
#+-------------+-------+
#| Column Name | Type  |
#+-------------+-------+
#| sale_id     | int   |
#| product_id  | int   |
#| year        | int   |
#| quantity    | int   |
#| price       | int   |
#+-------------+-------+

#Table: Product
#+--------------+---------+
#| Column Name  | Type    |
#+--------------+---------+
#| product_id   | int     |
#| product_name | varchar |
#+--------------+---------+

#Input: 
#  Sales:
#  +---------+------------+------+----------+-------+
#  | sale_id | product_id | year | quantity | price |
#  +---------+------------+------+----------+-------+ 
#  | 1       | 100        | 2008 | 10       | 5000  |
#  | 2       | 100        | 2009 | 12       | 5000  |
#  | 7       | 200        | 2011 | 15       | 9000  |
#  +---------+------------+------+----------+-------+

#  Product:
#  +------------+--------------+
#  | product_id | product_name |
#  +------------+--------------+
#  | 100        | Nokia        |
#  | 200        | Apple        |
#  | 300        | Samsung      |
#  +------------+--------------+

#Joins the Sales table with Product table, then returns the product's name, sales year, and sales price
SELECT Product.product_name, Sales.year, Sales.price
    FROM Product
    LEFT JOIN Sales
    ON Product.product_id = Sales.product_id
    WHERE Sales.year IS NOT NULL
  

#Output: 
#  +--------------+-------+-------+
#  | product_name | year  | price |
#  +--------------+-------+-------+
#  | Nokia        | 2008  | 5000  |
#  | Nokia        | 2009  | 5000  |
#  | Apple        | 2011  | 9000  |
#  +--------------+-------+-------+
