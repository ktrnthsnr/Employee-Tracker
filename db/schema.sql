DROP DATABASE IF EXISTS employeetracker_db;
CREATE DATABASE employeetracker_db;
USE employeetracker_db;

DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS role;
DROP TABLE IF EXISTS department;

USE employeetracker_db;

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

-- validate tables created
show tables;
describe department; 
describe role; 
describe employee;