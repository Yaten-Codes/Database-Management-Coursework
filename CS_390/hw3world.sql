/*
Part	1:	Querying	the	WORLD	Database:
*/


-- 1. Who is listed in the database as head of state of the 'United Kingdom'?
SELECT HeadOfState AS 'Head of State'
FROM country
WHERE Name = 'United Kingdom';

-- 2. Change the head of state for the 'United Kingdom' to Charles III
UPDATE country
SET HeadOfState = 'Charles III'
WHERE Name = 'United Kingdom';

-- 3. Show the name of the countries that do not have an independence year specified
SELECT Name AS 'Country Name'
FROM country
WHERE IndepYear IS NULL;

-- 4. Show the name and continent of countries with population >= 100 million and life expectancy between 80-90
SELECT Name, Continent
FROM country
WHERE Population >= 100000000 AND LifeExpectancy BETWEEN 80 AND 90;

-- 5. List the countries located in North America and South America
SELECT Name
FROM country
WHERE Continent IN ('North America', 'South America');
