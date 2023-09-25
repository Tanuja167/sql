use employee

create table employee1
(
    empid int primary key,
	empname varchar(20),
	email varchar(20),
	emp_sal numeric(5),
	
)

insert into employee1 values(101, 'tanuja', 'tanuja@gmail.com', 65000),
(102, 'rutuja', 'rutuja@gmail.com', 60000),(103, 'alisha', 'alisha@gmail.com', 50000),
(104, 'pooja', 'pooja@gmail.com', 45000)
insert into employee1(empid,empname,email, emp_sal) values(105, 'bhakti','bhakti@gmail.com', 30000)


select *from employee1

alter table employee1 add emp_city varchar(20)

alter table employee1 drop column emp_city


select email
from employee1

select e.empname, empid
from employee1 e
where  empid = 104

create table department
(
   did int primary key,
   empid int,
   dep_name varchar(20),
   constraint emfk foreign key(empid) references employee1(empid)
)
select *from department

insert into department values(11, 101, 'HR'), (12, 102, 'Admin'),(13,102,'manager'),(14, 103,'HR'),(15,105,'admin')
insert into department(did) values(104)

delete from department where did =104


-------------------------------------------------------
select e.*, d.did, d.dep_name
from employee1 e
join department d on e.empid = d.empid
--------------------------------------------------------------

select *from employee1
select *from department

select d.*, e.*
from employee1 e
right join department d on d.empid = e.empid 
order by did desc


select *from employee1

---view
create view employee_view1 as
select *from employee1

--fetch
select *from employee_view1 

--modify
alter view employee_view1 as
select empname, empid, emp_sal from employee1 where empid = (select empid from department where 
dep_name = 'HR')

--drop
drop view employee_view1
-------------------------------------------------------------------------
--cerate view
create view myview as
select *from employee1
---------------------------------------------------------------------------

--select/fetch view
select *from myview
---------------------------------------------------------------------------

create view myview2 as
select empid, empname from employee1

select *from myview2
-------------------------------------------------------------------------------

--modify view 
alter view myview2 as
select emp_sal,empid, empname  from employee1

select *from myview2
------------------------------------------------------------------------------

--drop view
drop view myview2