SET @rowIndex := -1;
SELECT ROUND(AVG(temp.LAT_N), 4) 
FROM
(
    SELECT @rowIndex := @rowIndex+1 AS rowIndex, s.LAT_N 
    FROM STATION AS s 
    ORDER BY s.LAT_N
) 
AS temp
WHERE temp.rowIndex IN (FLOOR(@rowIndex / 2), CEIL(@rowIndex / 2));