use DP6TITANS1

create table student 
(
  sname varchar(20),
  rid int,
  spercentage int,
  city varchar(20),
  dob int,
)

--add column
alter table student add country varchar(20)

insert into student values('tanuja', 10, 81, 'nagar', 16072002, 'india')
insert into student values('rutuja', 11, 83, 'mumbai', 17012001, 'india')


--drop column
alter table student drop column country

--rename column
exec sp_rename 'student.sname', 'studentname'

select *from student

