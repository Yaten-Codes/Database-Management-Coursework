-- Date updated:  05/20/2024

-- Drops the conman database if it exists

DROP DATABASE IF EXISTS conman;
CREATE DATABASE conman;
USE conman;

-- Creates the contactInfo table

/* Since the database is dropped if it exists,
   there is no reason to drop the table */

CREATE TABLE BOOK(
title VARCHAR(50),
isbn13Number CHAR(3),
author VARCHAR(13),
numberOfPages INT,
releaseDate Date,
CONSTRAINT BOOK_pk PRIMARY KEY(isbn13Number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



