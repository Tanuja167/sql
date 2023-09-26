use Order_Product_User_JOINS
use employee

select *from Product

select pname, price,
case
when price > 40000 then 'expensive'
when price < 4000 then 'not expensive'
else 'average'
end as 'remark'
from Product


select empid, empname,
case
when emp_sal >40000 and emp_sal <90000 then 'hign salary'
when emp_sal >25000 and emp_sal <40000 then 'average salary'
else 'low salary'
end as 'remark'
from employee1

select *from employee1

select empid, empname,
case
when empid > 103 then 'highest record'
when empid < 103 then 'lowest record'
else 'medium record'
end as 'remark'
from employee1

