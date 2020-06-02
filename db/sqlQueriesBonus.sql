----------------------------------------------------------------------------------------------
------------------------   Bonus queries - to do: add to the app.js
----------------------------------------------------------------------------------------------
---------------------------- 	○ Update employee managers (do you mean update employees to be a manager?)
    -- check before
    SELECT * FROM employee WHERE last_name in ('Lamarr');   
    -- run update
UPDATE employee SET manager_id = 1 WHERE last_name in ('Lamarr');
    -- check after
    SELECT * FROM employee WHERE last_name in ('Lamarr');

--  mysql>  SELECT * FROM employee WHERE last_name in ('Lamarr');
-- +----+------------+-----------+---------+------------+
-- | id | first_name | last_name | role_id | manager_id |
-- +----+------------+-----------+---------+------------+
-- | 15 | Hedy       | Lamarr    |       5 |       NULL |
-- +----+------------+-----------+---------+------------+
-- 1 row in set (0.00 sec)

-- mysql> UPDATE employee SET manager_id = 1 WHERE last_name in ('Lamarr');
-- Query OK, 1 row affected (0.01 sec)
-- Rows matched: 1  Changed: 1  Warnings: 0

-- mysql>  SELECT * FROM employee WHERE last_name in ('Lamarr');
-- +----+------------+-----------+---------+------------+
-- | id | first_name | last_name | role_id | manager_id |
-- +----+------------+-----------+---------+------------+
-- | 15 | Hedy       | Lamarr    |       5 |          1 |
-- +----+------------+-----------+---------+------------+
-- 1 row in set (0.00 sec)

---------------------------- 	○ View employees by manager (do you mean, who are manager?)
SELECT * FROM employee WHERE manager_id = 1;

-- +----+------------+-----------+---------+------------+
-- | id | first_name | last_name | role_id | manager_id |
-- +----+------------+-----------+---------+------------+
-- |  1 | Freddie    | Mercury   |       1 |          1 |
-- | 12 | Bjorn      | Ulvaeus   |       1 |          1 |
-- | 13 | Hedy       | Lamarr    |       1 |          1 |
-- +----+------------+-----------+---------+------------+

----------------------------	○ View employees by department (requires 2 joins)
-- join statement
SELECT 
-- r.id as roleid, 
-- e.role_id as employeeroleid, 
e.*,
d.dept_name
FROM employee e
INNER JOIN role r ON
    e.role_id=r.id
INNER JOIN department d ON
    r.department_id=d.id
ORDER BY e.id;

-- mysql> SELECT
--     -> -- r.id as roleid,
--     -> -- e.role_id as employeeroleid,
--     -> e.*,
--     -> d.dept_name
--     -> FROM employee e
--     -> INNER JOIN role r ON
--     ->     e.role_id=r.id
--     -> INNER JOIN department d ON
--     ->     r.department_id=d.id
--     -> ORDER BY e.id;
-- +----+------------+-----------+---------+------------+---------------------+
-- | id | first_name | last_name | role_id | manager_id | dept_name           |
-- +----+------------+-----------+---------+------------+---------------------+
-- |  1 | Freddie    | Mercury   |       1 |          1 | Management          |
-- |  2 | Ed         | Sheeran   |       2 |       NULL | SoftwareDevelopment |
-- |  3 | Tito       | Puente    |       3 |       NULL | Engineering         |
-- |  4 | Celia      | Cruz      |       4 |       NULL | SoftwareDevelopment |
-- |  5 | Marvin     | Gaye      |       2 |       NULL | SoftwareDevelopment |
-- |  6 | Jimi       | Hendrix   |       3 |       NULL | Engineering         |
-- |  7 | Janis      | Joplin    |       4 |       NULL | SoftwareDevelopment |
-- |  8 | Billy      | Holiday   |       5 |       NULL | SoftwareDevelopment |
-- |  9 | Benny      | Andersson |       6 |       NULL | Operations          |
-- | 10 | Anni-Frid  | Lyngstad  |       7 |       NULL | Networking          |
-- | 11 | Agnetha    | Faltskog  |       8 |       NULL | Operations          |
-- | 12 | Bjorn      | Ulvaeus   |       1 |          1 | Management          |
-- | 15 | Hedy       | Lamarr    |       5 |          1 | SoftwareDevelopment |
-- +----+------------+-----------+---------+------------+---------------------+
-- 13 rows in set (0.00 sec)

