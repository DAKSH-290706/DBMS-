-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 03: Implementation of different types of SQL functions.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: DAKSH D
-- USN: 1RUA24BCA0019
-- SECTION: A
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
-- 'root@localhost', 'LAPTOP-RBOG5HPO', '8.0.43', '2025-09-08 19:02:41'


create database BCALAB003;
use BCALAB003;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PreCoded Relational Schema and Instance.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- 1. create a table named Employee with EmpID ,FirstName,LastName Salary BirthDate HireDate 

-- 2. Insert 10 records to employee;
-- 3. create a table named Orders with OrderID , OrderDate, totalAmount, EmpID(foreign key)  

-- 4. Insert 10 records to Orders


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
create table Employee (
    EmpID int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Salary decimal(10,2),
    BirthDate date,
    HireDate date
);
desc Employee;
/*'EmpID', 'int', 'NO', 'PRI', NULL, ''
'FirstName', 'varchar(50)', 'YES', '', NULL, ''
'LastName', 'varchar(50)', 'YES', '', NULL, ''
'Salary', 'decimal(10,2)', 'YES', '', NULL, ''
'BirthDate', 'date', 'YES', '', NULL, ''
'HireDate', 'date', 'YES', '', NULL, ''*/

insert into Employee (EmpID, FirstName, LastName, Salary, BirthDate, HireDate) values
(1, 'Arjun',  'Mehta',    46000.00, '1992-02-11', '2016-03-20'),
(2, 'Sneha',  'Patel',    51000.00, '1987-08-05', '2020-09-15'),
(3, 'Karan',  'Singh',    59000.00, '1981-11-22', '2018-07-18'),
(4, 'Pooja',  'Raj',     53000.00, '1993-09-14', '2019-11-25'),
(5, 'Manoj',  'Desai',    48000.00, '1996-10-27', '2021-05-30'),
(6, 'Lakshmi','Rao',     64000.00, '1988-04-09', '2013-01-12'),
(7, 'Ramesh', 'Reddy',    47000.00, '1984-06-18', '2022-02-08'),
(8, 'Divya',  'Shetty',     52500.00, '1986-03-25', '2021-08-10'),
(9, 'Nikhil', 'Jai',    57500.00, '1991-12-02', '2014-04-22'),
(10,'Meera',  'Kapoor',   61500.00, '1985-01-15', '2012-10-05');

create table Orders (
    OrderID int primary key,
    OrderDate date,
    TotalAmount decimal(10,2),
    EmpID int,
    foreign key (EmpID) references Employee(EmpID)
);
desc Orders;
/*'OrderID', 'int', 'NO', 'PRI', NULL, ''
'OrderDate', 'date', 'YES', '', NULL, ''
'TotalAmount', 'decimal(10,2)', 'YES', '', NULL, ''
'EmpID', 'int', 'YES', 'MUL', NULL, ''*/

insert into Orders (OrderID, OrderDate, TotalAmount, EmpID) values
(101, '2023-06-03', 1350.75, 1),
(102, '2023-06-12', 2650.00, 2),
(103, '2023-07-05', 1950.40, 3),
(104, '2023-07-18', 3100.90, 4),
(105, '2023-08-02', 2250.25, 5),
(106, '2023-08-15', 4200.00, 6),
(107, '2023-09-01', 1600.85, 7),
(108, '2023-09-10', 2890.50, 8),
(109, '2023-10-04', 3650.30, 9),
(110, '2023-10-20', 2999.99, 10);


-- Output: 
select * from Employee;
/*'1', 'Arjun', 'Mehta', '46000.00', '1992-02-11', '2016-03-20'
'2', 'Sneha', 'Patel', '51000.00', '1987-08-05', '2020-09-15'
'3', 'Karan', 'Singh', '59000.00', '1981-11-22', '2018-07-18'
'4', 'Pooja', 'Raj', '53000.00', '1993-09-14', '2019-11-25'
'5', 'Manoj', 'Desai', '48000.00', '1996-10-27', '2021-05-30'
'6', 'Lakshmi', 'Rao', '64000.00', '1988-04-09', '2013-01-12'
'7', 'Ramesh', 'Reddy', '47000.00', '1984-06-18', '2022-02-08'
'8', 'Divya', 'Shetty', '52500.00', '1986-03-25', '2021-08-10'
'9', 'Nikhil', 'Jai', '57500.00', '1991-12-02', '2014-04-22'
'10', 'Meera', 'Kapoor', '61500.00', '1985-01-15', '2012-10-05'*/

