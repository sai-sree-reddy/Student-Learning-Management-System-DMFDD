--Creating Database--
CREATE DATABASE DMDDPROJECT1
GO

USE DMDDPROJECT1

--Creating Student Table--
 CREATE TABLE STUDENT(
   StudentID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
   StudentName varchar(50),
   StudentEmail  varchar(50) Constraint s_email_check Check(StudentEmail like  '[a-z,0-9,_,-]%@[a-z]%.[a-z][a-z]%'),
   StudentBdate varbinary(400),
   StudentPhoneNo BIGINT NOT NULL UNIQUE CONSTRAINT Stud_Phonelength_check CHECK  (len([StudentPhoneNo])=10),
   StudentAddress varchar(50),
);
GO

--Creating Category Table--
Create table Category(
     CategoryID varchar(50) not null Primary Key,
	 CategoryDescription varchar(100)
)
GO

--Creating Course Table--
CREATE table Course(
    CourseID varchar(50) NOT NULL PRIMARY KEY,
	CourseName varchar(150),
	CourseDescription varchar(255),
	CourseCredits int,
	CategoryID varchar(50),
	 CONSTRAINT Course_catgry_fk FOREIGN KEY(CategoryID) references Category(CategoryID)
);
GO

--Creating Semester Table--
CREATE TABLE Semester(
SemesterID int not null PRIMARY KEY,
SemesterDescription varchar(100),
SemesterStartDate date,
SemesterEndDate date
)
GO

--Creating CourseperSemester Table--
CREATE table CoursePerSemester(
 CoursePerSemesterID int Not Null PRIMARY KEY,
 CourseID  varchar(50) Not Null,
 SemesterID int Not Null,
 CourseStartDate date NOT NULL,
 CourseEndDate date,
 CONSTRAINT Cps_semid_fk FOREIGN KEY(SemesterID) references Semester(SemesterID),
  CONSTRAINT Cps_courseid_fk FOREIGN KEY(CourseID) references Course(CourseID)
)
GO

--Creating Enrollment table--
CREATE TABLE Enrollment(
 EnrollmentID int IDENTITY(1000,1) Not NUll PRIMARY KEY,
 StudentID int Not Null,
 CourseID  varchar(50) Not Null,
 SemesterID int Not Null,
 EnrollmentDate Date Not Null,
 CancellationReason text,
 CoursePerSemesterID int Not Null ,
 CONSTRAINT enroll_stid_fk FOREIGN KEY(StudentID) references Student(StudentID),
 CONSTRAINT enroll_course_fk FOREIGN KEY(CourseID) references Course(CourseID),
 CONSTRAINT enroll_secid_fk FOREIGN KEY(SemesterID) references Semester(SemesterID),
 CONSTRAINT enroll_courseper_sec_fk FOREIGN KEY(CoursePerSemesterID) references CoursePerSemester(CoursePerSemesterID),
);
GO

--Creting Teachers Table--
CREATE TABLE Teachers(
TeacherID int IDENTITY(100,1) not null PRIMARY KEY,   
TeacherName varchar(100),
TeacherEmail varchar(255) Constraint T_email_check Check(TeacherEmail like  '[a-z,0-9,_,-]%@[a-z]%.[a-z][a-z]%'),
TeacherPhoneNumber bigint NOT NULL UNIQUE CONSTRAINT Teacher_Phonelength_check CHECK  (len([TeacherPhoneNumber])=10),
)
GO


--Creating TeachersPerCourse Table--
create table TeachersPerCourse(
 TeachersPerCourseID varchar(50) not null PRIMARY KEY, 
 CoursePerSemesterID int not null,
 TeacherID int not null,
 TeachercourseStartDate date,
 TecahercourseEndDate date,
 Constraint tps_courseper_sem_fk foreign key (CoursePerSemesterID) references CoursePerSemester(CoursePerSemesterID),
 Constraint tps_teacherid_fk foreign key (TeacherID) references Teachers(TeacherID)
)
GO

--Creating Classes Table--
Create Table Classes(
  ClassNo int Identity(700,1) Primary key not null,
  TeacherID int not null,
  CoursePerSemesterID int Not null,
  ClassTitle varchar(40) not null,
  ClassDate date not null CONSTRAINT class_date_check check( ClassDate between '2022-01-01' and '2024-12-31' ),
  ClassStartTime time ,
  ClassEndTime Time,
  Constraint Classes_TeacherID_fk foreign key (TeacherID) references Teachers(TeacherID),
  Constraint Classes_coursepersemID_fk foreign key (CoursePerSemesterID) references CoursePerSemester(CoursePerSemesterID)
 )
GO

--Creating Attendance Table--
  Create Table Attendance(
  ClassNo int not null,
  StudentId int Not null,
  TimeArrive Time,
  TimeLeave Time,
  CONSTRAINT Attendance_PK Primary key(ClassNo,StudentId),
  Constraint Attendance_ClassNo_fk foreign key (ClassNo) references Classes(ClassNo)
)
GO

--Creating Tests Table--
create table Tests(
TestNo int Identity(25,1) not null Primary key,
EnrollmentID int Not NUll,
TestTime Time Not Null,
TestDate date NOT NULL,
CONSTRAINT test_enrollment_fk FOREIGN KEY(EnrollmentID) references Enrollment(EnrollmentID)
)

--Creating TestScore--
create table TestScore(
  TestNo int Not Null,
  StudentID int Not Null,
  Score Decimal(5,2) Not Null,
  Constraint tests_pk primary key (TestNo,StudentID),
  Constraint testScore_TestNo_fk foreign key (TestNo) references Tests(TestNo),
  Constraint testScore_StudentID_fk foreign key (StudentID) references Student(StudentID)
 )

 --COLUMN ENCRYPTION--
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'student1';
go
--DROP MASTER KEY 
--VERIFY THAT MASTER KEY EXISTS
--SELECT NAME KeyName,
--  symmetric_key_id KeyID,
-- key_length KeyLength,
--  algorithm_desc KeyAlgorithm
--FROM sys.symmetric_keys;
--GO
--CREATE A SELF SIGNED CERTIFICATE AND NAME IT EmpSSN
CREATE CERTIFICATE Stud_Bdate  
   WITH SUBJECT = 'Protect student personal info';  
GO 
--DROP CERTIFICATE Stud_Bdate
--SELECT name CertName, 
--    certificate_id CertID, 
--    pvt_key_encryption_type_desc EncryptType, 
--    issuer_name Issuer
--FROM sys.certificates;
--CREATE A SYMMETRIC KEY  WITH AES 256 ALGORITHM USING THE CERTIFICATE
--AS ENCRYPTION/DECRYPTION METHOD

CREATE SYMMETRIC KEY StudBdate_SK
	WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE Stud_Bdate;  
GO		
--DROP SYMMETRIC KEY StudBdate_SK
--NOW WE ARE READY TO ENCRYPT THE PASSWORD AND ALSO DECRYPT
--ENCRYPTION IS DONE WHILE INSERTING DATA IN THE INSERT SCRIPT
 --OPEN THE SYMMETRIC KEY WITH WHICH TO ENCRYPT THE DATA.  
OPEN SYMMETRIC KEY StudBdate_SK
DECRYPTION BY CERTIFICATE Stud_Bdate;
GO

