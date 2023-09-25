use HomeWork
create table customer
(
  city varchar(20),
  country varchar(20),
  cid int,
  postalcode int,
)

insert into  customer values('london','india',101 ,121110), ('berlin','china',102 ,121111),('london','japan', 103,121114),
('ABCD','norway',104 ,121113),('A.nagr','india', 105,121112),('china','china',106 ,121115),('london','america', 107,121110)
insert into  customer values('ABCD','norway',23 ,121113),('A.nagr','india', 105,121112)
insert into  customer values('berlin','norway',23 ,121110),('A.nagr','india', 105,121112)

select *from customer

--1.	Write a statement that will select the City column from the Customers table
select city from customer

--2.	Select all the different values from the Country column in the Customers table.
select distinct country from customer

--3.	Select all records where the City column has the value "London"
select *from customer where city = 'London'

--4.	Use the NOT keyword to select all records where City is NOT "Berlin".
select *from customer where city not in('berlin')
select *from customer where city <>'berlin'

--5.	Select all records where the CustomerID column has the value 23.
select *from customer where cid = 23

--6.	Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110.
select *from customer where city = 'berlin' and postalcode = 121110

--7.	Select all records where the City column has the value 'Berlin' or 'London'.
select *from customer where city = 'berlin' or city='london'
select *from customer where city in ('berlin', 'london')

--8.	Select all records from the Customers table, sort the result alphabetically by the column City.
select *from customer order by city

--9.	Select all records from the Customers table, sort the result reversed alphabetically by the column City.
select *from customer order by city desc

--10.	Select all records from the Customers table, sort the result alphabetically, first by the column Country, 
--then, by the column City
select *from customer order by country, city

--11.	Select all records from the Customers where the PostalCode column is empty.
select *from customer where postalcode is null

--12.	Select all records from the Customers where the PostalCode column is NOT empty.
select *from customer where postalcode is not null

--13.	Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".
update customer set city = 'oslo' where country='norway'
select *from customer

--14.	Delete all the records from the Customers table where the Country value is 'Norway'.
delete from customer where country='norway'

--20.	Select all records where the value of the City column starts with the letter "a".
select *from customer where city like 'a%'

--21.	Select all records where the value of the City column ends with the letter "a".
select *from customer where city like '%a'

--22.	Select all records where the value of the City column contains the letter "a".
select *from customer where city like '%a%'

--23.	Select all records where the value of the City column starts with letter "a" and ends with the letter "b".
select *from customer where city like 'a%b'

--24.	Select all records where the value of the City column does NOT start with the letter "a".
select *from customer where city not like 'a%'

--25.	Select all records where the second letter of the City is an "a".
select *from customer where city = '_a%'

--26.	Select all records where the first letter of the City is an "a" or a "c" or an "s".
select *from customer where city like '[acs]%'

--27.	Select all records where the first letter of the City starts with anything from an "a" to an "f".
select *from customer where city like '[a-f%]'

--28.	Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".
select *from customer where city not like'[acf]%'

--29.	Use the IN operator to select all the records where the Country is either "Norway" or "France".
select *from customer where country in('norway', 'france')

--30.	Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".
select *from customer where country not in ('norway','france')

--33.	Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically
--between 'Geitost' and 'Pavlova'.

--34.When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.
select postalcode as 'pno' from customer

--35.	When displaying the Customers table, refer to the table as Consumers instead of Customers.

--36.	List the number of customers in each country.
select *from customer
select c.country , count(cid) as 'no of customers'
from customer c
group by country

--37.	List the number of customers in each country, ordered by the country with the most customers first.
select c.country, count(cid) as 'no of customers'
from customer c
group by country order by count(cid) desc

--38.	Write the correct SQL statement to create a new database called testDB.
create database testDB

--39.	Write the correct SQL statement to delete a database named testDB
drop database testDB

--40.	Add a column of type DATE called Birthday in Persons table

--41.	Delete the column Birthday from the Persons table





