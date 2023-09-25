
create table country
(
   cid int primary key,
   cname varchar(20),
)
insert into country values(97, 'india'),(92, 'pakistan'), (89, 'japan')
insert into country(cid) values(78)

select *from country

create table state1
(
 stid int primary key,
 sname varchar(20),
 cid int,
 constraint ccid foreign key(cid) references country(cid) 
)

insert into state1 values(101, 'maharastra', 97), (102, 'bihar', 89), (103, 'gujrat', 89)

select *from state1


create table city
(
  cityid int,
  cityname varchar(20),
  stid int,
  constraint cs foreign key(stid) references state1(stid),
)

insert into city values(111, 'nagar', 101), (112, 'nashik', 101),(113, 'pune',103 )
insert into city(cityid, cityname) values(114, 'mumbai')



--find country whose state is maharastra
select cname from country where cid = (select cid from state1 where sname = 'maharastra')

select cname from country c join state1 s on c.cid = s.cid where sname = 'maharastra'

--find country id, country name,  state maharastra and city is pune
select c.cid from country c 
inner join state1 s on s.cid = c.cid 
inner join city c1 on c1.stid = s.stid 
where s.sname = 'maharastra' and c1.cityname = 'pune'

--find state for col japan

--find city name from the country india
select c.cityname from city c 
inner join state1 s on s.stid = c.stid
inner join country c1 on c1.cid = s.cid
where c1.cname = 'india'

select *from city
select *from country
select *from state1

--find state name whose city anme pune
select s.sname from state1 s 
inner join city c on s.stid = c.stid where cityname = 'pune'

--find statename whos sid = 3
select sname from state1 where stid = 103

select c.* , s.*,cr.*
from city c  
inner join state1 s on s.stid = c.stid
inner join country cr on cr.cid = s.cid



























