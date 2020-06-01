----------- ## Usage
--   1) Start the MySQL command line, - mysql -u root -p 
-- - Enter the MySQL password
-- - 2) Create the database, tables and seed them
-- -   mysql> source ./db/schema.sql
-- -   mysql> source ./db/seeds.sql
-- - 3) Check the database and tables were created by running int he mysql command line
    -- * mysql> USE employeetracker_db; show tables; describe department; describe role; describe employee;
-- - Check the tables after seeding by running in the mysql command line,
    -- * mysql> select * from department; select * from role; select * from employee;


DROP DATABASE IF EXISTS employeetracker_db;
CREATE DATABASE employeetracker_db;
USE employeetracker_db;

DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS department;


-- (1) DEPARTMENT - First table, ran ok (no foreign keys)
CREATE TABLE department (
    id INTEGER NOT NULL AUTO_INCREMENT,
    dept_name VARCHAR(30) NULL,
    PRIMARY KEY(id)
    );

-- (2) ROLE - First table, ran ok
-- CREATE TABLE role (
--     id INT NOT NULL,
--     title VARCHAR(30) NOT NULL,
--     salary DECIMAL NOT NULL,
--     PRIMARY KEY(id)   
-- );

-- with foreign key
CREATE TABLE role (
    id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(30) NULL,
    salary DECIMAL NULL,
    department_id INTEGER NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (department_id)
        REFERENCES department(id)
);

-- (3) EMPLOYEE - First table
-- CREATE TABLE employee (
--     id INT NOT NULL,
--     first_name VARCHAR(30) NOT NULL,
--     last_name VARCHAR(30) NOT NULL,
--     PRIMARY KEY(id)
--     );

-- w/foreign key
CREATE TABLE employee (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(30) NULL,
    last_name VARCHAR(30) NULL,
    role_id INT NULL,
    manager_id INT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (role_id)
        REFERENCES role(id),
    FOREIGN KEY (manager_id)
        REFERENCES employee(id)
    );



USE employeetracker_db;

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

-- Other statements:
-----------------------------
-- SELECT * FROM employee;
-- TRUNCATE TABLE employee;
-- SHOW CREATE TABLE employee;
-- SELECT COUNT(*) FROM employee;
