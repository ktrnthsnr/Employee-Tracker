-- Run from MySQL command line prompt:
--      mysql> source ./db/seeds.sql
-- Select on tables:
--      mysql> select * from department; select * from role; select * from employee;

USE employeetracker_db;

TRUNCATE TABLE employee;
TRUNCATE TABLE department;
TRUNCATE TABLE role;

INSERT INTO department (dept_name)
VALUES 
('Management'),
('SoftwareDevelopment'),
('Engineering'),
('Operations'),
('Networking');

INSERT INTO role (title, salary, department_id)
VALUES
('Manager', 110000, 1),
('WebDev', 120000, 2),
('Engineer', 90000, 3),
('Tester', 85000, 2),
('SQLDev', 120000, 2),
('SQLDBA', 90000, 4),
('NetEng', 90000, 5),
('Analyst', 50000, 4);

INSERT INTO employee (first_name, last_name, role_id)
VALUES
('Freddie', 'Mercury', 1),
('Ed', 'Sheeran', 2),
('Tito', 'Puente', 3),
('Celia', 'Cruz', 4),
('Marvin', 'Gaye', 2),
('Jimi', 'Hendrix', 3),
('Janis', 'Joplin', 4),
('Billy', 'Holiday', 5),
('Benny', 'Andersson', 6),
('Anni-Frid', 'Lyngstad', 7),
('Agnetha', 'Faltskog', 8),
('Bjorn', 'Ulvaeus', 1);


-- add manager_id to employee table
UPDATE employee
SET manager_id = 1 WHERE last_name in ('Mercury', 'Ulvaeus');


-- checks\other statements:
-----------------------------
-- SELECT * FROM employee;
-- TRUNCATE TABLE employee;
-- SHOW CREATE TABLE employee;
-- SELECT COUNT(*) FROM employee;
