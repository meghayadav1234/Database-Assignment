DROP TABLE Assignment_2.RESOURCE ;

CREATE TABLE Assignment_2.RESOURCE (
ID INTEGER NOT NULL PRIMARY KEY,
NAME VARCHAR(30),
DATE_OF_JOINING DATE ,
YEAR_OF_EXP INTEGER, 
YASH_EMP_ID INTEGER,
LOCATION_ID INTEGER);

SELECT * FROM Assignment_2.RESOURCE;

INSERT INTO Assignment_2.RESOURCE(ID, NAME, DATE_OF_JOINING, YEAR_OF_EXP, YASH_EMP_ID, LOCATION_ID) VALUES(1, 'Amol Nilkanth Bagal', '2014/01/20',	1,	1002899	,1	);

INSERT INTO Assignment_2.RESOURCE(ID, NAME, DATE_OF_JOINING, YEAR_OF_EXP, YASH_EMP_ID, LOCATION_ID) VALUES(2, 'Manohar Singh '	,'2012/09/10',	8,	1003927,1);

INSERT INTO Assignment_2.RESOURCE(ID, NAME, DATE_OF_JOINING, YEAR_OF_EXP, YASH_EMP_ID, LOCATION_ID) VALUES(3,'Nitish Aggarwal','2008/03/28',	8,1001553,2);

INSERT INTO Assignment_2.RESOURCE(ID, NAME, DATE_OF_JOINING, YEAR_OF_EXP, YASH_EMP_ID, LOCATION_ID) VALUES(4,'Sonali Uttam Mane','2015/03/09',2,	1000193,3);

INSERT INTO Assignment_2.RESOURCE(ID, NAME, DATE_OF_JOINING, YEAR_OF_EXP, YASH_EMP_ID, LOCATION_ID) VALUES(5,'Ruchi Soni' ,'2015/03/26',3,1003719	,1);

INSERT INTO Assignment_2.RESOURCE(ID, NAME, DATE_OF_JOINING, YEAR_OF_EXP, YASH_EMP_ID, LOCATION_ID) VALUES(6,'Kartik Dharmendra Jalgaonkar','2014/01/12',14,	41003813,2);

INSERT INTO Assignment_2.RESOURCE(ID, NAME, DATE_OF_JOINING, YEAR_OF_EXP, YASH_EMP_ID, LOCATION_ID) VALUES(7,'Charu Dubey' ,'2014/03/13',8,1003549,1);

INSERT INTO Assignment_2.RESOURCE(ID, NAME, DATE_OF_JOINING, YEAR_OF_EXP, YASH_EMP_ID, LOCATION_ID) VALUES(8,'Nikhil Bhagwantrao Raut','2014/05/19',6,1003054,2);

INSERT INTO Assignment_2.RESOURCE(ID, NAME, DATE_OF_JOINING, YEAR_OF_EXP, YASH_EMP_ID, LOCATION_ID) VALUES(9,'Vishal Khandu Kumkar','2012/05/25',7,1003177,1);

INSERT INTO Assignment_2.RESOURCE(ID, NAME, DATE_OF_JOINING, YEAR_OF_EXP, YASH_EMP_ID, LOCATION_ID) VALUES(10,'Isha Tiwari','2015/04/27',2,1003927,3);

INSERT INTO Assignment_2.RESOURCE(ID, NAME, DATE_OF_JOINING, YEAR_OF_EXP, YASH_EMP_ID, LOCATION_ID) VALUES(11,'Dharmendra Biswal','2015/04/30',5,1003999,2);

CREATE TABLE Assignment_2.LOCATION(
LOCATION_ID int	primary KEY, 
LOCATION_NAME varchar(200)	
);

SELECT * FROM Assignment_2.LOCATION;

INSERT INTO ASSIGNMENT_2.LOCATION(LOCATION_ID , LOCATION_NAME) VALUES (1,'INDORE');

INSERT INTO ASSIGNMENT_2.LOCATION(LOCATION_ID , LOCATION_NAME) VALUES (2,'PUNE');

INSERT INTO ASSIGNMENT_2.LOCATION(LOCATION_ID , LOCATION_NAME) VALUES (3,'BANGLORE');

INSERT INTO ASSIGNMENT_2.LOCATION(LOCATION_ID , LOCATION_NAME) VALUES (4,'MUMBAI');

CREATE TABLE ASSIGNMENT_2.RESOURCE_HRS(
RESOURCE_HRS_ID INT PRIMARY KEY,
RESOURCE_ID INT,
HOURS INT, 
WEEK_END_DATE DATE,
FOREIGN KEY (RESOURCE_ID) REFERENCES ASSIGNMENT_2.RESOURCE(ID));

INSERT INTO ASSIGNMENT_2.RESOURCE_HRS(RESOURCE_HRS_ID,RESOURCE_ID ,HOURS ,WEEK_END_DATE) VALUES (1,	1,8,'2014/12/26');

INSERT INTO ASSIGNMENT_2.RESOURCE_HRS(RESOURCE_HRS_ID,RESOURCE_ID ,HOURS ,WEEK_END_DATE) VALUES (2,2,9,'2014/12/26');

INSERT INTO ASSIGNMENT_2.RESOURCE_HRS(RESOURCE_HRS_ID,RESOURCE_ID ,HOURS ,WEEK_END_DATE) VALUES (3,3,2,'2014/12/26');

