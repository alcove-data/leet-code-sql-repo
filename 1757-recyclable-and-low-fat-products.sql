#1757. Recyclable and Low Fat Products

#Input:
#Products table:
#+-------------+----------+------------+
#| product_id  | low_fats | recyclable |
#+-------------+----------+------------+
#| 0           | Y        | N          |
#| 1           | Y        | Y          |
#| 2           | N        | Y          |
#| 3           | Y        | Y          |
#| 4           | N        | N          |
#+-------------+----------+------------+

    
# Selects ID of products that are both low-fat and recyclable, then returns only these IDs
SELECT product_id
    FROM Products
    WHERE low_fats = 'Y' AND recyclable = 'Y';


#Output: 
#+-------------+
#| product_id  |
#+-------------+
#| 1           |
#| 3           |
#+-------------+
