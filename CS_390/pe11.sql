Drop DATABASE IF EXISTS Carreto_PE11;

-- Create the database
Create DATABASE Carreto_PE11;

--open the database ]
Use Carreto_PE11;

CREATE TABLE person(
    ssn CHAR(9), /* exactly 9 chars */
    firstName VARCHAR(25) NOT NULL, /* 1-25 chars must have a value */
    lastName VARCHAR(25) NOT NULL, /* 1-25 chars must have a value */
    patient TINYINT NOT NULL DEFAULT 0, /* discriminating attribute for patient subtype */
    staff TINYINT NOT NULL DEFAULT 0, /* discriminator */
    CONSTRAINT person_pk PRIMARY KEY (ssn)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE person;

CREATE TABLE department(
    deptNum TINYINT UNSIGNED AUTO_INCREMENT, -- auto increment from range 1 to 200 using tinyint unsiged
    name VARCHAR(50) NOT NULL, -- name must hold 50 chars
    CONSTRAINT department_pk PRIMARY KEY (deptNum)  -- PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE department;

CREATE TABLE insurance_company(
    coNum SMALLINT UNSIGNED AUTO_INCREMENT,  -- ranges up to 65,000
    name VARCHAR(80) NOT NULL, -- Name must hold 80 chars
    CONSTRAINT insurance_company_pk PRIMARY KEY (coNum) -- sets primary key
)   ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE insurance_company;

CREATE TABLE staff(
    ssn CHAR(9), -- FOREIGN KEY
    managerSSN CHAr(9) NOT NULL, -- fk not null from cardinalities on E-R diagram
    docNurSup ENUM('doctor', 'nurse', 'support'),
    CONSTRAINT staff_pk PRIMARY KEY (ssn),
    CONSTRAINT staff_ssn_fk FOREIGN KEY (ssn) REFERENCES person(ssn),
    CONSTRAINT staff_managerSSN_fk FOREIGN KEY (managerSSN) REFERENCES staff(ssn)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE staff;

-- Create doctor table
CREATE TABLE doctor(
    ssn CHAR(9), /* fk */
    mentorSSN CHAR(9) NOT NULL, /* fk, NOT NULL known from cardinalities on E-R diagram! */
    CONSTRAINT doctor_pk PRIMARY KEY (ssn),
    CONSTRAINT doctor_ssn_fk FOREIGN KEY (ssn) REFERENCES staff(ssn),
    CONSTRAINT doctor_mentorSSN_fk FOREIGN KEY (mentorSSN) REFERENCES doctor(ssn)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE doctor;

-- Create patient table
CREATE TABLE patient(
    ssn CHAR(9), /* fk */
    doctorSSN CHAR(9) NOT NULL, /* fk, NOT NULL known from cardinalities on E-R diagram! */
    CONSTRAINT patient_pk PRIMARY KEY (ssn),
    CONSTRAINT patient_ssn_fk FOREIGN KEY (ssn) REFERENCES person(ssn),
    CONSTRAINT patient_doctorSSN_fk FOREIGN KEY (doctorSSN) REFERENCES doctor(ssn)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE patient;

-- Create nurse table
CREATE TABLE nurse(
    ssn CHAR(9), /* fk */
    certification ENUM('LPN', 'RN') NOT NULL, -- should allow only the values of LPN or RN and value is required
    CONSTRAINT nurse_pk PRIMARY KEY (ssn),
    CONSTRAINT nurse_ssn_fk FOREIGN KEY (ssn) REFERENCES staff(ssn)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE nurse;

-- Create support_staff table
CREATE TABLE support_staff(
    ssn CHAR(9), /* fk */
    wage DECIMAL(4,2) NOT NULL,
    CONSTRAINT support_staff_pk PRIMARY KEY (ssn),
    CONSTRAINT support_staff_ssn_fk FOREIGN KEY (ssn) REFERENCES staff(ssn)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE support_staff;


-- Create insurance_policy table
CREATE TABLE insurance_policy(
    policyNum VARCHAR(25),
    ssn CHAR(9), /* fk */
    coNum SMALLINT UNSIGNED, /* fk (copy data type excluding AUTO_INCREMENT) */
    CONSTRAINT insurance_policy_pk PRIMARY KEY (ssn, coNum),
    CONSTRAINT insurance_policy_ssn_fk FOREIGN KEY (ssn) REFERENCES patient(ssn),
    CONSTRAINT insurance_policy_coNum_fk FOREIGN KEY (coNum) REFERENCES insurance_company(coNum)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE insurance_policy;

-- Create department_staff table
CREATE TABLE department_staff(
    deptNum TINYINT UNSIGNED, /* fk (copy data type excluding AUTO_INCREMENT) */
    ssn CHAR(9), /* fk */
    CONSTRAINT department_staff_pk PRIMARY KEY (deptNum, ssn),
    CONSTRAINT department_staff_deptNum_fk FOREIGN KEY (deptNum) REFERENCES department(deptNum),
    CONSTRAINT department_staff_ssn_fk FOREIGN KEY (ssn) REFERENCES staff(ssn)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DESCRIBE department_staff;