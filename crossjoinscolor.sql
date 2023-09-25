create table color
(
  id int primary key,
  cname varchar(10)
)
insert into color values(1, 'red'),(2, 'white'),(3, 'black'),(4, 'white')


create table size
(
id int,
size varchar(20),
constraint f_k foreign key(id) references color(id)
)

insert into size values(1, 'l'),(2, 'xl'),(3,'m'),(4,'xll')

select *from color cross join size