use trigger1
use employee


create table EmployeeTrack1
(
  id int primary key identity(1,1),
  ddescription varchar(500),
)

  alter table EmployeeTrack1 alter column ddescription varchar(max)


alter trigger tr_emp
on employee1 after insert
as begin
declare @empid int
declare @empname varchar(20)
declare @email varchar(20)
declare @emp_sal numeric(5,0)
select @empid = empid, @empname = empname, @email = email, @emp_sal=emp_sal from inserted
insert into EmployeeTrack1 values('new record'+cast(@empid as varchar(5))+ 'name'+@empname+ 'email ' +@email
+ 'sal' +cast(@emp_sal as varchar(10))+ 'added')
end

select *from employee1
select *from EmployeeTrack1

insert into employee1 values(106, 'tanuja', 'tanuja@gmail.com',30000)
select *from employee1


create table Main1
(
   id int,
   sal int,
)
insert into Main1 values(1, 10000)
insert into Main1 values(2, 20000)
insert into Main1 values(3,30000)
select *from Main1

create table Backup11
(
id int,
sal int,
)




