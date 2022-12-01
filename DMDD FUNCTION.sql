USE DMDDPROJECT
Go
Create Function CalcAge (@dob date)
 Returns Int
 As
 Begin
 declare @age int
 set @dob='2000-08-18'
 set @age = DATEDIFF(YEAR,@dob,GETDATE()) -
				Case
					When (Month(@dob)> MONTH(GETDATE()) ) or 
						 (MONTH(@dob)=MONTH(GETDATE()) and DAY (@dob)> DAY(GETDATE()))
					Then 1
					else 0
					End
Return @age
 End
 GO

 Select dbo.CalcAge('2000-09-18') as Age_of_Student
