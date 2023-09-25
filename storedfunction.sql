use STOREDPRO
use employee

select *from employee1

alter procedure emp_proc
as begin
select *from employee1 
return
end

exec emp_proc



create proc emp_proc1
as begin
select max(emp_sal) from employee1
end

exec emp_proc1

drop PROCEDURE if EXISTS emp_proc

create proc Add_proc
@num1 int,
@num2 int,
@result int output
as begin
set @result = @num1 + @num2
end
go

declare @ans int
exec Add_Proc @num1 = 4, @num2 = 10, @result = @ans output 
select @ans as additon

