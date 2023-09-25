--DDL Commands

create table employee
(
ename varchar(10),
eid int,
email varchar(20),
eage int,
)

--insert
insert into employee values('tanuja',101 , 'tanuja@gmail.com', 21),
('rutuja', 102, 'rutuja@gmail.com', 23)

--update
update employee set eage=27 where ename='rutuja'

--delete(remove one/more rows from table)
delete from employee where ename = 'tanuja'

select *from employee