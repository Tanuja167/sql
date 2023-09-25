use Worker_Bonus_Title



CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY,
	FIRST_NAME VARCHAR(25),
	LAST_NAME VARCHAR(25),
	SALARY INT,
	JOINING_DATE DATE,
	DEPARTMENT VARCHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '02/14/2020', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '06/14/2011', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '02/14/2020', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '02/14-2020', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '06/14/2011', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '06/14/2011', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '01/14/2001', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '04/14/2011', 'Admin');



----------------------------------
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATE,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
       
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '02/16/2020'),
		(002, 3000, '06/16/2011'),
		(003, 4000, '02/16/2020'),
		(001, 4500, '02/16/2020'),
		(002, 3500, '06/16/2011');

		
-------------------------------------------------------------

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE VARCHAR(25),
	AFFECTED_FROM DATE,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '02/20/2016'),
 (002, 'Executive', '06/11/2016'),
 (008, 'Executive', '06/11/2016'),
 (005, 'Manager', '06/11/2016'),
 (004, 'Asst. Manager', '06/11/2016'),
 (007, 'Executive', '06/11/2016'),
 (006, 'Lead', '06/11/2016'),
 (003, 'Lead', '06/11/2016');


 select *from Worker
 select *from Bonus
 select *from Title

 ---------------------------------------------------------------------------------------------------------------------

 --Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.
 select FIRST_NAME as 'worker_name'
 from Worker

 --Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
 select upper(FIRST_NAME) from Worker 

 --Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
 select distinct DEPARTMENT 
 from Worker

 --Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.
select SUBSTRING( FIRST_NAME,1,3)
from Worker

--Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.
select CHARINDEX('a',first_name) as matchposition from Worker where  FIRST_NAME = 'amitabh'

--Q-6. Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.
select RTRIM(FIRST_NAME)
from Worker

--Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.
select LTRIM(DEPARTMENT)
from worker

--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
select  distinct Len(DEPARTMENT) as 'length'
from Worker

--Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
select REPLACE(FIRST_NAME,'a', 'A') from Worker

--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. 
--A space char should separate them.
select Concat(FIRST_NAME,' ', LAST_NAME ) as 'COMPLETE NAME'
from Worker

--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select *from Worker 
order by FIRST_NAME

--Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select *from Worker 
order by FIRST_NAME, DEPARTMENT DESC

--Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
select *
from Worker
where FIRST_NAME in('vipul', 'satish')

--Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
select *
from Worker
where FIRST_NAME not in ('vipul', 'satish')

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select *
from Worker
where DEPARTMENT = 'Admin'

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select *
from Worker
where FIRST_NAME like '%a%'

--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select *
from Worker 
where FIRST_NAME like '%a'

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select *from Worker where FIRST_NAME like '_____h'

--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select *from Worker where SALARY between 100000 and 5000000

--Q-20. Write an SQL query to print details of the Workers who joined in Feb’2014.
select *from Worker where year(JOINING_DATE) = 2014 and MONTH(JOINING_DATE) = 2

--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(WORKER_ID)
from worker
where DEPARTMENT = 'admin'

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select CONCAT(FIRST_NAME,' ', LAST_NAME) as 'worker name'
from Worker
where SALARY between 50000 and 100000

--Q-23. Write an SQL query to fetch the no. of workers for each department in descending order.
select count(DEPARTMENT) as 'department count', DEPARTMENT
from worker
group by DEPARTMENT

--Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

select *from Worker
 select *from Bonus
 select *from Title

 --Q-26. Write an SQL query to show only odd rows from a table.


 --Q-27. Write an SQL query to show only even rows from a table.

 --Q-28. Write an SQL query to clone a new table from another table.
 select *into workercopy from Worker
 

 --Q-29. Write an SQL query to fetch intersecting records of two tables.

 --Q-30. Write an SQL query to show records from one table that another table does not have.

 --Q-31. Write an SQL query to show the current date and time.
 select GETDATE()

 --Q-32. Write an SQL query to show the top n (say 10) records of a table.

 --Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

 --Q-34. Write an SQL query to determine the 5th highest salary without using the TOP or limit method.
 select *from worker 
 order by SALARY desc 
 offset 4 rows 
 fetch next 1 row only

 --Q-35. Write an SQL query to fetch the list of employees with the same salary.
Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;

 --Q-36. Write an SQL query to show the second-highest salary from a table.
 select *from worker order by SALARY desc 
 offset 1 row
 fetch next 1 rows only

--Q-37. Write an SQL query to show one row twice in the results from a table.
select *from Worker
 select *from Bonus
 select *from Title



 --Q-38. Write an SQL query to fetch intersecting records of two tables.


 --Q-39. Write an SQL query to fetch the first 50% of records from a table.
 

 --Q-40. Write an SQL query to fetch the departments that have less than five people in them.
 select count(w.WORKER_ID), w.DEPARTMENT 
 from worker w
 group by w.DEPARTMENT
 having count(w.WORKER_ID) < 5

 --Q-41. Write an SQL query to show all departments along with the number of people in there.
 select count(*) as 'DEP wise cnt',  w.DEPARTMENT
 from worker w
 group by DEPARTMENT

 --Q-42. Write an SQL query to show the last record from a table.
 select top 1 *from worker order by WORKER_ID desc

 --Q-43. Write an SQL query to fetch the first row of a table.
 select top 1 *from worker

 --Q-44. Write an SQL query to fetch the last five records from a table.
 select top 5 *from worker w order by WORKER_ID desc

 --Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
 SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary 
 from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;

 
 --Q-46. Write an SQL query to fetch three max salaries from a table.
 select top 3 *from worker order by SALARY desc
  
 --Q-47. Write an SQL query to fetch three min salaries from a table.
 select top 3 *from Worker order by SALARY 

 --Q-48. Write an SQL query to fetch nth max salaries from a table.



 --Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
 select sum(SALARY) as 'department wise salary sum', DEPARTMENT
 from Worker
 group by DEPARTMENT

--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
 select top 1 with ties *from Worker order by SALARY desc