
--like clause


create table employee
(
ename varchar(20),
email varchar(20),
eage int,
esal int,
)

insert into employee values('tanuja', 'tanuja@gmail.com', 21, 65000),('rutu', 'rutu@gmail.com', 23, 65500),
('alisha', 'alisha@gmail.com', 25, 70000), ('pooja', 'pooja@gmail.com', 18, 40000)

insert into employee values('bhakti', 'bhakti@gmail.com', 26, 35000),('arti', 'arti@gmail.com', 29, 46000),
('sagar', 'sagar@gmail.com', 32, 70000), ('chinmay', 'chinmay@gmail.com', 25, 45000)


insert into employee values('samyug', 'samyug@gmail.com', 26, 65800),('amar', 'amar@gmail.com', 23, 33000),
('muskan', 'muskan@gmail.com', 25, 70060), ('prasad', 'prasad@gmail.com', 22, 46000)


select *from employee

select *from employee where ename like 'tanuja'

select *from employee where ename like 'a%'

select *from employee where ename like '%a'

select *from employee where ename like '%a%'

select *from employee where ename like '[a-g]%'

select *from employee where ename like '%[a-g]'

select *from employee where ename like 't_____'

select *from employee where ename like '__o__'

