CREATE VIEW [StudentsEnrolledICourse] AS 
select s.StudentID,s.StudentName, e.CourseID,e.CoursePerSemesterID,e.EnrollmentDate ,c.CourseName
from STUDENT s 
JOIN Enrollment e ON s.StudentID = e.StudentID
Join Course c on c.CourseID=e.CourseID
GO

SELECT * FROM  [StudentsEnrolledICourse]
GO

Create view [TeacherTeachCourses] as
Select t.TeacherID, t.TeacherName,t.TeacherEmail ,tpc.TeachersPerCourseID,tpc.CoursePerSemesterID,class.ClassTitle
from Teachers t
Join TeachersPerCourse tpc on t.TeacherID= tpc.TeacherID
Join Classes class on class.CoursePerSemesterID= tpc.CoursePerSemesterID

GO
SELECT * FROM  [TeacherTeachCourses]
GO

Create view [StudentGetScore] as
Select st.StudentID,st.StudentName ,ts.Score,ts.TestNo
from STUDENT st
Join TestScore ts on ts.StudentID= st.StudentID
GO
SELECT * FROM [StudentGetScore]
GO

-------------------------------------for decrypting data--------------------------------------------------------------
OPEN SYMMETRIC KEY StudBdate_SK
DECRYPTION BY CERTIFICATE Stud_Bdate;
GO
Create view ShowStudData1 AS
(
select StudentID,StudentName,convert(varchar,DecryptByKey(StudentBdate)) as BirthDate from Student
)
GO
--query to view ther birthdates for student
select * from ShowStudData1
----------------------------------------------------------------------------------------------------------------------