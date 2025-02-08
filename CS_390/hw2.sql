
-- Drops the conman database if it exists

DROP DATABASE IF EXISTS hw2;
CREATE DATABASE hw2;
USE hw2;


/* Since the database is dropped if it exists,
   there is no reason to drop the table */

CREATE TABLE Item(
    itemID  VARCHAR(25),
    itemName VARCHAR(25),
    name VARCHAR(25),
    street VARCHAR(25),
    city VARCHAR(25),
    colors VARCHAR(25),
    state CHAR(2),
    zipcode VARCHAR(10),
    cost Decimal(10,2),
    retailPrice Decimal(10,2),
    notes VARCHAR(255),
    description VARCHAR(255),
    returnable CHAR(1),
    perishable CHAR(1),
    shelfQty INT,
    CONSTRAINT Item_pk PRIMARY KEY(itemID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



