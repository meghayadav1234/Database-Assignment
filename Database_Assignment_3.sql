-- Update Years of exp any Candidate  to 8 from 10

UPDATE ASSIGNMENT_2.RESOURCE 
SET 
    YEAR_OF_EXP = 8
WHERE
    YEAR_OF_EXP = 10;

SELECT * FROM ASSIGNMENT_2.RESOURCE;

-- Delete record of any person

DELETE FROM ASSIGNMENT_2.RESOURCE WHERE ID = 11;

-- Alter  table to add location column 

ALTER TABLE ASSIGNMENT_2.RESOURCE  ADD COLUMN LOCATION INTEGER;

-- Make id as primary key

SHOW CREATE TABLE ASSIGNMENT_2.RESOURCE_HRS;
 
ALTER TABLE ASSIGNMENT_2.RESOURCE_HRS
	DROP FOREIGN KEY resource_hrs_ibfk_1;

ALTER TABLE ASSIGNMENT_2.RESOURCE
    DROP PRIMARY KEY;

ALTER TABLE ASSIGNMENT_2.RESOURCE
	ADD PRIMARY KEY (ID);

-- Alter  table to drop column years_of_exp 

ALTER TABLE ASSIGNMENT_2.RESOURCE
DROP COLUMN YEAR_OF_EXP;

-- Alter table to change the datatype of primary key column to Bigint

ALTER TABLE ASSIGNMENT_2.RESOURCE
MODIFY ID BIGINT;

-- Write a select statement to view all the from the table created

SELECT * FROM RESOURCE ORDER BY DATE_OF_JOINING ASC;

-- Write a select statement to view data in the increasing and decreasing order of date_of_joining

SELECT * FROM RESOURCE ORDER BY DATE_OF_JOINING DESC;