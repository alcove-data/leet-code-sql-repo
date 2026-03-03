/*
619. Biggest Single Number

A single number is a number that appeared only once in the MyNumbers table.
Find the largest single number. If there is no single number, report null.
The result format is in the following example.


Table: MyNumbers
+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+


Example 1:

Input:
  MyNumbers:
  +-----+
  | num |
  +-----+
  | 8   |
  | 8   |
  | 3   |
  | 3   |
  | 1   |
  | 4   |
  | 5   |
  | 6   |
  +-----+

Example 2:

Input: 
  MyNumbers:
  +-----+
  | num |
  +-----+
  | 8   |
  | 8   |
  | 7   |
  | 7   |
  | 3   |
  | 3   |
  | 3   |
  +-----+
*/

SELECT MAX(num) AS num -- selects the maximum value from the num column
FROM (  -- creates a sub query to iterate the SELECT statement over
    SELECT num
    FROM MyNumbers
    GROUP BY num  -- groups the results by num
    HAVING COUNT(num) = 1  -- restricts the results to numbers appearing only once in the column
) MN  -- names the new table MN


/*
Example 1:

Output:
  +-----+
  | num |
  +-----+
  | 6   |
  +-----+

Example 2:

Output: 
  +------+
  | num  |
  +------+
  | null |
  +------+
*/
