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
