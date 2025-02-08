/*
Part 2: Modifying the CONMAN Database:
*/



-- Task 1: Add new data into contactInfo table
INSERT INTO contactInfo (contactID, firstName, middleInitial, lastName, email, url, birthday, notes)
VALUES 
(3, 'Eli', 'T', 'Wallowby', 'etwallowby@concor.com', 'www.concor.com', '1986-03-26', 'Very helpful.'),
(4, 'Eve', 'C', 'Sampson', 'esampson@concor.com', NULL, '2002-05-11', 'Avid chess player.'),
(5, 'Carson', 'B', 'Campbell', 'cbc232@mvch.org', NULL, '1985-01-05', 'Vegan.');

-- own record here
INSERT INTO contactInfo (contactID, firstName, middleInitial, lastName, email, url, birthday, notes)
VALUES 
(6, 'Alexis', 'N', 'Carreto', 'acarreto@poets.whittier.edu', NULL, '2003-01-15', 'Student.');

-- Check the table
SELECT * FROM contactInfo;


-- Task	2	– Add	an	attribute	to	the	contactInfo	table:
ALTER TABLE contactInfo
ADD COLUMN nickname VARCHAR(20) DEFAULT 'To Be Determined';

DESCRIBE contactInfo;

SELECT * FROM contactInfo;

-- Task	3	– Add	constraints	to	the	contactInfo	table:
ALTER TABLE contactInfo
MODIFY COLUMN firstName VARCHAR(15) NOT NULL,
MODIFY COLUMN lastName VARCHAR(25) NOT NULL;

DESCRIBE contactInfo;


-- Task	4	−	Update	an	existing	record:
UPDATE contactInfo
SET nickname = 'Prez'
WHERE firstName = 'Kristine' AND lastName = 'Dillon';

SELECT * FROM contactInfo;

-- Task	5	−	Delete	records:
DELETE FROM contactInfo
WHERE url = 'www.concor.com';

SELECT * FROM contactInfo;

