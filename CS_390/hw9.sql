-- hw 9
--  problem 1
-- SELECT CONCAT(p.city, ', ', s.stateCode) AS Location, COUNT(*) AS Count
-- FROM publisher p INNER JOIN state s ON p.stateCode = s.stateCode
-- GROUP BY p.city, p.stateCode
-- ORDER BY COUNT(*) ASC, Location DESC;

SELECT 
    CONCAT(publisher.city, ', ', publisher.stateCode) AS Location, -- city & state code inside publisher table 
    COUNT(*) AS Count -- COUNT(*) returns the number of rows in the table.
FROM publisher  -- uses this table
GROUP BY 
    publisher.city, publisher.stateCode -- groups all rows that share the same city and stateCode
ORDER BY 
    COUNT(*) ASC,  -- makes so the count is prioritized in asc: 1, 2 ,3
    Location DESC; -- makes so the loc is priotized next in desc: z--> a
    

-- problem 2:
-- 2)	For	EVERY book	that	exists	in	the	book	table,	show	the	title,	the	count	of	the	number	of	ratings,	the	
-- minimum	rating,	the	maximum	rating,	and	the	average	rating	rounded	to	the	nearest	hundredth.	Books	
-- with	no	ratings	should	show	NULL	for	the	minimum,	maximum,	and	average	rating.	Sort	the	results by	the
-- number	of	ratings	in	descending	order,	followed	by	the	average	rating	rounded	to	the	nearest	hundredth in	
-- descending	order,	followed	by	the	title	in	ascending	order.	Your	output	should	match	the	display	given	
-- below	(including	column	headings).
-- solution:

SELECT 
    book.title, 									-- selects book title
    COUNT(bookReview.rating) AS 'Total Ratings',									
    MIN(bookReview.rating) AS MinimumRating,
    MAX(bookReview.rating) AS MaximumRating,
    ROUND(AVG(bookReview.rating), 2) AS AverageRating  -- round to the nearest a hundredth
FROM book		-- use book table
LEFT JOIN  		-- joins the book table & bookreview table using isbn 
    bookReview
ON 
    book.isbn = bookReview.isbn
GROUP BY   -- groups the book title for aggregate functions to work on each book
    book.title
ORDER BY 					
    `Total Ratings` DESC, 
    AverageRating DESC, 
    book.title ASC;
    
-- Problem: 3:
-- 3)	Show	the	publisher	name	and	count	of	books	published	for	those	publishers	that	have	published	two	or	
-- more books.	Records	should	be	sorted	by	the	count	of	books	published	in	descending	order,	followed	by	
-- publisher	name	in	ascending	order.	Your	output	should	match	the	display	given	below	(including	column	
-- headings).
-- solution:
SELECT 
    publisher.name AS 'Publisher Name',
    COUNT(book.isbn) AS 'Book Count'    -- counts books published 
FROM 
    publisher   -- use publisher table
JOIN 
    book   -- joins the publisher with the book table using the ID
ON 
    publisher.publisherID = book.publisherID
GROUP BY 
    publisher.name  	-- count is applied to the name of each publisher
HAVING 
    COUNT(book.isbn) >= 2  -- count has to be >= 2
ORDER BY
    `Book Count` DESC, 
    `Publisher Name` ASC;
    
    
    
--     Problem 4:
-- 4)	Write	a	query	that	will	select	all	of	the	book	titles	that	have	“love” in	their	name	and	will	display	the	title	
-- of	the	book,	the	length	of	the	title,	and	the	part	of	the	title	that	includes	the	first	appearance	of	the	string
-- “love”	through	the	end	of	the	title.	Sort	your	results	by	title	in	ascending	order.	Your	output	should	exactly	
-- match	the	display	given	below	(including	column	headings).
-- HINT:	Use	the	SUBSTR	and	INSTR functions.	If	you	omit	the	third	input	for	the	SUBSTR	function	(the	string	
-- length),	then	the	function	defaults	to	reading	until	the	end	of	the	string,	which	is	very	useful	for	this	
-- problem.
-- solution:

SELECT 
    title AS `Title`,
    LENGTH(title) AS `Title Length`,		-- length of title
    SUBSTR(title, INSTR(title, 'love')) AS `After Love`	-- INSTR(title, 'love'): Finds the starting position of the first occurrence of the string "love" in the title
-- SUBSTR(title, position): Extracts the substring starting from the position of "love" until the end of the string.
FROM 
    book  -- uses book table
WHERE 
    title LIKE '%love%' 	-- Filters for book titles that contain "love" anywhere in the text.
ORDER BY 
    title ASC;

-- 	Problem 5:
-- 5)	Show	a	listing	of	used	book	titles	that	are	actually	available	(meaning	that	they	are	actually	currently	
-- owned	by	someone,	so	that	they	appear	in	the	ownersBook table).	Also, display	the description	of	the	
-- book’s	category	from	the	category	table	as	a	column	with	the	heading	“Genre”.	A	book’s title	should	only	
-- appear	once	in	the	listing (you	will	need	to	use	the	DISTINCT	command	to	make	sure	of	this).	Order	your	
-- results	by	title	in	ascending	order.	Your	output	should	match	exactly	the	display	given	below	(including	
-- column	headings)
-- solution:

SELECT DISTINCT  -- book title only appears once using distinct
    book.title AS `Title`, 
    category.catDescription AS `Genre`   	
FROM 
    book   -- book table
JOIN 
    ownersBook   -- joins book table with the ownersBook table to include only books currently owned by someone. (using isbn)
ON 
    book.isbn = ownersBook.isbn
JOIN 
    category		-- join the book table with the category table to fetch the genre (category description) of each book. (category = catID) 
ON 
    book.category = category.catID
ORDER BY 
    `Title` ASC;
