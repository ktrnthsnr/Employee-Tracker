// -- // SQL Statements - Summary
// -- // ------------------------
// -- // View all departments
// -- // View all roles
// -- // View all employees
// -- // Add a department
// -- // Add a role
// -- // Add an employee
// -- // Update an employee role


 // -- to invoke application, run $ node app.js

 const mysql = require('mysql2');
 const env = require('./env');

//  console.log(mysqlpassword);

 // connection to database
 const connection = mysql.createConnection({
   host: 'localhost',
   user: 'root',
   password: env.password,
   database: 'employeetracker_db'
 });
 
 connection.connect(err => {
   if (err) throw err;
   console.log('connected as id ' + connection.threadId);
   afterConnection();
 });
 
 afterConnection = () => {
   connection.query(
     // USE employeetracker_db;
     'SELECT * from role;',   
     function(err, results) {
       console.log(results);
 
     }
   );
 
 connection.end();
 };
 
 