select * from Orders;
/*'101', '2023-06-03', '1350.75', '1'
'102', '2023-06-12', '2650.00', '2'
'103', '2023-07-05', '1950.40', '3'
'104', '2023-07-18', '3100.90', '4'
'105', '2023-08-02', '2250.25', '5'
'106', '2023-08-15', '4200.00', '6'
'107', '2023-09-01', '1600.85', '7'
'108', '2023-09-10', '2890.50', '8'
'109', '2023-10-04', '3650.30', '9'
'110', '2023-10-20', '2999.99', '10'*/

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
Select Round(Salary) As RoundSalary From Employee;
-- Output: 
/*'46000'
'51000'
'59000'
'53000'
'48000'
'64000'
'47000'
'52500'
'57500'
'61500'*/

/* b. Absolute Values: Show absolute values of salaries */
Select Abs(Salary) As AbsoluteSalary From Employee;
-- Output: 
/*'46000.00'
'51000.00'
'59000.00'
'53000.00'
'48000.00'
'64000.00'
'47000.00'
'52500.00'
'57500.00'
'61500.00'*/

/* c. Ceiling Values: Get ceiling values of order amounts */
Select Ceil(TotalAmount) as CeilingAmount from Orders;
-- Output: 
/*'1351'
'2650'
'1951'
'3101'
'2251'
'4200'
'1601'
'2891'
'3651'
'3000'*/

-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
Select count(*) as TotalEmployees from Employee;
-- Output: 
/*'10'*/

/* b. Sum of Salaries: Calculate total salary expense */
Select sum(Salary) as TotalSalaryExpense from Employee;
-- Output: 
/*'539500.00'*/

/* c. Average Order Amount: Find average order value */
Select Avg(TotalAmount) as AverageOrderValue from Orders;
-- Output: 
/*'2664.394000'*/

/* d. Max/Min Salary: Find highest and lowest salaries */
Select Min(Salary) As MinSalary from Employee;
Select Max(Salary) As MaxSalary from Employee;
-- Output: 
/*'46000.00'*/
/*'64000.00'*/

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
select upper(FirstName) as UpperName, lower(FirstName) as LowerName from Employee;
-- Output: 
/*'ARJUN', 'arjun'
'SNEHA', 'sneha'
'KARAN', 'karan'
'POOJA', 'pooja'
'MANOJ', 'manoj'
'LAKSHMI', 'lakshmi'
'RAMESH', 'ramesh'
'DIVYA', 'divya'
'NIKHIL', 'nikhil'
'MEERA', 'meera'*/

/* b. Concatenate Names: Create full names */
select concat(FirstName, ' ', LastName) as FullName from Employee;
-- Output: 
/*'Arjun Mehta'
'Sneha Patel'
'Karan Singh'
'Pooja Raj'
'Manoj Desai'
'Lakshmi Rao'
'Ramesh Reddy'
'Divya Shetty'
'Nikhil Jai'
'Meera Kapoor'*/

/* c. Extract Substring: Get first 3 characters of first names */
Select substr(FirstName, 1, 3) from Employee; 
-- Output: 
/*'Arj'
'Sne'
'Kar'
'Poo'
'Man'
'Lak'
'Ram'
'Div'
'Nik'
'Mee'*/

-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */
select str_to_date('15-08-2023', '%d-%m-%Y') as ConvertedDate;
-- Output: 
/*'2023-08-15'*/

-- ------------------------------------------------------------
-- Date Functions Section
-- ------------------------------------------------------------
/* a. Current Date/Time: Get current timestamp */
Select Cast(OrderDate AS Char) As ConvertedDate from Orders;
-- Output: 
/*'2023-06-03'
'2023-06-12'
'2023-07-05'
'2023-07-18'
'2023-08-02'
'2023-08-15'
'2023-09-01'
'2023-09-10'
'2023-10-04'
'2023-10-20'*/

Select now();
/*'2025-09-08 20:03:28'*/

/* b. Extract Year: Get year from order dates */
Select Extract(Year From OrderDate) As OrderYear from Orders;
-- Output: 
/*'2023'
'2023'
'2023'
'2023'
'2023'
'2023'
'2023'
'2023'
'2023'
'2023'*/

/* c. Add Months: Add 3 months to order dates */
Select Date_Add(OrderDate, Interval 3 Month) as FinalDate from Orders;
-- Output: 
/*'2023-09-03'
'2023-09-12'
'2023-10-05'
'2023-10-18'
'2023-11-02'
'2023-11-15'
'2023-12-01'
'2023-12-10'
'2024-01-04'
'2024-01-20'*/

/* d. Days Since Order: Calculate days between order date and now */
Select OrderID, datediff(Now(), OrderDate) As DaysSinceOrder from Orders;
-- Output: 
/*'101', '828'
'102', '819'
'103', '796'
'104', '783'
'105', '768'
'106', '755'
'107', '738'
'108', '729'
'109', '705'
'110', '689'*/

-- END of the Task -- 