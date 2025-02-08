-- Date updated:  05/20/2024

-- Drops the conman database if it exists

DROP DATABASE IF EXISTS conman;
CREATE DATABASE conman;
USE conman;

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
/