---------------------------- 	○ Delete departments, roles, and employees.

-- deletes all
TRUNCATE TABLE deparment;
TRUNCATE TABLE role;
TRUNCATE TABLE employee;

-- deletes by id
-- Delete an employee
DELETE FROM employee WHERE id = 1;
-- Delete a role (can't have any fk attached)
DELETE FROM role WHERE id = 1;
-- Delete a dept (can't have any fk attached)
DELETE FROM department WHERE id = 1;


----------------------------	○ View the total utilized budget of a department—i.e., the combined salaries of all employees in that department.

-- (1) joining 2 tables
SELECT 
e.*,
r.salary,
d.dept_name
FROM employee e
INNER JOIN role r ON
    e.role_id=r.id
INNER JOIN department d ON
    r.department_id=d.id
ORDER BY e.id;


-- mysql> SELECT
--     -> e.*,
--     -> r.salary,
--     -> d.dept_name
--     -> FROM employee e
--     -> INNER JOIN role r ON
--     ->     e.role_id=r.id
--     -> INNER JOIN department d ON
--     ->     r.department_id=d.id
--     -> ORDER BY e.id;
-- +----+------------+-----------+---------+------------+--------+---------------------+
-- | id | first_name | last_name | role_id | manager_id | salary | dept_name           |
-- +----+------------+-----------+---------+------------+--------+---------------------+
-- |  1 | Freddie    | Mercury   |       1 |          1 | 110000 | Management          |
-- |  2 | Ed         | Sheeran   |       2 |       NULL | 120000 | SoftwareDevelopment |
-- |  3 | Tito       | Puente    |       3 |       NULL |  90000 | Engineering         |
-- |  4 | Celia      | Cruz      |       4 |       NULL |  85000 | SoftwareDevelopment |
-- |  5 | Marvin     | Gaye      |       2 |       NULL | 120000 | SoftwareDevelopment |
-- |  6 | Jimi       | Hendrix   |       3 |       NULL |  90000 | Engineering         |
-- |  7 | Janis      | Joplin    |       4 |       NULL |  85000 | SoftwareDevelopment |
-- |  8 | Billy      | Holiday   |       5 |       NULL | 120000 | SoftwareDevelopment |
-- |  9 | Benny      | Andersson |       6 |       NULL |  90000 | Operations          |
-- | 10 | Anni-Frid  | Lyngstad  |       7 |       NULL |  90000 | Networking          |
-- | 11 | Agnetha    | Faltskog  |       8 |       NULL |  50000 | Operations          |
-- | 12 | Bjorn      | Ulvaeus   |       1 |          1 | 110000 | Management          |
-- | 15 | Hedy       | Lamarr    |       5 |          1 | 120000 | SoftwareDevelopment |
-- +----+------------+-----------+---------+------------+--------+---------------------+
-- 13 rows in set (0.00 sec)

-- (2) group by 

SELECT 
-- e.*,
d.dept_name,
SUM(r.salary)
FROM employee e
INNER JOIN role r ON
    e.role_id=r.id
INNER JOIN department d ON
    r.department_id=d.id
GROUP BY d.dept_name;
-- ORDER BY r.salary, d.dept_name asc;

-- mysql> SELECT
--     -> -- e.*,
--     -> d.dept_name,
--     -> SUM(r.salary)
--     -> FROM employee e
--     -> INNER JOIN role r ON
--     ->     e.role_id=r.id
--     -> INNER JOIN department d ON
--     ->     r.department_id=d.id
--     -> GROUP BY d.dept_name;
-- +---------------------+---------------+
-- | dept_name           | SUM(r.salary) |
-- +---------------------+---------------+
-- | Management          |        220000 |
-- | SoftwareDevelopment |        650000 |
-- | Engineering         |        180000 |
-- | Operations          |        140000 |
-- | Networking          |         90000 |
-- +---------------------+---------------+