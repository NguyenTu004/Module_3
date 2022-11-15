create database QuanLyHang;
use QuanLyHang;
create table NhaCC(
MaNCC int not null auto_increment primary key,
Ten varchar(40),
DiaChi varchar(40),
SDT varchar(40)
);
create table DonDH(
SoDH int not null auto_increment primary key,
MaNCC int not null,
NgayDH datetime,
foreign key(MaNCC) references NhaCC (MaNCC)
);
create table PhieuNhap(
SoPN int not null auto_increment primary key,
NgayNhap datetime,
DGNhap varchar(40),
SLNhap int
);
create table VatTu(
MaVT int not null auto_increment primary key,
SoDH int not null,
SoPN int not null,
TenVT varchar(40),
foreign key(SoDH) references DonDH (SoDH),
foreign key(SoPN) references PhieuNhap (SoPN)
);
create table PhieuXuat(
SoPX int not null auto_increment primary key,
MaVT int not null,
NgayXuat datetime,
DGXuat varchar(40),
SLXuat int,
foreign key(MaVT) references VatTu (MaVT)
);
