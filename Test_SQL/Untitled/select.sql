use demo2006;
-- Muc 1
-- san pham co so luong >= 30
select*from product where quantity >= 30;
-- san pham co so luong >= 30 va co gia trong khoang 100 - 300
select*from product where quantity >= 30 and (price between 100 and 300);
-- khach hang co tuoi 18+
select*from customer where age >= 18;
-- khach hang co tuoi 20+ va ho Nguyen
select*from customer where age >= 20 and name like '%Nguyễn%';
-- san pham co ten bat dau bang chu M
select*from product where name like 'M%';
-- san pham co ten ket thuc bang chu E
select*from product where name like '%E';
-- danh sach san pham co so luong tang dan
select*from product order by quantity ;
-- danh sach san pham co gia giam dan
select*from product order by price DESC;

-- Muc2
-- in ra tong so luong san pham co gia nho hon 300
select sum(quantity) as 'Sum quantity'
from product
where price < 300;
-- in ra tong so luong san pham theo tung gia
select price, sum(quantity) as quantity
from product
group by price;
-- in ra san pham co gia cao nhat
select*from product
where price >= all (select max(price)from product);
-- in ra tong so tien neu ban het san pham
select sum(price*quantity)as 'Sum money'
from product;
-- in ra san pham co gia cao nhat co ten bat dau la chu M
select*from product
where price >= all (select max(price)from product where name like 'M%');
-- in ra san pham co gia thap nhat co ten bat dau la chu M
select*from product
where price = all (select min(price)from product where name like 'M%');
-- in ra gia trung binh co ten bat dau la chu M
select avg(price)as price 
from product
where name like 'M%';

-- Muc 3
-- in ra ten khach hang va thoi gian mua hang
select cus.name, o.time
from customer cus join `order` o on cus.id = o.id; 
-- in ra ten khach hang va san pham da mua
select cus.name, o.time, p.name, odt.quantity
from customer cus join `order` o on cus.id = o.id
join orderdetail odt on o.id = odt.orderId
join product p on odt.ProductId = p.id;
-- in ra hoa don va gia
select o.id, o.time, sum(odt.quantity*p.price)as price
from `order` o join orderdetail odt on o.id = odt.OrderId
join product p on odt.ProductId = p.id
group by o.id;
-- in ra hoa don va gia giam dan
select o.id, o.time, sum(odt.quantity*p.price)as price
from `order` o join orderdetail odt on o.id = odt.OrderId
join product p on odt.ProductId = p.id
group by o.id
order by price DESC;

