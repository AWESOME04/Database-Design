-- PRACTICAL LECTURE SESSION

CREATE DATABASE school_db;

-- create database cpen_207;

-- How to create tables and functions
-- ER Diagrams

create table student (
	StudentPID VARCHAR(50),
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	Address VARCHAR(50)
);

INSERT INTO Student (StudentPID, first_name, last_name,Address ) values (1098633, 'Evans', 'Acheampong ', 'LegonHallAA');
INSERT INTO Student (StudentPID, first_name, last_name,Address ) values (1095632, 'Edward', 'Acquah ', 'LegonHallAA');
SELECT DISTINCT * FROM Student;

create table Professor (
	ProfessorPID INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	Office VARCHAR(50),
	Age INT,
	DepartmentName VARCHAR(50) NOT NULL
);

INSERT INTO Professor (ProfessorPID, first_name, last_name, Office, Age, DepartmentName ) values (1986882, 'Kenneth', 'Broni', 'SES-O233', 39, 'CPEN' );
SELECT DISTINCT * FROM Professor;

create table Course (
	Number INT NOT NULL,
	DepartmentName VARCHAR(50),
	CourseName VARCHAR(50),
	Classroom VARCHAR(50),
	Enrollment INT
);

INSERT INTO Course (Number, DepartmentName, CourseName,Classroom, Enrollment ) values (203, 'CPEN', 'Programming For Engineers', '09', 1);
SELECT * FROM Course;



create table Teach (
	ProfessorPID VARCHAR(50) NOT NULL,
	Number INT NOT NULL,
	DepartmentName VARCHAR(50)
);

INSERT INTO Teach (ProfessorPID, Number, DepartmentName ) values (20835560, 2, 'CPEN');
SELECT * FROM Course;


create table Take (
	StudentPID VARCHAR(50) NOT NULL,
	Number INT NOT NULL,
	DepartmentName VARCHAR(50),
	Grade VARCHAR(50),
	ProfessorEvaluation INT 
);

INSERT INTO Take (StudentPID, Number, DepartmentName, Grade, ProfessorEvaluation) values (305112, 12, 'CPEN', 'B', 83);
SELECT * FROM Course;


create table Department (
	Name VARCHAR(50),
	ChairmanPID VARCHAR(50)
);

INSERT INTO Department (Name, ChairmanPID) values ('CPEN', 8558892);
SELECT * FROM Department;


create table PreReq (
	Number INT NOT NULL,
	DepartmentName VARCHAR(50),
	PreReqNumber INT,
	PreReqDeptName VARCHAR(50)
);

INSERT INTO PreReq (Number, DepartmentName, PreReqNumber, PreReqDeptName) values (15, 'CPEN', 19, 13);
SELECT * FROM PreReq;


-- Creating the orders table

CREATE TABLE orders (
	order_id INT NOT NULL,
	product VARCHAR(50) NOT NULL,
	total BIGINT NOT NULL,
	customer_id INT NOT NULL

);


-- Inserting values into the orders table

INSERT INTO orders (order_id, product, total, customer_id)
	VALUES(1, 'Paper', 500, 5);
INSERT INTO orders (order_id, product, total, customer_id)
	VALUES(2, 'Pen', 10, 2);
INSERT INTO orders (order_id, product, total, customer_id)
	VALUES(3, 'Marker', 120, 3);
INSERT INTO orders (order_id, product, total, customer_id)
	VALUES(4, 'Books', 1000, 1);
INSERT INTO orders (order_id, product, total, customer_id)
	VALUES(5, 'Erasers', 20, 4);
	
	
-- Selecting Values from the orders table
SELECT * FROM orders;


SELECT * FROM orders WHERE total > 500;


CREATE TABLE customers (
	customer_id INT NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL,
	country TEXT NOT NULL
);


-- Inserting values into the cuatomers table

INSERT INTO customers (customer_id, first_name, last_name, phone, country)
	VALUES(1, 'John', 'Doe', '817-646-8833', 'USA');
INSERT INTO customers (customer_id, first_name, last_name, phone, country)
	VALUES(2, 'Robert', 'Luna', '412-862-0502', 'USA');
