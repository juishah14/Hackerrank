/* 
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed 
underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation.
*/

-- ie. PIVOT A GIVEN TABLE

-- If you forget how this works: https://nifannn.github.io/2017/10/21/SQL-Notes-Hackerrank-Occupations/

-- Set vars for the row number RowLine (one for each profession)
SET @d=0, @a=0, @p=0, @s=0;
SELECT MIN(Doctor), MIN(Professor), MIN(SINGER), MIN(Actor)
FROM

-- Selecting Name or NULL if no name and putting under appropriate col (Actor, Doctor, etc)
(SELECT IF(OCCUPATION='Actor', NAME, NULL) AS Actor,
        IF(OCCUPATION='Doctor', NAME, NULL) AS Doctor,
        IF(OCCUPATION='Professor', NAME, NULL) AS Professor,
        IF(OCCUPATION='Singer', NAME, NULL) AS SINGER,
 
-- Calculating RowLine
 CASE OCCUPATION
    WHEN 'Actor' THEN @a:=@a+1
    WHEN 'Doctor' THEN @d:=@d+1
    WHEN 'Professor' THEN @p:=@p+1
    WHEN 'Singer' THEN @s:=@s+1
END
AS RowLine 
 
-- Get Names from OCCUPATIONS table in Alphabetical Order
-- So get Ashley first, Christeen second, etc. and then add Ashley to the temp table first etc.
-- Look at like to see what temp table should look like
FROM OCCUPATIONS ORDER BY NAME)

-- Then group temp table values by same RowLine number
AS temp GROUP BY temp.RowLine;