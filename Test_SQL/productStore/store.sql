create table product (
id int primary key auto_increment,
code varchar(10) unique,
name varchar(50),
price double,
date_created datetime,
amount int
);

create table customer (
id int primary key auto_increment,
name varchar(50),
age int check (age > 0 and age < 120),
address longtext
);

create table orders (
id int primary key auto_increment,
date_created datetime,
customer_id int);

alter table orders
add foreign key (customer_id) references customer(id);

create table orderdetails (
orders_id int,
product_id int,
quantity int);

alter table orderdetails
add foreign key (orders_id) references orders(id),
add foreign key (product_id) references product(id),
add primary key(orders_id, product_id);

-- hiển sản phẩm có số lượng cao nhất
-- hàm max() trả về giấ trị cao nhất của dữ liệu trong cột
select max(amount) from product; -- lấy max số lượng
select * from product where amount = (select max(amount) from product);

-- hiển thị các sản phẩm theo giá giảm dần
select * from product order by price DESC;

-- hiển thị các sản phẩm theo ngày sản xuất
select * from product where date_created < '2022-07-10';

-- hiển thị tổng tiền của order
-- as: khái niệm ALIAS dùng để đổi tên cho các cột được sinh ra trong tính toán
-- hoặc đổi tên bảng ngắn gọn hơn
select orders.id, sum(product.price * odt.quantity) as total_price from orders
join orderdetails odt on odt.orders_id = orders.id
join product on odt.product_id = product.id
group by orders.id;

-- hiển thị sản phẩm được mua nhiều nhất
-- select product.name, max(sum_amount) as max from product join (
-- select product.name as p_name, sum(odt.quantity) as sum_amount from product
-- join orderdetails odt on odt.product_id = product.id
-- group by product.id order by sum_amount limit 1) as demo on demo.p_name = product.name;

-- hiển thị sản phẩm có số lượng bán lớn nhất trong 1 lần
select * from product
where product.id = 
(select orderdetails.product_id from orderdetails where orderdetails.quantity=
(select max(orderdetails.quantity) from orderdetails ));

-- hiển thị sản phẩm được mua nhiều nhất
select product.id, product.name, Sum(orderdetails.quantity) as BestSeller from orderdetails
join product on product.id = orderdetails.product_id
group by orderdetails.product_id
having BestSeller >= All (select Sum(orderdetails.quantity) from orderdetails group by orderdetails.product_id);