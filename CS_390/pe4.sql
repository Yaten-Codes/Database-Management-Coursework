-- Date updated:  05/23/2024

-- Drops the pe4 database if it exists

DROP DATABASE IF EXISTS pe4;
CREATE DATABASE pe4;
USE pe4;

-- Creates the contactInfo table

/* Since the database is dropped if it exists,
   there is no reason to drop the table */

CREATE TABLE contactInfo(
contactID INTEGER,              
firstName VARCHAR(15),
middleInitial CHAR(1),
lastName VARCHAR(25),
email VARCHAR(40),
url VARCHAR(55),
birthday DATE,
notes VARCHAR(255),
CONSTRAINT contactInfo_pk PRIMARY KEY(contactID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Inserts the initial data.

INSERT INTO contactInfo
(contactID,
firstName,
middleInitial,
lastName,
email,
url,
birthday,
notes)
VALUES
(1,
'Kristine',
'E',
'Dillon',
'president@whittier.edu',
'https://www.whittier.edu/president',
NULL,
'Started as President of Whittier on June 14, 2023.');
