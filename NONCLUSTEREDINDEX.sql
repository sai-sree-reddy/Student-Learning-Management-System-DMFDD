CREATE NONCLUSTERED INDEX [IX_NonClusteredIndex_Student_details]
ON [dbo].[STUDENT] ([StudentID],[StudentName],[StudentEmail]);

GO

CREATE NONCLUSTERED INDEX [IX_NonClusteredIndex_Attendance]
ON [dbo].[Attdendance] ([ClassNo],[StudentID]);

GO

CREATE NONCLUSTERED INDEX [IX_NonClusteredIndex_Courses]
ON [dbo].[Courses] ([CourseID],[CourseName]);

GO

CREATE NONCLUSTERED INDEX [IX_NonClusteredIndex_Teachers]
ON [dbo].[Teachers] ([TeacherID],[TeacherName],[TeacherEmail]);

GO

CREATE NONCLUSTERED INDEX [IX_NonClusteredIndex_Enrollment]
ON [dbo].[Enrollment] ([EnrollmentID],[StudentID],[CourseID]);