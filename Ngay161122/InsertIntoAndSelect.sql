use quanlysinhvien;
-- insert into Class values (1,'A1','2022-12-12',1);
-- insert into Class values (2,'A2','2022-12-12',1);
-- insert into Class values (3,'B1',current_date,0);
-- INSERT INTO Student (StudentName, Address, Phone, Statuss, ClassId)
-- VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
-- INSERT INTO Student (StudentName, Address, Statuss, ClassId)
-- VALUES ('Hoa', 'Hai phong', 1, 1);
-- INSERT INTO Student (StudentName, Address, Phone, Statuss, ClassId)
-- VALUES ('Manh', 'HCM', '0123123123', 0, 2);
-- INSERT INTO Subjectt
-- VALUES (1, 'CF', 5, 1),
--        (2, 'C', 6, 1),
--        (3, 'HDJ', 5, 1),
--        (4, 'RDBMS', 10, 1);
-- INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
-- VALUES (1, 1, 8, 1),
--        (1, 2, 10, 2),
--        (2, 1, 12, 1);

-- select*from student where statuss = true;
-- select*from subjectt where credit < 10;
-- SELECT S.StudentId, S.StudentName, C.ClassName 
-- FROM Student S join Class C on S.ClassId = C.ClassID;
-- select s.studentID, s.studentName, c.ClassName 
-- from student s join class c on s.classID = c.classID
-- where c.className = 'A1';
-- select s.studentID, s.studentName, sub.subname, m.mark
-- from student s join mark m on s.studentID = m.studentId join subjectt sub on m.subID = sub.subID; 
-- select s.studentID, s.studentName, sub.subname, m.mark
-- from student s join mark m on s.studentid = m.studentID join subjectt sub on m.subID = sub.subID
-- where sub.subname = 'CF';