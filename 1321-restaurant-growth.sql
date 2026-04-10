/*
1321. Restaurant Growth

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).
Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.
Return the result table ordered by visited_on in ascending order.

Table: Customer
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+

Input: 
  Customer:
  +-------------+--------------+--------------+-------------+
  | customer_id | name         | visited_on   | amount      |
  +-------------+--------------+--------------+-------------+
  | 1           | Jhon         | 2019-01-01   | 100         |
  | 2           | Daniel       | 2019-01-02   | 110         |
  | 3           | Jade         | 2019-01-03   | 120         |
  | 4           | Khaled       | 2019-01-04   | 130         |
  | 5           | Winston      | 2019-01-05   | 110         | 
  | 6           | Elvis        | 2019-01-06   | 140         | 
  | 7           | Anna         | 2019-01-07   | 150         |
  | 8           | Maria        | 2019-01-08   | 80          |
  | 9           | Jaze         | 2019-01-09   | 110         | 
  | 1           | Jhon         | 2019-01-10   | 130         | 
  | 3           | Jade         | 2019-01-10   | 150         | 
  +-------------+--------------+--------------+-------------+
*/


SELECT
    c1.visited_on,
    SUM(c2.amount) AS amount,  -- calculates a sum of customer payments
    ROUND(SUM(c2.amount) / 7, 2) AS average_amount  -- calculates the moving 7-day average
FROM (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
) c1,  -- creates an instance of the Customer table to capture customer vist dates
(
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
) c2  -- creates a second instance of the Customer table to calculate a moving average
WHERE c2.visited_on BETWEEN DATE_SUB(c1.visited_on, INTERVAL 6 DAY) AND c1.visited_on  -- limits the visit date(s) to a 7-day window
GROUP BY c1.visited_on  -- groups the data by visit date
HAVING c1.visited_on >= DATE_ADD(MIN(c2.visited_on), INTERVAL 6 DAY)  -- adds the condition that only dates within the 7-day window should be included in the moving average
ORDER BY c1.visited_on  -- orders the results by visit date in chronological order


/*
Output:
  +--------------+--------------+----------------+
  | visited_on   | amount       | average_amount |
  +--------------+--------------+----------------+
  | 2019-01-07   | 860          | 122.86         |
  | 2019-01-08   | 840          | 120            |
  | 2019-01-09   | 840          | 120            |
  | 2019-01-10   | 1000         | 142.86         |
  +--------------+--------------+----------------+
*/
