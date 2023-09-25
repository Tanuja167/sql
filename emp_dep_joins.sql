use AllJoinsemployeedep


create table dep
(
   did int primary key,
   dep_name varchar(20),
   dlocation varchar(20),
   
)

insert into dep values(1, 'admin', 'pune'),(2, 'HR', 'mumbai'),(3, 'employee', 'nagar')
insert into dep values(4, 'manager', 'nashik')

create table emp2
(
   eid int,
   ename varchar(20),
   email varchar(20),
   esal numeric(10,2),
   did int
   constraint f_k foreign key(did) references dep(did)
   
)

insert into emp2 values(101, 'tanuja', 'tanuja@gmail.com', 20000, 1),
(102, 'rutuja', 'rutuja@gmail.com', 25000, 2),
(103, 'pooja', 'pooja@gmail.com', 30000, 2), (104, 'alisha', 'alisha@gmail.com', 35000, 3)
insert into emp2 (eid, ename, esal) values(105, 'bhakti', 40000)

select *from dep
select *from emp2

select *
from emp2 e inner join dep d on e.did = d.did

select *
from emp2 e left join dep d on e.did = d.did

select *
from emp2 e right join dep d on e.did = d.did

select *
from emp2 e full join dep d on e.did = d.did


select e1.ename 'Employee', e2.ename as 'Manager'
from emp2 e1 , emp2 e2
where e1.did=e2.did

--group by
--display count of emp in each dep
select eid,  did from emp2 

select did , count(eid) as 'count' from emp2
group by did 

--display depwise sum salary

select did, sum(esal)  from emp2 
group by did

--display dep wise avg sal

select did, avg(esal) from emp2
group by did

----------------------------------------------------------------
--subqueries

--display emp details who has max salary
select *from emp2 where esal =
(
select max(esal) from emp2
)


--display emp details who has second highest salary
select *from emp2 where esal = (
select max(esal) from emp2  where esal<>
(
select max(esal) from emp2
)
)

select *from dep
select *from emp2
-- display emp details who work in HR dept

select *from emp2 where did =
(
select did from dep where dep_name = 'hr'
)

---- display emp details who has less salary than Rahul
select *from emp2 where esal < 
(
select esal from emp2 where ename = 'alisha'
)

-- display the emp details who has less salary than the avg salary of all emps
select * from emp2 where esal<
(
select avg(esal) from emp2
)

----display the emp from dev dept who has less salary then the 
--avg salary of admin dept


select *from emp2 where esal < 
(
select avg(esal) from emp2 where did = (select did from dep where dep_name = 'admin')
)
and did = (select did from dep where dep_name = 'development')


--------------------------------------------------------------------------------
-- update the salary by 2000rs for emp who work in hr dept

update emp2 set esal = esal +2000 where did in
(
select did from dep where dep_name = 'hr'
)


-- delete the emp who work in admin dept

delete from emp2 where did in ( 
select did from dep where dep_name = 'admin'
)




