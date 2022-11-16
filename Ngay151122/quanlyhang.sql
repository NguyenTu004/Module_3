
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
NgayNhap datetime
);
create table VatTu(
MaVT int not null auto_increment primary key,
TenVT varchar(40)
);
create table PhieuXuat(
SoPX int not null auto_increment primary key,
NgayXuat datetime
);
create table deltailDonDH(
SoDH int not null,
MaVT int not null,
foreign key(SoDH) references DonDH (SoDH),
foreign key(MaVT) references VatTu (MaVT),
primary key(SoDH,MaVT)
);
create table deltailPhieuNhap(
SoPN int not null,
MaVT int not null,
foreign key(SoPN) references PhieuNhap (SoPN),
foreign key(MaVT) references VatTu (MaVT),
primary key(SoPN,MaVT),
DGNhap varchar(40),
SLNhap int
);
create table deltailPhieuXuat(
SoPX int not null,
MaVT int not null,
foreign key(SoPX) references PhieuXuat (SoPX),
foreign key(MaVT) references VatTu (MaVT),
primary key(SoPX,MaVT),
DGXuat varchar(40),
SLXuat int
);
