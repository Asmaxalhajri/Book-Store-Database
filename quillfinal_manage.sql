use quillFinal;
create table Employee(ID int not null, Fname Varchar(50) null,Lname Varchar(50) null, 

Gender char(1) null, Salary int null, Phone int null, BOD date null, Address varchar(50), 

Super_ID int null, BR_ID int not null, primary key (ID),

Constraint Gender_check CHECK (Gender IN ('F','M'))

);

Alter table employee
 ADD foreign key (Super_ID) references employee (ID) ON DELETE CASCADE ON UPDATE CASCADE;

Alter table employee
ADD foreign key (BR_ID) references Branch (Branch_ID)ON DELETE CASCADE ON UPDATE CASCADE;

insert into Employee values(001, 'Daniel','Alexander','M',12000000,050455993,'1979-11-28',

'LA',1,011);

insert into Employee values(002, 'chris','Lake','M',75000000,050310065,'1979-05-05',

'LA',001,020);

insert into Employee values(003, 'Nicole','Abbatiello','F',32000000,050785922,'1982-06-12',

'LA',002,012);

insert into Employee values(004, 'Elizabeth','Bullerman','F',50000000,050356763,'1980-07-02',

'new york',003,013);

insert into Employee values(005, 'Jacob','Baker','M',12000000,050682993,'1983-11-11',

'chicago',004,014);

insert into Employee values(006, 'Andrew','Barnes','M',15000000,050583759,'1979-04-13',

'japan',5,015);

insert into Employee values(007, 'June','Adam','F',20000000,050274655,'1985-07-28',

'french',006,016);

insert into Employee values(008, 'Michael','Hope','F',45000000,050733461,'1958-03-22',

'LA',7,017);

insert into Employee values(009, 'Isabell','Kalani','F',14000000,050667378,'1945-01-04',

'new york',008,018);

insert into Employee values(010, 'Noah','Hunter','M',34000000,050174660,'1985-09-03',

'cuba',009,019);



create table Customer(Ssn int not null, Fname Varchar(50) null,Lname Varchar(50) null, 

Gender char(1) null, Phone int null, Age int null, Region Varchar(50) null, City varchar(50), 

Control_Emp_ID int not null, primary key (Ssn),

Constraint Gender_check_cus CHECK (Gender IN ('F','M'))
);

Alter table Customer

ADD foreign key (Control_Emp_ID) references employee (ID) ON DELETE CASCADE ON UPDATE CASCADE;

insert into Customer values(011, 'chris','Lake','M',050310065,25,'west',

'italy',001);

insert into Customer values(012, 'Tyler','Lobodzinski','M',050674463,35,'south',

'LA',005);

insert into Customer values(013, 'chris','Lake','M',050684456,23,'east',

'Canada',006);

insert into Customer values(014, 'Paige','Thomas','F',050112736,33,'south',

'chicago',003);

insert into Customer values(015, 'Grace','Palmer','F',050337582,45,'west',

'paris',002);

insert into Customer values(016, 'Anne','Russell','F',050997841,55,'north',

'london',008);

insert into Customer values(017, 'Nikolas','Scancarello','M',050364779,35,'north',

'italy',007);

insert into Customer values(018, 'James','Rowand','M',050475613,38,'south',

'new york',010);

insert into Customer values(019, 'Sofia','Vasquez','F',050884624,20,'east',

'cuba',004);

insert into Customer values(020, 'Eric','Watson','M',050193841,40,'east',

'london',009);

create table Branch (Branch_ID int not null, Region Varchar(50) null, City varchar(50), 

Mgr_ID int not null, primary key (Branch_ID), 

foreign key (Mgr_ID) references employee (ID)

ON DELETE CASCADE ON UPDATE CASCADE);

insert into Branch values(01,'south','new york',006);

insert into Branch values(02,'east','LA',005);

insert into Branch values(03,'west','chicago',002);


create table Books (ISBN int not null, Title Varchar(50) null, Author varchar(50), 

Version int null,Price int null, primary key (ISBN));

insert into Books values(0143034901,'The Shadow of the Wind','Carlos Ruiz Zafón',1,20);

insert into Books values(0099554798,'The Night Circus','Erin Morgenstern',1,30);

insert into Books values(0749707232,'The Little Prince','Antoine de Saint-Exupéry',1,40);

insert into Books values(1401322786,'The Time Keeper','Mitch Albom',1,50);

insert into Books values(0765376474 ,'A Gathering of Shadows','V.E. Schwab',2,60);

insert into Books values(0007119291,'The ABC Murders','Agatha Christie',13,66);

insert into Books values(1509889175,'If Cats Disappeared from the World','Genki Kawamura',1,99);

insert into Books values(1471407365,'The Wicked King','Holly Black',2,100);

insert into Books values(1250157668,'Finale','Stephanie Garber',3,45);

insert into Books values(0062362224,'Peter Pan','J.M. Barrie',1,33);

create table Books_Type(BookType Varchar(50) not null, B_ISBN int not null,primary key (BookType,B_ISBN), 

foreign key (B_ISBN) references Books (ISBN)

ON DELETE CASCADE ON UPDATE CASCADE);

insert into Books_Type values('Horror',0143034901);

insert into Books_Type values('Spanish Literature',0143034901);

insert into Books_Type values('Magical Realism',0099554798);

insert into Books_Type values('Historical Fiction',0099554798);

insert into Books_Type values('Classics',0749707232);

insert into Books_Type values('Contemporary',1401322786);

insert into Books_Type values('Fantasy',0765376474);

insert into Books_Type values('Mystery',0007119291);

