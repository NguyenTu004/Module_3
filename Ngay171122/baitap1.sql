use quanlysinhvien;
select subName, max(credit) as credit
from subjectt;
select subjectt.SubName, max(m.mark) as Mark
from subjectt subjectt join Mark m on subjectt.SubId = m.SubId;
select s.studentName, s.Address, avg(m.mark) as 'AVG'
from student s join mark m on s.StudentID = m.StudentId
group by s.studentName
order by avg(m.mark) DESC;

