/*
585. Investments in 2016

Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:
> have the same tiv_2015 value as one or more other policyholders, and
> are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.

Table: Insurance
+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| pid         | int   |
| tiv_2015    | float |
| tiv_2016    | float |
| lat         | float |
| lon         | float |
+-------------+-------+

Input:
  Insurance:
  +-----+----------+----------+-----+-----+
  | pid | tiv_2015 | tiv_2016 | lat | lon |
  +-----+----------+----------+-----+-----+
  | 1   | 10       | 5        | 10  | 10  |
  | 2   | 20       | 20       | 20  | 20  |
  | 3   | 10       | 30       | 20  | 20  |
  | 4   | 10       | 40       | 40  | 40  |
  +-----+----------+----------+-----+-----+
*/


SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016  -- selects the total investment value after rounding to two digits
FROM Insurance
WHERE tiv_2015 IN ( -- creates the condiition that total investment value is the same as at least one other policyholder
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (  -- creates the condition that location, as a latitude + longitude pair, is unique
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);


/*
Output:
  +----------+
  | tiv_2016 |
  +----------+
  | 45.00    |
  +----------+
*/