insert into Books_Type values('Japanese Literature',1509889175);

insert into Books_Type values('Fiction',1509889175);

insert into Books_Type values('Fantasy',1471407365);

insert into Books_Type values('Fantasy',1250157668);

insert into Books_Type values('Classics',0062362224);

create table Dependent (Emp_ID int not null, Fname Varchar(50) not null,Lname Varchar(50) null,

Gender char(1) null,BOD date null,Relationship Varchar(50) null,primary key (Emp_ID,Fname),foreign key (Emp_ID) references Employee (ID)

ON DELETE CASCADE ON UPDATE CASCADE);

insert into Dependent values(005,'Ryan','Baker','M','1955-05-03','son');

insert into Dependent values(004,'Christopher','Bullerman','M','1955-05-03','son');

insert into Dependent values(003,'Richard','Abbatiello','M','1955-05-03','brother');

insert into Dependent values(001,'Amanda','Alexander','F','1955-05-03','sister');

insert into Dependent values(007,'Rachel','Adam','F','1955-05-03','daughter');

insert into Dependent values(006,'William','Barnes','M','1955-05-03','Son');

insert into Dependent values(008,'Ashley','Hope','F','1955-05-03','daughter');

insert into Dependent values(009,'Caleb','Kalani','M','1955-05-03','brother');

insert into Dependent values(010,'Isabella','Hunter','F','1955-05-03','sister');

insert into Dependent values(002,'Zoey','Lake','F','1955-05-03','daughter');

create table Manage (Emp_ID int not null, B_ISBN int not null, primary key (Emp_ID,B_ISBN), 

foreign key (Emp_ID) references employee (ID),foreign key (B_ISBN) references Books (ISBN)

ON DELETE CASCADE ON UPDATE CASCADE);

insert into Manage values(003,0143034901);

insert into Manage values(001,0099554798);

insert into Manage values(002,0749707232);

insert into Manage values(005,1401322786);

insert into Manage values(008,0765376474);

insert into Manage values(007,0007119291);

insert into Manage values(006,1509889175);

insert into Manage values(004,1471407365);

insert into Manage values(009,1250157668);

insert into Manage values(010,0062362224);

create table Orders(Cust_Ssn int not null, B_ISBN int not null, Quantity int null, 

Odate date null, primary key (Cust_Ssn,B_ISBN), 

foreign key (Cust_Ssn) references Customer (Ssn),foreign key (B_ISBN) references Books (ISBN)

ON DELETE CASCADE ON UPDATE CASCADE);

insert into Orders values(011,0143034901,1,'2021-04-01');

insert into Orders values(012,0099554798,1,'2021-04-02');

insert into Orders values(013,0749707232,1,'2021-04-15');

insert into Orders values(018,1401322786,1,'2021-03-25');

insert into Orders values(014,0765376474,1,'2021-02-17');

insert into Orders values(016,0007119291,1,'2021-03-01');

insert into Orders values(017,1509889175,1,'2021-01-25');


insert into Orders values(014,0062362224,1,'2021-04-02');

insert into Orders values(015,1250157668,1,'2021-04-02');

insert into Customer values(55, 'sami','ali','M',null ,23,'east',

'Canada',006);
##DML language##
#1) insert 
Insert into Books(  ISBN,Title,Author, Version, Price)
Values (16485616, ' The Brain :The story of you ' ,' David Eagleman',1,30);

#2) update
Update Employee 
Set salary=5500000
Where ID=003;

# 3) delete
Delete from  Books where ISBN= 16485616   ;

##SIMPLE QUERY##

# 1) is Null
Select *
From Customer
Where Phone IS NULL;

# 2) Between
Select *
From Employee
 Where   Salary between   12000000 and  15000000;
 
 # 3) Order by 
 Select *
From Customer
Order by Fname ASC;

# 4) LIKE operator:
select Fname,Lname
from employee
where fname lIKE 'D%';

# 5) Not IN
select * from customer
where City not in ('Canada','london','italy');



##COMPLEX QUERY##

# 1) Group by 
Select gender ,avg(salary) as Average_salary 
From EMPLOYEE
GROUP BY gender;

# 2) Difference 
SELECT * FROM customer
WHERE NOT EXISTS (SELECT * FROM Orders WHERE Cust_Ssn =Ssn);  

# 3) Having
select fname , lname 
from customer , orders 
where SSN=CUST_SSN
GROUP BY CUST_SSN
HAVING count(*)>1;

# 4) comparison Queries(ALL) 
SELECT ALL Title , price
FROM books
WHERE price<50;


# 5) Aggregation(CONT)
Select count(ISBN)
From BOOKS;


# 6) join: show the book name and book type 
SELECT title ,BookType
FROM books JOIN BOOKS_TYPE ON ISBN=B_ISBN;

# 7) Trigger
create trigger name_upercase 
before insert on employee for each row
set new.Fname=upper(new.Fname);

insert into employee
values(012, 'asma','alhajri','F',32000000,050785922,'2000-03-7',
'LA',2,012);

# 8) view
create view Branch_employee AS
select *
from employee
where BR_ID=12;

delete from orders
where Cust_Ssn=20;

# 9) Flow control IF statment 
select ID , gender, if(salary>15000000,"More","less") 
from employee;

# 10) Calculate derived value employee age 
select ID,Fname,Lname,timestampdiff(year,BOD,curdate()) AS age 
from employee;

# 11) Calculate derived value dependent age  
select Emp_ID,Fname,Lname,timestampdiff(year,BOD,curdate()) AS age 
from dependent;
