SELECT w.id, wp.age, temp.coins_needed, temp.power
FROM
(
    -- get min coins and power values from this query
    SELECT code, MIN(w.coins_needed) AS coins_needed, power
    FROM Wands as w
    GROUP BY code, power
)
AS temp
-- join both tables w temp
INNER JOIN Wands as w ON temp.code = w.code AND temp.coins_needed = w.coins_needed AND temp.power = w.power
INNER JOIN Wands_Property as wp ON temp.code = wp.code
WHERE wp.is_evil = 0 
ORDER BY temp.power DESC, wp.age DESC