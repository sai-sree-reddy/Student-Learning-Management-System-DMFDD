Create Procedure [dbo].[spGetTestCountByEnrollmentID]
@EnrollmentID int ,
@TestCount int Output
	As
	Begin
	Select @TestCount= count(*) 
	from Tests 
	where EnrollmentID= @EnrollmentID
END
Declare @TotalTestCount int
Execute [spGetTestCountByEnrollmentID] '1001', @TotalTestCount output
Print @TotalTestCount
GO

Create Procedure [dbo].[UpdateStudentTestScoreMarks3]
@TestNo int,
@Score decimal(5,2)
As 
Begin
Update TestScore
Set Score =@Score where TestNo=@TestNo
--Print 'New Assigned score to the test no is : ' + cast(@Score as decimal)
	End
	EXEC [dbo].[UpdateStudentTestScoreMarks3] 26,64.0  ---CHANGES Score from assigned value

	Select * from TestScore
GO

CREATE PROCEDURE ChangeProfessorname
	(
    @teachername varchar(50),
	@teacherID int
	)
	As 
	Begin
	update Teachers
	Set TeacherName = @teachername where TeacherID=@teacherID
	--Print 'New Assigned Professor to the course is : ' + cast(@teachername as varchar)
	End
	EXEC ChangeProfessorname Maya,102  ---CHANGES Professor Name TO Pruthvi from assigned value

	SELECT * FROM Teachers