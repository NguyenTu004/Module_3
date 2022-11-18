
create database QuanLyBanHang;
create table Customer(
CustomerID int auto_increment not null primary key,
CustomerName varchar(50) not null,
CustomerAge int
);

create table Oder(
OderID int auto_increment not null primary key,
CustomerID int not null,
foreign key (CustomerID) references Customer(CustomerID),
OderDate datetime,
OderTotalPrice double
);

create table Product(
ProductID int auto_increment not null primary key,
ProductName varchar(50),
ProductPrice double
);
create table OderDetail(
OderID int not null,
foreign key (OderID) references Oder(OderID),
ProductId int not null,
foreign key (ProductID) references Product(ProductId),
primary key(OderID, ProductID),
OderQuantity int 
);
insert into customer (CustomerName, CustomerAge)
VALUES  ("Minh Quan",10),
        ("Ngoc Oanh",20),
        ("Hong Ha",50);
       
insert into oder (CustomerID, OderDate, OderTotalPrice)
VALUES  (1,'2006-03-21',null),
        (2,'2006-03-21',null),
        (1,'2006-03-16',null);
       
insert into product (ProductName, ProductPrice)
VALUES  ("May giat",3),
		("Tu Lanh",5),
		("Dieu Hoa",7),
		("Quat",1), 
		("Bep Dien",2);
        
insert into oderdetail (OderID,ProductID,OderQuantity )
VALUES  (1,1,3),
		(1,3,7),
		(1,4,2),
		(2,1,1),
		(3,1,8),
		(2,5,4),
		(2,3,3);

select * from customer;
select * from oder;
select * from product;
select * from oderdetail;


-- 1.AND được dùng để kiểm tra 2 hoặc nhiều điều kiện .
select * from  oder 
where CustomerID = 1 and day(OderDate) > 20; 

-- 2.OR được dùng để kiểm tra nhiều điều kiện xem có bản ghi nào đáp ứng được 1 trong những điều kiện đó hay không
select * from  oder 
where CustomerID = 3 or day(OderDate) > 20; 

-- 3.NOT dùng để phủ định một điều kiện trong mệnh đề WHERE 
select * from  oder 
where not (CustomerID = 1 and day(OderDate) > 20); 

-- 4.IN cho phép chúng ta liệt kê một tập hợp các giá trị có thể có của một cột cụ thể.
select customer.CustomerName, customer.CustomerID from customer
where customer.CustomerID not in(select oder.CustomerID from oder);


-- 5.IS NULL được dùng để kiểm tra giá trị NULL.
select * from oder where OderTotalPrice is not null;


--  6.BETWEEN được dùng để lấy dữ liệu trong một khoảng
select * from oder where  OderDate between '2006/03/17' and '2006/03/30' ;

select * from oder where  OderID between 2 and 3 ;

--  7.AS được dùng để gán tên mới tạm thời cho một 
 select oder.OderTotalPrice as Total from oder;

 select oderdetail.OderID, oderdetail.ProductId, sum(oderdetail.OderQuantity) as SumQuantity from oderdetail
 group by oderdetail.OderID;
 
--  8.LIKE  được dùng để so sánh một giá trị với các giá trị tương ứng 
	select * from product 
   --  	where ProductName LIKE 'd%' ;   -- Bắt đầu
    --  where ProductName LIKE '%t' ;   -- Kết Thúc
   -- where ProductName LIKE '%a%';     -- Bất kì vị trí nào
     -- where ProductName LIKE 'm_%';   -- Bắt đầu bằng 'm' ít nhất có số kí tự cộng thêm số lượng dấu "_"
    where ProductName LIKE 'd%a';       -- Bắt đầu băng "d" vừ kết thúc bằng "a"
   
--  9.LIMIT để giới hạn kết quả trả về, lấy một số dòng đầu tiên hoặc tập hợp nhỏ liên tiếp
		select * from product 
        where ProductName like "%a%"
        limit 2,1;
        
--  10.FROM  được dùng để liệt kê các bảng cần thiết trong truy vấn  
	select ProductID, ProductName from product;
    

--  11.EXISTS được dùng để kiểm tra một lệnh truy vấn con, nếu lệnh truy vấn con trả về ít nhất một hàng (bản ghi)
--  thì lệnh EXISTS sẽ trả về giá trị TRUE, còn nếu không thì lệnh EXISTS sẽ trả về giá trị FALSE.


select * from customer 
where exists(select * from oder where oder.CustomerID = customer.CustomerID );

select * from customer 
where not exists(select * from oder where oder.CustomerID = customer.CustomerID );


