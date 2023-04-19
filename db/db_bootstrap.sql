DROP SCHEMA IF EXISTS `codifydb` ;
Create database codifydb;
use codifydb;

grant all privileges on codifydb.* to 'webapp'@'%';
flush privileges;


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
project_id int,
FOREIGN KEY (dep) REFERENCES department(dep_id)
                   ON UPDATE CASCADE
                   ON DELETE RESTRICT,
FOREIGN KEY(project_id) REFERENCES emp_project(project_id)
);

CREATE TABLE Employee_Info(
employee_id int PRIMARY KEY,
birthday varchar(15) NOT NULL,
street varchar(100) NOT NULL,
zip varchar(5) NOT NULL,
city varchar(50) NOT NULL,
gender varchar(50),
fname varchar(100) NOT NULL,
minit varchar(5),
lname varchar(100) NOT NULL,
ssn varchar(11) UNIQUE NOT NULL,
visa varchar(100) NOT NULL,
disability varchar(100) ,
vet_stat varchar(100),
email varchar(100) UNIQUE NOT NULL,
startDate varchar(15) NOT NULL,
phone varchar(12) UNIQUE NOT NULL,
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
  clock_in varchar(15) NOT NULL,
  clock_out varchar(15) NOT NULL,
  date_worked varchar(15) NOT NULL,
  FOREIGN KEY(emp_id) REFERENCES Employee(employee_id)
                    ON UPDATE CASCADE
                    ON DELETE RESTRICT
);


CREATE TABLE officeResources(
  resource_name varchar(50),
  issue_date varchar(15) NOT NULL,
  dep_num int,
  FOREIGN KEY (dep_num) REFERENCES department(dep_id)
                          ON UPDATE CASCADE
                          ON DELETE RESTRICT
);

CREATE TABLE projects
(
   project_id varchar(50) PRIMARY KEY,
   location   varchar(50),
   project_description varchar(80),
   project_name varchar(40),
   project_status int,
   project_languages varchar(35)
);


CREATE TABLE users(
 int PRIMARY KEY,
  email varchar(100) UNIQUE NOT NULL,
  phone_num varchar(10) UNIQUE NOT NULL,
  employee_id int,
  project_id int,
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
                          ON UPDATE CASCADE
                          ON DELETE RESTRICT

  FOREIGN KEY (project_id) REFERENCES projects (project_id)
                          ON UPDATE CASCADE
                          ON DELETE RESTRICT
);


CREATE TABLE userprofile(
  fname varchar(100) NOT NULL,
  midinit varchar(5),
  lname varchar(100) NOT NULL,
  username varchar(20) NOT NULL,
  userRole varchar(20) NOT NULL,
  portfolio varchar(200) NOT NULL,
 int,
  FOREIGN KEY ) REFERENCES users)
                          ON UPDATE CASCADE
);

CREATE TABLE socials(
  linkedin varchar(100),
  instagram varchar(100),
  facebook varchar(100),
  twitter varchar(100),
 int,
  FOREIGN KEY ) REFERENCES users)
                          ON UPDATE CASCADE
);

CREATE TABLE user_demo(
  fav_animal varchar(50) NOT NUlL,
  race varchar(50),
  gender varchar(50),
  age int NOT NULL,
 int,
  FOREIGN KEY ) REFERENCES users)
               ON UPDATE CASCADE
               ON DELETE RESTRICT
);



INSERT INTO department(location,dep_id,dep_name) VALUES ('Fuxi',1,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Paris 16',2,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Arevik',3,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Biograd na Moru',4,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Santuario',5,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Cruz Alta',6,'Engineering');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Hezhang',7,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Usab',8,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Phú Lộc',9,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Maluso',10,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Baohe',11,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Guaranda',12,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Lodoyo',13,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Ciodeng',14,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Bilohirs’k',15,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Blagaj',16,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Yongledian',17,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Saint Petersburg',18,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Chłapowo',19,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Nogueira',20,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Limoges',21,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Murów',22,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Goulmima',23,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Itapira',24,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Knoxville',25,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Ning’an',26,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Pacov',27,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Anak',28,'Engineering');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Jampang Tengah',29,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Parakanpanjang',30,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Couto',31,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Zhuangbian',32,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Oliveira',33,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Áyios Nikólaos',34,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Shahumyan',35,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Jifnā',36,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Mabamba',37,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Moose Jaw',38,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Rybnoye',39,'Support');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Balazar',40,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Gaotai',41,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Sunnyvale',42,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Mauren',43,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Lobuni',44,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Thị Trấn Việt Quang',45,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Nacka',46,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Bolhrad',47,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Cama Juan',48,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Auray',49,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Vřesina',50,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Bira',51,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Muquiyauyo',52,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Vidovci',53,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Colombo',54,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Xitan',55,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Gouxaria',56,'Engineering');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Pará de Minas',57,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Weepangali',58,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Mokil',59,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Francistown',60,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Sann',61,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Hekou',62,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Camden',63,'Support');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Yanjiang',64,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('São Pedro Gafanhoeira',65,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Tiguha',66,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Yasenevo',67,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Chengjiao Chengguanzhen',68,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Strängnäs',69,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Jarabacoa',70,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Fencheng',71,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Zhenjiang',72,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Likwatang Timur',73,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Mocho',74,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Bangus Kulon',75,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Garešnica',76,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Huangpo',77,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('El Carril',78,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Duncan',79,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Ikeda',80,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Nepeña',81,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Obas',82,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Loukísia',83,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Toroy',84,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Kilifarevo',85,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Lubenec',86,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Gifu-shi',87,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Xindai',88,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Gwangjeok',89,'Engineering');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Bergen',90,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Lindavista',91,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Paris 10',92,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Chambéry',93,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Jeonju',94,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Popil''nya',95,'Engineering');
INSERT INTO department(location,dep_id,dep_name) VALUES ('San Miguel',96,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Castlebellingham',97,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Ústí nad Orlicí',98,'Support');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Cheyenne',99,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Wuquan',100,'Business Development');

INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (1646,'Pingyi',6335,56);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9445,'Aroeira',9784,26);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7043,'Medveditskiy',4152,5);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7184,'Shenji',6758,99);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (1419,'Xibin',5242,57);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8757,'Rifu',7115,6);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (1394,'Semuda',8394,60);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9833,'Napenay',9193,33);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8629,'Viana do Castelo',8371,18);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5911,'Hlybokaye',2308,73);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3877,'Krzczonów',6732,20);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4176,'Mineralni Bani',8751,47);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6963,'Selmes',8117,49);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9077,'Besuk Selatan',4715,2);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9712,'Rendian',2039,8);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6371,'Hepu',1597,96);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3221,'Asembagus',9520,34);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4236,'Qiandian',6419,37);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8195,'Angers',6295,46);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2389,'Sopron',8133,93);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6377,'Xinbei',8018,64);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8326,'Bailu',3567,60);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5868,'São Roque',2262,69);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4552,'Abomey-Calavi',2550,38);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7132,'Levallois-Perret',8338,8);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3370,'Jiujie',9052,54);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4122,'Micheng',5521,26);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8360,'Tianfen',7965,88);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9934,'Slavonice',1225,92);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8370,'Sohbatpur',6404,48);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8682,'Lunenburg',8177,24);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5061,'Kerikeri',8586,75);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2079,'Marseille',9724,35);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3595,'Ōi',9979,98);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4373,'Barotac Viejo',8276,19);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9120,'Mushu',1419,77);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6713,'Palekastro',6006,7);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2718,'Uruguaiana',4018,35);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9423,'Tuodian',3493,63);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8284,'Kanḏay',8806,99);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9080,'Mulhouse',8708,62);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5454,'Paranho',1809,89);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (1114,'Huilelot',1963,4);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2512,'Orzesze',2230,33);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9112,'Damai',5787,66);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7109,'Wilkowice',9561,2);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9945,'Zhourui',7853,6);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5183,'Saynshand',5289,48);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2339,'Takaka',7275,9);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7112,'Kanshan',7671,69);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7206,'Filipowice',1179,55);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3287,'Wenjiao',4533,3);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5512,'Telgawah',8131,76);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7510,'Shuikou',7364,85);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3969,'Słupno',2780,19);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4256,'Klenica',3935,99);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9386,'Tangchi',5466,68);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8078,'Buenavista',8985,73);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9174,'San Cristobal',7386,87);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4458,'Yandian',4266,47);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8136,'Tangier',6049,62);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4026,'Jatisari',6219,45);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8422,'Warungbanten',6285,75);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7002,'Vidče',1887,95);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6408,'Uzlovaya',1855,33);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5045,'Kushnarënkovo',2745,20);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5759,'Cibojong',5505,96);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9884,'Mestre',9261,79);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5776,'K Bang',9363,1);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4264,'Balykchy',7707,7);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4211,'Best',4153,23);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3930,'Banqiao',3428,41);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5705,'Kulun',1452,2);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5114,'Tanxi',4675,95);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7738,'Nackawic',7425,39);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6457,'Besukrejo',6655,74);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2831,'Przecław',2681,52);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3142,'Kristinehamn',1201,47);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6043,'Gunungbatu',4012,41);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3906,'Swords',9922,66);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7179,'Staryy Togul',8162,37);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2852,'Caramay',5915,5);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (1072,'Buffalo',1100,88);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8105,'Bethanie',3085,87);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3374,'Pondohan',7776,66);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2741,'Shanhou',2044,16);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7723,'Xiangtang',7678,52);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7640,'Bieto',2928,37);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5786,'Walakeri',1883,81);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6904,'San Antonio',1925,76);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5362,'Chendian',8709,57);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6973,'Dallas',3067,78);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3895,'Wadi Kidul',1175,64);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4567,'Carvalhais',6279,41);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9061,'Putrajaya',8948,44);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9983,'Atsugi',9677,42);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5144,'Bartošovice',1514,43);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3866,'Pavia',4520,56);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9417,'Barbudo',4064,29);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7793,'Takari',3237,58);

INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1,'Accounting Assistant IV',94,3287);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (2,'Food Chemist',25,4458);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3,'Clinical Specialist',8,7793);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (4,'Clinical Specialist',78,4264);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (5,'Quality Control Specialist',10,8757);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6,'Assistant Manager',90,3221);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (7,'Administrative Assistant III',29,8195);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (8,'Nuclear Power Engineer',69,6043);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (9,'Biostatistician I',1,9423);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (10,'Librarian',81,8757);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (11,'Analog Circuit Design manager',27,2852);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (12,'Analyst Programmer',51,4122);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (13,'Computer Systems Analyst III',45,7793);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (14,'VP Sales',7,6963);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (15,'Human Resources Assistant II',2,8326);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (16,'Research Associate',23,7043);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (17,'Safety Technician II',94,7640);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (18,'VP Sales',78,1394);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (19,'Geologist I',29,7184);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (20,'Marketing Manager',21,9174);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (21,'Editor',82,8422);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (22,'Technical Writer',91,4236);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (23,'Geological Engineer',75,8326);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (24,'Editor',16,5144);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (25,'Professor',60,9417);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (26,'Research Associate',70,6904);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (27,'Marketing Manager',21,8422);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (28,'Environmental Specialist',45,7510);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (29,'Human Resources Manager',31,7132);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (30,'Environmental Tech',57,6713);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (31,'Social Worker',17,4026);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (32,'Editor',80,3866);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (33,'Systems Administrator III',44,2079);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (34,'Programmer Analyst II',68,2718);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (35,'Help Desk Technician',56,7738);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (36,'Research Nurse',33,2512);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (37,'Information Systems Manager',73,5759);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (38,'Programmer Analyst I',81,3969);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (39,'Administrative Assistant IV',16,2718);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (40,'Registered Nurse',88,8326);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (41,'Teacher',47,5454);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (42,'Director of Sales',65,1114);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (43,'Programmer Analyst II',48,1646);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (44,'Account Executive',41,3287);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (45,'Biostatistician III',96,5362);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (46,'Mechanical Systems Engineer',89,2831);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (47,'Chemical Engineer',91,5362);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (48,'Operator',65,4236);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (49,'Paralegal',86,7132);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (50,'Dental Hygienist',40,9833);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (51,'Social Worker',90,9417);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (52,'Financial Analyst',85,7043);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (53,'Payment Adjustment Coordinator',25,4236);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (54,'VP Accounting',49,8078);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (55,'Media Manager II',87,5776);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (56,'Office Assistant III',16,4176);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (57,'Product Engineer',59,3374);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (58,'Business Systems Development Analyst',70,9423);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (59,'Structural Analysis Engineer',46,1394);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (60,'Accounting Assistant III',78,8326);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (61,'Pharmacist',25,6043);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (62,'Graphic Designer',1,2079);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (63,'Administrative Assistant II',61,4236);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (64,'Editor',16,5911);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (65,'Executive Secretary',42,9061);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (66,'Occupational Therapist',5,5144);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (67,'Engineer IV',41,4567);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (68,'Research Associate',91,8422);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (69,'Design Engineer',72,3374);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (70,'Quality Engineer',83,9077);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (71,'Sales Associate',61,5759);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (72,'Actuary',92,2831);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (73,'Systems Administrator I',65,5868);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (74,'Clinical Specialist',1,9945);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (75,'Junior Executive',77,9423);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (76,'Data Coordinator',49,4026);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (77,'Senior Developer',80,9884);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (78,'Professor',18,2741);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (79,'Teacher',43,5868);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (80,'Legal Assistant',7,9120);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (81,'Legal Assistant',30,9445);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (82,'Financial Analyst',4,3595);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (83,'Recruiting Manager',88,3877);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (84,'Information Systems Manager',65,5776);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (85,'Director of Sales',90,5512);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (86,'Chemical Engineer',55,4373);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (87,'Business Systems Development Analyst',58,3370);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (88,'Account Representative II',83,5183);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (89,'Marketing Manager',87,8360);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (90,'Environmental Specialist',45,5911);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (91,'Assistant Media Planner',15,4256);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (92,'Social Worker',50,5911);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (93,'Automation Specialist III',98,5144);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (94,'Associate Professor',56,2389);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (95,'Programmer Analyst III',25,1072);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (96,'Senior Quality Engineer',80,3930);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (97,'Research Nurse',17,9120);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (98,'Quality Control Specialist',41,6963);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (99,'Desktop Support Technician',19,4264);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (100,'Information Systems Manager',44,9423);

INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (1,'6/28/1968','29800 Dunning Plaza',19748,'Buga','Non-binary','Mia','H','Compston','149-74-6489','F1','true','false','mcompston0@ucsd.edu','11/9/2020','899-727-4575');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (2,'12/17/1994','53572 Declaration Crossing',29698,'Jiuli','Female','Flss','P','Vittore','867-45-9972','N/A','true','true','fvittore1@amazon.de','3/30/2013','394-730-3814');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (3,'10/28/1945','347 Northwestern Terrace',89181,'Jistebnice','Male','Rodd','J','MacCombe','549-66-3150','F1','false','true','rmaccombe2@istockphoto.com','7/22/2005','378-348-3677');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (4,'7/10/1973','774 Melby Point',52270,'Liulin','Female','Faustina','O','Tewkesberry','578-89-7346','H1','true','true','ftewkesberry3@mashable.com','5/17/2003','995-789-0774');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (5,'9/4/1966','64477 Harbort Plaza',44008,'Shichuan','Genderfluid','Wyatan','L','Pinxton','888-42-7672','F1','true','false','wpinxton4@angelfire.com','6/28/2011','192-583-3241');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (6,'2/10/1989','877 Transport Place',89691,'Victoria','Non-binary','Randy','C','Teggin','879-12-7670','N/A','false','false','rteggin5@ed.gov','1/15/2013','214-565-4428');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (7,'1/23/1942','35827 Cottonwood Plaza',30747,'Coyaima','Female','Shoshana','W','Haville','406-61-3735','H1','true','false','shaville6@blogtalkradio.com','12/8/2001','802-360-7527');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (8,'7/13/1985','1268 Gateway Park',43374,'Ciangir','Female','Kristel','F','Balsdone','219-23-0386','F1','true','false','kbalsdone7@microsoft.com','4/7/2005','574-490-5439');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (9,'7/1/1945','0456 Helena Junction',58792,'San Vicente','Male','Gino','I','Gamlen','436-50-7673','F1','false','false','ggamlen8@reddit.com','2/24/2019','791-992-5083');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (10,'2/4/1962','7030 Milwaukee Crossing',29816,'Suba','Male','Julie','P','Hasser','762-60-6927','H1','false','false','jhasser9@ezinearticles.com','10/18/2003','514-258-6972');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (11,'6/11/1965','207 Johnson Parkway',85707,'Checca','Female','Kala','N','Portail','383-71-9064','N/A','false','true','kportaila@netlog.com','12/8/2016','495-614-6407');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (12,'4/22/1957','3505 Gale Parkway',88173,'Raffingora','Female','Shalna','H','Agney','831-89-3690','F1','false','false','sagneyb@yellowbook.com','1/4/2009','513-151-7429');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (13,'5/29/1972','0820 Buhler Drive',49363,'Ciodeng','Female','Caryn','N','Thumim','519-01-2033','H1','false','false','cthumimc@wired.com','11/6/2002','357-566-3318');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (14,'11/16/1991','70 Mcguire Junction',74907,'Reszel','Female','Malena','A','Di Lucia','341-89-4662','N/A','false','false','mdiluciad@nbcnews.com','1/20/2017','320-860-7862');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (15,'2/7/1979','00122 Lindbergh Street',79231,'Sho’rchi','Male','Abelard','G','Kapiloff','745-35-5526','F1','false','true','akapiloffe@springer.com','5/23/2003','843-221-2231');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (16,'10/4/1980','24 Becker Terrace',49059,'Sandy Bay','Male','Ewen','D','Records','400-22-5306','H1','false','true','erecordsf@sourceforge.net','9/12/2016','369-695-2699');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (17,'2/15/1983','2 Heffernan Court',20510,'Sumurber','Female','Germain','C','Bunney','492-11-4783','H1','true','true','gbunneyg@google.nl','5/8/2020','418-891-2418');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (18,'5/10/1958','270 Muir Drive',89150,'Mobara','Female','Eleonora','N','McFaul','525-62-2574','H1','true','false','emcfaulh@techcrunch.com','5/2/2022','726-413-4586');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (19,'2/22/1944','2673 Tomscot Road',38491,'Uitiuhtuan','Male','Vance','M','McAmish','116-27-9013','H1','false','false','vmcamishi@upenn.edu','11/2/2015','266-962-2426');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (20,'12/9/1993','1552 Kensington Circle',34599,'Kisoro','Male','Otho','D','Adin','226-76-3471','H1','false','false','oadinj@geocities.jp','6/1/2007','560-399-2650');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (21,'6/1/1972','98644 Warner Place',16638,'Bagaces','Female','Asia','U','Learoyde','269-64-1553','F1','true','false','alearoydek@wix.com','3/18/2013','944-308-1608');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (22,'3/10/1988','1 Summer Ridge Street',81241,'Xinli','Female','Bella','J','Wanless','135-72-7291','H1','true','true','bwanlessl@devhub.com','5/29/2018','558-674-2799');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (23,'10/13/1955','5 Mccormick Way',51630,'Staryy Krym','Male','Fergus','X','Woollcott','416-06-6402','H1','true','true','fwoollcottm@theatlantic.com','4/16/2016','216-658-8922');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (24,'5/25/1980','2 Beilfuss Court',19312,'San Fernando','Female','Dot','N','Kynsey','652-79-5334','F1','true','true','dkynseyn@nifty.com','6/8/2006','832-796-4415');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (25,'4/6/1942','8 Kingsford Plaza',70525,'Aragarças','Female','Wilhelmina','Y','Yorath','529-76-5649','F1','false','true','wyoratho@cdbaby.com','3/11/2010','379-546-4141');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (26,'4/6/1986','91 Dayton Alley',60468,'Oujda','Female','Harriott','O','Poulston','404-94-1284','F1','true','true','hpoulstonp@booking.com','9/29/2011','188-291-7697');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (27,'10/23/1971','95 Garrison Junction',36747,'Malonty','Male','Thorsten','X','Skerratt','875-82-1040','H1','true','false','tskerrattq@google.co.uk','8/8/2014','572-101-6324');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (28,'6/25/1981','225 Thierer Avenue',62748,'Skerries','Male','Pierce','J','Braniff','434-31-4133','N/A','false','true','pbraniffr@studiopress.com','5/21/2017','548-832-0605');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (29,'5/17/1962','60 Algoma Street',28340,'Pasirhuni','Female','Drusy','V','Pitkins','814-97-0577','N/A','false','false','dpitkinss@google.com','12/6/2021','557-109-6819');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (30,'6/15/1954','077 Barnett Point',76290,'Dao’er','Female','Nata','R','Ferrettino','553-51-1214','H1','false','true','nferrettinot@scientificamerican.com','11/2/2002','765-546-3493');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (31,'1/16/1990','1 Oak Trail',24207,'Banjar Bengkelgede','Male','Kent','Y','Saura','523-69-2111','N/A','false','false','ksaurau@tamu.edu','9/11/2005','523-452-5960');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (32,'8/24/1991','16105 Cordelia Street',85365,'Siborong-borong','Male','Del','G','Kerford','690-33-0821','F1','false','true','dkerfordv@accuweather.com','10/27/2016','552-186-0633');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (33,'7/29/1949','52700 Londonderry Pass',33536,'Umeå','Male','Trevar','W','Barrowclough','155-62-2951','H1','false','true','tbarrowcloughw@timesonline.co.uk','6/12/2001','700-832-4163');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (34,'1/20/1948','5 Ronald Regan Street',72381,'Ágios Geórgios','Female','Nelle','J','Burgwyn','743-79-2033','H1','false','true','nburgwynx@addtoany.com','2/6/2017','984-851-8481');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (35,'3/29/1998','11 Crest Line Terrace',34482,'Souillac','Male','Wendall','E','Chellam','784-31-0008','N/A','true','false','wchellamy@adobe.com','4/20/2018','245-348-5674');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (36,'8/13/1948','10 Riverside Junction',82219,'Trajouce','Female','Madelina','Q','Halversen','635-17-1987','H1','true','false','mhalversenz@cisco.com','12/22/2009','497-997-7881');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (37,'3/22/1994','4366 Ridgeway Plaza',82997,'Zhongzhai','Female','Paolina','V','Dolligon','671-95-3853','N/A','false','false','pdolligon10@blinklist.com','10/19/2013','379-477-2579');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (38,'10/4/1968','90 Holy Cross Road',74895,'Tubel','Female','Kial','Q','Mawd','760-51-6807','H1','true','false','kmawd11@shop-pro.jp','10/3/2010','650-596-9052');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (39,'5/29/1950','551 Everett Road',59956,'Dashi','Male','Wade','V','Hammersley','246-90-5882','F1','true','false','whammersley12@ow.ly','5/22/2004','292-408-4691');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (40,'11/5/1953','69 Schurz Way',88248,'Neochórion','Male','Morgun','X','Beagen','432-09-5143','H1','false','true','mbeagen13@google.com.au','8/4/2000','717-390-8738');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (41,'10/17/1940','751 Roxbury Way',54238,'Stockholm','Male','Sandor','K','Style','187-76-9758','H1','true','true','sstyle14@360.cn','5/12/2013','416-892-9385');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (42,'2/16/1942','03588 Dunning Alley',66398,'Vatutine','Female','Dallas','F','Belitz','372-81-5436','H1','false','false','dbelitz15@hud.gov','9/30/2018','392-757-8783');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (43,'7/12/1983','211 Shasta Parkway',46140,'Al Ibrāhīmīyah','Female','Trenna','K','Stiell','303-23-1013','F1','true','true','tstiell16@angelfire.com','12/26/2019','908-942-8209');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (44,'2/7/1982','56854 Basil Lane',78393,'Koźle','Female','Carlynne','H','Howey','662-38-7866','F1','true','true','chowey17@imdb.com','3/7/2000','263-193-8530');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (45,'2/10/1986','12 Brickson Park Plaza',49271,'Kozhva','Male','Budd','A','Anthoine','455-24-1360','F1','false','false','banthoine18@woothemes.com','2/28/2000','301-320-1082');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (46,'11/9/1990','85164 Eggendart Junction',69942,'Mūdīyah','Female','Sherline','Y','Tutchell','899-01-8016','N/A','true','true','stutchell19@icio.us','2/14/2010','161-671-8459');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (47,'2/25/1942','6203 Tennyson Trail',26441,'Paninggaran','Female','Wilmette','P','Lutsch','617-23-6624','H1','true','false','wlutsch1a@addthis.com','3/2/2008','659-526-0909');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (48,'10/21/1999','5733 Sunbrook Road',43967,'Gugark’','Female','Nona','R','Fosdyke','798-62-4554','H1','false','true','nfosdyke1b@imdb.com','3/22/2006','685-287-0176');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (49,'4/24/1962','42872 Dawn Plaza',61809,'Bhāndāria','Female','Claudie','F','Vauter','307-18-7947','F1','false','false','cvauter1c@elpais.com','3/21/2013','345-192-7162');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (50,'12/8/1965','37 Dapin Plaza',28835,'Hejiang','Female','Miran','P','Rosbotham','418-50-8973','F1','false','true','mrosbotham1d@1688.com','11/24/2019','900-206-9251');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (51,'10/6/1950','4297 Bultman Pass',57380,'Shaoyang','Male','Randolph','H','Meak','126-60-5573','N/A','true','true','rmeak1e@zdnet.com','7/23/2002','879-141-1453');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (52,'11/26/1995','2 2nd Junction',81944,'Carvoeira','Female','Sophey','W','Gehrels','406-35-5611','N/A','true','true','sgehrels1f@ed.gov','3/19/2018','176-730-6029');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (53,'2/21/1972','059 Porter Junction',53112,'Rueil-Malmaison','Male','Harlin','X','Planque','860-18-0824','F1','true','false','hplanque1g@soundcloud.com','12/27/2005','184-930-2027');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (54,'7/8/1976','576 Old Shore Pass',78879,'Campo Largo','Male','Fredric','V','Axelbey','222-60-2092','H1','false','true','faxelbey1h@cornell.edu','8/21/2016','781-158-5716');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (55,'7/29/1945','822 Ronald Regan Center',84285,'Soubré','Genderfluid','Oby','Y','Bruneau','116-22-4269','F1','true','false','obruneau1i@ycombinator.com','3/18/2005','195-922-5151');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (56,'5/24/1983','77679 Tony Plaza',84274,'Tomsk','Male','Wash','H','Geall','548-74-8812','F1','true','false','wgeall1j@fastcompany.com','1/21/2017','226-510-0653');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (57,'1/2/1997','6 Dexter Court',54444,'Tuohua','Genderfluid','Jessa','S','Cricket','237-57-1968','F1','true','false','jcricket1k@dyndns.org','4/2/2016','938-533-5495');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (58,'12/7/1981','876 Milwaukee Court',85255,'Arevshat','Female','Aile','U','Acres','899-91-5752','N/A','false','true','aacres1l@europa.eu','1/1/2015','215-689-6096');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (59,'11/1/1940','80 Chive Trail',53424,'Gävle','Female','Fiann','C','Rosel','366-27-8497','N/A','false','false','frosel1m@weibo.com','7/31/2000','466-265-2134');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (60,'10/17/1957','9537 Mccormick Trail',30409,'Sanhui','Female','Silvie','Q','Gooderridge','279-51-4024','F1','true','true','sgooderridge1n@hatena.ne.jp','11/7/2008','368-101-4813');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (61,'12/23/1989','42 Randy Plaza',67148,'Czerniewice','Male','Dominique','B','Giacobazzi','866-80-5836','H1','true','false','dgiacobazzi1o@cam.ac.uk','1/20/2005','604-672-3127');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (62,'3/22/1962','6 Dexter Pass',71350,'Zhaojia','Female','Paola','N','Skeggs','400-30-8614','F1','true','true','pskeggs1p@sciencedirect.com','11/12/2008','436-584-3632');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (63,'11/24/1988','78262 Dawn Park',12049,'Jijiazhuang','Female','Anabal','P','Priddle','299-35-4167','F1','true','false','apriddle1q@shinystat.com','2/15/2013','158-235-5083');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (64,'2/8/1942','2 Debra Drive',25111,'Hedi','Female','Karna','W','Baumber','883-66-7356','N/A','false','true','kbaumber1r@macromedia.com','4/20/2008','720-513-6747');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (65,'7/10/1963','19 Holy Cross Drive',37206,'Město Libavá','Female','Stacie','D','Cubuzzi','411-87-2774','H1','false','false','scubuzzi1s@51.la','4/9/2006','526-628-4293');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (66,'8/31/1970','99224 Burning Wood Court',12486,'Kairouan','Polygender','Basil','R','Stollman','260-61-0323','H1','false','true','bstollman1t@elpais.com','2/11/2019','949-322-6998');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (67,'3/11/1999','27204 Gateway Court',47233,'Bakovci','Male','Rodney','P','Nason','412-08-9882','N/A','false','false','rnason1u@technorati.com','9/3/2005','352-839-0382');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (68,'7/5/1983','1490 Corben Parkway',69543,'Kabar Utara','Female','Leontine','Y','Ortiga','461-66-1014','H1','true','true','lortiga1v@upenn.edu','10/3/2014','945-361-5346');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (69,'7/5/1969','65 Haas Hill',34103,'Belmopan','Female','Leeanne','O','Thumnel','775-46-6846','N/A','false','false','lthumnel1w@hatena.ne.jp','8/28/2009','829-745-8075');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (70,'10/15/1998','900 Reindahl Way',34541,'Syzran’','Female','Bobette','W','Scardifeild','798-15-4754','H1','true','false','bscardifeild1x@cafepress.com','11/18/2006','993-841-2465');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (71,'12/7/1951','085 Fairfield Hill',89118,'Mae Sot','Female','Dinah','C','Jeens','157-95-4308','F1','false','false','djeens1y@sciencedaily.com','1/15/2017','523-972-5953');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (72,'3/19/1962','1838 Dahle Place',63263,'Gazanjyk','Female','Dell','F','Whyler','177-99-2549','F1','false','false','dwhyler1z@jigsy.com','2/8/2005','740-295-0208');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (73,'8/2/1966','7171 Waubesa Drive',12370,'Dashiju','Male','Raffaello','W','Coghill','663-61-7076','N/A','true','true','rcoghill20@odnoklassniki.ru','8/31/2008','748-142-3980');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (74,'9/16/1969','27896 Mcbride Avenue',13681,'Smarhon’','Female','Arlene','R','Moorrud','100-86-2996','N/A','true','false','amoorrud21@google.it','1/10/2021','136-476-8462');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (75,'3/18/1958','07689 Stang Drive',89328,'Buíque','Male','Alvin','S','Joris','125-92-8846','F1','true','true','ajoris22@over-blog.com','7/31/2015','299-657-5520');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (76,'1/13/1979','580 Schmedeman Hill',69214,'Fushui','Female','Quinn','E','Krysztowczyk','768-62-6540','N/A','false','true','qkrysztowczyk23@ow.ly','12/18/2004','722-456-4833');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (77,'4/7/1960','779 Almo Court',42582,'Drezdenko','Female','Suzi','A','Tomei','422-27-3074','H1','true','true','stomei24@usnews.com','6/4/2013','779-861-2470');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (78,'9/5/1998','1348 Crescent Oaks Crossing',17755,'Kuznetsovs’k','Female','Inessa','J','Volant','730-82-3697','N/A','true','false','ivolant25@twitpic.com','8/22/2014','761-446-8600');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (79,'2/15/1951','695 Sutherland Road',69355,'Ryōtsu-minato','Female','Dolores','A','Kuhnt','764-05-1277','N/A','false','true','dkuhnt26@newyorker.com','1/30/2022','467-275-7780');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (80,'6/3/1949','63731 Donald Center',32574,'Niška Banja','Male','Randal','L','Blevin','448-44-1100','N/A','true','false','rblevin27@guardian.co.uk','12/12/2002','845-617-2456');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (81,'7/4/1965','5734 Hanson Lane',19695,'Oued Zem','Female','Pearla','J','Syson','514-30-2127','N/A','true','false','psyson28@tripod.com','6/4/2006','331-936-7867');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (82,'5/13/1977','344 Autumn Leaf Road',70414,'Guimbal','Female','Ingunna','X','Guerrazzi','147-62-6037','H1','true','true','iguerrazzi29@tamu.edu','8/21/2016','371-176-6300');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (83,'7/6/1957','35 Farmco Pass',42866,'Abucayan','Female','Perle','T','Lorente','827-10-8566','H1','true','true','plorente2a@dot.gov','11/7/2009','166-221-4827');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (84,'4/2/1940','43016 Donald Pass',44630,'Wageningen','Female','Frank','N','Earley','867-25-6125','N/A','true','true','fearley2b@bandcamp.com','10/9/2008','299-612-5465');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (85,'6/20/1985','112 Declaration Circle',63248,'Lasusua','Male','Abran','I','Carlson','344-29-7075','F1','true','false','acarlson2c@diigo.com','8/8/2020','492-466-2079');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (86,'8/1/1990','224 Shoshone Crossing',29388,'Kashin','Male','Ignatius','O','Brugh','580-42-3818','H1','false','false','ibrugh2d@economist.com','5/27/2019','508-524-6537');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (87,'8/5/1960','5781 Waywood Drive',67522,'Ōtawara','Bigender','Mortie','K','Trubshawe','549-51-1828','F1','false','false','mtrubshawe2e@domainmarket.com','10/13/2012','548-711-1390');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (88,'5/14/1999','8373 Forster Pass',44645,'Timba Lauk','Male','Frederigo','E','Goathrop','879-53-3202','F1','false','false','fgoathrop2f@opera.com','6/25/2008','910-628-4759');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (89,'5/29/1950','40 Stoughton Circle',74017,'Tongda','Male','Ulises','C','Noor','174-74-3997','H1','true','true','unoor2g@furl.net','1/26/2003','966-722-9262');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (90,'3/23/1971','55 Pleasure Street',51918,'Chumphon','Male','Vincent','L','Iianon','142-55-7251','H1','false','true','viianon2h@cpanel.net','3/15/2014','691-773-7109');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (91,'10/7/1967','5312 Declaration Center',86930,'Timaru','Male','Theo','Q','Aust','436-59-6458','N/A','true','true','taust2i@newsvine.com','3/23/2018','353-261-3736');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (92,'12/9/1945','1 Bluestem Drive',64349,'Montpellier','Male','Basil','U','Semour','370-47-8249','N/A','false','false','bsemour2j@youtube.com','8/30/2020','339-816-1251');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (93,'8/30/1983','6 Bluejay Parkway',59555,'Guaxupé','Male','Rriocard','U','Morrowe','535-37-4946','N/A','true','false','rmorrowe2k@linkedin.com','10/8/2009','398-956-8273');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (94,'2/23/1948','3939 Namekagon Junction',21473,'Libu','Female','Sophie','W','Pierton','213-02-9885','N/A','false','true','spierton2l@gnu.org','6/15/2014','994-773-0270');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (95,'11/5/1946','9 Stoughton Parkway',36685,'Libato','Female','Carly','D','D''Almeida','824-14-2176','N/A','true','true','cdalmeida2m@devhub.com','5/2/2020','750-130-7657');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (96,'5/6/1961','0 Meadow Vale Avenue',50558,'Popovice','Female','Belvia','L','Stanier','794-89-2290','H1','false','false','bstanier2n@t.co','5/17/2007','215-401-1833');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (97,'7/21/1990','5545 Blue Bill Park Place',63341,'Manhan','Female','Cthrine','G','Itscowics','844-26-3337','F1','true','false','citscowics2o@dell.com','8/28/2006','730-815-2198');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (98,'2/17/2000','559 Monument Hill',79946,'Los Arcos','Female','Mollie','J','Seniour','627-11-0074','F1','true','false','mseniour2p@alibaba.com','5/3/2012','417-174-0799');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (99,'2/4/1947','56142 Macpherson Road',37339,'Tsapêraī','Male','Hersch','I','Blowes','372-04-7159','H1','true','true','hblowes2q@domainmarket.com','8/14/2002','686-140-9143');
INSERT INTO Employee_Info(employee_id,birthday,street,zip,city,gender,fname,minit,lname,ssn,visa,disability,vet_stat,email,startDate,phone) VALUES (100,'10/25/1947','0420 Lakewood Gardens Junction',27977,'Rokitno','Female','Catharina','W','Snook','829-17-7771','H1','true','false','csnook2r@zimbio.com','10/7/2022','141-812-6540');

INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (1,'Elliott','L','Pettie','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (2,'Eberto','K','Mewton','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (3,'Lamont','A','Bolding','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (4,'Dunstan','V','Roddell','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (5,'Jannelle','M','Gendrich','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (6,'Alwin','L','Curwen','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (7,'Randy','Z','Golding','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (8,'Marylinda','A','Stanfield','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (9,'Ximenes','M','Fishburn','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (10,'Any','R','Swiers','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (11,'Bridget','O','Golton','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (12,'Tod','G','Stickens','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (13,'Raven','O','Van Velden','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (14,'Bernard','Q','Sellers','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (15,'Loralyn','N','Lynam','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (16,'Dulcinea','O','Goullee','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (17,'Sandro','X','Richley','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (18,'Ardella','X','Poytheras','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (19,'Cammi','R','Atlee','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (20,'Bridgette','A','Ginnell','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (21,'Friederike','I','Renol','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (22,'Nisse','U','Maidlow','son','Agender');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (23,'Alexis','F','Rohlf','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (24,'Millisent','I','Othick','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (25,'Herve','G','Swainson','son','Non-binary');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (26,'Isa','O','Tellenbrook','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (27,'Manny','D','Otton','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (28,'Robby','O','Tighe','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (29,'Celina','Z','Jennemann','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (30,'Filmer','C','Mc Queen','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (31,'Cora','F','Jessett','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (32,'Zechariah','L','Howett','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (33,'Ulrich','W','Grundell','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (34,'Tore','O','Ziebart','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (35,'Josee','Z','Orneles','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (36,'Josy','F','Copello','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (37,'Anet','B','Newis','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (38,'Reece','D','Stangoe','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (39,'Winne','J','Cryer','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (40,'Dierdre','H','Filipczynski','son','Agender');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (41,'Adan','J','Gurry','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (42,'Barbie','Q','Dinzey','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (43,'Carr','B','Baldacchino','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (44,'Jude','X','Vayro','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (45,'Reginald','X','Farre','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (46,'Katinka','H','Askin','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (47,'Jedd','H','Uphill','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (48,'Cull','X','Malcher','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (49,'Anatole','I','Tovey','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (50,'Jeromy','S','Le Monnier','daughter','Genderqueer');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (51,'Janaya','H','Hinemoor','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (52,'Udell','T','Riditch','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (53,'Nye','I','Craik','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (54,'Abigael','V','Boichat','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (55,'Darbie','W','Osgorby','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (56,'Berti','R','Pixton','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (57,'Vi','M','Alforde','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (58,'Kristien','P','Preskett','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (59,'Winslow','P','Trevaskis','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (60,'Katlin','X','Caghy','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (61,'Nessa','V','Matuszkiewicz','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (62,'Emlen','G','Oaker','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (63,'Bondy','P','Jess','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (64,'Artus','L','Pinsent','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (65,'Ingrim','Q','Astill','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (66,'Jane','S','Kalewe','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (67,'Rubia','I','Dorie','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (68,'Jude','N','Coo','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (69,'Pammie','Q','Dionisio','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (70,'Alika','R','Greetham','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (71,'Lorianne','J','Harrald','other','Polygender');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (72,'Skye','Z','Diment','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (73,'Perceval','S','Franzelini','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (74,'Timi','C','Seaking','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (75,'Sharia','C','Willoughway','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (76,'Eddie','Q','Reolfi','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (77,'Gerry','A','Trent','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (78,'Augustine','S','Audsley','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (79,'Damara','E','Hails','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (80,'Darsey','T','Whistance','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (81,'Mariska','B','Robotham','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (82,'Augusto','L','Casseldine','daughter','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (83,'Ynes','W','Yushachkov','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (84,'Bunnie','D','Hinge','son','Polygender');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (85,'Terrel','P','Abberley','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (86,'Porter','D','Stuart','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (87,'Gwenette','K','Ennever','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (88,'Auguste','I','Lickess','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (89,'Hebert','I','Rogans','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (90,'Kaylyn','H','Saylor','daughter','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (91,'Perrine','G','Pharo','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (92,'Carmela','K','Ibbitson','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (93,'Chance','G','Gill','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (94,'Ignacio','E','Abramcik','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (95,'Delinda','H','Harriot','other','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (96,'Tasia','I','Cotman','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (97,'Con','B','Saterweyte','son','Female');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (98,'Glen','E','Rydzynski','son','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (99,'Alphonse','W','Skade','other','Male');
INSERT INTO dependent(emp,fname,minit,lname,relation,gender) VALUES (100,'Aubert','I','Bloxam','daughter','Male');

INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (1,85315,39,4559,1,'biweekly',4963);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (2,146382,39,577,1,'weekly',4000);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (3,199385,81,3706,1,'monthly',3689);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (4,77163,50,3310,0,'weekly',2445);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (5,77091,84,2899,0,'weekly',2674);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (6,153291,66,4124,1,'biweekly',1534);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (7,15398,71,925,0,'weekly',2961);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (8,99711,22,806,1,'monthly',3743);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (9,37078,9,3133,0,'biweekly',3119);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (10,176936,4,2175,1,'monthly',1915);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (11,121933,85,1084,1,'biweekly',1136);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (12,54117,17,2175,0,'biweekly',1367);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (13,74949,99,2452,1,'weekly',1405);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (14,163666,25,3553,1,'biweekly',4228);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (15,124758,74,1537,1,'weekly',2074);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (16,7363,82,4883,0,'weekly',2904);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (17,131616,9,2930,0,'weekly',1997);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (18,195367,66,3277,0,'weekly',1887);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (19,62408,57,2893,1,'monthly',3522);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (20,59538,74,3751,1,'monthly',1054);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (21,130770,76,2856,0,'biweekly',1411);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (22,157791,91,1595,1,'weekly',3077);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (23,145528,99,310,0,'weekly',2194);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (24,104056,55,4112,1,'weekly',4267);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (25,143643,79,311,0,'biweekly',4005);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (26,63616,94,3573,1,'biweekly',3463);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (27,4817,50,3518,0,'monthly',1514);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (28,163959,19,4551,1,'weekly',3924);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (29,145328,42,4960,0,'monthly',2953);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (30,87851,78,2631,0,'weekly',2003);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (31,184713,97,1910,1,'biweekly',2318);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (32,79265,58,1588,0,'weekly',2453);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (33,176739,5,3672,1,'biweekly',1174);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (34,97685,69,2011,0,'weekly',3123);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (35,160053,81,923,1,'monthly',2264);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (36,187551,4,3436,0,'biweekly',2216);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (37,47623,39,3143,1,'monthly',1081);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (38,148114,33,4099,1,'weekly',2039);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (39,160670,79,3204,1,'monthly',3014);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (40,120016,46,3781,0,'biweekly',1700);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (41,155808,77,4971,0,'monthly',3819);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (42,110243,18,4025,1,'monthly',1070);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (43,95066,3,730,0,'biweekly',1531);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (44,195044,5,2075,0,'weekly',3464);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (45,12989,68,2115,1,'weekly',4911);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (46,102282,86,3108,1,'weekly',3629);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (47,6783,1,1991,0,'biweekly',4920);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (48,192954,93,2302,1,'weekly',2853);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (49,83878,60,1834,0,'weekly',3316);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (50,154558,61,962,1,'weekly',4967);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (51,97342,24,3451,0,'weekly',3945);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (52,146736,91,313,1,'weekly',1091);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (53,179037,55,2216,0,'weekly',1429);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (54,187904,19,4168,1,'weekly',4808);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (55,74963,81,3270,0,'monthly',4195);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (56,41961,4,4056,0,'biweekly',3095);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (57,4563,63,2127,0,'monthly',1871);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (58,102236,24,3589,1,'biweekly',4126);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (59,102659,75,1003,1,'biweekly',1823);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (60,189224,94,4928,0,'weekly',1195);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (61,46428,27,2811,1,'weekly',3789);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (62,197777,82,3841,0,'weekly',3611);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (63,72663,91,615,0,'biweekly',4304);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (64,35309,98,3772,0,'monthly',4200);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (65,170882,16,4610,1,'biweekly',2357);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (66,137678,96,3614,0,'weekly',3523);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (67,97843,45,4904,1,'weekly',3984);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (68,136551,61,2799,1,'monthly',3077);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (69,20960,27,2590,1,'weekly',1336);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (70,90734,6,4886,0,'monthly',4792);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (71,12140,83,911,0,'weekly',4605);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (72,139936,60,816,1,'biweekly',1832);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (73,11325,4,1892,1,'biweekly',2389);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (74,170991,48,373,1,'biweekly',2741);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (75,194227,75,3802,1,'monthly',2309);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (76,154742,62,3992,1,'weekly',4453);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (77,102590,87,2788,1,'biweekly',3757);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (78,88415,87,2227,1,'weekly',1668);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (79,191304,11,3075,1,'weekly',1920);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (80,85588,48,1237,0,'biweekly',3300);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (81,121627,45,169,0,'weekly',1933);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (82,37293,57,4181,0,'weekly',2416);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (83,84614,3,1087,1,'weekly',3685);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (84,138370,13,332,0,'weekly',4759);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (85,74668,2,4833,0,'biweekly',3029);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (86,102985,26,3900,1,'biweekly',1367);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (87,122120,36,330,0,'biweekly',3530);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (88,171116,12,2718,1,'biweekly',4531);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (89,48407,67,1533,0,'biweekly',2435);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (90,80107,98,539,1,'biweekly',1869);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (91,2517,14,2624,1,'monthly',2002);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (92,150336,17,4851,0,'monthly',1459);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (93,18495,34,3320,0,'biweekly',4671);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (94,51124,62,3065,1,'weekly',3968);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (95,175330,72,448,0,'monthly',4196);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (96,94076,40,1989,1,'monthly',4903);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (97,85081,33,3116,0,'weekly',3413);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (98,4698,59,3902,0,'monthly',2119);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (99,195800,77,1875,1,'weekly',1316);
INSERT INTO payroll(emp_id,amount,hourly,stock,salary,pay_interval,bonus) VALUES (100,17515,89,1738,0,'weekly',4760);

INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (1,'7:25 AM','7:33 PM','3/3/2023');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (2,'8:37 AM','4:29 PM','3/30/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (3,'7:06 AM','4:11 PM','4/21/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (4,'9:02 AM','5:21 PM','10/31/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (5,'9:08 AM','7:17 PM','1/20/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (6,'7:51 AM','7:34 PM','4/3/2023');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (7,'9:21 AM','7:23 PM','4/28/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (8,'7:11 AM','7:37 PM','1/22/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (9,'7:20 AM','5:24 PM','11/30/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (10,'8:15 AM','7:40 PM','12/17/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (11,'9:38 AM','5:35 PM','10/9/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (12,'7:36 AM','4:28 PM','4/9/2023');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (13,'9:58 AM','4:36 PM','3/2/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (14,'6:35 AM','5:09 PM','7/19/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (15,'7:44 AM','4:16 PM','7/10/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (16,'8:17 AM','7:42 PM','2/28/2023');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (17,'8:32 AM','7:31 PM','2/18/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (18,'8:47 AM','5:05 PM','10/5/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (19,'6:16 AM','7:01 PM','5/18/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (20,'8:51 AM','5:21 PM','9/20/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (21,'9:05 AM','4:35 PM','5/20/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (22,'6:55 AM','5:20 PM','10/19/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (23,'6:40 AM','5:01 PM','9/4/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (24,'7:13 AM','7:48 PM','12/30/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (25,'9:10 AM','7:04 PM','10/16/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (26,'6:13 AM','7:29 PM','12/7/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (27,'6:53 AM','4:26 PM','10/17/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (28,'9:04 AM','6:19 PM','2/15/2023');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (29,'6:30 AM','6:24 PM','2/6/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (30,'6:33 AM','4:29 PM','10/25/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (31,'7:33 AM','5:32 PM','12/25/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (32,'6:55 AM','7:48 PM','7/8/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (33,'8:36 AM','7:21 PM','3/1/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (34,'8:28 AM','7:22 PM','3/3/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (35,'8:22 AM','5:37 PM','12/18/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (36,'9:10 AM','6:53 PM','3/1/2023');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (37,'8:54 AM','6:05 PM','5/4/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (38,'6:48 AM','7:55 PM','10/7/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (39,'6:16 AM','6:03 PM','8/28/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (40,'6:14 AM','5:16 PM','11/12/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (41,'9:28 AM','7:14 PM','12/9/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (42,'9:24 AM','6:22 PM','10/3/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (43,'8:21 AM','5:30 PM','4/13/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (44,'9:56 AM','7:31 PM','8/9/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (45,'8:41 AM','6:40 PM','3/11/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (46,'7:01 AM','5:57 PM','12/24/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (47,'9:57 AM','5:45 PM','12/27/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (48,'8:17 AM','4:45 PM','3/26/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (49,'8:31 AM','4:36 PM','10/12/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (50,'7:09 AM','6:13 PM','10/24/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (51,'7:11 AM','6:18 PM','9/11/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (52,'8:01 AM','7:44 PM','10/3/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (53,'8:56 AM','6:50 PM','10/22/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (54,'9:06 AM','7:40 PM','9/25/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (55,'6:51 AM','6:35 PM','3/13/2023');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (56,'9:16 AM','5:26 PM','6/26/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (57,'6:39 AM','7:02 PM','11/6/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (58,'6:11 AM','6:44 PM','8/8/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (59,'9:41 AM','6:37 PM','3/2/2023');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (60,'9:02 AM','5:54 PM','4/17/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (61,'7:22 AM','5:31 PM','10/4/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (62,'8:51 AM','7:14 PM','2/25/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (63,'6:52 AM','5:18 PM','1/23/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (64,'9:06 AM','6:32 PM','3/14/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (65,'8:46 AM','4:19 PM','1/18/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (66,'6:06 AM','6:26 PM','12/3/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (67,'7:27 AM','5:31 PM','11/8/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (68,'9:35 AM','6:09 PM','5/28/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (69,'8:17 AM','7:49 PM','11/11/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (70,'6:00 AM','5:41 PM','8/27/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (71,'6:55 AM','4:47 PM','12/18/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (72,'6:47 AM','5:33 PM','1/5/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (73,'9:06 AM','6:06 PM','5/6/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (74,'8:57 AM','5:07 PM','12/20/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (75,'8:12 AM','4:08 PM','2/25/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (76,'9:13 AM','5:25 PM','8/7/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (77,'8:49 AM','7:03 PM','8/24/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (78,'8:33 AM','5:32 PM','1/22/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (79,'6:16 AM','5:02 PM','2/22/2023');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (80,'7:05 AM','7:13 PM','4/3/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (81,'7:45 AM','7:51 PM','11/28/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (82,'8:31 AM','4:43 PM','7/12/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (83,'8:13 AM','7:03 PM','4/4/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (84,'7:24 AM','6:37 PM','5/13/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (85,'9:01 AM','5:15 PM','11/6/2021');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (86,'6:18 AM','4:55 PM','4/7/2023');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (87,'9:10 AM','6:19 PM','4/23/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (88,'9:24 AM','5:54 PM','9/29/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (89,'7:18 AM','6:10 PM','4/29/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (90,'6:22 AM','6:13 PM','4/20/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (91,'7:15 AM','6:50 PM','4/1/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (92,'6:13 AM','5:06 PM','4/19/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (93,'8:50 AM','6:13 PM','11/12/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (94,'8:29 AM','5:22 PM','6/30/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (95,'9:42 AM','5:18 PM','12/25/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (96,'6:35 AM','5:05 PM','4/1/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (97,'9:43 AM','4:34 PM','4/15/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (98,'8:54 AM','4:03 PM','11/13/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (99,'6:05 AM','4:24 PM','12/1/2022');
INSERT INTO timesheet(emp_id,clock_in,clock_out,date_worked) VALUES (100,'9:52 AM','6:05 PM','3/8/2023');

INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('charger','12/15/2022',1);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','1/27/2023',2);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','12/14/2022',3);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','8/18/2022',4);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('tape','12/22/2022',5);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','1/31/2023',6);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','4/5/2023',7);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('tape','11/10/2022',8);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','8/22/2022',9);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','1/10/2023',10);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','3/16/2023',11);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','10/19/2022',12);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','2/6/2023',13);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','3/14/2023',14);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('charger','1/8/2023',15);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','12/24/2022',16);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','6/7/2022',17);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('chair','6/23/2022',18);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','5/18/2022',19);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','6/22/2022',20);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('tape','4/24/2022',21);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','2/13/2023',22);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','4/24/2022',23);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('charger','1/29/2023',24);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','3/28/2023',25);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','6/8/2022',26);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','10/21/2022',27);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','8/3/2022',28);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('chair','5/20/2022',29);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('chair','8/9/2022',30);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','6/16/2022',31);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','1/21/2023',32);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','2/19/2023',33);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','4/28/2022',34);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','10/12/2022',35);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','5/31/2022',36);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('tape','1/28/2023',37);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','1/14/2023',38);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','1/8/2023',39);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','12/12/2022',40);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','7/6/2022',41);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','6/13/2022',42);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','7/12/2022',43);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','7/28/2022',44);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','7/23/2022',45);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','9/7/2022',46);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','7/7/2022',47);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','9/1/2022',48);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','4/27/2022',49);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','2/12/2023',50);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','4/19/2022',51);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','1/16/2023',52);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('tape','3/22/2023',53);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','9/11/2022',54);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','4/22/2022',55);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','11/10/2022',56);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('tape','12/2/2022',57);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('tape','4/26/2022',58);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','7/2/2022',59);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','4/26/2022',60);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','6/25/2022',61);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','10/11/2022',62);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('chair','4/27/2022',63);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','7/8/2022',64);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','11/28/2022',65);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('charger','11/2/2022',66);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('chair','1/29/2023',67);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('charger','4/7/2023',68);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('chair','7/17/2022',69);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('chair','4/19/2022',70);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','10/4/2022',71);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','7/29/2022',72);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('chair','3/6/2023',73);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('charger','8/28/2022',74);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','3/14/2023',75);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('tape','10/29/2022',76);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','10/11/2022',77);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('chair','5/28/2022',78);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('charger','9/30/2022',79);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','10/8/2022',80);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','6/26/2022',81);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','3/21/2023',82);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('tape','4/18/2022',83);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('chair','5/4/2022',84);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('charger','11/4/2022',85);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','2/24/2023',86);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('tape','11/2/2022',87);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('chair','10/11/2022',88);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('charger','9/14/2022',89);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('charger','10/7/2022',90);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','6/6/2022',91);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('laptop','5/11/2022',92);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('monitor','4/13/2022',93);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('charger','3/25/2023',94);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('desk','12/25/2022',95);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','2/7/2023',96);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','10/7/2022',97);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('charger','1/21/2023',98);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('chair','5/28/2022',99);
INSERT INTO officeResources(resource_name,issue_date,dep_num) VALUES ('stapler','4/19/2022',100);

INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (1,'lgiraldez0@trellian.com',4908724742,1,1);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (2,'fsalterne1@scientificamerican.com',5123284027,2,2);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (3,'ssumers2@goo.gl',3831409641,3,3);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (4,'ebeneze3@harvard.edu',6984484701,4,4);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (5,'mpaaso4@acquirethisname.com',9639159332,5,5);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (6,'cmunkley5@statcounter.com',5632259347,6,6);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (7,'wterris6@washington.edu',6832334514,7,7);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (8,'braynham7@rambler.ru',5483098316,8,8);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (9,'lganders8@lycos.com',4127813232,9,9);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (10,'zlehrian9@sohu.com',8477502142,10,10);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (11,'aparmentera@tinypic.com',6614792332,11,11);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (12,'dbidewellb@redcross.org',7075671390,12,12);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (13,'pzorenc@zdnet.com',5835194408,13,13);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (14,'epaueld@simplemachines.org',3809643884,14,14);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (15,'ctedorenkoe@imgur.com',3925902861,15,15);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (16,'gbellf@canalblog.com',1221707861,16,16);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (17,'jstenhouseg@ask.com',2816196343,17,17);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (18,'ccroucherh@zimbio.com',4324956973,18,18);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (19,'egortoni@yahoo.com',8569292550,19,19);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (20,'rbertomieuj@mail.ru',2254921861,20,20);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (21,'ameechk@wisc.edu',3579963574,21,21);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (22,'ajedrzejewiczl@bizjournals.com',8985038987,22,22);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (23,'omccolmm@homestead.com',6473099044,23,23);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (24,'eedmedn@wikispaces.com',4942979852,24,24);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (25,'wheymanno@java.com',1538489344,25,25);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (26,'mphilpottp@barnesandnoble.com',3396381819,26,26);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (27,'rzuppaq@java.com',3273321750,27,27);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (28,'bdelazenner@economist.com',7524526859,28,28);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (29,'jvogls@printfriendly.com',2586484163,29,29);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (30,'aomulderrigt@netlog.com',2803804940,30,30);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (31,'tlingfootu@nps.gov',4285214542,31,31);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (32,'vfeldonv@soundcloud.com',6095827116,32,32);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (33,'amilmithw@slashdot.org',1105580675,33,33);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (34,'eavrasinx@unicef.org',4617406169,34,34);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (35,'mloreky@wikia.com',6259248952,35,35);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (36,'dmaccaddiez@php.net',4847497675,36,36);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (37,'cgaish10@github.com',3693219832,37,37);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (38,'aledram11@youtu.be',4467276389,38,38);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (39,'glayburn12@addthis.com',3105401710,39,39);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (40,'lsendley13@addthis.com',3343167283,40,40);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (41,'botowey14@bloomberg.com',7499526648,41,41);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (42,'cdyne15@unicef.org',7445158335,42,42);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (43,'mcorroyer16@hibu.com',8346879916,43,43);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (44,'djurca17@weibo.com',6358151098,44,44);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (45,'toborne18@amazon.com',9313192256,45,45);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (46,'sosorio19@linkedin.com',6724419484,46,46);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (47,'gmuino1a@cmu.edu',4826335541,47,47);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (48,'cnucci1b@sun.com',7275256022,48,48);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (49,'bslessor1c@tamu.edu',3294644226,49,49);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (50,'cblennerhassett1d@technorati.com',9774273519,50,50);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (51,'sjumel1e@smugmug.com',2271076359,51,51);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (52,'vmatushevitz1f@vimeo.com',8696927922,52,52);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (53,'vguiso1g@mapquest.com',2734611589,53,53);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (54,'blunnon1h@jiathis.com',2241375894,54,54);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (55,'mnealey1i@ted.com',5817139352,55,55);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (56,'bvirr1j@oracle.com',4877304492,56,56);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (57,'rhasling1k@acquirethisname.com',4219068249,57,57);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (58,'mspringle1l@tinyurl.com',8956226959,58,58);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (59,'srandlesome1m@quantcast.com',5965326755,59,59);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (60,'abyway1n@furl.net',1591724490,60,60);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (61,'ksalsberg1o@t.co',5738714377,61,61);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (62,'kvignal1p@hud.gov',8739926792,62,62);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (63,'yhurdis1q@com.com',1388137195,63,63);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (64,'ssnoxell1r@adobe.com',9725958831,64,64);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (65,'sledekker1s@so-net.ne.jp',5162694081,65,65);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (66,'mholde1t@nature.com',1696627563,66,66);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (67,'gbortol1u@nyu.edu',6131195126,67,67);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (68,'pidle1v@cbslocal.com',5499592410,68,68);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (69,'wcregeen1w@rambler.ru',9251538556,69,69);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (70,'fbratten1x@irs.gov',1467061274,70,70);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (71,'ascneider1y@google.com',5024792838,71,71);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (72,'lcouroy1z@wisc.edu',2743090008,72,72);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (73,'tskillett20@amazon.co.jp',5425799349,73,73);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (74,'jdeighan21@theglobeandmail.com',2669001523,74,74);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (75,'ofernando22@mozilla.org',2024693473,75,75);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (76,'igilley23@wikipedia.org',3355833295,76,76);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (77,'fbarroux24@free.fr',1834246792,77,77);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (78,'gpfiffer25@blogtalkradio.com',6376504855,78,78);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (79,'lharberer26@wix.com',5942440374,79,79);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (80,'crego27@pcworld.com',3137769195,80,80);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (81,'pvigors28@bigcartel.com',6136348629,81,81);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (82,'ssexstone29@sogou.com',2543573129,82,82);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (83,'ephilippault2a@behance.net',6356058463,83,83);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (84,'athornthwaite2b@edublogs.org',5573768787,84,84);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (85,'ldillistone2c@netlog.com',8864741660,85,85);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (86,'hgirkin2d@paypal.com',4302995880,86,86);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (87,'tbowmer2e@hud.gov',7842935965,87,87);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (88,'lkirkbright2f@sogou.com',4303003442,88,88);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (89,'growen2g@bbb.org',4489407946,89,89);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (90,'ibottleson2h@cbsnews.com',9338241204,90,90);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (91,'dwillbourne2i@sciencedaily.com',9061884838,91,91);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (92,'asandercroft2j@answers.com',7027385810,92,92);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (93,'fdomenc2k@diigo.com',3147817096,93,93);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (94,'hbromfield2l@ow.ly',4892110672,94,94);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (95,'jdombrell2m@sbwire.com',6201262166,95,95);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (96,'ssaull2n@theguardian.com',9416589174,96,96);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (97,'ltitchener2o@yelp.com',1652803611,97,97);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (98,'kwickham2p@ning.com',9951487664,98,98);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (99,'ddemonge2q@netlog.com',1788933041,99,99);
INSERT INTO users,email,phone_num,employee_id,project_id) VALUES (100,'eparell2r@irs.gov',9353230679,100,100);

INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Byrann','P','Anglim','banglim0','Project Creator','e-recht24.de',1);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Marlie','S','Oager','moager1','Designer','accuweather.com',2);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Maitilde','Z','Troctor','mtroctor2','Designer','51.la',3);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Domingo','V','Dericot','ddericot3','Developer','nhs.uk',4);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Jody','U','Bengle','jbengle4','Designer','sitemeter.com',5);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Lilian','M','Eyden','leyden5','Designer','wiley.com',6);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Laurens','Y','Village','lvillage6','Designer','moonfruit.com',7);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Norrie','Y','Tropman','ntropman7','Developer','answers.com',8);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Devon','F','Neal','dneal8','Project Creator','wikispaces.com',9);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Adore','T','Walasik','awalasik9','Project Creator','nasa.gov',10);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Nikita','B','Tremblot','ntremblota','Designer','biglobe.ne.jp',11);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Helen','R','Gainor','hgainorb','Developer','dyndns.org',12);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Rudyard','C','Yewen','ryewenc','Developer','state.tx.us',13);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Mateo','G','Kupisz','mkupiszd','Designer','soundcloud.com',14);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Renato','D','Hebbron','rhebbrone','Designer','kickstarter.com',15);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Morris','N','Collinwood','mcollinwoodf','Project Creator','ca.gov',16);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Gregoire','K','Mager','gmagerg','Project Creator','google.ca',17);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Lewes','Y','Parzizek','lparzizekh','Developer','pagesperso-orange.fr',18);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Alf','I','Pill','apilli','Project Creator','senate.gov',19);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Shem','F','Jenicek','sjenicekj','Designer','cocolog-nifty.com',20);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Bartholomeus','I','Bentke','bbentkek','Project Creator','weather.com',21);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('El','D','MacEveley','emaceveleyl','Designer','amazonaws.com',22);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Roanne','T','Sired','rsiredm','Project Creator','forbes.com',23);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Kathrine','J','Janousek','kjanousekn','Designer','time.com',24);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Torr','E','Bachmann','tbachmanno','Project Creator','yandex.ru',25);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Sheppard','C','Pacher','spacherp','Designer','edublogs.org',26);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Raynard','S','Currin','rcurrinq','Designer','youtu.be',27);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Melissa','F','Jacobs','mjacobsr','Designer','gmpg.org',28);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Dot','T','Patrickson','dpatricksons','Project Creator','twitpic.com',29);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Leone','D','Wayvill','lwayvillt','Designer','zimbio.com',30);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Deeanne','P','Bagworth','dbagworthu','Developer','slashdot.org',31);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Berton','Z','Scraggs','bscraggsv','Designer','sciencedirect.com',32);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Sande','C','Eykelhof','seykelhofw','Designer','fotki.com',33);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Ingar','S','Robeson','irobesonx','Designer','ucla.edu',34);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Domingo','B','O''Nolan','donolany','Developer','japanpost.jp',35);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Theobald','V','Merrgan','tmerrganz','Project Creator','ted.com',36);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Gaile','E','Oda','goda10','Developer','cnbc.com',37);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Mikaela','R','Rosewell','mrosewell11','Designer','auda.org.au',38);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Tedman','G','Wooles','twooles12','Developer','whitehouse.gov',39);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Giselbert','J','Pittendreigh','gpittendreigh13','Developer','time.com',40);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Jeanelle','T','Yurenev','jyurenev14','Developer','independent.co.uk',41);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Corrinne','G','Manson','cmanson15','Designer','1688.com',42);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Vergil','M','Joriot','vjoriot16','Project Creator','telegraph.co.uk',43);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Monique','G','Welbrock','mwelbrock17','Developer','w3.org',44);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Cinnamon','B','Godehard.sf','cgodehardsf18','Designer','canalblog.com',45);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Dag','Q','Elia','delia19','Developer','wp.com',46);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Jasun','Z','Jeens','jjeens1a','Designer','abc.net.au',47);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Mirelle','L','Drakers','mdrakers1b','Project Creator','latimes.com',48);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Rickert','F','Barus','rbarus1c','Project Creator','printfriendly.com',49);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Livy','F','Radmer','lradmer1d','Designer','51.la',50);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Joannes','X','Tort','jtort1e','Project Creator','geocities.jp',51);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Ivy','V','Penritt','ipenritt1f','Project Creator','xinhuanet.com',52);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Allister','A','Nuschke','anuschke1g','Designer','4shared.com',53);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Culver','F','Skitterel','cskitterel1h','Designer','shinystat.com',54);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Hermy','S','Gorke','hgorke1i','Designer','hp.com',55);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Sileas','K','Buckston','sbuckston1j','Designer','weebly.com',56);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Say','D','Possek','spossek1k','Designer','blogs.com',57);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Francklin','P','Atwel','fatwel1l','Designer','ehow.com',58);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Benoit','M','Bramsom','bbramsom1m','Designer','altervista.org',59);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Sylvan','F','Lishmund','slishmund1n','Designer','tumblr.com',60);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Quinta','C','Lohde','qlohde1o','Designer','zimbio.com',61);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Nana','D','Brattan','nbrattan1p','Project Creator','lycos.com',62);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Morse','O','Cruz','mcruz1q','Developer','squarespace.com',63);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Noemi','H','Dacke','ndacke1r','Project Creator','360.cn',64);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Amalie','Q','Cockling','acockling1s','Designer','nifty.com',65);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Cob','T','Gyppes','cgyppes1t','Developer','tripadvisor.com',66);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Clement','U','Gallahar','cgallahar1u','Designer','soup.io',67);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Tad','E','Milburne','tmilburne1v','Designer','geocities.com',68);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Cole','O','Lees','clees1w','Developer','yelp.com',69);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Gordon','N','Stevani','gstevani1x','Project Creator','bluehost.com',70);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Tony','O','Simmen','tsimmen1y','Project Creator','bravesites.com',71);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Dotty','H','Gallie','dgallie1z','Developer','angelfire.com',72);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Flory','Z','Kohnemann','fkohnemann20','Project Creator','google.com.hk',73);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Dasi','M','Tustin','dtustin21','Project Creator','dagondesign.com',74);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Charlie','R','Headington','cheadington22','Developer','bloglines.com',75);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Raf','D','Taylour','rtaylour23','Developer','si.edu',76);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Meredeth','M','Thrussell','mthrussell24','Project Creator','1und1.de',77);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Elfrida','O','Walbrook','ewalbrook25','Project Creator','behance.net',78);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Fanny','W','Hansemann','fhansemann26','Designer','dell.com',79);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Wenona','N','Messenbird','wmessenbird27','Designer','lulu.com',80);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Cammi','T','Buckney','cbuckney28','Project Creator','surveymonkey.com',81);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Fredericka','Z','Luckcock','fluckcock29','Project Creator','freewebs.com',82);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Sanford','C','Pecht','specht2a','Project Creator','google.com.br',83);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Sonnnie','K','Burlingham','sburlingham2b','Project Creator','msn.com',84);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Buddy','L','Spensley','bspensley2c','Project Creator','rediff.com',85);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Welbie','K','McIlwaine','wmcilwaine2d','Developer','mit.edu',86);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Dani','Z','Clutheram','dclutheram2e','Developer','g.co',87);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Adelice','X','Kopje','akopje2f','Developer','salon.com',88);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Reta','M','Dobinson','rdobinson2g','Developer','myspace.com',89);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Kaitlynn','I','McWilliams','kmcwilliams2h','Project Creator','list-manage.com',90);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Kalindi','S','Whightman','kwhightman2i','Project Creator','nhs.uk',91);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Tamar','K','Wickenden','twickenden2j','Developer','360.cn',92);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Denni','C','Fagg','dfagg2k','Developer','bing.com',93);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Elvin','C','Neve','eneve2l','Developer','baidu.com',94);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Annabella','A','Rubertis','arubertis2m','Project Creator','w3.org',95);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Jephthah','O','Bernardelli','jbernardelli2n','Project Creator','diigo.com',96);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Delano','G','Jephcott','djephcott2o','Designer','vkontakte.ru',97);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Jerry','G','Llop','jllop2p','Developer','archive.org',98);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Brittni','R','Rawood','brawood2q','Designer','telegraph.co.uk',99);
INSERT INTO userprofile(fname,midinit,lname,username,userRole,portfolio) VALUES ('Ibby','D','Boeter','iboeter2r','Project Creator','discuz.net',100);

INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('netvibes.com','e-recht24.de','ameblo.jp','hostgator.com',1);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('fema.gov','umn.edu','ifeng.com','si.edu',2);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('oakley.com','cbsnews.com','discovery.com','indiegogo.com',3);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('hugedomains.com','pinterest.com','dyndns.org','tripadvisor.com',4);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('un.org','thetimes.co.uk','irs.gov','discovery.com',5);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('yahoo.co.jp','ucoz.ru','mayoclinic.com','economist.com',6);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('shinystat.com','dailymail.co.uk','liveinternet.ru','hexun.com',7);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('is.gd','smugmug.com','wix.com','tinyurl.com',8);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('eepurl.com','unc.edu','google.com.hk','globo.com',9);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('gmpg.org','xrea.com','51.la','sitemeter.com',10);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('illinois.edu','msn.com','godaddy.com','wikia.com',11);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('telegraph.co.uk','nature.com','omniture.com','hp.com',12);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('jiathis.com','technorati.com','nationalgeographic.com','dedecms.com',13);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('bloglines.com','tamu.edu','mlb.com','homestead.com',14);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('zdnet.com','princeton.edu','people.com.cn','msu.edu',15);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('pen.io','netlog.com','hubpages.com','acquirethisname.com',16);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('amazon.de','bravesites.com','cocolog-nifty.com','huffingtonpost.com',17);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('dmoz.org','com.com','theglobeandmail.com','spiegel.de',18);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('illinois.edu','hibu.com','ebay.co.uk','statcounter.com',19);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('prlog.org','hostgator.com','dion.ne.jp','booking.com',20);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('usgs.gov','timesonline.co.uk','si.edu','ed.gov',21);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('mail.ru','xrea.com','google.ca','theglobeandmail.com',22);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('slate.com','xrea.com','latimes.com','ucsd.edu',23);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('clickbank.net','discovery.com','biblegateway.com','comsenz.com',24);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('hc360.com','histats.com','weebly.com','shinystat.com',25);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('dot.gov','sciencedirect.com','china.com.cn','discovery.com',26);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('instagram.com','wp.com','fema.gov','java.com',27);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('purevolume.com','slate.com','spiegel.de','php.net',28);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('pen.io','yolasite.com','nyu.edu','imgur.com',29);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('sogou.com','posterous.com','dailymail.co.uk','google.pl',30);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('latimes.com','blog.com','ycombinator.com','parallels.com',31);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('ca.gov','xinhuanet.com','theglobeandmail.com','a8.net',32);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('ning.com','home.pl','amazon.com','tinypic.com',33);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('europa.eu','macromedia.com','edublogs.org','imdb.com',34);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('desdev.cn','go.com','wordpress.com','army.mil',35);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('webeden.co.uk','spiegel.de','baidu.com','slashdot.org',36);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('opensource.org','ovh.net','macromedia.com','virginia.edu',37);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('fastcompany.com','networksolutions.com','usgs.gov','hc360.com',38);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('uiuc.edu','telegraph.co.uk','nasa.gov','paypal.com',39);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('ihg.com','ca.gov','digg.com','imageshack.us',40);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('bbb.org','youku.com','wordpress.com','wp.com',41);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('cam.ac.uk','domainmarket.com','va.gov','etsy.com',42);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('constantcontact.com','businesswire.com','google.co.uk','pcworld.com',43);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('nationalgeographic.com','japanpost.jp','apache.org','europa.eu',44);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('google.ca','bloglines.com','jalbum.net','discuz.net',45);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('accuweather.com','arstechnica.com','buzzfeed.com','wired.com',46);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('boston.com','yahoo.co.jp','shutterfly.com','list-manage.com',47);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('xrea.com','livejournal.com','merriam-webster.com','reference.com',48);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('sbwire.com','state.tx.us','pagesperso-orange.fr','ftc.gov',49);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('sourceforge.net','sitemeter.com','mayoclinic.com','wired.com',50);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('studiopress.com','ed.gov','altervista.org','newsvine.com',51);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('fastcompany.com','etsy.com','ebay.com','1688.com',52);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('npr.org','toplist.cz','wufoo.com','edublogs.org',53);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('google.com','epa.gov','wikimedia.org','forbes.com',54);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('go.com','timesonline.co.uk','chronoengine.com','webnode.com',55);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('zimbio.com','hc360.com','omniture.com','xinhuanet.com',56);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('fema.gov','hao123.com','ucoz.com','smugmug.com',57);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('weebly.com','alibaba.com','ft.com','github.com',58);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('sourceforge.net','sciencedirect.com','examiner.com','about.me',59);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('sphinn.com','japanpost.jp','wikia.com','oracle.com',60);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('pen.io','buzzfeed.com','flavors.me','purevolume.com',61);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('adobe.com','tinypic.com','cnn.com','ed.gov',62);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('mlb.com','163.com','ox.ac.uk','1und1.de',63);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('wikimedia.org','sciencedirect.com','blogtalkradio.com','sciencedirect.com',64);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('deviantart.com','prnewswire.com','bizjournals.com','reference.com',65);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('bloglovin.com','simplemachines.org','ifeng.com','furl.net',66);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('eventbrite.com','friendfeed.com','t.co','si.edu',67);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('i2i.jp','google.fr','icq.com','tripadvisor.com',68);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('bloglines.com','redcross.org','newyorker.com','zimbio.com',69);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('symantec.com','ebay.com','hhs.gov','hao123.com',70);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('tripod.com','canalblog.com','google.com','ning.com',71);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('engadget.com','oakley.com','nsw.gov.au','google.com.hk',72);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('twitter.com','miitbeian.gov.cn','usnews.com','infoseek.co.jp',73);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('canalblog.com','house.gov','census.gov','artisteer.com',74);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('sphinn.com','ehow.com','prweb.com','yellowpages.com',75);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('wordpress.com','ebay.co.uk','alexa.com','github.com',76);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('about.me','arstechnica.com','ucla.edu','hc360.com',77);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('hexun.com','feedburner.com','devhub.com','ucoz.com',78);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('mozilla.org','discuz.net','artisteer.com','artisteer.com',79);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('nymag.com','ca.gov','senate.gov','xing.com',80);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('ask.com','google.pl','irs.gov','unicef.org',81);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('photobucket.com','shop-pro.jp','gnu.org','hud.gov',82);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('globo.com','paypal.com','digg.com','github.com',83);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('vk.com','archive.org','i2i.jp','tinyurl.com',84);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('usnews.com','indiegogo.com','freewebs.com','themeforest.net',85);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('cdbaby.com','altervista.org','altervista.org','samsung.com',86);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('cmu.edu','mlb.com','squarespace.com','163.com',87);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('tumblr.com','jugem.jp','blinklist.com','pinterest.com',88);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('sogou.com','moonfruit.com','wikispaces.com','virginia.edu',89);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('paypal.com','google.it','patch.com','spotify.com',90);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('google.com.au','sohu.com','wordpress.com','prweb.com',91);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('unicef.org','mediafire.com','cocolog-nifty.com','bbb.org',92);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('youku.com','addtoany.com','nsw.gov.au','multiply.com',93);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('discovery.com','cbsnews.com','state.tx.us','1688.com',94);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('123-reg.co.uk','g.co','wikia.com','addthis.com',95);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('wisc.edu','w3.org','blogger.com','dropbox.com',96);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('globo.com','slate.com','paypal.com','yellowpages.com',97);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('google.cn','nih.gov','livejournal.com','odnoklassniki.ru',98);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('quantcast.com','nbcnews.com','nationalgeographic.com','un.org',99);
INSERT INTO socials(linkedin,instagram,facebook,twitter) VALUES ('statcounter.com','geocities.jp','samsung.com','yellowbook.com',100);

INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Common ringtail','Creek','Male',91,1);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Fox, north american red','Navajo','Female',73,2);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Penguin, little blue','Yuman','Female',49,3);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('White-throated robin','Paraguayan','Female',44,4);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Indian star tortoise','Costa Rican','Female',85,5);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Crab, sally lightfoot','Cree','Female',83,6);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('African bush squirrel','Ute','Male',68,7);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Lion, galapagos sea','Fijian','Male',84,8);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Sungazer, yellow-brown','Bolivian','Male',41,9);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Shrew, mandras tree','Paraguayan','Non-binary',48,10);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Square-lipped rhinoceros','Osage','Male',86,11);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('European wild cat','Thai','Male',70,12);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Boar, wild','Potawatomi','Male',94,13);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Toucan, white-throated','Malaysian','Female',39,14);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Otter, canadian river','Chickasaw','Female',53,15);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Deer, white-tailed','White','Male',86,16);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Lizard, goanna','Sioux','Female',23,17);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Great horned owl','Dominican (Dominican Republic)','Male',22,18);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Mocking cliffchat','Native Hawaiian and Other Pacific Islander (NHPI)','Female',68,19);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Giant girdled lizard','Polynesian','Bigender',42,20);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Pademelon, red-legged','Paraguayan','Female',71,21);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Southern brown bandicoot','Argentinian','Male',37,22);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Lion, steller''s sea','Honduran','Bigender',46,23);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Three-banded plover','Colombian','Male',31,24);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Starling, superb','Puerto Rican','Male',48,25);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Guanaco','Crow','Male',58,26);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Platypus','Laotian','Female',21,27);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Striated heron','Pakistani','Female',78,28);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Four-spotted skimmer','Laotian','Male',94,29);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Least chipmunk','Osage','Female',81,30);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Killer whale','Indonesian','Male',90,31);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Black-crowned night heron','Houma','Male',79,32);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Southern white-crowned shrike','Indonesian','Male',21,33);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Genet, common','Guamanian','Female',55,34);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Red-legged pademelon','Chippewa','Female',48,35);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Smith''s bush squirrel','Korean','Male',21,36);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Black-tailed prairie dog','Panamanian','Male',40,37);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Heron, yellow-crowned night','Venezuelan','Male',24,38);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Beaver, north american','Filipino','Female',51,39);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Golden brush-tailed possum','Yaqui','Agender',25,40);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Mule deer','Salvadoran','Female',78,41);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('European wild cat','Spaniard','Female',59,42);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Lesser flamingo','Uruguayan','Non-binary',93,43);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Great kiskadee','Pueblo','Female',27,44);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('African polecat','Korean','Male',68,45);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Fisher','Crow','Female',74,46);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Pied butcher bird','Micronesian','Female',52,47);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Tamandua, southern','Mexican','Male',26,48);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Salmon pink bird eater tarantula','Korean','Genderqueer',39,49);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Ring dove','Comanche','Male',51,50);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Spotted-tailed quoll','Colville','Male',40,51);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Red hartebeest','Cheyenne','Female',62,52);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Snake, eastern indigo','Kiowa','Female',25,53);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Feral rock pigeon','Mexican','Male',85,54);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Prairie falcon','Ottawa','Female',80,55);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Red howler monkey','Uruguayan','Male',21,56);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Owl, burrowing','Korean','Female',64,57);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Pheasant, ring-necked','Colville','Female',32,58);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Shrike, southern white-crowned','Paraguayan','Male',43,59);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Osprey','Central American','Male',45,60);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Lemur, sportive','Malaysian','Female',20,61);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Kongoni','Lumbee','Male',59,62);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Lory, rainbow','Malaysian','Female',21,63);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('African jacana','Polynesian','Male',55,64);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Crested bunting','Black or African American','Female',22,65);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Deer, barasingha','Cherokee','Male',95,66);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Gnu, brindled','Shoshone','Male',79,67);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('White-necked raven','Sioux','Male',80,68);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Egret, cattle','Apache','Male',70,69);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Vulture, lappet-faced','Eskimo','Female',71,70);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Pied butcher bird','Black or African American','Genderqueer',63,71);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Butterfly (unidentified)','Aleut','Female',28,72);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Crane, stanley','Nicaraguan','Female',48,73);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Asian openbill','Comanche','Male',39,74);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Sandhill crane','Hmong','Male',60,75);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Pheasant, common','Alaska Native','Female',88,76);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Peacock, blue','Taiwanese','Female',49,77);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Brush-tailed rat kangaroo','Ute','Male',36,78);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Richardson''s ground squirrel','Fijian','Male',53,79);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Red sheep','Native Hawaiian and Other Pacific Islander (NHPI)','Male',37,80);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Cape fox','Native Hawaiian and Other Pacific Islander (NHPI)','Female',31,81);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Vulture, lappet-faced','Asian','Female',51,82);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Salmon, sockeye','Bangladeshi','Female',86,83);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Boa, cook''s tree','South American','Male',41,84);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Dove, rock','Central American','Female',64,85);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Ornate rock dragon','Creek','Female',92,86);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Oribi','Spaniard','Female',73,87);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Kangaroo, jungle','Bangladeshi','Male',56,88);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Otter, small-clawed','Chickasaw','Male',77,89);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('North American red fox','White','Female',71,90);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Huron','Osage','Female',100,91);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Buffalo, wild water','Creek','Male',79,92);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Tortoise, indian star','Uruguayan','Male',66,93);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Purple moorhen','Pakistani','Male',24,94);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Red-winged blackbird','Tlingit-Haida','Female',87,95);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Crane, blue','Creek','Female',32,96);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('White-browed sparrow weaver','Asian','Male',29,97);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Least chipmunk','Alaskan Athabascan','Female',97,98);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Peacock, blue','Cambodian','Male',62,99);
INSERT INTO user_demo(fav_animal,race,gender,age) VALUES ('Boa, emerald green tree','Argentinian','Male',73,100);

INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (1,'Kiikala','porttitor lorem id ligula suspendisse ornare consequat lectus in','Vandervort-Trantow',28,'CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (2,'Negeriagung','pellentesque volutpat dui maecenas tristique est et tempus','Baumbach, Torp and Smith',50,'Java, CSS, HTML, JavaScript, Python');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (3,'Hongxing','vestibulum ante ipsum primis in faucibus orci luctus et ultrices','Jacobi LLC',60,'CSS, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (4,'Pyatigorsk','nunc rhoncus dui vel sem sed sagittis nam congue risus','Yundt-Wyman',46,'Python, Java, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (5,'San Julian','elementum nullam varius nulla facilisi cras non velit nec','Morissette LLC',71,'JavaScript, CSS, Python, HTML, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (6,'Nangkasari','venenatis turpis enim blandit mi in porttitor pede justo eu','Schuppe-Rosenbaum',2,'CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (7,'Néa Tríglia','justo sit amet sapien dignissim vestibulum vestibulum ante ipsum','D''Amore-Russel',27,'Java, JavaScript, HTML, Python, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (8,'Haparanda','nunc purus phasellus in felis donec semper sapien a libero','Blick, Flatley and Schaden',41,'HTML, Python, JavaScript, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (9,'Xingfu','integer pede justo lacinia eget tincidunt eget tempus vel','Kling, Haag and Dibbert',51,'Python, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (10,'Babakan Baru','congue risus semper porta volutpat quam pede lobortis ligula','White, Murazik and Waters',56,'Python, JavaScript, CSS, Java, HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (11,'Langarūd','et eros vestibulum ac est lacinia nisi venenatis tristique fusce','Prohaska-Schaefer',43,'Python, HTML, CSS, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (12,'Zhongxing','leo rhoncus sed vestibulum sit amet cursus id turpis','Rutherford-Wunsch',92,'Python, CSS, HTML, Java, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (13,'Benito Juarez','nascetur ridiculus mus vivamus vestibulum sagittis sapien cum','Connelly-West',52,'JavaScript, Java, Python, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (14,'Apeldoorn','natoque penatibus et magnis dis parturient montes nascetur ridiculus mus','Ziemann, Maggio and Howell',51,'Python, HTML, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (15,'Istres','porttitor lorem id ligula suspendisse ornare consequat lectus','Bernier LLC',75,'Python');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (16,'Jadowniki','placerat praesent blandit nam nulla integer pede justo lacinia eget','Hilll-Okuneva',90,'HTML, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (17,'Santa Catalina Norte','quam sollicitudin vitae consectetuer eget rutrum at lorem','Schowalter-Lakin',18,'JavaScript, Java, CSS, Python, HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (18,'Tanggulangin','lacus curabitur at ipsum ac tellus semper interdum','Boehm, Lindgren and Considine',99,'HTML, CSS, Java, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (19,'Heilbronn','convallis tortor risus dapibus augue vel accumsan tellus nisi eu','Littel LLC',3,'Java, Python, HTML, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (20,'Paracatu','condimentum id luctus nec molestie sed justo pellentesque viverra','Tillman and Sons',76,'HTML, CSS, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (21,'Mayantoc','integer ac neque duis bibendum morbi non quam nec','Heidenreich-Jacobs',9,'HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (22,'Rado','nunc purus phasellus in felis donec semper sapien a','Hamill-Mertz',76,'Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (23,'Bobrov','odio justo sollicitudin ut suscipit a feugiat et','Parker and Sons',50,'Python, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (24,'Cunliji','nam congue risus semper porta volutpat quam pede lobortis','Beier LLC',13,'CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (25,'Zamora','adipiscing elit proin risus praesent lectus vestibulum quam sapien varius','Hansen, Huel and Prohaska',1,'HTML, CSS, JavaScript, Python, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (26,'Rudna','sagittis sapien cum sociis natoque penatibus et magnis','Graham, Wilkinson and Barton',17,'JavaScript, Java, Python, CSS, HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (27,'Weiguo','turpis elementum ligula vehicula consequat morbi a ipsum','Kunze Group',64,'CSS, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (28,'Ruma','consectetuer adipiscing elit proin interdum mauris non ligula pellentesque','Harber and Sons',20,'Java, HTML, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (29,'Krajan Kedungsalam','turpis elementum ligula vehicula consequat morbi a ipsum integer a','Hilpert, Block and Koss',55,'Java, Python, HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (30,'Palmar de Varela','sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante','Huels and Sons',5,'CSS, HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (31,'Taghazout','rutrum neque aenean auctor gravida sem praesent id massa id','Terry-Padberg',34,'Python, JavaScript, Java, HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (32,'Sinacaban','quam nec dui luctus rutrum nulla tellus in sagittis','Kautzer, Wisozk and Bernhard',90,'Java, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (33,'Clifden','ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel','O''Conner-Goodwin',47,'Python, Java, HTML, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (34,'Lazaro Cardenas','in faucibus orci luctus et ultrices posuere cubilia curae','Wolf, Emmerich and McDermott',83,'HTML, CSS, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (35,'São Vicente de Ferreira','justo lacinia eget tincidunt eget tempus vel pede morbi','Lang, Keebler and Spencer',84,'Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (36,'Compostela','ac enim in tempor turpis nec euismod scelerisque','Haag Group',75,'JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (37,'Junshan','lobortis vel dapibus at diam nam tristique tortor eu','Stamm, Feest and Bechtelar',62,'Java, Python, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (38,'Garoua','ut odio cras mi pede malesuada in imperdiet et','Runte and Sons',76,'JavaScript, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (39,'Olocuilta','dui proin leo odio porttitor id consequat in consequat','Schinner, Walker and Cummerata',70,'CSS, JavaScript, HTML, Python, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (40,'Skýros','viverra eget congue eget semper rutrum nulla nunc','Powlowski LLC',32,'HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (41,'Lagoa','in libero ut massa volutpat convallis morbi odio odio elementum','Wyman, Legros and Bechtelar',43,'Python, JavaScript, Java, HTML, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (42,'Datang','quis tortor id nulla ultrices aliquet maecenas leo odio','O''Connell, Welch and Funk',56,'JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (43,'Kruševica','quam sapien varius ut blandit non interdum in','Daugherty, Emard and Collier',78,'JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (44,'Koa','sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar','Von and Sons',57,'JavaScript, Java, HTML, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (45,'Tianbao','justo sollicitudin ut suscipit a feugiat et eros','Leannon-Russel',9,'JavaScript, Python, Java, HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (46,'Golovchino','leo odio porttitor id consequat in consequat ut','Howe, Stamm and White',86,'Python, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (47,'Qinghe','blandit mi in porttitor pede justo eu massa donec dapibus','Kuvalis-Pouros',76,'JavaScript, HTML, CSS, Python');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (48,'Vilarinho das Cambas','primis in faucibus orci luctus et ultrices posuere','Stracke-Herman',2,'CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (49,'Banjar Triwangsakeliki','semper sapien a libero nam dui proin leo odio','Bashirian, Tromp and Hyatt',82,'CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (50,'Gurbuki','mauris enim leo rhoncus sed vestibulum sit amet cursus','Jones Inc',74,'Java, HTML, CSS, Python, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (51,'Sīdī Sālim','magna ac consequat metus sapien ut nunc vestibulum ante','Abernathy-Schneider',75,'Java, HTML, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (52,'General Pinedo','id nisl venenatis lacinia aenean sit amet justo morbi','Strosin, Douglas and Boehm',59,'JavaScript, CSS, Python, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (53,'Douarnenez','enim leo rhoncus sed vestibulum sit amet cursus','Quitzon-Crist',4,'HTML, Python');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (54,'Si Racha','vestibulum vestibulum ante ipsum primis in faucibus orci luctus','Larkin-Champlin',98,'HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (55,'Guan’e','leo rhoncus sed vestibulum sit amet cursus id turpis','Reichert and Sons',33,'Python, JavaScript, HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (56,'Pansoy','amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque','Cole LLC',90,'CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (57,'Xarsingma','justo sollicitudin ut suscipit a feugiat et eros vestibulum ac','Renner and Sons',59,'CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (58,'Ribeiro','duis ac nibh fusce lacus purus aliquet at feugiat','Bruen, Rohan and Mante',53,'CSS, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (59,'Santa Rosa de Lima','nam ultrices libero non mattis pulvinar nulla pede','Boyer, Kozey and O''Kon',16,'HTML, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (60,'Selasari','morbi vel lectus in quam fringilla rhoncus mauris enim','Streich-Heaney',26,'CSS, JavaScript, HTML, Python');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (61,'Puerto Castilla','rhoncus sed vestibulum sit amet cursus id turpis integer aliquet','Kovacek LLC',56,'Python');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (62,'Puerto Deseado','turpis nec euismod scelerisque quam turpis adipiscing lorem','Huels-Kunze',59,'HTML, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (63,'Chishmy','condimentum id luctus nec molestie sed justo pellentesque viverra','Cruickshank Group',18,'CSS, HTML, Python, Java, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (64,'Quillabamba','felis fusce posuere felis sed lacus morbi sem mauris laoreet','Purdy, Pollich and Graham',61,'Java, JavaScript, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (65,'Cililitan','a pede posuere nonummy integer non velit donec diam','Hagenes, Friesen and Kohler',36,'Python, JavaScript, HTML, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (66,'Busalangga','sapien non mi integer ac neque duis bibendum','Klein-Veum',45,'JavaScript, Java, HTML, Python, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (67,'Puricay','lacinia eget tincidunt eget tempus vel pede morbi','Krajcik-Stanton',20,'HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (68,'Bumpe','cubilia curae mauris viverra diam vitae quam suspendisse','Skiles LLC',10,'HTML, JavaScript, Python, Java, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (69,'La Habana Vieja','rhoncus aliquam lacus morbi quis tortor id nulla','Shanahan Inc',23,'Python, HTML, Java, JavaScript, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (70,'Selikhino','ornare imperdiet sapien urna pretium nisl ut volutpat sapien','Fay and Sons',9,'JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (71,'Banjarjo','id pretium iaculis diam erat fermentum justo nec condimentum neque','Walker, O''Reilly and Jerde',49,'Python, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (72,'Łobez','suspendisse ornare consequat lectus in est risus auctor sed','Orn Group',38,'Python, CSS, HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (73,'Pasirhuni','neque sapien placerat ante nulla justo aliquam quis','Bergnaum-White',94,'Java, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (74,'Pagsabangan','sed nisl nunc rhoncus dui vel sem sed','O''Conner-Dickens',11,'Python, CSS, JavaScript, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (75,'Muaralembu','sit amet lobortis sapien sapien non mi integer ac neque','Mann and Sons',100,'CSS, Java, JavaScript, Python');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (76,'Mae Sai','aliquet at feugiat non pretium quis lectus suspendisse potenti in','Gerlach, Waters and Hermiston',19,'CSS, HTML, Python, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (77,'La Esperanza','eu felis fusce posuere felis sed lacus morbi sem mauris','Gerhold-Daniel',35,'Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (78,'Thị Trấn Nước Hai','hac habitasse platea dictumst etiam faucibus cursus urna ut tellus','Senger Group',93,'HTML, Python, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (79,'Douala','lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi','Gerlach-Haley',78,'Java, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (80,'Verkhniy Baskunchak','enim leo rhoncus sed vestibulum sit amet cursus id turpis','McGlynn-Boyle',33,'HTML, Python');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (81,'Daqian','faucibus orci luctus et ultrices posuere cubilia curae duis','Sawayn, Beier and Jaskolski',6,'Python, HTML, JavaScript, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (82,'Khemarat','aliquam augue quam sollicitudin vitae consectetuer eget rutrum','Ortiz LLC',59,'JavaScript, CSS, Java, Python');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (83,'Sémbé','cursus urna ut tellus nulla ut erat id mauris','Hills Inc',81,'Java, JavaScript, CSS, HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (84,'Néa Palátia','nulla facilisi cras non velit nec nisi vulputate','Wisoky-Veum',35,'HTML, Python, JavaScript, CSS');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (85,'Amnat Charoen','sapien non mi integer ac neque duis bibendum morbi','Lehner-Kuphal',72,'JavaScript, Java, CSS, Python, HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (86,'Zhouling','curae duis faucibus accumsan odio curabitur convallis duis','Koss and Sons',41,'Python, CSS, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (87,'Novomyshastovskaya','ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing','Rosenbaum LLC',17,'Python, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (88,'Žebrák','justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis','Stanton, Emmerich and Yost',14,'Python, JavaScript, Java, HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (89,'Krajan Craken','ac tellus semper interdum mauris ullamcorper purus sit amet','Emard-Spencer',25,'HTML, Python, CSS, Java, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (90,'Xiangfu','aenean auctor gravida sem praesent id massa id nisl','King, Reichel and Hamill',25,'JavaScript, HTML, Python');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (91,'Pérama','nibh quisque id justo sit amet sapien dignissim vestibulum','Connelly, Friesen and Champlin',38,'Java, CSS, Python');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (92,'Kujung','sodales sed tincidunt eu felis fusce posuere felis sed','Rohan-Luettgen',8,'CSS, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (93,'Nevel’','vel nisl duis ac nibh fusce lacus purus','Tremblay Group',33,'JavaScript, CSS, HTML, Python');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (94,'Zhili','pulvinar sed nisl nunc rhoncus dui vel sem','Braun-Armstrong',56,'Java, CSS, Python, JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (95,'Meilin','vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id','Sanford Group',48,'JavaScript, HTML, CSS, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (96,'Svislach','lobortis vel dapibus at diam nam tristique tortor eu pede','Baumbach, VonRueden and Monahan',49,'HTML, Python, Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (97,'San Andrés Villa Seca','nulla sed vel enim sit amet nunc viverra','Franecki-Crooks',61,'Java, CSS, HTML');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (98,'Pedaringan','proin risus praesent lectus vestibulum quam sapien varius','Harris, Kshlerin and Denesik',23,'Java');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (99,'Zhuting','fermentum justo nec condimentum neque sapien placerat ante nulla justo','Effertz Group',89,'JavaScript');
INSERT INTO projects(project_id,location,project_description,project_name,project_status,project_languages) VALUES (100,'Povedniki','lobortis est phasellus sit amet erat nulla tempus vivamus in','Johnson, Dickinson and Heller',34,'JavaScript, Python, Java');


