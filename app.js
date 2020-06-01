
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
            choices: ['View All Departments', 'View All Roles', 'View All Employees', 'Add a Department', 'Add a Role',  'Add an Employee', 'Update an Employee role']
        }
    ])
    .then(answers => console.log(answers));
};
 
// const here(){
//     console.log("here");
// }   


// -- function calls 

// viewAllDept();

// promptUser()
// .then(answers => console.log(answers));
// .then(viewAllDept);

// if (answers == 'View All Departments'){
//     return viewAllDept()
// } else endDbConnection();


// .then(viewAllDept => {
//     console.log(viewAllDept);    
// })
// .catch(err => {
//     console.log(err);
// })

//-- test db connection

// -- to do: add array and if\else conditionals to call these functions
    // .then(answers => console.log(answers));
    // if answer = [0] .then viewAllDept()
    // else if answer = [1] .then viewAllRole()
    // else if answer = [2] .then viewAllEmployee()
    // else if answer = [3] .then addDept()
    // else if answer = [4] .then addRole()
    // else if answer = [5] .then addEmployee()
    // else if answer = [6] .then updateEmployeeRole()


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
    //    promptUser();
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
