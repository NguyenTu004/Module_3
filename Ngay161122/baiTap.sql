use quanlysinhvien;
-- update class set className = 'B2', Statuss =1
-- where classID = 3;
-- delete from class where classID = 4;


-- select*from class where startDate > '2022-12-01' ;
-- select*from subjectt sub where sub.Credit between 3 and 5 ;
-- select*from student s where s.StudentName like 'H%'; 
update Student set ClassID =2
where StudentName = 'Hung' ;
-- select*from student;
select s.studentName, sub.subName, m.mark 
from student s join mark m on s.studentid = m.studentID join subjectt sub on m.subID = sub.subID
order by m.mark DESC;