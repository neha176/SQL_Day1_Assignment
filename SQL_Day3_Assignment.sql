use day3

--1. Create a book table with id as primary key and provide the appropriate data type to other attributes.isbn no should be unique for each book
create table book(
id int identity(1,1) primary key,
title varchar(max),
author varchar(max),
isbn numeric(10) unique,
published_date datetime
)

insert into book values
('My First SQL book','Mary parker',6205231448,'2012-02-22 12:08:17.260'),
('My Second SQL book','John Mayer',7543907129,'1972-07-03 12:09:22.78'),
('My Third SQL book','Cary Flint',7742115784, '2015-10-18 14:08:05.19')

select * from book

-- 2. Write a query to fetch the details of the books written by author whose name ends with er.
select * from book where author like '%er'

create table review(
id int identity(1,1) primary key,
book_id int foreign key references book(id), 
reviewer_name varchar(30), 
content varchar(max), 
rating numeric(10), 
published_date datetime)

insert into review values
(1, 'John Smith', 'First review of john',4,'2017-12-10 12:08:10.290'),
(2,'John Smith', 'Second review',5,'1972-02-22 12:08:03.260'),
(3,'Alice waker', 'Third review',1,'2015-06-21 13:08:08.260')

select * from review
select * from book
drop table review

--3. Display the Title ,Author and ReviewerName for all the books from the above table
select title,author,reviewer_name from book b join review r on b.id=r.book_id

--4. Display the reviewer name who reviewed more than one book.
select reviewer_name from review group by reviewer_name having COUNT(reviewer_name)>1

create table Customer(
id int identity(1,1) primary key,
name varchar(20),  
age numeric(4), 
address varchar(max), 
salary numeric(10))

insert into Customer values
('Ramesh',32,'Ahmedabad',2000.00),
('Khilan',25,'Delhi',1500.00),
('Kaushik',23,'Kota',2000.00),
('Chaitali',25,'Mumbai',6500.00),
('Hardik',27,'Bhopal',8500.00),
('Komal',22,'MP',4500.00),
('Muffy',24,'Indore',10000.00)

select * from Customer

--4. Display the Name for the customer from above customer table who live in same address which has character o anywhere in address
select * from Customer where address in (select address from Customer where address like '%o%' group by address having count(address) > 1);

create table Orders(
Oid int identity(1, 1)primary key,
o_date datetime, 
customer_id int foreign key references Customer(id), 
amount numeric(10))

insert into Orders values
('2009-10-08 10:05:40',3,3000),
('2009-10-08 10:05:40',3,1500),
('2009-11-20 08:09:08',2,1560),
('2008-05-20 12:40:09',4,2060)

select * from orders
select * from Customer

--5. Write a query to display the Date,Total no of customer placed order on same Date.
select o_date,count(customer_id) as Total_customers from Orders group by o_date having count(o_date)>1

create table Employee(
id int identity(1,1) primary key,
name varchar(20),  
age numeric(4), 
address varchar(max), 
salary numeric(10))

insert into Employee values
('Ramesh',32,'Ahmedabad',2000.00),
('Khilan',25,'Delhi',1500.00),
('Kaushik',23,'Kota',2000.00),
('Chaitali',25,'Mumbai',6500.00),
('Hardik',27,'Bhopal',8500.00),
('Komal',22,'MP',NULL),
('Muffy',24,'Indore',NULL)

select * from Employee 

--6. Display the Names of the Employee in lower case, whose salary is null
select lower(name) as lname from employee where salary is null 

create table StudentDetails(
RegisterNo int primary key identity(2,1), 
Name varchar(20), 
Age numeric(5), 
Qualification varchar(10), 
MobileNo numeric(10), 
Mail_Id varchar(30),
Location varchar(20), 
Gender char)

insert into StudentDetails values
('Sai',22,'B.E',1111111111,'sai@gmail.com','Chennai','M'),
('Kumar',20,'B.E',9999999999,'kumar@gmail.com','Madurai','M'),
('Selvi',22,'B.E',7777777777,'selvi@gmail.com','Selam','F'),
('Nisha',25,'B.E',5555555555,'nisha@gmail.com','Theni','F'),
('SaiSaran',21,'B.E',3333333333,'saran@gmail.com','Madurai','F'),
('Tom',23,'B.E',8888888888,'tom@gmail.com','Pune','M')

select * from StudentDetails

--7. Write an sql server query to display the Gender,Total no of male and female from the above relation.
select gender,count(gender) as gender_count from StudentDetails group by gender

create table CourseDetails(
cid varchar(6) primary key ,
c_name varchar(20), 
start_date date, 
end_date date, 
fee Bigint)

insert into CourseDetails values
('DN003','DotNet','2018-02-01','2018-02-28',15000),
('DV004','DataVisulaisation','2018-03-01','2018-04-15',15000),
('JA002','AdvancedJava','2018-01-02','2018-01-20',10000),
('JC001','CoreJava','2018-01-02','2018-01-12',3000)

select * from  CourseDetails

create table CourseRegistration(
registerNo numeric(9) ,
cid  varchar(6) foreign key references CourseDetails(cid), 
batch varchar(4))

insert into CourseRegistration values
(2,'DN003','FN'),
(3,'DV004','AN'),
(4,'JA002','FN'),
(2,'JA002','AN'),
(5,'JC001','FN')

select * from CourseRegistration
select * from  CourseDetails

--8. Retrieve the CourseName and the number of student registered for each course between 2018-01-02 and 2018-02-28 and arrange the result by courseid in descending order
select c_name 'Course name', (select count(*) from CourseRegistration where cid = c.cid) 'Number of student registered' from CourseDetails c where start_date > '2018-01-02' and end_date <= '2018-02-28' order by cid desc

create table Customer1(
c_id int identity(1,1) primary key, 
first_name varchar(10), 
last_name varchar(10))

create table Order1(
order_id int identity(1,1) primary key, 
order_date date, 
amount numeric(10),	
c_id int foreign key references Customer1(c_id))



--9. Display the Firstname and LastName of the customer who have placed exactly 2 orders.
select * from Customer1 c where (select count(*) from Order1 where c_id = c.c_id)  = 2;

--10. Display all the student name in reverse order and Capitalize all the character in location
select Name, upper(Location) as 'Location' from StudentDetails order by name desc; 

create table Order2(
order_id int identity(1,1) primary key, 
order_date date, order_number numeric (20), 
amount numeric(10),	
c_id int foreign key references Customer1(c_id))

create table Product2(
id int identity(1,1) primary key,
product_name varchar(20),
supplierId numeric(20), 
unitPrice numeric(4), 
package varchar(10), 
isDiscontinued numeric(1))

create table OrderItem(
id int identity(1,1) primary key, 
orderId int foreign key references Order2(order_id), product_id int foreign key references Product2(id),
unitPrice numeric(4), 
quantity numeric(20))

--11. Create a view table to display the ProductName,ordered Quantity and OrderNumber from the above relatio
create view orderView as select product_name, quantity, order_number from Order2 o join OrderItem oi on o.order_id = oi.orderId join Product2 p on oi.product_id = p.id

--12. Display the Course Name registered by student Nisha
select c.c_name 'Course Name' from StudentDetails sd join CourseRegistration cr on sd.registerNo = cr.registerNo join CourseDetails c on cr.cid = c.cid where sd.name = 'Nisha'