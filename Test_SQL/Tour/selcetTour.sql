use quanlydulich;
insert into country (countryName)
values ('Hoa Ky'),
	   ('Thai Lan'),
	   ('Viet Nam');
       
insert into customer 
values ('Hoang',24,'Ha Noi',6968), 
		('Son',26,'Nghe An',9787),
		('HUy',54,'Hai Phong',9546),
		('Huyen',45,'Quang Ninh',2357);
	
insert into employee (EmpName,EmplAge,Wage)
values ('Cuong',43,100),
('Van',21,123),
('Nam',34,66);
insert into location (LocaName,CountryID)
values('New York',1),
('BangKok',2),
('Ha Noi',3);
insert into tour (price,days,LocaID)
values (1000,5,1),
(1420,7,1),
(600,5,2),
(590,2,3),
(3324,5,3),
(3443,5,2);
insert into service
 values(1,9787,1),
 (1,2357,2),
 (2,9546,3),
 (3,6968,1);
 
 -- hien thi tat ca chuyen di cua nhan vien theo ID
 select emp.EmplID, emp.EmpName,loca.LocaName, country.CountryName, tour.Days, tour.price
 from employee emp join service ser on emp.EmplID = ser.EmplID
 join Tour on ser.TourID = tour.TourID
 join location loca on tour.LocaID = loca.LocaID
 join country  on loca.CountryID = country.CountryID
 where emp.EmplID = 1 ;
 
 -- hien thi tat ca chuyen di cua 1 khach hang theo cccd
  select cus.cccd,cus.cusName,loca.LocaName, country.CountryName, tour.Days, tour.price
 from customer cus join service ser on cus.cccd = ser.cccd
 join Tour  on ser.TourID = tour.TourID
 join location loca on tour.LocaID = loca.LocaID
 join country  on loca.CountryID = country.CountryID
 where cus.cccd = 9787 ;
 
 -- hien thi tat ca cac chuyen di cua 1 thanh pho bat ky
   select loca.LocaName, country.CountryName, tour.Days, tour.price
 from Tour join location loca on tour.LocaID = loca.LocaID
 join country on loca.CountryID = country.CountryID
 where loca.LocaName = 'BangKok' ;
 
 -- hien thi chuyen di co gia cao nhat
 select loca.LocaName, country.CountryName, tour.Days, tour.price
 from  Tour join location loca on tour.LocaID = loca.LocaID
 join country on loca.CountryID = country.CountryID
 order by tour.price DESC ;
 
 select loca.LocaName, country.CountryName, tour.Days, tour.price 
 from  Tour join location loca on tour.LocaID = loca.LocaID
 join country on loca.CountryID = country.CountryID
 where tour.price >= all (select tour.price from tour);
