# drop database codifydb
show databases;
Create database codifydb;
use codifydb;

CREATE TABLE department(
  location varchar(100),
  dep_id int PRIMARY KEY ,
  dep_name varchar(100) NOT NULL
);

CREATE TABLE emp_project(
  project_id int PRIMARY KEY,
  location varchar(100),
  project_lead int,
  department int,
  FOREIGN KEY (department) REFERENCES department(dep_id)
                      ON UPDATE CASCADE
                      ON DELETE CASCADE




);

CREATE TABLE Employee(
employee_id int PRIMARY KEY,
title varchar(50) NOT NULL,
dep int NOT NULL,
project int,
FOREIGN KEY (dep) REFERENCES department(dep_id)
                   ON UPDATE CASCADE
                   ON DELETE RESTRICT,
FOREIGN KEY(project) REFERENCES emp_project(project_id)
);

CREATE TABLE Employee_Info(
employee_id int PRIMARY KEY,
birthday date NOT NULL,
street varchar(100) NOT NULL,
zip varchar(5) NOT NULL,
city varchar(50) NOT NULL,
gender varchar(50),
fname varchar(100) NOT NULL,
minit varchar(5),
lname varchar(100) NOT NULL,
ssn int UNIQUE NOT NULL,
visa varchar(100) NOT NULL,
disability varchar(100) ,
vet_stat varchar(100),
email varchar(100) UNIQUE NOT NULL,
startDate date NOT NULL,
phone varchar(10) UNIQUE NOT NULL,
FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
                        ON UPDATE CASCADE
                        ON DELETE CASCADE
);

CREATE TABLE dependent(
  emp int NOT NULL,
  fname varchar(100) NOT NULL,
  minit varchar(100),
  lname varchar(100) NOT NULL,
  relation varchar(100) NOT NULL,
  gender varchar(50),
  FOREIGN KEY (emp) REFERENCES Employee(employee_id)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE
);

CREATE TABLE payroll(
  emp_id int primary key,
  amount int NOT NULL,
  hourly int,
  stock int,
  salary bool NOT NULL,
  pay_interval varchar(50),
  bonus int,
  FOREIGN KEY (emp_id) REFERENCES Employee(employee_id)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE




);

CREATE TABLE timesheet(
  emp_id int,
  clock_in DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  clock_out DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  date_worked date NOT NULL,
  FOREIGN KEY(emp_id) REFERENCES Employee(employee_id)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT
);

CREATE TABLE officeResources(
  resource_name varchar(50),
  issue_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  dep_num int,
  FOREIGN KEY (dep_num) REFERENCES department(dep_id)
                          ON UPDATE CASCADE
                          ON DELETE RESTRICT
);

CREATE TABLE users(
  user_id int PRIMARY KEY,
  email varchar(100) UNIQUE NOT NULL,
  phone_num varchar(10) UNIQUE NOT NULL,
  employee_id int,
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
                          ON UPDATE CASCADE
                          ON DELETE RESTRICT
);

CREATE TABLE userprofile(
  fname varchar(100) NOT NULL,
  midinit varchar(5),
  lname varchar(100) NOT NULL,
  userRole varchar(20) NOT NULL,
  portfolio varchar(200) NOT NULL,
  user_id int,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
                          ON UPDATE CASCADE
);

CREATE TABLE socials(
  linkedin varchar(100),
  instagram varchar(100),
  facebook varchar(100),
  twitter varchar(100),
  user_id int,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
                          ON UPDATE CASCADE
);

CREATE TABLE user_demo(
  zodiac varchar(50) NOT NUlL,
  race varchar(50),
  gender varchar(50),
  age int NOT NULL,
  user_id int,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
               ON UPDATE CASCADE
               ON DELETE RESTRICT
);

CREATE TABLE projects
(
   project_id varchar(50) PRIMARY KEY,
   location   varchar(50),
   user_id int,
   FOREIGN KEY (user_id) REFERENCES users (user_id)
       ON UPDATE CASCADE
       ON DELETE RESTRICT
);

INSERT INTO department
  VALUES ('Boston', 2, 'Accounting');
INSERT INTO department
  VALUES ('Cambridge', 3, 'Human Resources');

INSERT INTO emp_project
  VALUES (53, 'Boston', 567, 2);
INSERT INTO emp_project
  VALUES (789, 'Cambridge', 125, 3);

INSERT INTO Employee
  VALUES (345, 'Accountant', 2, 53);
INSERT INTO Employee
  VALUES (529, 'Recruiter', 3, 789);

INSERT INTO Employee_Info
  VALUES (345, '2003-01-08', '48 Chestnut Lane', 90248, '‘Boston’', '‘Female’', '‘Emily’',0,' ‘Liu’',
          109480244, '‘H1’', 0, 1, 'emily@gmail.com', '2022-01-10', '4930983000');
INSERT INTO Employee_Info
  VALUES (529, '2002-10-21', '52 Huntington Ave', 09133,
          'Boston’', '‘Male’', 'Jason', NULL ,'‘Snyder’', 910248940, '‘N/A’', 1,
          0, '‘jason@outlook.com’', '2020-05-30', '4809184593');

INSERT INTO dependent
  VALUES (529, '‘John’', '‘Smith’', '‘Son’', '‘Male’',0);
INSERT INTO dependent
  VALUES (529, 'Jane', 'Doe', 'Daughter', 'Female',0);

INSERT INTO payroll
  VALUES (529, 500000, 0, 125000, 1, '‘Bi-weekly’', 0);
INSERT INTO payroll
  VALUES (345, 10000, 1, 500, 0, '‘Monthly’', 100);

INSERT INTO timesheet
  VALUES (529, '08:10:11', '15:10:11', '2023-04-07');
INSERT INTO timesheet
  VALUES (345, '08:10:11', '15:10:11', '2023-02-09');

INSERT INTO officeResources
  VALUES ('stapler', '2023-04-07', 2);
INSERT INTO officeResources
  VALUES ('laptop', '2021-03-20', 3);

INSERT INTO users
  VALUES (91284, 'anna@yahoo.com', '5163457893', 529);
INSERT INTO users
  VALUES (41928, 'john@gmail.com', '9178439023', 529);

INSERT INTO userprofile
  VALUES ('Jessica', 'L', 'Peng', 'Software Engineer', 'http://github.com/jessicapeng', 91284);
INSERT INTO userprofile
  VALUES ('Veda', 'M', 'Nandikam', 'Designer', 'http://github.com/vedanan', 41928);

INSERT INTO socials
  VALUES ('http://linkedin.com/vedanan', 0,0,0,91284);
INSERT INTO socials
  VALUES (0,'http://instagram.com/jessicapeng', 0,0, 41928);

INSERT INTO user_demo
  VALUES ('Gemini', 'Asian', 'Female', 19, 91284);
INSERT INTO user_demo
  VALUES ('Aquarius', 'Asian', 'Male', 21, 41928);

INSERT INTO projects
  VALUES (41928, 'Boston', 41928);
INSERT INTO projects
  VALUES (41929, 'Boston', 41928);
INSERT INTO projects
  VALUES (41930, 'Boston', 91284);
