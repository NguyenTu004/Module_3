
use ProcuctStore;
create table product(
ProductID int not null auto_increment primary key,
Codee varchar(30) unique,
ProductName varchar(40),
ProductDate datetime,
amount int 
);
alter table product add price double; 

create table customer(
CustomerID int not null auto_increment primary key,
CustomerName varchar(50),
age int check (age between 0 and 120),
address varchar(60)
);

create table Orderr(
OrderID int not null auto_increment primary key,
OrderDate datetime,
CustomerID int not null,
foreign key (CustomerID) references customer (CustomerID)
);

create table orderDetail(
OrderID int not null,
ProductID int not null,
foreign key (OrderID) references Orderr (OrderID),
foreign key (ProductID) references product (ProductID),
quantity int ,
primary key (ProductID,OrderID)
);