use productstore;

-- san pham co so luong cao nhat
select ProductID,productName, max(amount) as amount
from product;
-- hien thi san pham theo gia giam dan
select ProductID, productName, price
from product
order by price DESC;
-- hien thi san pham co date truoc ngay 07/10/2022
select ProductID, productName, price, productDate
from product
where ProductDate < '2022-10-07';
-- hien thi tong tien cua tat ca order va ma order tuong ung
select o.orderID, sum(detail.quantity*pro.price) as 'Sum'
from orderr o join orderdetail detail on o.OrderID = detail.OrderID
join product pro on detail.ProductID = pro.ProductID
group by o.OrderID;
-- san pham co luong mua nhieu nhat
select pro.ProductID, pro.productName, sum(detail.quantity) as bestseller
from product pro join orderdetail detail on pro.ProductID = detail.ProductID
group by pro.ProductID 
order by bestseller DESC limit 1 ;

select products.ProductID, products.ProductName, Sum(orderdetail.Quantity)as BestSeller from orderdetail
join products on products.ProductId = orderdetail.ProductId
group by orderdetail.ProductId
having BestSeller >= All (select Sum(orderdetail.Quantity) from orderdetail group by orderdetail.ProductId)
;