-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'
-- Note: City.CountryCode and Country.Code are matching key columns

SELECT City.Name FROM City
JOIN Country                        -- Note this is an inner join but in MySQL JOIN = INNER JOIN
ON City.CountryCode = Country.Code
WHERE Country.Continent = 'AFRICA';