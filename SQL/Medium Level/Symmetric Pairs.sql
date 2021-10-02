SELECT f1.X, f1.Y 
FROM Functions AS f1 
WHERE f1.X = f1.Y AND 
(
    -- situation where x = y in symmetric pair
    SELECT COUNT(*) FROM Functions 
    WHERE X = f1.X AND Y = f1.X
) > 1

UNION

SELECT f1.X, f1.Y 
FROM Functions AS f1, Functions AS f2
-- situation where x != y in symmetric pair, last part is to ensure we only pick one of these pairs eg. we have (20, 21) and (21, 20), we only print (20, 21)
WHERE f1.X <> f1.Y AND f1.X = f2.Y AND f1.Y = f2.X AND f1.X < f2.X

ORDER BY X;