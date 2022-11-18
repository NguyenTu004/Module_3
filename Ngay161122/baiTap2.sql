use quanlybanhang;
-- insert into orderr 
-- values(1,1,'2022-11-15',null),
-- 	(2,2,'2022-11-16',null),
-- 	(3,1,'2022-11-16',null);
-- insert into product 
-- values(1,'May Giat',3),
-- (2,'Tu Lanh',5),
-- (3,'Dieu Hoa',7),
-- (4,'Quat',1),
-- (5,'Bep Dien',2);
-- insert into orderdetail 
-- values(1,1,3),
-- (1,3,7),
-- (1,4,2),
-- (2,1,1),
-- (3,1,8),
-- (2,5,4),orderdetail
-- (2,3,3);

-- select o.oID, o.oDate, o.oTotailPrice from orderr o;orderdetailorderrcustomer
select customer.cName, product.pName 
from customer join orderr on customer.cID = orderr.cID 
join orderdetail on orderr.oID = orderdetail.oID
join product on orderdetail.pID = product.pID;
select customer.cName, customer.cID
from customer where customer.cID not in (select orderr.cID from orderr);
select orderr.oID, orderr.oDate, sum(orderdetail.odQTY*product.pPrice) as oTotalPrice
from orderr join orderdetail on orderr.oID = orderdetail.oID
join product on orderdetail.pID = product.pID
group by orderr.oID, orderr.oDate;

update orderr
set orderr.oTotalPrice = (select sum(orderdetail.odQTY*product.pPrice)
from orderdetail join product on orderdetail.pID = product.pID
where orderr.oID = orderdetail.oID );
select*from orderr;