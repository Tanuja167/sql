use studentdatabase

create table student 
(
stuid int primary key ,
stname varchar(20),
scity varchar(20)

)

insert into student values(1,'ram','pune'),(2, 'sham','mumbai'),(3,'sita','pune'),(4, 'gita', 'nashik')




create table subjects
(
   subid int primary key,
   subname varchar(20),
   maxmarks int,
   passing int,
)

insert into subjects values(1, 'maths',100,40),(2, 'english',100,40),(3,'marathi',50,15),(4,'hindi',50,15)

create table exam
(
 stuid int,
 subid int,
 marks int,
 constraint spk foreign key(stuid) references student(stuid),
 constraint supk foreign key(subid) references subjects(subid)
)

insert into exam values(1,1,100),(1,2,85),(1,3,40),(1,4,45),(2,1,35),(2,2,55),(2,3,25),(3,1,95),(3,2,87),(3,3,45),(3,4,42)



select s.stuid, s.stname, su.subname, su.maxmarks, su.passing, e.marks
from student s 
inner join subjects su on s.stuid = su.subid
inner join exam e on e.subid = su.subid

select e.stuid, s.stname, sb.subname
from exam e 
left join student s on s.stuid = e.stuid
left join subjects sb on sb.subid = e.subid

select stuid, sum(marks) from exam
group by stuid
having marks>200


------------------------------------------------------------------
--1. insert a new student(sid =5, name=ramesh, city = hyderabad) into student table
insert into student values(5,'ramesh','hyderabad')
select *from student
-------------------------------------------------------------

--2. change city of sid= 4(gita) to sangli
update student set scity = 'sangli' where stuid=4

------------------------------------------------------------------
--3. returns list of all students with columns sid, name, and city
select s.stuid, s.stname, s.scity
from student s
--------------------------------------------------------------------

--4.returns list containing columns sid, name, subname, marks, maxmarks, percentage

select s.stuid, s.stname, su.subname, e.marks, su.maxmarks
from student s
inner join exam e on e.stuid = s.stuid
join subjects su on su.subid = e.subid
--------------------------------------------------------------------
 
 --5.returns list containing column sid, name, subname, marks, maxmarks, pass(return p if student has passed f if student has failed)

 ----------------------------------------------------------------------------------------------------------------------------------------------

 --6.returns list containing column sid, name, subname of student who were absent for the exam

 
select s.stuid, s.stname
from student s
left join exam e on e.stuid = s.stuid
join subjects su on su.subid = e.subid

select s.*
from student s
join exam e on e.stuid = s.stuid 

------------------------------------------------------------------------------

--7.return subject list with name of just the student who came first in that subject along
--with his/her marks. subid, subname marks, maxmarks

select *from student
select *from subjects
select *from exam
select su.subname                   --s.stuid, e.marks, su.maxmarks
from student s
join exam e on s.stuid = e.stuid
join subjects su on su.subid = e.subid
group by su.subname

----------------------------------------------------------------------



