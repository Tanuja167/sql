
use EMPLOYEEINFOPOSITION

create table EmployeeInfo
(
    empid int primary key,
	empfname varchar(20),
	empLname varchar(20),
	department varchar(20),
	project varchar(20),
	eAddress varchar(20),
	DOB date,
	Gender varchar(20),

)

insert into EmployeeInfo values
(2, 'rahul','mahajan','admin','p2','mumbai', '10/10/1986','male'),
(3, 'sonia','banerjee','hr','p3','pune', '06/05/1983','female'),
(4, 'ankita','kapoor','hr','p4','chennai', '11/28/1983','female'),
(5, 'swati','garg','hr','p5','delhi', '04/06/1991','female'),
(12, 'rohit','gupta','admin','p1','delhi', '12/02/1979','male')

select *from EmployeeInfo


create table employeeposition
(
  empid int,
  empposition varchar(20),
  dateofjoining date,
  salary int,
  --constraint fke foreign key(empid) references EmployeeInfo(empid)
)

insert into employeeposition values (1,'executive','01/04/2020',75000),
(2,'manager','04/03/2020',500000),(3,'manager','04/02/2020',150000),
(2,'officer','04/02/2020',90000),(1,'manager','04/04/2020',300000)

select *from employeeposition
select *from EmployeeInfo

-- Create a query to generate the first records from the EmployeeInfo table.
select top 1 *from EmployeeInfo

--2. Create a query to generate the last records from the EmployeeInfo table.
select top 1 * 
from EmployeeInfo order by empid desc


--3. Create a query to fetch the third-highest salary from the EmpPosition table.
select *
from employeeposition e
order by e.salary desc
offset 2 rows
fetch next 1 row only

--4. Write a query to find duplicate records from a table.


--5. Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.
select e.empposition, sum(salary)
from employeeposition e 
group by empposition

--6. find the employee who has max salary
select top 1*
from employeeposition e
order by e.salary desc


--7 find the employee who has max salary from HR department
select top 1 e.*
from EmployeeInfo e, employeeposition e1
where department = 'hr'
order by e1.salary desc 


--8 find the age of each employee
--select  name,age,year(cast(GETDATE() as date))-age as'Birht year' from Employee
 select empfname, year(cast(GETDATE() as date)) - year(DOB) as 'emp age' from EmployeeInfo 

--9 display only female employee details
select *from EmployeeInfo where Gender = 'female'

--10 display employee whos position is executive
select e.*, ep.*
from EmployeeInfo e 
inner join employeeposition ep on e.empid = ep.empid
where ep.empposition = 'executive'

--11 display count of employee in each city
select eAddress, count(empid)
from EmployeeInfo e
group by e.eAddress