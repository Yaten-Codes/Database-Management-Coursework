-- hw 8

-- 1) Write a SQL statement that will accomplish the equivalent of the following theoretical relational algebra
-- statement: (EMPLOYER[stateCode]) UNION (CALENDARQUART[stateCode]).
-- Hint: Use UNION.
-- problem 1
SELECT DISTINCT stateCode 
FROM employer 
UNION
SELECT DISTINCT stateCode
FROM calendarQuart;


-- problem 2
-- 2) Write a SQL statement that will accomplish the equivalent of a theoretical relational algebra equijoin
-- (recall that this is an INNER JOIN in SQL) between employer and interview with a projection of
-- companyName, division, and stateCode from the employer table, and salaryOffered from the interview
-- table.
-- Hint: The employer table has a composite primary key of companyName and division, which is then used as
-- a composite foreign key in the interview table. The correct way to use this in an INNER JOIN is to write the
-- ON clause as “ON (primary key part 1 = foreign key part 1) AND (primary key part 2 = foreign key part 2)”

SELECT employer.companyName, employer.division, employer.stateCode, interview.salaryOffered
FROM employer INNER JOIN interview ON employer.companyName = interview.companyName AND employer.division = interview.division;


-- problem 3
-- 3) Write a SQL statement that produces the following table of stateCodes and fullNames from the state
-- table for all states that DO NOT have an employer from the employer table in them.
-- Hint: You should use a subquery combined with the “NOT IN” operator to accomplish this, review the script
-- selectDifference.sql from the lectures

SELECT state.stateCode, state.fullName
FROM state
WHERE state.stateCode NOT IN (
    SELECT DISTINCT employer.stateCode
    FROM employer
);

-- problem 4
-- 4) Write a SQL statement that performs the equivalent of the following theoretical relational algebra
-- statement: INTERVIEW[companyName, minHrsOffered].
-- Hint: To be consistent with pure relational algebra, the answer cannot contain any duplicate rows. You can
-- use the “SELECT DISTINCT” command to accomplish this.

SELECT DISTINCT companyName, minHrsOffered
FROM interview;


-- problem 5
-- 5) Write a SQL statement that shows a selection of all of the rows from the state table that have an ‘a’, ‘e’,
-- ‘i’, ‘o’, or ‘u’ as the third letter of the fullName.
-- Hint: This does not use any of the new commands from this week, instead you will need to review the
-- “LIKE” operator from earlier in the course.

SELECT stateCode, fullName
FROM state
WHERE fullName LIKE '__a%' OR fullName LIKE '__e%' OR fullName LIKE '__i%' OR fullName LIKE '__o%' OR fullName LIKE '__u%';

-- problem 6
-- 6) Write a SQL statement that will show the qtrCode and stateCode from the calendarQuart table, and the
-- state fullName from the state table, for stateCodes in the calendarQuart table that are also found in the
-- state table.
-- Hint: Use an INNER JOIN

SELECT calendarQuart.qtrCode, calendarQuart.stateCode, state.fullName
FROM calendarQuart INNER JOIN state ON calendarQuart.stateCode = state.stateCode;

-- problem 7
-- 7) Write a SQL statement that will show the fullName for ALL states in the state table as well as the
-- companyNames of the employers located in each state from the employer table. If a state has no
-- employers in it, then the state fullName should still be listed, and the associated companyName should be
-- listed as “NULL”.
-- Hint: Use a LEFT OUTER JOIN of the state and employer tables

SELECT state.fullName, employer.companyName
FROM state LEFT OUTER JOIN employer ON state.stateCode = employer.stateCode;
