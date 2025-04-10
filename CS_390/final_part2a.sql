

Drop DATABASE IF EXISTS final_part2a;

-- Create the database
Create DATABASE final_part2a;

-- open the database
Use final_part2a;

CREATE TABLE CUSTOMER (
	custID int PRIMARY KEY,
    firstName VARCHAR(25),
    lastName VARCHAR(25)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    
    DESCRIBE CUSTOMER;
    
CREATE TABLE CARD_ACCOUNT (
	acctID int PRIMARY KEY,
    cardType ENUM('debit', 'credit') NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    
    DESCRIBE CARD_ACCOUNT;
    
CREATE TABLE DEBIT_CARD (
	acctID int PRIMARY KEY,
	bankNo CHAR(9),
	CONSTRAINT DEBIT_CARD_acctID_fk FOREIGN KEY (acctID) REFERENCES CARD_ACCOUNT(acctID)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    
    DESCRIBE DEBIT_CARD;

CREATE TABLE CREDIT_CARD (
	acctID int PRIMARY KEY,
	currBal Decimal(7,2),
	CONSTRAINT CREDIT_CARD_acctID_fk FOREIGN KEY (acctID) REFERENCES CARD_ACCOUNT(acctID)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    
    DESCRIBE CREDIT_CARD;
    

    

