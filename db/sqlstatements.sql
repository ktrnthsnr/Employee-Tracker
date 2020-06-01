-- // SQL Statements - Summary
-- // ------------------------
-- // view all departments
-- // view all roles
-- // view all employees
-- // add a department
-- // add a role
-- // add an employee
-- // update an employee role

-- connect to the MySQL database
USE employeetracker_db;

-- // view all departments
SELECT * FROM department;

-- // view all roles
SELECT * FROM role;

-- // view all employees
SELECT * FROM employee;

-- // add a department -- samples for user responses
INSERT INTO department (dept_name)
VALUES ('Testing');

INSERT INTO department (dept_name)
VALUES ('Sales');

-- // add a role -- samples for user responses

INSERT INTO role (title, salary, department_id)
VALUES
('BusinessAnalyst', 60000, 4);

INSERT INTO role (title, salary, department_id)
VALUES
('ProgramManager', 110000, 1);

-- // add an employee -- samples for user responses
-- a
INSERT INTO employee (first_name, last_name, role_id)
VALUES
('Anders', 'Celsuis', 2);

-- b
INSERT INTO employee (first_name, last_name, role_id)
VALUES
('Hedy', 'Lamarr', 5);
 
-- // update an employee role -- samples for user responses
-- a
UPDATE employee
SET role_id = 3 WHERE last_name in ('Celsuis');

-- b
UPDATE employee
SET role_id= 7 WHERE last_name in ('Lamarr');