INSERT INTO customers (customer_id, first_name, last_name, phone, country)
	VALUES(3, 'David', 'Robinson', '208-340-7906', 'UK');
INSERT INTO customers (customer_id, first_name, last_name, phone, country)
	VALUES(4, 'John', 'Reinhardt', '307-232-6285', 'UK');
INSERT INTO customers (customer_id, first_name, last_name, phone, country)
	VALUES(5, 'Betty', 'Doe', '806-749-2958', 'UAE');


-- Selecting Values from the customers table
SELECT * FROM customers;*
SELECT * FROM customers WHERE country = 'UK';
SELECT phone, first_name FROM customers WHERE country = 'UK';
SELECT DISTINCT country FROM customers;

SELECT * FROM customers WHERE last_name = 'Doe' ORDER BY first_name;


-- FUNCTIONS


CREATE TABLE student_info (
	st_id BIGSERIAL PRIMARY KEY,
	student_id INT NOT NULL,
	student_name VARCHAR(50)
);


INSERT INTO student_info (student_id, student_name)
	VALUES(10864522, 'Mark');

INSERT INTO student_info (student_id, student_name)
	VALUES(10639236, 'Jane');
	
INSERT INTO student_info (student_id, student_name)
	VALUES(10945385, 'Nathaniel');

INSERT INTO student_info (student_id, student_name)
	VALUES(10856789, 'Evans');

INSERT INTO student_info (student_id, student_name)
	VALUES(10678906, 'Hammond');
	
INSERT INTO student_info (student_id, student_name)
	VALUES(10967845, 'Edward');
	
INSERT INTO student_info (student_id, student_name)
	VALUES(10443735, 'Dennis');

INSERT INTO student_info (student_id, student_name)
	VALUES(10856789, 'Ken');

INSERT INTO student_info (student_id, student_name)
	VALUES(10544774, 'Ama');
	
INSERT INTO student_info (student_id, student_name)
	VALUES(10766553, 'Kofi');
	
INSERT INTO student_info (student_id, student_name)
	VALUES(10964532, 'Theophilus');

INSERT INTO student_info (student_id, student_name)
	VALUES(10964088, 'Nate');

UPDATE student_info
SET student_name = 'Bright'
WHERE st_id = 2;

CREATE TABLE student_info_audit(
	st_id BIGSERIAL PRIMARY KEY,
	student_id INT NOT NULL,
	student_name VARCHAR(50),
	t_date TIMESTAMP WITHOUT TIME ZONE NOT NULL

);


-- CREATING A TRIGGER FUNCTION
CREATE OR REPLACE FUNCTION generate_audit_trail_on_student()
	RETURNS TRIGGER
	LANGUAGE 'plpgsql'
	COST 100
AS $BODY$
DECLARE
	--v_region TEXT DEFAULT";

BEGIN

	INSERT INTO 
student_info_audit(student_id, student_name, t_date)
VALUES(NEW.student_id, NEW.student_name,current_date);

	RETURN NEW;
END;
$BODY$;


-- CREATING A TRIGGER 
CREATE TRIGGER generate_audit_trail_on_student_trigger
	AFTER INSERT
	ON student_info
	FOR EACH ROW
	EXECUTE PROCEDURE
generate_audit_trail_on_student();

	
	
	

-- TRIGGER AND TRIGGER FUNCTION FOR UPDATING VALUES


-- CREATING A TRIGGER FUNCTION
CREATE OR REPLACE FUNCTION update_audit_on_student()
	RETURNS TRIGGER
	LANGUAGE 'plpgsql'
	COST 100
AS $BODY$
DECLARE
	--v_region TEXT DEFAULT";

BEGIN
		INSERT INTO 
student_info_audit(student_id, student_name, t_date)
VALUES(NEW.student_id, NEW.student_name,current_date);
		INSERT INTO 
student_info_audit(student_id, student_name, t_date)
VALUES(OLD.student_id, OLD.student_name,current_date);

	RETURN NEW;
END;
$BODY$;


-- CREATING A TRIGGER FUNCTION

CREATE TRIGGER updatee_audit_on_student_trigger
	AFTER UPDATE
	ON student_info
	FOR EACH ROW
	EXECUTE PROCEDURE
update_audit_on_student();


SELECT * FROM student_info;








