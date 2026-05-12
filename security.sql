USE TitanicDB;

-- Create read-only
CREATE ROLE student_readonly;

-- Grant SELECT only
GRANT SELECT ON TitanicDB.* TO student_readonly;

-- Create student users
CREATE USER 'student1'@'%' IDENTIFIED BY 'password';
CREATE USER 'student2'@'%' IDENTIFIED BY 'password';
CREATE USER 'student3'@'%' IDENTIFIED BY 'password';

-- Assign role
GRANT student_readonly TO 'student1'@'%';
GRANT student_readonly TO 'student2'@'%';
GRANT student_readonly TO 'student3'@'%';