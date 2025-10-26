create database Student_Marks_Card;
use Student_Marks_Card;


create table student(
USN varchar(10) primary key,
Name varchar(50),
Age int,
Combination varchar(20),
M1 int,
M2 int,
M3 int);

desc student;
/*'USN', 'varchar(10)', 'NO', 'PRI', NULL, ''
'Name', 'varchar(50)', 'YES', '', NULL, ''
'Age', 'int', 'YES', '', NULL, ''
'Combination', 'varchar(20)', 'YES', '', NULL, ''
'M1', 'int', 'YES', '', NULL, ''
'M2', 'int', 'YES', '', NULL, ''
'M3', 'int', 'YES', '', NULL, ''*/

insert into student values
('101','Meena',19,'DBMS',84,87,86),
('102','Gopal',21,'ST',99,98,97),
('103','Radha',20,'CN',22,32,45),
('104','Raman',18,'OS',76,87,98),
('105','Sanjana',21,'DBMS',22,67,89),
('106','Akash',18,'ST',34,67,89),
('107','Ajay',19,'CN',97,98,90),
('108','Saloni',21,'OS',23,45,65),
('109','Sonika',20,'DBMS',80,87,97),
('110','Rakesh',19,'CN',87,55,34);


alter table student add Total int;
alter table student add Avg float;
alter table student add Result varchar(20);

desc student;
/*'USN', 'varchar(10)', 'NO', 'PRI', NULL, ''
'Name', 'varchar(50)', 'YES', '', NULL, ''
'Age', 'int', 'YES', '', NULL, ''
'Combination', 'varchar(20)', 'YES', '', NULL, ''
'M1', 'int', 'YES', '', NULL, ''
'M2', 'int', 'YES', '', NULL, ''
'M3', 'int', 'YES', '', NULL, ''
'Total', 'int', 'YES', '', NULL, ''
'Avg', 'float', 'YES', '', NULL, ''
'Result', 'varchar(20)', 'YES', '', NULL, ''*/

update student set Total = M1+M2+M3 , Avg = (M1+M2+M3)/3;

update student set result = 'Pass' where M1>= 35 AND M2>=35 AND M3>=35;
update student set result = 'Fail' where M1<35 OR M2<35 OR M3<35;

select * from student;
/*'101', 'Meena', '19', 'DBMS', '84', '87', '86', '257', '85.6667', 'Pass'
'102', 'Gopal', '21', 'ST', '99', '98', '97', '294', '98', 'Pass'
'103', 'Radha', '20', 'CN', '22', '32', '45', '99', '33', 'Fail'
'104', 'Raman', '18', 'OS', '76', '87', '98', '261', '87', 'Pass'
'105', 'Sanjana', '21', 'DBMS', '22', '67', '89', '178', '59.3333', 'Fail'
'106', 'Akash', '18', 'ST', '34', '67', '89', '190', '63.3333', 'Fail'
'107', 'Ajay', '19', 'CN', '97', '98', '90', '285', '95', 'Pass'
'108', 'Saloni', '21', 'OS', '23', '45', '65', '133', '44.3333', 'Fail'
'109', 'Sonika', '20', 'DBMS', '80', '87', '97', '264', '88', 'Pass'
'110', 'Rakesh', '19', 'CN', '87', '55', '34', '176', '58.6667', 'Fail'*/