create database adept;

use adept;
create table dresses (
	id INT primary key,
    NAME VARCHAR(100),
    description varchar(200),
	price float
);

select * from dresses;
select id, name from dresses;
Delete from dresses where id in(1,2,3,4,5,6);


Insert into dresses (id, name, description, price) value (1, "Maxi", "Long gown dress", 40.50);
Insert into dresses (id, name, description, price) value (2, "Top", "Long gown dress", 50.50);
Insert into dresses (id, name, description, price) value (3, "Skirt", "Long gown dress", 50.50);
Insert into dresses (id, name, description, price) value (4, "Plazo", "Short Plazo", 20.44);
Insert into dresses (id, name, description, price) value (5, "Shirt", "Long Shirt", 10.50);
Insert into dresses (id, name, description, price) value (6, "Trouser", "Lined Trouser", 20.44);

Select * from Dresses where description like "%long%";

Select * from dresses order by description desc LIMIT 2;


select min(price) from dresses;
select count(*) from dresses;
select avg(price) from dresses;
select sum(price) from dresses;

select * from dresses where name in ("Maxi", "Top", "Skirt"); 

select * from dresses where price between 45.00 AND 55.60;

select name as dress_name from dresses; 

select * from dresses where name in ("Maxi", "Top", "Skirt") OR price>=50.40; 

select * from dresses where name NOT in ("Maxi", "Top", "Skirt");

select DISTINCT description FROM dresses;

Select min(price), name from dresses group by name;

select count(DISTINCT price) from dresses;

create table Dept (
	id INT primary key,
    NAME VARCHAR(100),
    location varchar(200)
);

select * from Dept;



Create table Employee (
	id INT Primary Key ,
    name VARCHAR(100),
    location varchar(200),
    deptId int references Dept(id)
);
select * from employee;


Insert into Employee (id, name, location, deptId) values (1, "Preeti", "Sterling", 10);
Insert into Employee (id, name, location, deptId) values (2, "Mangal", "Broadlands", 20);
Insert into Employee (id, name, location, deptId) values (3, "Nate", "Fairfax", 20);
Insert into Employee (id, name, location, deptId) values (4, "Haida", "Loudoun", 30);

select * from dept;

Insert into Dept (id, name, location) values (10, "HR", "Virginia");
Insert into Dept (id, name, location) values (20, "Developement", "Marylnd");
Insert into Dept (id, name, location) values (30, "Quality Assurance", "Ohio");
Insert into Dept (id, name, location) values (40, "Research", "NewYork");

Select e.id as EmployeeID, e.name as EmployeeName, d.name as DeptName, e.location as EmployeeAddress from Employee e, dept d where e.deptid=d.id and d.Id=20;

Alter table Employee add salary double;

Alter table Employee Add constraint un_constraint Unique(name, location);

desc Employee;








 