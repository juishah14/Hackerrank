/*
Write a query to print the pattern P(20).
Repeat a string 3 times: SELECT REPEAT("SQL Tutorial", 3);
And we also need a table with at least 20 rows, then we can apply REPEAT function once for each row. 
Additionally, we need a variable to represent the length of each line.
*/

-- set var for length of each line
SET @number = 21;

-- choose a table w at least 20 rows and apply REPEAT func for each row
SELECT REPEAT('* ', @number := @number - 1) FROM information_schema.tables 

-- limit num of lines to output
LIMIT 20;