-- Muc 4--10
-- 1 in ra hoa don ngay 19/06 va 20/06
select o.time, o.id, sum(odt.quantity*p.price)as price
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.ProductId = p.id
where o.time = '2021-06-19' or o.time = '2006-06-20'
group by o.id;
-- 2 in ra hoa don trong 06/2006 va sap xep price
select o.time, o.id, sum(odt.quantity*p.price)as price
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.ProductId = p.id
group by month(o.time)='06' and year(o.time)='2006'
order by price DESC;
-- 3 in ra makh va tenkh da mua hang trong 19/06/2021
select o.time,cus.id, cus.name
from `order` o join customer cus on o.customerId = cus.id
where o.time = '2021-06-19';
-- 4 in ra sp duoc Nguyen Van A mua trong 10/2006
select  cus.name, o.time, p.id, p.name
from customer cus join `order` o on cus.id = o.customerId
join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
where cus.name ='Nguyễn Văn A';
-- 5 tim cac hoa don mua may giat hoac tu lanh
select p.name, o.id
from `order` o join orderdetail odt on o.id=  odt.orderId
join product p on odt.productId = p.id
where p.name = 'Máy Giặt' or p.name = 'Tủ Lạnh';
-- 6 in ra san pham ko ban duoc
select id, name, price , quantity
from product 
where id not in (select productId from orderdetail);
-- 7 in ra san pham ko ban duoc in year 2006
select p.id, p.name, p.price , p.quantity
from product p 
where p.id not in (select*from byProduct_2006);
-- _____________________________________________
-- TAO VIEW
create view byProduct_2006 as
select productId 
from orderdetail odt join `order` o on odt.orderId = o.id 
where year(o.time) = '2006';
-- ______________________________________________
-- 8 in ra sp co price > 300 va duoc ban in year 2006
select p.id, p.name, p.price , p.quantity
from product p 
where p.id in (select*from byProduct_2006) and p.price > 300;
-- 9 co bao nhieu sp khac nhau duoc ban in year 2006
select count(p.name) as quantity
from product p
where p.id in (select*from byProduct_2006);
-- 10. tim hoa don mua may giat hoac tu lanh co so luong 10-20
select o.id as OrderID, p.name, odt.quantity
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
where (p.name = 'Máy Giặt' or p.name = 'Tủ Lạnh') and (odt.quantity between 10 and 20);
-- 11. tim hoa don mua may giat va tu lanh co so luong 10-20 
select o.id, count(o.id)
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
where (p.name = 'Máy Giặt' or p.name = 'Tủ Lạnh') and (odt.quantity between 10 and 20) 
group by o.id
having count(o.id) = 2;
-- 12. tim so hoa don sp co price > 200
select count(o.time) as quantity
from `order` o 
where o.id not in (select od.id 
from `order` od join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
where price <200) and o.id in (select orderId from orderdetail)
group by o.id;
-- 13. tim so hoa don 2006 sp co price < 300
-- select od.id,count(o.id) as quantity, count(odt.productId)
-- from `order` od join orderdetail odt on od.id = odt.orderId
-- where od.id not in (select o.id
-- from `order` o join orderdetail odt on o.id = odt.orderId
-- join product p on odt.productId = p.id
-- where price > 300 )  and year(o.time) = '2006'
-- group by o.id
-- 14. GIONG 9
-- 15. in hoa don cao nhat va thap nhat
select o.id, sum(odt.quantity*p.price) as SumPrice
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
group by o.id
having SumPrice >= all (select*from sumPriceBill);
select o.id, sum(odt.quantity*p.price) as SumPrice
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
group by o.id
having SumPrice <= all (select*from sumPriceBill);
-- TAO VIEW
create view sumPriceBill as
select sum(odt.quantity*p.price) as SumPrice
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
group by o.id;
-- 16. gia tri tb in year 2006
select avg(p.price*odt.quantity) as price
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
where year(o.time) = '2006';
-- 17. doanh thu in year 2006
select sum(p.price*odt.quantity) as price
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
where year(o.time) = '2006';
-- 18. hoa don cao nhat in year 2006
select sum(p.price*odt.quantity) as Price
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
where year(o.time) = '2006'
group by o.id
having Price >= all (select sum(p.price*odt.quantity) as Price
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
where year(o.time) = '2006'group by o.id);
-- 19. thong tin khach hang co bill lon nhat 2006
select cus.name, o.time, sum(p.price*odt.quantity) as Price
from customer cus join `order` o on cus.id = o.customerId
join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
where year(o.time) = '2006'
group by o.id
having Price >= all(select sum(p.price*odt.quantity) as Price
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
where year(o.time) = '2006'
group by o.id);
-- 20. in ra 3 khach hang mau nhieu nhat
select cus.id,cus.name,sum(odt.quantity)as quantity
from customer cus join `order` o on cus.id = o.customerId
join orderdetail odt on o.id = odt.orderId
group by cus.id
order by quantity DESC limit 3;
-- TAO VIEW
create view max3Price as
select price from product group by price order by price DESC limit 3;
-- 21. in ra sp co gia = 1 in 3 max price
select p.id, p.name, p.price
from product p
where p.price >= all (select min(price) from max3Price);
-- 22.  in ra sp co gia = 1 in 3 max price co ten bat dau bang chu M
select p.id, p.name, p.price
from product p
where p.price >= all (select min(price) from max3Price) and p.name like 'M%';
-- 23. doanh thu moi ngay
select o.time , sum(odt.quantity*p.price)as sumPrice
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
group by o.time;
-- 24. tong so luong tung san pham ban trong thang 10/2006
select p.name, sum(odt.quantity) as quantity
from product p join orderdetail odt on p.id = odt.productId
join `order` o on odt.orderId = o.id
where year(o.time) = '2006'
group by p.name;
-- 25. tinh doanh thu tung thang in year 2006
select month(o.time), sum(p.price*odt.quantity) as price
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
where year(o.time) = '2006'
group by month(o.time);
-- 26. tim hoa don mua it nhat 4 mat hang khac nhau
select o.id, o.time , count(p.name) as quantity
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
group by o.id
having quantity >= 4;
-- 27. tim hoa don co 3 sp co gia < 300 (3sp khac nhau)

-- 28. tim khach hang co so luot mua nhieu nhat
select cus.id,cus.name, count(o.id) as quantityBuy
from customer cus join `order` o on cus.id = o.customerId
group by cus.id 
having quantityBuy >= all (select count(o.id) from `order` o group by o.customerId);
-- 29.thang co daonh thu lon nhat in year 2006
select month(o.time), sum(p.price*odt.quantity) as price
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
where year(o.time) = '2006'
group by month(o.time)
having price >= all (select sum(p.price*odt.quantity)
from `order` o join orderdetail odt on o.id = odt.orderId
join product p on odt.productId = p.id
where year(o.time) = '2006'
group by month(o.time));
-- 30. sp duoc ban it nhat in year 2006
select p.id, p.name, sum(odt.quantity)as quantity
from product p join orderdetail odt on p.id = odt.productId
group by p.id
having quantity <= all(select sum(odt.quantity)
from product p join orderdetail odt on p.id = odt.productId
group by p.id);
-- 31. in 10 khach hang co doanh so cao nhat tim khach hang co luot mua nhieu nhat