INSERT INTO ASSIGNMENT_2.RESOURCE_HRS(RESOURCE_HRS_ID,RESOURCE_ID ,HOURS ,WEEK_END_DATE) VALUES (4,4,3,'2014/12/26');

INSERT INTO ASSIGNMENT_2.RESOURCE_HRS(RESOURCE_HRS_ID,RESOURCE_ID ,HOURS ,WEEK_END_DATE) VALUES (5,5,5,'2015/06/26');

INSERT INTO ASSIGNMENT_2.RESOURCE_HRS(RESOURCE_HRS_ID,RESOURCE_ID ,HOURS ,WEEK_END_DATE) VALUES (6,2,8,'2015/06/26');

INSERT INTO ASSIGNMENT_2.RESOURCE_HRS(RESOURCE_HRS_ID,RESOURCE_ID ,HOURS ,WEEK_END_DATE) VALUES (7,1,7,'2015/06/26');

CREATE TABLE ASSIGNMENT_2.PROJECT(
PROJECT_ID INT PRIMARY KEY,
PROJECT_NAME VARCHAR(30),
LOCATION_ID INTEGER,
FOREIGN KEY(LOCATION_ID) REFERENCES ASSIGNMENT_2.LOCATION(LOCATION_ID));

SELECT * FROM ASSIGNMENT_2.PROJECT;

INSERT INTO ASSIGNMENT_2.PROJECT(PROJECT_ID , PROJECT_NAME , LOCATION_ID) VALUES (1,'PROJECT 1',1);

INSERT INTO ASSIGNMENT_2.PROJECT(PROJECT_ID , PROJECT_NAME , LOCATION_ID) VALUES (2,'PROJECT 2',1);

INSERT INTO ASSIGNMENT_2.PROJECT(PROJECT_ID , PROJECT_NAME , LOCATION_ID) VALUES (3,'PROJECT 3',3);

INSERT INTO ASSIGNMENT_2.PROJECT(PROJECT_ID , PROJECT_NAME , LOCATION_ID) VALUES (4,'PROJECT 4',4);


-- List out resource name ,date_of_joining,location  od resource whose years_of_exp is more than 2 years

SELECT R.NAME, R.DATE_OF_JOINING,
(SELECT LOCATION_NAME FROM ASSIGNMENT_2.LOCATION L WHERE L.LOCATION_ID = R.LOCATION_ID) AS LOCATION_NAME
FROM Assignment_2.RESOURCE R WHERE R.YEAR_OF_EXP > 2;

-- Find the employee which maximum experience
SELECT * FROM ASSIGNMENT_2.RESOURCE R WHERE R.YEAR_OF_EXP = (SELECT MAX(YEAR_OF_EXP) FROM ASSIGNMENT_2.RESOURCE);

-- Find the resource with Indore location 
SELECT * FROM ASSIGNMENT_2.RESOURCE R 
WHERE R.LOCATION_ID = (SELECT LOCATION_ID FROM ASSIGNMENT_2.LOCATION WHERE LOCATION_NAME = 'INDORE');

-- Find the resource name,hours ,location ,week_end_date

SELECT R.NAME, RHRS.HOURS, (SELECT LOCATION_NAME FROM ASSIGNMENT_2.LOCATION L WHERE L.LOCATION_ID = R.LOCATION_ID) AS LOCATION_NAME,
	RHRS.WEEK_END_DATE
FROM ASSIGNMENT_2.RESOURCE R,ASSIGNMENT_2.RESOURCE_HRS RHRS 
WHERE R.ID = RHRS.RESOURCE_ID;

-- Delete record from location table with location name as Mumbai

DELETE FROM ASSIGNMENT_2.RESOURCE WHERE LOCATION_ID = (SELECT LOCATION_ID FROM ASSIGNMENT_2.LOCATION WHERE LOCATION_NAME = 'MUMBAI');

DELETE FROM ASSIGNMENT_2.PROJECT WHERE LOCATION_ID = (SELECT LOCATION_ID FROM ASSIGNMENT_2.LOCATION WHERE LOCATION_NAME = 'MUMBAI');

DELETE FROM ASSIGNMENT_2.LOCATION WHERE LOCATION_NAME = 'MUMBAI';

-- Make listing of all the records from all the tables using inner join 

SELECT DISTINCT R.ID, R.NAME, R.DATE_OF_JOINING, R.YEAR_OF_EXP, R.YASH_EMP_ID, R.LOCATION_ID, L.LOCATION_NAME,
P.PROJECT_ID , P.PROJECT_NAME, HRS.RESOURCE_HRS_ID, HRS.RESOURCE_ID  ,HRS.HOURS ,HRS.WEEK_END_DATE
FROM ASSIGNMENT_2.RESOURCE R 
LEFT JOIN ASSIGNMENT_2.LOCATION L  ON R.LOCATION_ID = L.LOCATION_ID
LEFT JOIN ASSIGNMENT_2.PROJECT P ON R.LOCATION_ID = P.LOCATION_ID
LEFT JOIN ASSIGNMENT_2.RESOURCE_HRS HRS  ON R.ID = HRS.RESOURCE_ID;

-- Drop primary key  and foreign key constraint from project table (Drop constraint not the columns)

ALTER TABLE ASSIGNMENT_2.PROJECT
	DROP FOREIGN KEY project_ibfk_1;

SHOW CREATE TABLE ASSIGNMENT_2.PROJECT;

ALTER TABLE ASSIGNMENT_2.PROJECT
  DROP PRIMARY KEY;














