create table product1
(
pid int,
pname varchar(20),
price int,
company varchar(20),

)

select *from product1

insert into product1 values(1, 'laptop', 45000, 'dell'), (2, 'macbook', 95000, 'XYZ'),
(3, 'pen', 100, 'renyold'),(4,'pencil',200, 'apsara')

select *from product1 where price<2000

select *from product1 where company= 'dell'

select *from product1 where price between 40000 and 100000

select distinct company from product1

select *from product1 where company in('dell', 'XYZ')
