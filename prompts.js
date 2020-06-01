// -- Inquirer prompt

var inquirer = require('inquirer');

inquirer
  .prompt([
    {
        type: 'list',
        name: 'sqlStatement',
        message: 'What would you like to do?',
        choices: ['View All Departments', 'View All Roles', 'View All Employees', 'Add a Department', 'Add a Role',  'Add an Employee', 'Update an Employee role']
    }   
  ])
  .then(answers => {
    console.log(JSON.stringify(answers, null, '  '));
  });

