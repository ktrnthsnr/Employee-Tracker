
 // -- to invoke application, run $ node app.js

// -- Inquirer prompt
const mysql = require('mysql2');
const env = require('./env');
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
            'Add a Department', 'Add a Role',  'Add an Employee', 'Update an Employee role']
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
            viewAllEmployee();  //placeholder
        }
        else if (sqlStatement == 'Add a Role') {
            viewAllEmployee(); //placeholder
        }
        else if (sqlStatement == 'Add an Employee') {
            viewAllEmployee(); //placeholder
        }
        else if (sqlStatement == 'Update an Employee role') {
            viewAllEmployee(); //placeholder
        }
        else {
            endDbConnection();
        }
    });
};
 

// -- function calls 

// promptUser()
// .then(answers => console.log(answers));
// .then(viewAllDept);


viewAllDept = () => {
    console.log('Selecting all products...\n');
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
    console.log('Selecting all products...\n');
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
    console.log('Selecting all products...\n');
    connection.query(
    'SELECT * from employee;',   
       function(err, results) {
        console.log(results);
    }
   );
    // -- next function() call;
   promptUser();
};

// -- to do: add other 4 functions.. 



// -- end db connection

 endDbConnection = () => {
    // -- end the connection
 connection.end();
 };
