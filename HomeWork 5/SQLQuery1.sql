/*
Create multi-statement table value function that for specific Teacher and Course 
will return list of students (FirstName, LastName) who passed the exam, 
together with Grade and CreatedDate
*/


create or alter function dbo.fn_PassedExamsByStudents (@TeacherId int, @CourseId int)
returns @output table(StudentFirstName nvarchar(100), StudentLastName nvarchar(100), Grade int, CreatedDate date, TeacherName nvarchar(100), CourseName nvarchar(100)  )
as
begin
	insert into @output
	select s.FirstName as StudentFirstName, s.LastName as StudentLastName, g.Grade as Grade, g.CreatedDate as CreatedDate, t.FirstName as TeacherName, c.name as CourseName
	from dbo.Student s
	inner join Grade g on s.ID = g.StudentID
	inner join Teacher t on t.ID = g.TeacherID
	inner join Course c on c.ID = g.CourseID
	where g.TeacherID = @TeacherId and g.CourseID = @CourseId
return
end



declare @TeacherId  int = 1
declare @CourseId int = 1

select * from dbo.fn_PassedExamsByStudents (@TeacherId,@CourseId)
order by Grade desc


--TeacherName i CourseName znam deka ne se baraa ama gi dodadov za da izvezbam


	
