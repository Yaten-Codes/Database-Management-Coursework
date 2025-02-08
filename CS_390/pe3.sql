/*
1. Show the name and length of films that include 'fun' in the description and are 120
minutes or less.
*/


SELECT Title,Description, Length as "Total Minutes", TRUNCATE(length/60,0) AS "Hours", length MOD 60 AS "Minutes"
FROM film 
WHERE Description LIKE '%fun%' AND length <= 120;


/*
2.Show the name of films that end in 'a', 'e', 'i', 'o', or 'u'
*/


SELECT Title
FROM film 
WHERE Title LIKE '%a' OR Title LIKE '%e' OR Title LIKE '%i' OR Title Like '%o' OR Title LIKE '%u';

/*
3.Show the name of films with a length that is 120 minutes or longer, but are also 180
minutes or less.
*/
SELECT Title,Description, Length as "Total Minutes", TRUNCATE(length/60,0) AS "Hours", length MOD 60 AS "Minutes"
FROM film 
WHERE Length >= 120 AND length <=180;

/*
4. Show the title and length of films that have 'river' in the title and a rating of either 'PG'
or 'PG-13'
*/
SELECT Title, Length
FROM film
WHERE title LIKE '%river%' AND (rating = 'PG' OR rating = 'PG-13');


/*5. What are the names of the movies that have been released after 2012 with a length
greater than 160?
*/
SELECT Title
FROM film
WHERE (releaseYear > 2012) AND (length > 160);

/*
6. Show the name, replacement cost and rating of movies that do not have 'a' as the
second letter of the name and have a replacement cost of $19.99.
*/
SELECT Title
FROM film
WHERE (releaseYear > 2012) AND (length > 160);

/*
7. What are the names of movies that do not have a description?
*/
SELECT Title
FROM film
WHERE description IS NULL;


/*
8. Show the replacement cost for the film 'Town Ark'.
*/
SELECT replacementCost AS 'Replacement Cost'
FROM film
WHERE title = 'Town Artk';

/*
9. What are the names of movies that are rated 'G' and released in 2006 or movies that are
rated 'PG' and released in 2010?
*/
SELECT Title
FROM film
WHERE ((rating = 'G') AND (releaseYear = 2006)) OR ((rating = 'PG') AND (releaseYear = 2010));

/*
10. Show all the data, except for the description, for films that were not released in either
2006 or 2010.
*/
SELECt filmID AS 'Film ID', Title, releaseYear AS 'Release Year', Length, replacementCost AS 'Replacement Cost', Rating
From film
WHERE releaseYear NOT IN (2006, 2010);


/*
12. Now for films released in 2006, change the replacement cost to 10.00, using one
statement.
*/
UPDATE film
SET replacementCost = 10.00
WHERE releaseYear = 2006;\

/*
13. Remove all films that are less than 60 minutes long and rated PG, using one statement.
*/
DELETE
FROM film
WHERE length < 60 AND rating = 'PG';