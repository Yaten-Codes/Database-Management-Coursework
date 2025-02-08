
--1 oepn use
USE sakilav2;


--2  show film structuce
DESCRIBE film; 

--3
SELECT title, replacementCost 
FROM film 
WHERE replacementCost > 28.00;

-- have a replacement cost that is greater than, or equal to, 15.99 and less than, or equal to, 17.99. and ha

SELECT title, replacementCost 
FROM film 
WHERE replacementCost >= 15.99 AND replacementCost <= 17.99 AND title LIKE '%z%';

--4 have a as second char and r as fifth and R or pg-13

SELECT title, Rating 
FROM film 
WHERE rating IN ('R', 'PG-13') AND title LIKE'_a__r%';