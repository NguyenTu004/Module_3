create database quanlybanhang;
use quanlybanhang;
create table customer(
cID int not null auto_increment primary key,
cName varchar(40),
cAge int
);
create table orderr(
oID int not null auto_increment primary key,
cID  int not null,
oDate datetime,
oTotalPrice double,
foreign key(cID)references  customer (cID)
);
create table product(
pID int not null auto_increment primary key,
pName varchar(40),
pPrice double
);
create table orderDetail(
oID int not null,
pID int not null,
odQTY varchar(20),
foreign key(oID) references orderr (oID),
foreign key(pID) references product (pID),
primary key(oID,pID)
);

