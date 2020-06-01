* Troubleshooting errors
---------------------------------

If $ node app.js does not work, here are somethings to try

Troubleshooting error and fixes:

* Error 1: Cannot find module 'mysql2'
Sample fix:
        -- after already installing globally: $ npm install -g mysql 
        -- Also run this, but first exist from all mysql command prompts
        -- $ npm install mysql2 --save
        -- verify installed in package.json
                 "dependencies": {
                         "mysql": "^2.18.1",
                          "mysql2": "^2.1.0"

        
* Error 2: PORT error
Sample fix
1. netstat -ano | findstr :3301
2. taskkill /PID 5824 /F

* Error 3: Error: connect ECONNREFUSED 127.0.0.1:3307
    at TCPConnectWrap.afterConnect [as oncomplete] (net.js:1141:16) {
  errno: 'ECONNREFUSED',
  code: 'ECONNREFUSED',
  syscall: 'connect',
  address: '127.0.0.1',
  port: 3307,
  fatal: true

fix: ????


