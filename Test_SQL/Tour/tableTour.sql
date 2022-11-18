
use quanlydulich;
create table country(
CountryID int not null auto_increment primary key,
CountryName varchar(50)
);
create table Location(
LocaID int not null auto_increment primary key,
LocaName varchar(60),
CountryID int not null,
foreign key (CountryID) references country (CountryID)
);
create table Tour(
TourID int not null auto_increment primary key,
Price double,
Days int,
LocaID int not null,
foreign key (LocaID) references Location (LocaID)
);
create table Customer (
CusName varchar(40),
Age int,
Address varchar(50),
cccd int not null primary key
);
create table Employee (
EmplID int not null auto_increment primary key,
EmpName varchar(50),
EmplAge int,
Wage double
);
create table Service (
TourID int not null,
cccd int not null,
EmplID int not null,
foreign key (TourID) references Tour (TourID),
foreign key (cccd) references Customer (cccd),
foreign key (EmplID) references Employee (EmplID),
primary key(TourID,cccd,EmplID)
);