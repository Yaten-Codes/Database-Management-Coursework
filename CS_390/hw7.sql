

Drop DATABASE IF EXISTS Carreto_ACMEOnline;

-- Create the database
Create DATABASE Carreto_ACMEOnline;

-- open the database
Use Carreto_ACMEOnline;



-- CATEGORY(categoryName, shippingPerPound, offersAllowed)
-- • categoryName should allow up to 35 characters to be stored.
-- • shippingPerPound should be able to store digits in the format ##.##. A value is not required.
-- • offersAllowed should allow only 'y' or 'n' to be entered. A value is not required

CREATE TABLE CATEGORY (
    categoryName VARCHAR(35) PRIMARY KEY,
    shippingPerPound DECIMAL(4,2),
    offersAllowed ENUM('y', 'n')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE CATEGORY;


-- ITEM(itemNumber, itemName, descript, model, price, categoryName)
-- ITEM(categoryName) mei CATEGORY(categoryName)

-- • itemNumber is an integer that will store only positive values and automatically increment by 1 when
--  record is added.
-- • itemName should store up to 35 characters. A value is required.
-- • descript should store up to 255 characters. A value is not required.
-- • model should store up to 50 characters. A value is required.
-- • price should be able to store digits in the format ######.##. A value is required.
-- • If a categoryName is changed or deleted in CATEGORY, then the change should be reflected here as
-- well.


CREATE TABLE ITEM(
    itemNumber INT AUTO_INCREMENT PRIMARY KEY,
    itemName VARCHAR(35)  NOT NULL,
    descript VARCHAR(255),
    model VARCHAR(50) NOT NULL,
    price DECIMAL(8,2) NOT NULL,
    categoryName VARCHAR(35),
    CONSTRAINT ITEM_categoryName_fk FOREIGN KEY (categoryName) REFERENCES CATEGORY(categoryName)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE ITEM;


-- OFFER(offerCode, discountAmt, minAmount, expirationDate)
-- • offerCode should allow up to 15 characters to be stored.
-- • discountAmt must should up to 35 characters to be stored. A value is required.
-- • minAmount should be able to store digits in the format ##.##. A value is required.
-- • expirationDate should store a date value. A value is required.
CREATE TABLE OFFER(
    offerCode VARCHAR(15) PRIMARY KEY,
    discountAmt VARCHAR(35) NOT NULL,
    minAmount DECIMAL (4,2) NOT NULL,
    expirationDate DATE NOT NULL
) ENGINE=InnoDB CHARSET=utf8mb4;

DESCRIBE OFFER;


-- CUSTOMER(customerID, customerName, address, email, customerType)
-- • customerID is an integer that will store only positive values and automatically increment by 1 when
-- a record is added.
-- • customerName should allow up to 50 characters to be stored. A value is required.
-- • address should allow up to 150 characters to be stored. A value is required.
-- • email should allow up to 80 characters to be stored. A value is not required.
-- • customerType is a discriminator that should allow only 'business' or 'home' to be entered. A value is
-- not required.
CREATE TABLE CUSTOMER(
    customerID INT AUTO_INCREMENT PRIMARY KEY,
    customerName VARCHAR(50) NOT NULL,
    address VARCHAR(150) NOT NULL,
    email VARCHAR(80),
    customerType ENUM('business', 'home')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE CUSTOMER;


-- BUSINESS(customerID, paymentTerms)
-- BUSINESS(customerID) mei CUSTOMER(customerID)
-- • paymentTerms should allow up to 50 characters to be stored. A value is required.
-- • If a customerID is changed or deleted, then the change should be reflected here as well.
CREATE TABLE BUSINESS(
    customerID INT PRIMARY KEY,
    paymentTerms VARCHAR(50) NOT NULL,
    CONSTRAINT BUSINESS_customerID_fk FOREIGN KEY (customerID) REFERENCES CUSTOMER(customerID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE BUSINESS;

-- HOME(customerID, creditCardNum, cardExpirationDate)
-- HOME(customerID) mei CUSTOMER(customerID)
-- • creditCardNum will store exactly 16 characters. A value is required.
-- • cardExpiration will store exactly 6 characters. A value is required.
-- • If a customerID is changed or deleted, then the change should be reflected here as well.
CREATE TABLE HOME(
        customerID INT PRIMARY KEY,
    creditCardNum CHAR(16) NOT NULL,
    cardExpirationDate CHAR(6) NOT NULL,
    CONSTRAINT HOME_customerID_fk FOREIGN KEY (customerID) REFERENCES CUSTOMER(customerID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE HOME;


-- ORDERED(orderID, totalCost, customerID, offerCode)
-- ORDERED(customerID) mei CUSTOMER(customerID)
-- ORDERED(offerCode) mei OFFER(offerCode)
-- • orderID is an integer that will store positive values and automatically increment by 1 when a record
-- is added.
-- • totalCost should allow digits in the format of ########.## to be stored. A value is required.
-- • If the customerID of a CUSTOMER is changed or deleted, then that change should be reflected here
-- as well.
-- • If the offerCode of an OFFER is changed, then that change should be reflected here as well. If the
-- offerCode of an OFFER is deleted, then offerCode should be SET NULL in this table.
CREATE TABLE ORDERED(
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    totalCost DECIMAL(10,2) NOT NULL,
    customerID INT,
    offerCode VARCHAR(15),
    CONSTRAINT ORDERED_customerID_fk FOREIGN KEY (customerID) REFERENCES CUSTOMER(customerID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT ORDERED_offerCode_fk FOREIGN KEY (offerCode) REFERENCES OFFER(offerCode)
        ON UPDATE CASCADE
        ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE ORDERED;



-- LINE_ITEM(orderID, itemNumber, quantity, shippingAmount)
-- LINE_ITEM(orderID) mei ORDERED(orderID)
-- LINE_ITEM(itemNumber) mei ITEM(itemNumber)
-- • quantity should be capable of storing a whole number up to 255 only. A value is required.
-- • shippingAmount should be able to store digits in the format ####.##. A value is not required.
-- • If an orderID in ORDERED is changed or deleted, then the change should be reflected here as well.
-- • If the itemNumber of an ITEM is changed or deleted, then the change should be reflected here as
-- well
CREATE TABLE LINE_ITEM(
    orderID INT,
    itemNumber INT,
    quantity TINYINT UNSIGNED NOT NULL,
    shippingAmount DECIMAL(6,2),
    PRIMARY KEY (orderID, itemNumber),
    CONSTRAINT LINE_ITEM_orderID_fk FOREIGN KEY (orderID) REFERENCES ORDERED(orderID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT LINE_ITEM_itemNumber_fk FOREIGN KEY (itemNumber) REFERENCES ITEM(itemNumber)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE LINE_ITEM;



-- PURCHASE_CONTACT(customerID, contactName, contactPhone)
-- PURCHASE_CONTACT(customerID) mei BUSINESS(customerID)
-- • contactName should allow up to 50 characters to be stored.
-- • contactPhone should store exactly 12 characters. A value is required.
-- • If the customerID of a BUSINESS customer is changed or deleted, then the change should be
-- reflected here as well.
CREATE TABLE PURCHASE_CONTACT(
    customerID INT,
    contactName VARCHAR(50),
    contactPhone CHAR(12) NOT NULL,
    PRIMARY KEY (customerID, contactPhone),
    CONSTRAINT PURCHASE_CONTACT_customerID_fk FOREIGN KEY (customerID) REFERENCES BUSINESS(customerID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE PURCHASE_CONTACT;

-- GUARANTEE(orderID, customerID, url, refundAmount)
-- GUARANTEE(orderID) mei ORDERED(orderID)
-- GUARANTEE(customerID) mei HOME(customerID)
-- • url should be able to store up to 50 characters. A value is not required.
-- • refundAmount should be able to store digits in the format ########.##. A value is required.
-- • If an orderID in ORDERED is changed or deleted, then the change should be reflected here as well.
-- • If a customerID is changed or deleted, then the change should be reflected here as well.
CREATE TABLE GUARANTEE(
    orderID INT,
    customerID INT,
    url VARCHAR(50),
    refundAmount DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (orderID, customerID),
    CONSTRAINT GUARANTEE_orderID_fk FOREIGN KEY (orderID) REFERENCES ORDERED(orderID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT GUARANTEE_customerID_fk FOREIGN KEY (customerID) REFERENCES HOME(customerID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE GUARANTEE;


-- part 2

/*
1) Add the following data to the CATEGORY table:
+--------------+------------------+---------------+
| categoryName | shippingPerPound | offersAllowed |
+--------------+------------------+---------------+
| Books | 0.99 | y |
| Home | 1.99 | y |
| Jewelry | 0.99 | n |
| Toys | 0.99 | y |
+--------------+------------------+---------------+
*/

INSERT INTO CATEGORY (categoryName, shippingPerPound, offersAllowed) VALUES
('Books', 0.99, 'y'),
('Home', 1.99, 'y'),
('Jewelry', 0.99, 'n'),
('Toys', 0.99, 'y');

SELECT * FROM CATEGORY;

/*
2) Add the following data to the ITEM table:
+------------+-----------------------+---------------------------+------------------+---------+--------------+
| itemNumber | itemName | descript | model | price | categoryName |
+------------+-----------------------+---------------------------+------------------+---------+--------------+
| 1 | Cabbage Patch Doll | Baby boy doll | Boy | 39.95 | Toys |
| 2 | The Hobbit | Written by J.R.R. Tolkien | Paperback | 9.95 | Books |
| 3 | Keurig Beverage Maker | Platinum Edition in Red | Platinum Edition | 299.95 | Home |
| 4 | 1ct diamond ring | diamond is certified | 64gt32 | 4000.00 | Jewelry |
+------------+-----------------------+---------------------------+------------------+---------+--------------+
*/

INSERT INTO ITEM (itemName, descript, model, price, categoryName) VALUES
('Cabbage Patch Doll', 'Baby boy doll', 'Boy', 39.95, 'Toys'),
('The Hobbit', 'Written by J.R.R. Tolkien', 'Paperback', 9.95, 'Books'),
('Keurig Beverage Maker', 'Platinum Edition in Red', 'Platinum Edition', 299.95, 'Home'),
('1ct diamond ring', 'diamond is certified', '64gt32', 4000.00, 'Jewelry');

SELECT * FROM ITEM;

/*
3) Add the following data to the OFFER table:
+-----------+-------------+-----------+----------------+
| offerCode | discountAmt | minAmount | expirationDate |
+-----------+-------------+-----------+----------------+
| 34574 | 20% off | 20.00 | 2025-12-31 |
| 45678 | 30% off | 30.00 | 2025-12-31 |
+-----------+-------------+-----------+----------------+
*/

INSERT INTO OFFER (offerCode, discountAmt, minAmount, expirationDate) VALUES
('34574', '20% off', 20.00, '2025-12-31'),
('45678', '30% off', 30.00, '2025-12-31');

SELECT * FROM OFFER;

/*
4) Add the following data to the CUSTOMER table:
+------------+--------------+----------------------+----------------------------+--------------+
| customerID | customerName | address | email | customerType |
+------------+--------------+----------------------+----------------------------+--------------+
| 1 | Peter Parker | 13100 Whittier Blvd. | pparker@poets.whittier.edu | home |
+------------+--------------+----------------------+----------------------------+--------------+
*/

INSERT INTO CUSTOMER (customerName, address, email, customerType) VALUES
('Peter Parker', '13100 Whittier Blvd.', 'pparker@poets.whittier.edu', 'home');

SELECT * FROM CUSTOMER;

/*
5) Add the following data to the HOME table:
+------------+------------------+--------------------+
| customerID | creditCardNum | cardExpirationDate |
+------------+------------------+--------------------+
| 1 | 1234567890123456 | 123124 |
+------------+------------------+--------------------+
*/

INSERT INTO HOME (customerID, creditCardNum, cardExpirationDate) VALUES
(1, '1234567890123456', '123124');

SELECT * FROM HOME;


/*
6) Add the following data to the ORDERED table:
+---------+-----------+------------+-----------+
| orderID | totalCost | customerID | offerCode |
+---------+-----------+------------+-----------+
| 1 | 4646.90 | 1 | 45678 |
+---------+-----------+------------+-----------+
*/
INSERT INTO ORDERED (totalCost, customerID, offerCode) VALUES
(4646.90, 1, '45678');

SELECT * FROM ORDERED;


/*
7) Add the following data to the LINE_ITEM table:
+---------+------------+----------+----------------+
| orderID | itemNumber | quantity | shippingAmount |
+---------+------------+----------+----------------+
| 1 | 2 | 2 | 0.99 |
| 1 | 3 | 3 | 1.99 |
| 1 | 4 | 1 | 0.99 |
+---------+------------+----------+----------------+
*/

INSERT INTO LINE_ITEM (orderID, itemNumber, quantity, shippingAmount) VALUES
(1, 2, 2, 0.99),
(1, 3, 3, 1.99),
(1, 4, 1, 0.99);

SELECT * FROM LINE_ITEM;



