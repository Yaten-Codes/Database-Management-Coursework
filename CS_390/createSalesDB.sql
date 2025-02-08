# Date updated: 6/13/24

DROP DATABASE IF EXISTS sales;

CREATE DATABASE sales;

USE sales;

CREATE TABLE district (
distID VARCHAR(5),
distName VARCHAR(50),
CONSTRAINT district_pk PRIMARY KEY (distID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE territory (
terrID VARCHAR(5),
terrName VARCHAR(50),
salesRepID VARCHAR(9),
distID VARCHAR(5),
CONSTRAINT territory_pk PRIMARY KEY (terrID),
CONSTRAINT territory_distID_fk FOREIGN KEY (distID) REFERENCES district(distID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE salesRep (
empID VARCHAR(9),
firstName VARCHAR(25),
lastName VARCHAR(25),
address VARCHAR(50),
city VARCHAR(30),
state CHAR(2),
zip VARCHAR(10),
CONSTRAINT salesRep_pk PRIMARY KEY(empID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE techSalesRep (
empNum VARCHAR(9),
fName VARCHAR(25),
lName VARCHAR(25),
addr VARCHAR(50),
city VARCHAR(30),
state CHAR(2),
zip VARCHAR(10),
CONSTRAINT techSalesRep_pk PRIMARY KEY(empNum)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;