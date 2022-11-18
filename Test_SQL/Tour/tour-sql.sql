-- tạo database
create database tour_service;
use tour_service;

-- tạo bảng country
create table country (
id int auto_increment primary key,
country_name varchar(50) not null
);

-- tạo bảng location
create table location (
id int auto_increment primary key,
location_name varchar(50) not null
);

alter table location add column id_country int;
alter table location add constraint foreign key (id_country) references country(id);

-- tạo bảng employee
create table employee (
id int auto_increment primary key,
employee_name varchar(50) not null,
age int,
salary double not null
);

alter table employee add constraint demo check (age > 0 and age < 120);

-- tạo bảng customer
create table customer (
id int auto_increment primary key,
employee_name varchar(50) not null,
age int,
address longtext,
id_card varchar(12) not null unique
);

-- tạo bảng tour
create table tour (
id int auto_increment primary key,
tour_code varchar(5) not null unique,
price double not null,
day_of_tour int not null
);

alter table tour add column id_location int;
alter table tour add constraint foreign key (id_location) references location(id);

-- tạo bảng service
create table service (
id int auto_increment primary key
);

alter table service add column id_tour int;
alter table service add constraint foreign key (id_tour) references tour(id);
alter table service add column id_customer int;
alter table service add constraint foreign key (id_customer) references customer(id);
alter table service add column id_employee int;
alter table service add constraint foreign key (id_employee) references employee(id);