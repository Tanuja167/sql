use builtinfunctions
use employee

-- addition of 2 numbers using SQL function
-- scalar function
create function addition(@a int,@b int)
returns int
as begin
--declare variable in SQL
declare @c int
-- code to exe
set @c=@a+@b
return @c
end

--addition of 2 numbers using SQL function
--scalar function
create function addition(@a int, @b int)
returns int
as begin
--declare variable in sql
declare @c int 
--
set @c = @a + @b
return @c
end

--database object
select dbo.addition(10,20) as 'sum'

--scalaer function
create function GetEmpName1(@id int)
returns varchar(20)
as begin
return( select empname from employee1 where empid=@id)
end

select dbo.GetEmpName1(3) as 'Emp name'

-- multi value function begin & end keyword not need to write

create function GetEmpByDept(@empid int)
returns table
as
return (select * from employee1 where empid=@empid)


select * from dbo.GetEmpByDept(103)

-------------------------------------------------------------------------------------------

create table product1
( 
id int,
pname varchar(20),
pprice int,
)

insert into product1 values(111, 'laptop', 50000),(222, 'mobile', 40000),(333,'Macbook', 100000)
select *from product1

create function discountprice1(@pprice int)
returns decimal
as begin

declare @dp decimal
set @dp = @pprice - (@pprice * 0.1)
 return @dp 
 end

 select pprice,  dbo.discountprice1(pprice) as 'discount price' from product1


