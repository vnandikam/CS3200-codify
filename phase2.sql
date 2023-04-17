-- drop database codifydb
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
project_id int,
FOREIGN KEY (dep) REFERENCES department(dep_id)
                   ON UPDATE CASCADE
                   ON DELETE RESTRICT,
FOREIGN KEY(project) REFERENCES emp_project(project_id)
);

ALTER TABLE Employee
RENAME COLUMN project to project_id;


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
  clock_in TIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
  clock_out TIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  date_worked DATE NOT NULL,
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
  username varchar(20) NOT NULL,
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
  fav_animal varchar(50) NOT NUlL,
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
INSERT INTO department(location,dep_id,dep_name) VALUES ('Bouarouss',53,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Le Blanc-Mesnil',223,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Florencia',304,'Support');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Sinazongwe',260,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Hang Dong',118,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Cognac',280,'Support');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Dalan',291,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Sheksna',399,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Armenta',191,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Xiaojin',76,'Engineering');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Mawlaik',371,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Pul-e Khumrī',179,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Nashville',437,'Engineering');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Boyany',248,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Billa',286,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Kuleqi',461,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('El Alamo',22,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Nisporeni',277,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Diaofeng',464,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Maesan',128,'Support');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Empedrado',17,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Aghsu',294,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Harstad',7,'Engineering');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Złotniki Kujawskie',44,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Fort Myers',362,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Paraparaumu',384,'Engineering');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Stavropol’',313,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Ahmadpur Siāl',431,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Kuching',150,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Wenceslao Escalante',242,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Krasnyy Oktyabr’',416,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Nice',277,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Valence',106,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Bershet’',96,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Musawa',148,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Dacheng',59,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Challans',238,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Baborów',133,'Engineering');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Tver',65,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Jeremoabo',382,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('La‘l',426,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Unión de Reyes',41,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Ol’ginskaya',20,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Zhouyuan',223,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Luoyang',128,'Support');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Bắc Ninh',301,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Velikooktyabr’skiy',344,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Kamsack',397,'Support');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Żarki-Letnisko',459,'Support');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Hässelby',337,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Ganzhou',32,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Marseille',37,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Punta de Bombón',208,'Support');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Molodizhne',367,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Kosów Lacki',302,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Takai',463,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Buensuseso',132,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Zheleznogorsk-Ilimskiy',197,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Gjinoc',137,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Linköping',385,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Akouda',457,'Support');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Rogachëvo',420,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Pueblo Nuevo',59,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Jiuquan',465,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Runan',233,'Engineering');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Salgado',462,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Tawau',122,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Hengxi',150,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Kulun',194,'Support');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Jian’ou',309,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Gongnong',128,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Awilega',197,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Bagumbayan',13,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Kafarati',380,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Timmins',239,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Xinglong',15,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Badaogu',287,'Engineering');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Makoua',92,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('San Pedro',30,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Pital',299,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Pajarillo',387,'Training');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Oslo',451,'Support');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Bishan',332,'Services');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Roshal’',4,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Vallenar',78,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Obando',148,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Třešť',62,'Sales');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Kynopiástes',381,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Zdounky',181,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Bolanon',415,'Legal');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Jietou',331,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Ipiales',441,'Marketing');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Parungjawa',132,'Research and Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Podhum',270,'Engineering');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Tucuran',453,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Longjing',133,'Accounting');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Ciudad Choluteca',195,'Human Resources');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Kaniv',112,'Business Development');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Gedera',343,'Product Management');
INSERT INTO department(location,dep_id,dep_name) VALUES ('Novi Travnik',404,'Engineering');

INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2524,'Jiaocha',4066,70);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6357,'Thạnh Mỹ',1799,98);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7496,'Panenggoede',4519,61);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9149,'Nonggunong',3737,100);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5251,'Manalad',5461,41);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9071,'Ngurore',1422,23);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5715,'Wojcieszków',7952,33);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9549,'Petrov',4236,13);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3681,'Brzyska',5605,31);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5368,'Yeping',6184,64);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5708,'Severo-Zadonsk',4138,61);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8078,'Pakemitan Dua',1393,95);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4730,'Ningyuan',3109,43);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5037,'Sidenreng',9425,38);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (1478,'Sergokala',3589,46);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8191,'Fenjie',6729,46);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6722,'Hoàn Kiếm',7454,24);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5487,'Wuli',9197,44);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8422,'Gao',8528,90);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8486,'Kiernozia',1824,29);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5465,'Trzebieszów',1058,100);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3545,'Ngepoh Kidul',6295,83);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8857,'Pavlovka',1491,84);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6211,'Guohe',3147,22);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2898,'Staraya Kulatka',2447,39);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5747,'Pleven',7298,25);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9506,'Thessaloníki',6376,80);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (1555,'Shuigou’ao',6137,28);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2615,'Atok',4163,72);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5430,'Warungtanjung',6220,9);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9640,'Pulau Pinang',3817,44);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8303,'Katsuta',4367,98);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (1613,'Kumbo',1304,40);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3862,'Lanipao',2039,13);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4011,'Cruzeiro do Oeste',6473,15);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9504,'Otutara',6228,36);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9858,'Sāh',8224,17);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9504,'Ning’an',9396,65);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3123,'Mtsensk',2029,59);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9123,'Bajina Bašta',3000,6);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5229,'Cikaduen',8604,4);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9353,'Banes',7677,93);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6149,'Hà Đông',4737,58);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9301,'La Jagua de Ibirico',8511,13);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7342,'Ogwashi-Uku',1916,70);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8797,'Khilok',9556,3);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2097,'La Rochelle',9359,43);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2770,'Daxindian',4404,80);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5142,'Göteborg',7291,75);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8301,'Candijay',7463,68);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6579,'Mokwa',7995,93);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7067,'Staropyshminsk',7456,13);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9380,'Ribeira',1512,72);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (1450,'Narita',1053,84);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7883,'Catujal Velho',1640,6);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7383,'La Ferté-Bernard',8457,33);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9366,'Antony',6209,50);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9601,'Delmiro Gouveia',5186,82);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3164,'Bairros',4300,87);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5728,'Mēga',8713,48);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4496,'Tak Bai',5672,84);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3589,'Yajiang',8052,78);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4610,'Junín',5362,96);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6871,'Atar',8306,24);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9594,'Tinawagan',1956,44);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4891,'Gongjiang',3048,18);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2933,'Wenquan',7808,2);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (8979,'Cañada de Gómez',6263,64);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4210,'Jingdang',2424,14);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6193,'Solntsevo',9755,24);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5012,'Merke',2084,48);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3183,'Suhopolje',1846,22);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6530,'Dumingag',6124,38);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9432,'Rumburk',1645,69);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (1917,'Schaan',9045,52);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6103,'Idrija',8289,16);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6073,'Miłakowo',7357,62);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7894,'Hermoso Campo',4334,4);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9164,'Temanjang',8178,14);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (5436,'Ostravice',9778,68);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9366,'Kaburon',2421,15);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6385,'Bastia',8875,8);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2609,'Hexi',7533,56);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9639,'Grazhdanka',3231,47);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9853,'Cigeulis',7492,5);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3616,'Mineralni Bani',5234,10);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3725,'Morez',9188,49);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (1201,'Tangjiawan',2093,20);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9206,'St. Anton an der Jeßnitz',9207,25);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9420,'Trondheim',5531,55);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (6840,'Erada',7376,6);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (4741,'Niort',1583,23);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3874,'Ḩawsh ‘Īsá',3778,73);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (2967,'Longnawang',3569,74);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7359,'Jiagao',5400,76);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (9363,'Beihuaidian',5918,32);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (7013,'Skomielna Czarna',2294,77);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3929,'Shireet',7209,89);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3510,'Thaba Nchu',1439,5);
INSERT INTO emp_project(project_id,location,project_lead,department) VALUES (3269,'Tianfu',5851,11);


INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1827,'Senior Financial Analyst',3,8333);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (7606,'Chemical Engineer',29,9400);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1317,'Automation Specialist II',52,7050);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6194,'Systems Administrator III',66,8031);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (4689,'Pharmacist',26,4795);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (5324,'Editor',96,1563);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (7237,'Legal Assistant',65,7395);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1233,'VP Product Management',80,9545);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (7957,'Chemical Engineer',50,1537);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (5615,'Web Developer III',83,9365);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (2059,'Senior Editor',29,9076);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1373,'Data Coordinator',49,3202);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1334,'Help Desk Operator',38,7789);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6113,'Sales Representative',71,9609);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (5992,'Editor',40,7637);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6230,'Nurse',80,6464);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (4691,'Account Coordinator',16,4615);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3257,'Human Resources Assistant I',8,7049);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6363,'Web Designer III',58,8238);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (8342,'Associate Professor',64,2791);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3296,'Geological Engineer',55,9260);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1189,'Account Coordinator',78,9365);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (7665,'Environmental Specialist',3,7050);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (2624,'Staff Scientist',2,1568);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (5991,'Help Desk Operator',56,6307);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6537,'Professor',92,1568);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (5150,'Marketing Assistant',26,4615);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (2077,'Accountant III',7,2139);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (9248,'Statistician II',81,9551);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6978,'Internal Auditor',65,8018);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1750,'Budget/Accounting Analyst II',99,7060);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6879,'Staff Accountant I',46,4489);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3636,'Tax Accountant',75,1537);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (4318,'Marketing Assistant',30,1561);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (4755,'Research Nurse',97,8616);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1687,'Research Associate',21,6464);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (2043,'Computer Systems Analyst II',80,9610);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (7650,'Legal Assistant',10,9190);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3988,'Occupational Therapist',9,2390);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (5279,'Teacher',35,7789);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3282,'Payment Adjustment Coordinator',7,6067);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (7905,'Recruiter',29,7906);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (8204,'Account Representative II',82,5342);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (4753,'Marketing Manager',86,1561);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (2404,'Budget/Accounting Analyst III',22,2106);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3519,'Design Engineer',59,4615);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (4977,'Graphic Designer',45,7906);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1524,'VP Accounting',65,8323);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (2352,'Professor',69,9509);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (2798,'Statistician II',19,7050);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (9200,'Analyst Programmer',68,7637);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (4210,'Registered Nurse',1,2651);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1674,'Quality Engineer',82,9551);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (4319,'Pharmacist',93,6635);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1766,'Account Coordinator',4,9509);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3864,'Software Engineer I',1,1039);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1193,'Environmental Specialist',7,5928);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (8571,'Automation Specialist III',84,7906);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3314,'Mechanical Systems Engineer',64,4795);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6377,'Account Executive',99,2511);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3798,'Executive Secretary',62,6836);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (9749,'Registered Nurse',21,9076);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6731,'Sales Representative',15,2390);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6587,'Budget/Accounting Analyst I',41,7226);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (5492,'Programmer Analyst II',64,1568);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (8987,'Administrative Officer',32,1568);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6204,'Operator',95,7060);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (4025,'Financial Analyst',60,9659);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (2060,'Assistant Professor',33,3202);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (8497,'Tax Accountant',69,7637);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3289,'Nuclear Power Engineer',54,8281);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (2446,'Senior Developer',13,8813);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (2879,'VP Marketing',93,2139);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (9356,'Developer II',16,1563);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3802,'Geologist II',75,4539);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1483,'Junior Executive',47,3937);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3178,'Senior Developer',33,1668);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6436,'Sales Associate',6,6464);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (9271,'Desktop Support Technician',73,5670);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3422,'Statistician I',75,6635);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (8438,'Actuary',84,7049);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (7288,'Environmental Specialist',19,2791);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3106,'Junior Executive',93,8412);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (8957,'VP Accounting',61,6850);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1093,'Food Chemist',58,8018);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (5195,'Database Administrator IV',45,8412);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (2717,'Environmental Tech',37,2106);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6817,'Information Systems Manager',63,3296);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6962,'Business Systems Development Analyst',39,5967);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (7818,'Human Resources Manager',92,1561);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (7244,'Media Manager I',92,9076);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (4836,'Mechanical Systems Engineer',98,6307);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (4762,'Structural Analysis Engineer',64,1108);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (3517,'Physical Therapy Assistant',20,8486);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (5321,'Senior Quality Engineer',4,4225);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (6722,'Biostatistician II',13,7395);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (7587,'VP Quality Control',31,7637);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (8328,'Statistician II',60,4615);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (1577,'Web Designer II',77,4613);
INSERT INTO Employee(employee_id,title,dep,project_id) VALUES (8623,'Registered Nurse',30,5670);


INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (2939,'geitter0@foxnews.com',4549260338,4561);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3452,'mforlonge1@skyrock.com',3293110832,2822);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (5583,'gpollicatt2@nsw.gov.au',8792059168,6216);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8123,'csteward3@marriott.com',7155582975,5973);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (1152,'apadefield4@netscape.com',6058686323,3945);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (7398,'lfegan5@nasa.gov',9372273574,9304);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (4169,'plifton6@dedecms.com',3721526484,9304);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3342,'adoughton7@vk.com',1363136686,2796);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8265,'eocannan8@tmall.com',8855239125,2200);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (2343,'lpillinger9@unesco.org',8455751276,5363);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (9919,'hpeersa@nationalgeographic.com',4603753104,6485);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (7909,'hsigsworthb@about.com',9939427145,9304);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (9189,'fwinleyc@house.gov',8118280568,2190);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8921,'wthurmand@nsw.gov.au',1656882267,9545);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (1325,'rkarpole@japanpost.jp',4456601310,3207);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (7950,'aritchleyf@wordpress.com',6347665823,9765);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (5290,'jmayog@ucsd.edu',2293706915,3750);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (2909,'cziemh@loc.gov',4168980198,5860);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (2223,'aaudsleyi@soundcloud.com',4013372007,8395);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8242,'tbengej@spotify.com',1054815854,3017);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (6500,'gcleifek@imageshack.us',5759428343,4268);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (9196,'alamprechtl@digg.com',2309775879,2190);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8281,'eepiletm@tuttocitta.it',6783651777,9304);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8256,'groundsn@istockphoto.com',1721910112,6625);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (6509,'woffillo@cam.ac.uk',1521937023,5896);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (6912,'mtyremanp@odnoklassniki.ru',2066044510,9545);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3178,'acrowhurstq@hibu.com',5228441305,1689);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (7972,'demptager@army.mil',1339041396,8278);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3564,'jstoodleys@google.cn',6052640929,7015);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (2904,'tmarvelt@booking.com',7285299548,1514);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (2584,'dallardyceu@ox.ac.uk',3488158612,9448);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3782,'pgollinv@paginegialle.it',9994872513,3801);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (1972,'lschniederw@google.com.au',5053331973,8278);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8239,'hnieldx@simplemachines.org',1582066761,1689);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (1908,'emucilloy@uol.com.br',3542784754,3050);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (5597,'hpealz@gov.uk',5998942700,4784);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (2566,'abottrill10@icio.us',3879549038,2108);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (2579,'kyegorev11@businesswire.com',1016199157,2668);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3313,'bcolliar12@patch.com',9147828938,9765);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (5943,'tbugge13@wunderground.com',9031146013,6926);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (2894,'wottee14@gnu.org',3001530291,5125);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (6798,'bmartyntsev15@addtoany.com',4826449631,5602);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8780,'aspinks16@dagondesign.com',5443966230,8942);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (2804,'mthorp17@icq.com',8753093629,5973);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (7266,'syelyashev18@nytimes.com',6467718322,2511);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (6664,'awoltering19@jalbum.net',2996288307,2466);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (9108,'wmetts1a@yale.edu',5395179161,8942);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (4854,'dbendley1b@myspace.com',1799986619,3750);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (6953,'rknobell1c@google.co.jp',1884538948,7149);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (9874,'cjellings1d@wikispaces.com',1177513170,7706);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (4011,'gjobbins1e@angelfire.com',5793453287,1636);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (1148,'ascandwright1f@dedecms.com',6227803710,3750);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3589,'mwimbury1g@stanford.edu',8702432251,7149);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (7522,'bhambrick1h@google.ca',3477572730,3740);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (6741,'sinman1i@oracle.com',8708287281,9304);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (7055,'mchurchlow1j@nps.gov',4971098575,9448);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (5915,'tgreenard1k@vk.com',6128216372,2668);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8678,'bgreenhall1l@g.co',1718678803,6216);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3036,'lmixture1m@salon.com',1776005147,8942);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8584,'aspira1n@fotki.com',9099723295,2962);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3652,'eprangnell1o@jalbum.net',2721301121,2108);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (2282,'rpetracchi1p@nature.com',1586087982,4784);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (7612,'ecazin1q@lycos.com',6264788008,2200);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (4772,'brattenbury1r@photobucket.com',3546141702,6608);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3463,'mmanvell1s@nasa.gov',4428464050,2880);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (5705,'twhiteland1t@i2i.jp',6436096219,5292);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (1653,'edeacock1u@clickbank.net',5913456060,7916);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (5432,'hrockcliffe1v@ucoz.ru',5709678592,8104);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (5000,'sreisenstein1w@europa.eu',3682714897,4784);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (5041,'abrien1x@meetup.com',4181763338,8395);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3386,'apindar1y@ed.gov',2431934882,9608);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (4231,'bmaffeo1z@fda.gov',7134398831,5292);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (7321,'ograsser20@utexas.edu',5438611948,4784);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (6219,'msirett21@nih.gov',7803641523,3350);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (1503,'jstranaghan22@businessweek.com',7622342663,9677);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (6763,'mthake23@unesco.org',5832053813,6466);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3582,'cbloxsum24@mediafire.com',5582758189,6926);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (9939,'zofihillie25@technorati.com',1122238878,7916);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3574,'htrangmar26@unblog.fr',7479040871,2190);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (2772,'rwilsone27@livejournal.com',6345951784,8787);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (4238,'tdenington28@booking.com',1444626862,9019);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8382,'hdavison29@nsw.gov.au',6141877587,5602);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (6991,'lottosen2a@blinklist.com',4833472251,5125);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (2158,'pjorat2b@devhub.com',1922791516,3750);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8001,'dbrindley2c@google.co.uk',7582823184,3903);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (6008,'bcruess2d@mtv.com',2033451370,5602);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (5356,'fblacklawe2e@redcross.org',8955969683,2876);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (6909,'cgimert2f@twitpic.com',1594106893,2632);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (6967,'kmonteith2g@un.org',6074460082,9304);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (4828,'ndraayer2h@slideshare.net',6763533851,7395);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (5999,'lwilmot2i@time.com',3379672980,3350);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (7459,'mblackham2j@domainmarket.com',4417054851,7395);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8765,'aogleasane2k@behance.net',2087818710,8509);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8846,'jwheatley2l@jimdo.com',1735754278,6608);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (1748,'ekingzeth2m@liveinternet.ru',3109208706,6196);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (1807,'bskirven2n@storify.com',7357004529,3750);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (3548,'rrichardes2o@hao123.com',4619916110,2876);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (4734,'jspehr2p@angelfire.com',2313442617,5602);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (8886,'xdowding2q@guardian.co.uk',2186317401,9677);
INSERT INTO users(user_id,email,phone_num,employee_id) VALUES (9573,'ycoronado2r@abc.net.au',4983553232,2123);
