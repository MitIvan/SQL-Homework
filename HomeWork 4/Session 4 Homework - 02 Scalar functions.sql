/*
Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:
	- StudentCardNumber without “sc-”
	- “ – “
	- First character of student FirstName
	- “.”
	- Student LastName
	
	example:
	sc-77712 => 77712-K.Spasevska
*/

CREATE FUNCTION dbo.fn_FormatStudentName (@StudentId int) 
RETURNS nvarchar(100)
AS
BEGIN

DECLARE @Result nvarchar(100)

SELECT @Result = SUBSTRING(StudentCardNumber, 4, 100)  + ' ' + '-' + ' ' + LEFT(FirstName, 1) + '.' + lastName
FROM dbo.Student
WHERE Id = @StudentId

RETURN @Result

END

SELECT  distinct dbo.fn_FormatStudentName (id) as FunctionOutput
FROM dbo.student

select * From Student