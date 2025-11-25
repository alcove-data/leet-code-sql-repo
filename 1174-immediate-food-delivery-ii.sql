/*
1174. Immediate Food Delivery II

If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.
The first order of a customer is the order with the earliest order date that the customer made.
It is guaranteed that a customer has precisely one first order.
Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
The result format is in the following example.


Table: Delivery
+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+

Input: 
  Delivery
  +-------------+-------------+------------+-----------------------------+
  | delivery_id | customer_id | order_date | customer_pref_delivery_date |
  +-------------+-------------+------------+-----------------------------+
  | 1           | 1           | 2019-08-01 | 2019-08-02                  |
  | 2           | 2           | 2019-08-02 | 2019-08-02                  |
  | 3           | 1           | 2019-08-11 | 2019-08-12                  |
  | 4           | 3           | 2019-08-24 | 2019-08-24                  |
  | 5           | 3           | 2019-08-21 | 2019-08-22                  |
  | 6           | 2           | 2019-08-11 | 2019-08-13                  |
  | 7           | 4           | 2019-08-09 | 2019-08-09                  |
  +-------------+-------------+------------+-----------------------------+
*/


SELECT
    ROUND(100 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*), 2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (SELECT customer_id, MIN(order_date) AS first_order FROM Delivery GROUP BY customer_id)


/*
Output: 
  +----------------------+
  | immediate_percentage |
  +----------------------+
  | 50.00                |
  +----------------------+
*/
