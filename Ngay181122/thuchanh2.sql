
DELIMITER //
create procedure findAllCustomers()
begin
select*from customers;
end //
DELIMITER ;
call findAllCustomers();
DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomers`//
create procedure findAllCustomers()
begin 
select * from customers where customerNumber = 175;
END //
DELIMITER ;
call findAllCustomers();
