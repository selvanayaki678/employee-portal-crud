# employee-portal-crud
This repo is having simple webapplication source code .To create, delete, view and update employee details using this source code. Tech stack is React js+ java+ MYSQL

# Installing Mysql 
sudo apt install mysql-server

Login into Mysql
mysql -u root  -h localhost --password
create DB
create database employee_management_system;
list databases
show databases;
get into the DB
use db_name;
To see the tables
show tables;
# note for mysql
by default mysql will allow connection from localhost using root user.

If u want to add mysql ip instead of localhost need to run folowing commands inside the mysql db.
CREATE USER 'root'@'ip_address' IDENTIFIED BY 'some_pass';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'ip_address';
SELECT user,host from mysql.user;


# Java build and run
https://devopscube.com/build-java-application-using-maven/

maven installation:
https://devopscube.com/install-maven-guide/

to build java -- mvn clean install

To run application
java -jar <jar file>

# React js application
install npm 
sudo apt install npm
 #Build the react js application
  npm install

  #run the reactjs app
  npm start

# Reference

# jenkins pipeline

sudo docker build -t java-middle .
sudo docker run -d --network host first:v1




