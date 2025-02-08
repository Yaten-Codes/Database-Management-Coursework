--1

DROP DATABASE IF EXISTS midterm;
CREATE DATABASE midterm;
USE midterm;

--2
CREATE TABLE PERSON(
personID INT,
name VARCHAR(25) NOT NULL,
address VARCHAR(25),
city VARCHAR(25),
state CHAR(2), 
zipCode VARCHAR(10),
areaCode CHAR(3), 
phoneNO CHAR(8),
CONSTRAINT PERSON_pk PRIMARY KEY (personID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--3
INSERT INTO PERSON (personID, name, address, city, state, zipCode, areaCode, phoneNO)
VALUES 
(1, 'Johnny Poet', '13406 E Philadelphia St', 'Whittier', 'CA', '90602', '562', '907-4200');


/*
check if inserted correctly
SELECT * FROM PERSON;
-*/
--4 remove person id1

DELETE
FROM PERSON
WHERE personID = 1;

