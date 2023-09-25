use Bank1

create table Bank
(
  bankid int primary key,
  bname varchar(20),
  bcity varchar(20),
  bstate varchar(20)
)

insert into Bank values(101, 'icici', 'pune', 'maharastra'),
(102, 'sbi', 'mumbai', 'maharastra'), (103,'BOB', 'hyderabadcity', 'hyderabad'),
(104, 'kotak', 'nagpur', 'maharastra'),(105, 'HDFC', 'ABC','Bihar'),
(106, 'government', 'XYZ','punjab')


create table customer
(
   cust_id int primary key,
   bankid int,
   constraint fkbc foreign key(bankid) references Bank(bankid)
)
insert into customer values(11, 101),(12, 103),(13, 102),(14, 102),(15,106)



create table Account_type
(
  acctype varchar(20),
  acctypeid int primary key
)
insert into Account_type values('saving', 1), ('current', 2),('fix',3),('salary',4),('saving',5)

create table Accounts
(
  accno int primary key,
  cust_id int,
  acctypeid int,
  balance int,
  constraint fkac foreign key(cust_id) references customer(cust_id),
  constraint fkat foreign key(acctypeid) references Account_type(acctypeid)

)
insert into Accounts values(8975, 11, 2, 3000), (9284, 13, 3, 4000),(9763, 14, 4, 2000),(1122, 13, 2, 5000)

create table transactiont
(
   transactonid int,
   accno int,
   amount int,
   ttransactiontype varchar(20),
   constraint fkacno foreign key(accno) references Accounts(accno)
)
insert into transactiont values(1, 8975, 6000,  'debit'), (2, 9284 , 5000, 'credit'),(2, 9763, 8000, 'debit'),
(1, 9763, 1000, 'credit' )

create table customer_master
(
 cust_id int,
 cname varchar(20),
 contact numeric(10),
 age int,
 pan_no numeric(10),
 constraint fkcm foreign key(cust_id) references customer(cust_id),
)

insert into customer_master values(12, 'tanuja', 9284408720, 21, 7789989),
(11, 'rutuja', 7817789999, 22, 6755565),(14, 'alisha', 9763859607, 27, 623443),
(11, 'janvi', 8975445348, 34,  465467),(13, 'eisha',7899177878, 33, 6436436),
(13, 'kiran', 8975445344, 31, 46673)





--1.	Find the no of accounts in saving account
select  a.acctype ,count(acctypeid) as 'cnt'
from Account_type a
group by a.acctype 
having a.acctype = 'saving'
-----------------------------------------------------------------------------------------

--2.	Display all bank name, cname , city from all  bank in ascending order of bankname  and desceding order of 
--city name
select b.bname,cm.cname, b.bcity  
from Bank b
inner join customer c on c.bankid = b.bankid
inner join customer_master cm on cm.cust_id = c.cust_id
order by b.bname, b.bcity desc 
------------------------------------------------------------------------------------------

--3.	Find the customer who has perform maximum number of transaction
select top 1 count(c.cust_id) as 'no of transaction', c.cname
from customer_master c
join Accounts a on c.cust_id = a.cust_id
join transactiont t on t.accno = a.accno
group by c.cust_id, c.cname order by count(c.cust_id)desc

----------------------------------------------------------------------------------------------

--4.	find the customers whose  balance is greater than avg balance of saving accounts.
select c.cname
from customer_master c
join Accounts a on a.cust_id = c.cust_id
join transactiont t on t.accno = a.accno
join Account_type ac on ac.acctypeid = a.acctypeid
having  a.balance > avg(a.balance)
-------------------------------------------------------------------------------------------------
--5.	find the amount , name of customer whose acc_no is 12345 /9763


select t.amount, c.cname
from customer_master c 
join Accounts a on a.cust_id = c.cust_id
join transactiont t on t.accno = a.accno
where a.accno = 9763
------------------------------------------------------------------------------------
--6.	display the customer name ,contact of customers whose account type is
--saving’ order by descending order of cname .
select c.cname, c.contact, ac.acctype
from customer_master c
inner join Accounts a on a.cust_id = c.cust_id
inner join Account_type ac on a.acctypeid = ac.acctypeid
where ac.acctype = 'current'
order by c.cname desc

--7.	display bank name , total balance of all customers in that bank of all banks in
--descending order of balance.
select b.bname, sum(balance) as 'total balnce'
from bank b 
join customer c on b.bankid = c.bankid
join Accounts a on a.cust_id = c.cust_id
group by (b.bname) 

select *from Bank
select *from Account_type
select *from Accounts
select *from customer
select *from transactiont
select *from customer_master



--cloning
select *into emp from Bank