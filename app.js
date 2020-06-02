
 // -- to invoke application, run $ node app.js

// -- Inquirer prompt
const mysql = require('mysql2');
const env = require('./env');   // custom module to hold mysql password
var inquirer = require('inquirer');

// connection to database
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: env.password,
    database: 'employeetracker_db'
  });
  
 connection.connect(err => {
     if (err) throw err;
     console.log('connected as id ' + connection.threadId + '\n');
     console.log("Employee Tracker:");
     // -- call first function, user prompt
     promptUser();
 });

 // -- functions defined

 const promptUser = () => {
    return inquirer .prompt([
        {
            type: 'list',
            name: 'sqlStatement',
            message: 'What would you like to do?',
            choices: ['View All Departments', 'View All Roles', 'View All Employees', 
            'Add a Department', 'Add a Role',  'Add an Employee', 'Update an Employee role', 'Quit']
        }
    ])
    // .then(answers => console.log(answers));

    .then(answers => {
       const { sqlStatement } = answers;
        if (sqlStatement == 'View All Departments') {
            viewAllDept();
        }
        else if (sqlStatement == 'View All Roles') {
            viewAllRole();
        }
        else if (sqlStatement == 'View All Employees') {
            viewAllEmployee();
        }
        else if (sqlStatement == 'Add a Department') {
            addDept();  
        }
        else if (sqlStatement == 'Add a Role') {
            addRole(); 
        }
        else if (sqlStatement == 'Add an Employee') {
            addEmployee(); 
        }
        else if (sqlStatement == 'Update an Employee role') {
            updateEmployee(); 
        }
        else if (sqlStatement == 'Quit') {
            endDbConnection(); 
        }
    });
};
 

// -- function calls 

// promptUser()
// .then(answers => console.log(answers));
// .then(viewAllDept);


viewAllDept = () => {
    console.log('Selecting all departments...\n');
    connection.query(
    'SELECT * from department;',
       function(err, results) {
         console.log(results);
        }
       );
        // -- next function() call;
// -- testing 
// endDbConnection();
       promptUser();
};

viewAllRole = () => {
    console.log('Selecting all roles...\n');
    connection.query(
    'SELECT * from role;',   
       function(err, results) {
        console.log(results);
    }
   );
    // -- next function() call;
   promptUser();
};

viewAllEmployee = () => {
    console.log('Selecting all employees...\n');
    connection.query(
    'SELECT * from employee;',   
       function(err, results) {
        console.log(results);
    }
   );
    // -- next function() call;
   promptUser();
};

addDept = () => {
    console.log('Adding a department...\n');
    connection.query(
    'INSERT INTO department SET ?',   
    {
        dept_name: 'Testing',   //placeholder
    },
    function(err, res) {
        if (err) throw err;
        console.log(' || Added: ' + res.affectedRows + ' a new department!\n');
    }
   );
    // -- next function() call;
   promptUser();
};

addRole = () => {
    console.log('Adding a role...\n');
    connection.query(
        'INSERT INTO role SET ?',   
        {
            title: 'BusinessAnalyst',
            salary: 60000,             //placeholder
            department_id: 4
        },
        function(err, res) {
            if (err) throw err;
            console.log(' || Added: ' + res.affectedRows + ' a  new role!\n');
        }
       );
        // -- next function() call;
       promptUser();
};

addEmployee = () => {
    console.log('Adding an employee...\n');
    connection.query(
        'INSERT INTO employee SET ?',   
        {
            first_name: 'Hedy',
            last_name: 'Lamarr',             //placeholder
            role_id: 2
        },
        function(err, res) {
            if (err) throw err;
            console.log(' || Added: ' + res.affectedRows + ' a  new employee!\n');
        }
       );
        // -- next function() call;
       promptUser();
};

updateEmployee = () => {
    console.log('Updating an employee...\n');
    // -- update SQL statement
    let sql =   `UPDATE employee
                SET role_id = ?
                WHERE last_name = ?`;
    let data = [5, 'Lamarr'];
    connection.query(sql, data, (error, results, fields) => {
        if (error){
            return console.error(error.message);
          }
          console.log('| Updated: ' + results.affectedRows + 'new employee!\n');
    });
    // -- next function() call;
    promptUser();
};


// -- end db connection
 endDbConnection = () => {
 connection.end();
 };
