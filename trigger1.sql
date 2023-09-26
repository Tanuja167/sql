use UnionAndUnionAll

create table Customer
(
cname varchar(20),
city varchar(20),
cstate varchar(20)
)
insert into Customer values('Tanuja','ahmednagar','maharastra'),('rutuja','nagar','banglore'),
('alisha','nashik','Maharastra'),('chinmay','Dispur','Assam'),('pooja','Patna','Bihar')
insert into Customer values('Muskan','Gandinagar','Gujrat')


create table Supplier
(
sname varchar(20),
scity varchar(20),
sstate varchar(20)
)

insert into Supplier values('bhakti','Panaji','Goa'),('Muskan','Gandinagar','Gujrat'),
('sahil','ranchi','jharkhand'),('nehal','bhopal','madhya pradesh'),('namita','Imphal','Manipur')
insert into Supplier values('chinmay','Dispur','Assam'),('pooja','Patna','Bihar')

select *from Customer
select *from Supplier

select *
from Customer
union
select *
from Supplier

select *
from Customer
union All
select *
from Supplier