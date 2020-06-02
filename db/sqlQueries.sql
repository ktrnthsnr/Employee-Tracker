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
-- sample a
INSERT INTO employee (first_name, last_name, role_id)
VALUES
('Anders', 'Celsuis', 2);

-- sample b
INSERT INTO employee (first_name, last_name, role_id)
VALUES
('Hedy', 'Lamarr', 5);
 
-- // update an employee role -- samples for user responses
-- sample a
UPDATE employee
SET role_id = 3 WHERE last_name in ('Celsuis');

-- sample b
UPDATE employee
SET role_id = 1 WHERE last_name in ('Lamarr');


-- Delete an employee
DELETE FROM employee WHERE last_name in ('Lamarr'); 



----------- Usage

--   1) Start the MySQL command line, and when prompted, enter your pwd

--              mysql -u root -p              

--   2) Create the database, tables and seed them

--              mysql> source ./db/schema.sql

--              mysql> source ./db/seeds.sql

--   3) Check the database and tables were created by running int he mysql command line

--              mysql> USE employeetracker_db; show tables; describe department; describe role; describe employee;

--      Check the tables after seeding by running in the mysql command line,

--              mysql> select * from department; select * from role; select * from employee;


show tables;

--  Tables_in_employeetracker_db |
-- +------------------------------+
-- | department                   |
-- | employee                     |
-- | role                         |
-- +------------------------------+

describe department; describe role; describe employee;

-- mysql> describe department; describe role; describe employee;
-- +-----------+-------------+------+-----+---------+----------------+
-- | Field     | Type        | Null | Key | Default | Extra          |
-- +-----------+-------------+------+-----+---------+----------------+
-- | id        | int         | NO   | PRI | NULL    | auto_increment |
-- | dept_name | varchar(30) | YES  |     | NULL    |                |
-- +-----------+-------------+------+-----+---------+----------------+
-- 2 rows in set (0.07 sec)

-- +---------------+---------------+------+-----+---------+----------------+
-- | Field         | Type          | Null | Key | Default | Extra          |
-- +---------------+---------------+------+-----+---------+----------------+
-- | id            | int           | NO   | PRI | NULL    | auto_increment |
-- | title         | varchar(30)   | YES  |     | NULL    |                |
-- | salary        | decimal(10,0) | YES  |     | NULL    |                |
-- | department_id | int           | YES  | MUL | NULL    |                |
-- +---------------+---------------+------+-----+---------+----------------+
-- 4 rows in set (0.01 sec)

-- +------------+-------------+------+-----+---------+----------------+
-- | Field      | Type        | Null | Key | Default | Extra          |
-- +------------+-------------+------+-----+---------+----------------+
-- | id         | int         | NO   | PRI | NULL    | auto_increment |
-- | first_name | varchar(30) | YES  |     | NULL    |                |
-- | last_name  | varchar(30) | YES  |     | NULL    |                |
-- | role_id    | int         | YES  | MUL | NULL    |                |
-- | manager_id | int         | YES  | MUL | NULL    |                |
-- +------------+-------------+------+-----+---------+----------------+
-- 5 rows in set (0.00 sec)

select * from department; select * from role; select * from employee;

-- mysql> select * from department; select * from role; select * from employee;

-- dept
-- +----+---------------------+
-- | id | dept_name           |
-- +----+---------------------+
-- |  1 | Management          |
-- |  2 | SoftwareDevelopment |
-- |  3 | Engineering         |
-- |  4 | Operations          |
-- |  5 | Networking          |
-- |  6 | Testing             |

-- role
-- +----+------------------+--------+---------------+
-- | id | title            | salary | department_id |
-- +----+------------------+--------+---------------+
-- |  1 | Manager          | 110000 |             1 |
-- |  2 | WebDev           | 120000 |             2 |
-- |  3 | Engineer         |  90000 |             3 |
-- |  4 | Tester           |  85000 |             2 |
-- |  5 | SQLDev           | 120000 |             2 |
-- |  6 | SQLDBA           |  90000 |             4 |
-- |  7 | NetEng           |  90000 |             5 |
-- |  8 | Analyst          |  50000 |             4 |
-- |  9 | BusinessAnalyst  |  60000 |             4 |

-- employee
-- +----+------------+-----------+---------+------------+
-- | id | first_name | last_name | role_id | manager_id |
-- +----+------------+-----------+---------+------------+
-- |  1 | Freddie    | Mercury   |       1 |          1 |
-- |  2 | Ed         | Sheeran   |       2 |       NULL |
-- |  3 | Tito       | Puente    |       3 |       NULL |
-- |  4 | Celia      | Cruz      |       4 |       NULL |
-- |  5 | Marvin     | Gaye      |       2 |       NULL |
-- |  6 | Jimi       | Hendrix   |       3 |       NULL |
-- |  7 | Janis      | Joplin    |       4 |       NULL |
-- |  8 | Billy      | Holiday   |       5 |       NULL |
-- |  9 | Benny      | Andersson |       6 |       NULL |
-- | 10 | Anni-Frid  | Lyngstad  |       7 |       NULL |
-- | 11 | Agnetha    | Faltskog  |       8 |       NULL |
-- | 12 | Bjorn      | Ulvaeus   |       1 |          1 |
-- | 13 | Anders     | Celsuis   |       2 |       NULL |
-- | 14 | Hedy       | Lamarr    |       5 |       NULL |


