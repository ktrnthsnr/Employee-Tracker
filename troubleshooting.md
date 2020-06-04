* Troubleshooting errors
---------------------------------
If $ npm start or  $ mysql -u root -p DO NOT work, here are some things to try, which are some obstacles I encountered and may help you!


Troubleshooting errors with mysql2 command line, recommendations

* Error: Cannot find module 'mysql2'
-----------------------------------------------
Here are steps that resolved my issues when after installing mysql and mysql2, the comnand line still wasn't working
- Installed globally 
-      $ npm install -g mysql 
- Installed mysql2 command line util with --save option
-      $ npm install mysql2 --save
- Verified then added in package.json
                "dependencies": {
                        "mysql": "^2.18.1",
                        "mysql2": "^2.1.0"
- Checked within the terminal the msql version to see if installed 
        $ mysql -- version
- Within the VSCode terminal, started MySQL
              $ mysql -u root -p
Entered my MySQL password when prompted


* Other: MySQL command line not working and other info
-----------------------------------------------------------
- Where is MySQL installed? Type within the terminal
        $ mysql --version 
        For me, the installed was here: C:\Program Files\<..>
        If mysql command line prompt is not showing up, check the \bin path has been added to the PATH environment variables

- Where is my db installed?  Within the mysql2 command line, type this 
        mysql> select @@datadir;
        For me, the install landed here:  C:\ProgramData\MySQL\MySQL Server 8.0\Data\
        
- How to do I move my mysql database to another location? (Warning, this may cause problems with mysql, see http://dev.mysql.com/ for further instructions)- 
        First shutdown mysql by closing the terminal. Check services.msc to check if the MySQL80 service is stopped.
        In this location: "C:\ProgramData\MySQL\MySQL Server 8.0\my.ini"
        Change datadir parameter value to point to the new location. 

- For any unresolved mysql usage issues, consider reinstalling Oracle's MySQL, http://dev.mysql.com/downloads/

- How to restart mysql?
        cmd
        cd  C:\Program Files\MySQL\MySQL Server 8.0\bin 
        run mysqld.exe                 
        Within the VSCode terminal, start MySQL
              $ mysql -u root -p
        Enter your MySQL password when prompted


