
use BOOKAUTHOR

create table author
(
  authorid int primary key,
  authorname varchar(20),
  ph_no int,
  email varchar(20),
 city varchar(20)
)
insert into author values(101,'r.s.mehta',98765432,'mehta@gmail.com','pune')
insert into author values(102,'s.more',944532,'more@gmail.com','pune')
insert into author values(103,'A.despande',55565432,'despande@gmail.com','pune')
insert into author values(104,'dr.kumar',98765432,'kumar@gmail.com','pune')

insert into author(authorid,authorname,ph_no) values(105,'r.prasad',8998)


create table awardmaster
( 
   awardtypeid int primary key,
   awardname varchar(20),
   awardprice int,
)
insert into awardmaster  values(111, 'ABCD', 5000), (222,'XYZ',6000),(333,'efg',7000),(444,'rstu',8000),
(555,'vwx',9000)

create table Book
(
    bookid int primary key, 
	auid int,
	bookname varchar(20),
	price int,
	constraint fkau foreign key(auid) references author(authorid)
)

insert into Book values(1,102,'python',8000)
insert into Book values(2,103,'java',9000)
insert into Book values(3,102,'dbms',8000)
insert into Book values(4,104,'csharp',8000)
insert into Book(bookid,bookname,auid) values(5,'csharp',104)
insert into Book(bookid,bookname) values(6,'java')

create table award
(
     awardid int,
	 awardtypeid int,
	 auid int,
	 bookid int,
	 yr int
	 constraint fkb foreign key(bookid) references Book(bookid),
	 constraint fka foreign key(awardtypeid) references awardmaster(awardtypeid),
	 constraint fkai foreign key(auid) references author(authorid)
)

insert into award values(11,222,101,2,7),(12,111,102,3,6),(13,333,101,4,5),(14,444,104,3,6)



select auid , count(bookid) as 'noof_book'
from Book 
group by auid 

select bookname 
from Book b
join author a on a.authorid = b.auid
where authorname = 's.more' 

select authorname from author a
inner join Book b on b.auid = a.authorid
where bookname = 'python'

select authorname from author a1
inner join award a on a.auid = a1.authorid
where yr = 6

select bookname from Book b
join award a on b.bookid = a.bookid

select authorname, count(awardid)
from author a 
inner join award a1 on a.authorid = a1.auid
group by authorname 
having count(awardid) = 1


--find the authorname who got oscaraward
select a.authorname 
from author a 
inner join award aw on a.authorid = aw.auid
inner join awardmaster am on am.awardtypeid = aw.awardtypeid
where awardname = 'abcd'

select * from awardmaster
select * from award

--find the author who got awardprice more than 7000
select a.authorname
from author a
inner join award aw on aw.auid = a.authorid
inner join awardmaster am on am.awardtypeid = aw.awardtypeid
where am.awardprice > 7000

--find author who got maximum awards
select a.authorname, count(awardid) as 'awardcount'
from author a 
inner join award aw on a.authorid = aw.auid
group by authorname 
order by  count(awardid) desc
offset 0 rows
fetch next 1 row only

--select top 1 a.authorname, count(awardid) as 'awardcount'
--from author a 
--inner join award aw on a.authorid = aw.auid
--group by authorname 
--order by  count(awardid) desc






select *from author
select *from Book
select *from awardmaster

select *from award