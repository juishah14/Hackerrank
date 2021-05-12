/* Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths 
(i.e. number of characters in the name). If there is more than one smallest or largest city, choose the one that 
comes first when ordered alphabetically.*/

-- To get the city with the shortest length name
SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY), CITY
LIMIT 1;

-- To get the city with the longest length name
SELECT CITY, LENGTH(CITY) FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1;