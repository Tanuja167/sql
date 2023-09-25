use employee

create table dep1
( 
  did int primary key,
  dname varchar(20),
  dlocation varchar(20),
)
insert into dep1 values(11, 'admin', 'pune')
insert into dep1 values(12, 'employee', 'mumbai')
insert into dep1 values(13, 'manager', 'pune')


select *from dep1

create table employee1
(
eid int primary key, 
ename varchar(20),
salary int,
did int,
constraint d_fk foreign key(did) references dep1(did)

)

insert into employee1 values(101, 'tanuja', 65000, 11)
insert into employee1 values(102, 'rutuja', 65500, 12)
insert into employee1 values(103, 'alisha', 66000, 13)
insert into employee1 values(104, 'sagar', 66500, 11)
insert into employee1 values(105, 'pooja', 67000, 12)
insert into employee1 values(106, 'pooja', 67000, 12)
insert into employee1 values(107, 'pooja', 67000, 11)
insert into employee1 (eid, ename, salary)values(108, 'pooja', 67000)

select *from employee1
exec sp_help employee1

--cross join
select *from dep
select*from employee1
select *from dep1 cross join employee1 

--subquery find the depname for the ename="xyz"
select dname from dep1 where did = (select did from employee1 where ename = 'tanuja')

--find the employee who is workhing in hr dep
select  ename from employee1 where did = (select did from dep where dname = 'admin' )

select ename from employee1 , dep1  where dep1.did = employee1.did and dname = 'admin'

--select ename from employee where location is pune
select ename from employee1 , dep1 where dep.did = employee1.did and dlocation = 'pune'

select ename from employee1 where did = (select did from dep where dlocation = 'mumbai')


--inner join
select *from dep1
select*from employee1
select *from dep inner join employee1 on
dep.did = employee1.did


--left join
select *from employee1 e left join dep d
on e.did = d.did 

select *from dep d left join employee1 e
on d.did = e.did






select name from sys.tables
