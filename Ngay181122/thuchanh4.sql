create view customer_views as 
select customerNumber, customerName, phone 
from customers;
select*from customer_views;
-- Cap nhap view
create or replace view customer_views  as
select customerNumber, customerName, contactFirstName, contactLastName, phone
from customers
where city = 'Nantes';

DROP VIEW view_name;
DROP VIEW customer_views;