
-- Tham so loai IN
DELIMITER //
create procedure getCusById
(In cusNum int(11))
begin
select*from customers where customerNumber = cusNum;
end //
DELIMITER ;
call getCusById(175);

-- Tham so loai OUT
DELIMITER //
create procedure GetCustomersCountByCity(
In in_city varchar(50),
Out total int
)
begin
	select count(customerNumber)
    into total
    from customers
    where city = in_city;
end //
DELIMITER ;
Call GetCustomersCountByCity('Lyon',@total);
select @total;

-- Tham so loai INOUT
DELIMITER //
create procedure SetCounter(
	Inout counter int,
	In inc int
)
begin
	set counter = counter + inc;
end //
DELIMITER ;
SET @counter = 1;
CALL SetCounter(@counter,1); 
CALL SetCounter(@counter,1); 
CALL SetCounter(@counter,5);  
SELECT @counter;