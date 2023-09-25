use BIKE_SHOWROOM

create table model
(
model_id int primary key,
model_name varchar(20),
cost int
)

insert into model values(1, 'Royal enfield', 70000),(2,'Honda',5000),(3,'yamaha',6000),(4,'KTM',5000)
,(5, 'suzuki', 9000)

create table customer
(
  cust_id int primary key,
  first_name varchar(20),
  last_name varchar(20),
  mobile_no numeric(10),
  gender varchar(20),
  email varchar(20)
)


insert into customer values(101, 'rutu', 'nimase', 7499177878, 'female', 'rutu@gmail.com'),
(102, 'bhakti', 'jare', 8975445348, 'female', 'bhakti@gmail.com'),(103, 'muskan','shaikh', 7869408720, 'female','muskan@gmail.com'),
(104, 'sagar', 'devkar', 9284754453, 'male', 'sagar@gmail.com'),(105, 'amar', 'joshi', 9763859607, 'male', 'amar@gmail.com')

create table paymentmode
(
paymentid int primary key,
payment_type varchar(20),
)

insert into paymentmode values(11,'online'),(22,'cash'),(33,'cheqe')

create table feedbackratring
(
  rating_id int primary key,
  rating varchar(20),
)
insert into feedbackratring values(5, 'excellent'),(4,'good'),
(3,'average'),(2,'bad'),(1,'complaint')

create table purchase
(
pur_id int,
cus_id int,
model_id int,
book_amount int,
payment_id int,
pur_date date,
rate_id int,
constraint cufk foreign key(cus_id) references customer(cust_id),
constraint mfk foreign key(model_id) references model(model_id),
constraint pfk foreign key(payment_id) references paymentmode(paymentid),
constraint ffk foreign key(rate_id) references feedbackratring(rating_id)
)

insert into purchase values(51, 105, 4, 3000, 33,'04/16/2021', 4 ),
(52, 101, 3, 5000, 11, '02/23/2020', 3),
(53, 103, 2, 6000, 22, '07/16/2019', 2),
(54, 101, 1, 7000, 33, '08/12/2018', 1),
(55, 104, 3, 2000, 22, '06/22/2022', 5)
insert into purchase values(55, 104, 3, 2000, 22, '06/22/2022', 5)


select *from model
select *from customer
select *from purchase
select *from paymentmode
select *from feedbackratring

--1.	1.WAQ to get the book amount for customers who made cash payment
select p.*, pm.* 
from purchase p
inner join paymentmode pm on p.payment_id = pm.paymentid
where payment_type = 'cash'
--------------------------------------------------------------------------------------------------

--2. 2.	Delete all the records of customer who have paid complete amount as that of bike cost.
select *from customer
select *from purchase
select *from model

select c.*, p.*, m.*, cost- book_amount as 'pendingcost'
from customer  c 
join purchase p on c.cust_id = p.cus_id
join model m on m.model_id = p.model_id
where cost- book_amount > 000
-------------------------------------------------------------------------------------------------------
--3.	Create an index to have faster retrival of data on the basis of booking_amount.
create index in_pu on purchase(book_amount)
-------------------------------------------------------------------------------------------------------

--4.	WAQ to change payment mode to cash for ‘activa5g’ purchased by customer with id 11. 
select p.*, m.*, pm.* 
from purchase p 
inner join  model m on m.model_id = p.model_id
inner join paymentmode pm  on pm.paymentid = p.payment_id
---------------------------------------------------------------------------------

--5.	Map where key is modelName and value is arraylist of ids of customers who purchased that model.

----------------------------------------------------------------------------------
--6.	Create a stored procedure to get the full name of customer whose cust_id is provided as input.

------------------------------------------------------------------------------------------------
--7.	WAQ to get the number of complaints registered for model activa 5G.
----------------------------------------------------------------------------------

--8.	WAQ to get all customer names who haven’t given ratings yet. 
select c.*, p.*, f.*
from customer c
join purchase p on c.cust_id = p.cus_id
join feedbackratring f on f.rating_id = p.rate_id



--9.	Delete all complaint records from purchase. 
-----------------------------------------------------------------------------
--10.	Update ratings given by Mr Vaibhav from good to excellent.

update feedbackratring set rating = 'bad' 
(
select cust_id from customer where first_name = 'sagar'
)


--11.	Reduce cost of all bikes for which rating is bad by 10%. 
----------------------------------------------------------------------------------
--12.	Write a to display highest selling model along with name and
--count 

