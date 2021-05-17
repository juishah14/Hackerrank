-- Write a query to print the pattern P(20).

-- set var for length of each line
SET @number = 0;

-- choose a table w at least 20 rows and apply REPEAT func for each row
SELECT REPEAT('* ', @number := @number + 1) FROM information_schema.tables

-- limit num of lines to output
LIMIT 20;