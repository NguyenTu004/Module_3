use quanlysinhvien;
select address, count(studentID) as 'So luong hoc vien'
from student 
group by address;
select s.studentID, s.studentName, avg(Mark)
from student s join mark m on s.studentID = m.studentID
group by s.studentID, s.StudentName;
select s.studentID, s.studentName, avg(Mark)
from student s join mark m on s.studentID = m.studentID
group by s.studentID, s.StudentName
having avg(Mark) > 11;
select s.studentID, s.studentName, avg(Mark)
from student s join mark m on s.studentID = m.studentID
group by s.studentID, s.StudentName
having avg(Mark) >= all (select avg(Mark)from mark group by mark.studentID);

