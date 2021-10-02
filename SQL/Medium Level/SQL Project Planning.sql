SELECT start_date, MIN(end_date)
FROM
(
    -- pick actual start date
    SELECT start_date
    FROM Projects
    -- if start_date not in end_date col then it's acc the start of the project
    WHERE start_date NOT IN
    (
        SELECT end_date
        FROM Projects
    )
)
AS s,
(
    -- pick actual end date
    SELECT end_date
    FROM Projects
    -- if end_date not in start_date col then it's acc the end of the project
    WHERE end_date NOT IN
    (
        SELECT start_date
        FROM Projects
    )
)
AS e
WHERE start_date < end_date
GROUP BY start_date
-- order by time taken, start_date
ORDER BY DATEDIFF(MIN(end_date), start_date), start_date;