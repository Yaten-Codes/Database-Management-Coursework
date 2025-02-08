-- Practice exercise 14
-- -- problem 1
-- 1)	Display	the	reviewer's	name,	book	title,	and	rating	for	books	that have	a	rating	between	5	and	7.	Sort	
-- the	results	by	rating	in	descending	order, and	then	by	title	in	ascending	order. Remember	that	for	this	
-- assignment,	both	the	column	headings	and	the	result	order	should	match	exactly	the	answers	that	are	
-- provided.
-- Solution:
SELECT reviewer.name AS 'Reviewer Name', book.title AS 'Book Title', bookReview.rating
FROM (reviewer INNER JOIN bookReview   --  reviewer table goes first in column
ON reviewer.reviewerID = bookReview.reviewerID)  -- joins only when where the reviewerID is the same
INNER JOIN book				
ON bookReview.isbn = book.isbn -- joins the book table to go first matching isbn of bookreview table
WHERE bookReview.rating BETWEEN 5 AND 7    -- where rating is between 5 and 7
ORDER BY bookReview.rating DESC, book.title ASC;  -- rating takes priority in desc form


-- 3 tables used; Reviewer, book, bookReview
-- 3 column result: Reviewer Name, Book Title, Rating


-- Problem 2
-- 2)	List	the	owners	and	the	books	that	they	own.	List	the	owners	even	if	they	do	not	currently	own	a	
-- book.	List	the	owners	first	and	last	name	and	the	titles	of	their	books. An	owner	will	appear	on	multiple	
-- rows	if	they	own	multiple	books,	and	the	“Title”	for	an	owner	will	be	NULL	if	they	currently	do	not	own	
-- any	books.	Order	the	results	by	the	owner’s	last	name	in	descending	order,	then	by	title	in	ascending	
-- order.
-- solution:
SELECT owner.Firstname, owner.LastName, book.Title   -- selects owner and book tables
FROM (owner LEFT OUTER JOIN ownersBook   		-- joins owner and ownersBook according to ownerID
ON owner.ownerID = ownersBook.ownerID)
LEFT OUTER JOIN book							-- joins book table to ownerBook table using isb
ON ownersBook.isbn = book.isbn
ORDER BY owner.lastName Desc, book.title ASC;

-- 3 tables used: joined even tho 2 are selected
-- 3 columns firstname, lastname, title



-- problem 3
-- 3)	For	publishers	that	have	'Read'	in	the	publisher's	name, and	that	have	published	MORE than	one	
-- book:	show	the	publisher	name	and	location	(exactly	as	shown	below,	use	the	CONCAT	function	to	do	
-- this),	the	count	of	the number	of	books	that	they	have	published	(by	counting	their	published	books’
-- ISBN	numbers),	the	string	length	of	the	longest title that	they	have	published,	and	the	string	length	of	
-- the	shortest	title that	they	have	published. Order	your	results	by	publisher	name	in	ascending	order
-- solution:
SELECT CONCAT(publisher.name, ' in ', publisher.city, ', ', publisher.stateCode) AS 'Publisher Name and Location',  -- combines name,'in', city, ', ', statecode
COUNT(book.isbn) AS '# Books', MAX(LENGTH(book.title)) AS 'Longest Title', MIN(LENGTH(book.title)) AS 'Shortest Title'
FROM publisher INNER JOIN book   -- joins publisher table with book table using publisherID  publisher table goes first
ON publisher.publisherID = book.publisherID
WHERE publisher.name LIKE '%read%'
GROUP BY publisher.name, publisher.city, publisher.stateCode  -- in this order
HAVING COUNT(book.isbn) > 1
ORDER BY publisher.name ASC;

-- 2 tables used: publisher & book
-- 4 columns: Publisher Name and Location, # books, Longest Title, Shortest Title


-- problem 4
-- 4)	Show	the	title,	average	rating	rounded	to	the	nearest	whole	number,	and	the	first	20	characters	of	
-- the	book's	description,	for	all	books	that	have	'the'	in	the	title	(regardless	of	case)	in	descending	order	by	
-- the	rounded	average	rating, and	then	in	descending	order	by	title.	You	should	include	books	that	have	
-- not	been	rated	as	having	an	average	rating	of	NULL.	Your	output	should	match	exactly	the	output	given	
-- below
-- Solution:
SELECT book.Title, ROUND(AVG(bookReview.rating), 0) AS 'Avg Rating', CONCAT(SUBSTR(book.description, 1, 20), '...') AS 'Description Excerpt'
FROM book LEFT OUTER JOIN bookReview    -- joins the book and book review table
ON book.isbn = bookReview.isbn
WHERE book.title LIKE '%the%'
GROUP BY book.title, book.description
ORDER BY ROUND(AVG(bookReview.rating),0) DESC, book.title DESC;

-- tables used: Book, bookreview, 
-- 3 columns: Title, Avg Rating, Description Excerpt


-- how to use join:
-- 1.INNER JOIN (or just JOIN):
-- Only returns matches between both tables
-- If no match exists, the row is excluded

-- 2.LEFT JOIN:
-- Returns ALL records from the left table and matching records from the right table
-- If no match in right table, returns NULL for those columns

-- 3. RIGHT JOIN:
-- Returns ALL records from the right table and matching records from the left table
-- If no match in left table, returns NULL for those columns