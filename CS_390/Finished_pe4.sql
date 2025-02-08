-- Resulting	Relation:	CONTACT_INFO(contactID,	firstName,	middleInitial,	lastName,	birthday,	email,	url,	
-- notes)


--notes ALTER TABLE _table_Name__
-- drop or add constraint __name__
--ex ADD film_pk Primary KEY (filmID)]

--alter table
--drop constraint --name-- 




--task #1
-- A	variable-length	string	capable	of	storing	up	to	20 characters.
-- A	value	is	now	required.	If	a	value	isn't	specified	'UNKNOWN'	should	appear.
use pe4;
ALTER TABLE contactInfo
MODIFY COLUMN firstName VARCHAR(20) NOT NULL DEFAULT 'UNKOWN';

ALTER TABLE contactInfo
MODIFY COLUMN lastName VARCHAR(30) NOT NULL DEFAULT 'UNKOWN';


/*
Task	2	– Add	a	record:
Create	a	statement	that	will	add	a	record	(with	contactID	=	2)	to	the	contactInfo	table	without	specifying	
values	for	any	of	the	other	attributes.	You	can	test	if	your	addition	worked	properly	by	executing	the	
following	statement	and	seeing	that	'UNKNOWN'	was	used	for	both	the	firstName	and	lastName	for	the	
contact	just	added.
*/

INSERT INTO contactInfo (contactID)
VALUES(2);


/*
Task	3	– Add	a	new	attribute:
*/
ALTER TABLE contactInfo
ADD COLUMN owes DECIMAL(6,2);


/*
TASK 4
*/
--The new best identifier without an ID would be email because usually people only have a unique email .