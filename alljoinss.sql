use ALLJOINS3

create table user3
(
  uname varchar(20),
  uuid int primary key,
  ucity varchar(20),
)

insert into user3 values('tanuja', 1, 'nagar'), ('rutuja', 2, 'pune'), ('pooja', 3, 'mumbai')
insert into user3 (uname, uuid) values('bhakti', 4)
select *from user3

create table product
(
 pid int primary key,
 pname varchar(20),
 price int,
)

insert into product values(101, 'ABC', 1000),(102,'def', 2000),(103, 'xyz', 3000)
insert into product (pid) values(104)
select *from product

create table order2
(
   oid int,
   pid int,
   uuid int,
   constraint pdf foreign key(pid) references product(pid),
   constraint prf foreign key(uuid) references user3(uuid)
  )

  insert into order2 values(11, 101, 1), (12, 102, 2), (13, 101, 2), (14, 103, 3)
  insert into order2 (oid, pid) values(15,102)
  insert into order2 (oid, uuid) values(16, 2)
  select *from order2

  --inner join
  select o.*, u.*, p.*
  from order2 o
  inner join user3 u on u.uuid = o.uuid
  inner join product p on p.pid = o.pid

  --left join
  select o.*, u.*, p.*
  from order2 o 
  left join user3 u on u.uuid = o.uuid
  left join product p on p.pid = o.pid

  --right join
  select o.*,u.*, p.*
  from order2 o
  right join product p on p.pid = o.pid
  right join user3 u on u.uuid = o.uuid
  