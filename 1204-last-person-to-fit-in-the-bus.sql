/*
1204. Last Person to Fit in the Bus

There is a queue of people waiting to board a bus.
However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.
Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit.
The test cases are generated such that the first person does not exceed the weight limit.
Note that only one person can board the bus at any given turn.

Table: Queue
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| person_id   | int     |
| person_name | varchar |
| weight      | int     |
| turn        | int     |
+-------------+---------+


Input: 
  Queue:
  +-----------+-------------+--------+------+
  | person_id | person_name | weight | turn |
  +-----------+-------------+--------+------+
  | 5         | Alice       | 250    | 1    |
  | 4         | Bob         | 175    | 5    |
  | 3         | Alex        | 350    | 2    |
  | 6         | John Cena   | 400    | 3    |
  | 1         | Winston     | 500    | 6    |
  | 2         | Marie       | 200    | 4    |
  +-----------+-------------+--------+------+
*/


SELECT person_name
FROM (
    SELECT
        person_name,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
) Sorted  -- used window function to sum total weight of passengers aboard the bus
WHERE total_weight <= 1000  -- restricts the weight of all passengers aboard the bus to 1000
ORDER BY turn DESC  -- orders by descending values to identify the last passenger that boarded the bus
LIMIT 1  -- limits the results to 1 (i.e. the final passenger)


/*
Output: 
  +-------------+
  | person_name |
  +-------------+
  | John Cena   |
  +-------------+
*/
