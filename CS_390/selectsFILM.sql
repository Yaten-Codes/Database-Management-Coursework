USE sakilav2;

-- Show the title and the replacement cost for films with a replacement cost of more than 28.00.

SELECT title, replacementCost 
FROM film 
WHERE replacementCost > 28.00;

-- Show the title and the replacement cost for films that have a replacement cost that is greater than, or equal to, 15.99 and less than, or equal to, 16.99.

SELECT title, replacementCost 
FROM film 
WHERE replacementCost >= 15.99 AND replacementCost <= 16.99;

SELECT title, replacementCost 
FROM film 
WHERE replacementCost <= 16.99 AND replacementCost >= 15.99;

SELECT title, replacementCost 
FROM film 
WHERE replacementCost BETWEEN 15.99 AND 16.99;

-- Show the title, description, rating, and length of films that have a length of 120.

SELECT title, description, rating, length 
FROM film 
WHERE length = 120;

-- Show the title, description, rating, and length of films that do not have a length of 120.

SELECT title, description, rating, length 
FROM film 
WHERE length <> 120;

SELECT title, description, rating, length 
FROM film 
WHERE length != 120;

-- Show the title, description, and rating of movies that are rated either 'G' or 'PG'.

SELECT Title, Description, Rating 
FROM film 
WHERE rating = 'G' OR rating = 'PG';

SELECT Title, Description, Rating 
FROM film 
WHERE rating IN ('G', 'PG');

-- Show the title, description, and rating of movies that are not rated either 'G' or 'PG'.

SELECT Title, Description, Rating 
FROM film 
WHERE rating != 'G' AND rating <> 'PG';

SELECT Title, Description, Rating 
FROM film 
WHERE rating NOT IN ('G', 'PG');

-- What are the titles of movies that contain 'art' in the title?

SELECT Title 
FROM film 
WHERE title LIKE '%art%';

-- What are the titles of movies that start with an 'e' and end with a 't'?

SELECT TITLE 
FROM film 
WHERE title LIKE 'e%t';

-- What are the titles of movies that have an 'a' as the second letter of the title and a 'r' as the fifth letter of the title?

SELECT TITLE 
FROM film 
WHERE title LIKE '_a__r%';

-- Show the title of each film, the total length in minutes, as well as in hours and minutes for movies that have an 'a' as the second letter of the title and a 'r' as the fifth letter of the title.

SELECT title, length, TRUNCATE(length/60,0), length MOD 60 
FROM film 
WHERE title LIKE '_a__r%';


--Rename columns--
SELECT Title, Length as "Total Minutes", TRUNCATE(length/60,0) AS "Hours", length % 60 AS "Minutes" 
FROM film 
WHERE title LIKE '_a__r%';

