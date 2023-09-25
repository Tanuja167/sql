use regioncountryloctions

create table region
(
region_id int not null ,
region_name varchar(20),
primary key(region_id)
)

create table countries
(
   countryid int primary key,
   countryname varchar(20),
   region_id int,
   constraint fkr foreign key(region_id) references region(region_id)
)

create table locations
(
   locationid int primary key,
   street_address varchar(20),
   postal_code int,
   city varchar(20),
   state_province varchar(20),
   countryid int,
   constraint fkc foreign key(countryid) references countries(countryid)
)


