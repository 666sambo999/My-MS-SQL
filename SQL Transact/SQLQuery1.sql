USE [Acad_PD321(class)]


DECLARE @discipline_name NVARCHAR(50) = '%SQL%'
Declare	@group INT = (Select group_id FROM Groups WHERE group_name = 'PD_321')
Declare @discipline SMALLINT = (Select disciplin_id FROM Disciplines WHERE discipline_name LIKE (@discipline_name))
DECLARE @number_of_lessons TINYINT = (Select number_of_lesson FROM Disciplines WHERE discipline_name LIKE (@discipline_name))
DECLARE @number_of_lesson TINYINT  = 0
DECLARE @teacher SMALLINT = (SELECT teacher_id FROM Teacher WHERE first_name = 'Олег')
Declare @start_data Date = '2024-02-27'
Declare @date Date = @start_data
Declare @time TIME = '13:30'
Declare @holidiy DATE = '2024-03-09'

While (@number_of_lesson < @number_of_lessons)
BEGIN 
	IF NOT EXISTS 
	(
		Select 
			[group], discipline, teacher, [date], [time], spent
		FROM Schudule 
		JOIN Groups ON [group] = group_id
		JOIN Disciplines ON discipline = disciplin_id
		JOIN Teacher ON teacher = teacher_id
		WHERE [group] = @group
		AND discipline = @discipline
		AND teacher = @teacher
		AND [date] = @date
		AND [time] = @time
		--AND [date] = @holidiy
	)
	Begin
		Insert INTO Schudule 
		([group], discipline, teacher, [date], [time], spent, number_of_lesson)

		VALUES (@group, @discipline,@teacher, @date, @time, IIF(@date<GETDATE(),1,0), @number_of_lesson+1),
				(@group, @discipline,@teacher, @date, DATEADD (MINUTE,95, @time), IIF(@date<GETDATE(),1,0), @number_of_lesson+1)
				--(@group, @discipline,@teacher, @date, @time, IIF(@holidiy<GETDATE(),1,0), NULL)
				
	End
	SET @number_of_lesson= @number_of_lesson+2
	IF DATENAME(WEEKDAY, @date) IN ('Вторник', 'Четверг')
			Set @date = Dateadd(Day, 2, @date)
	Else 
			Set @date = Dateadd(Day,3, @date)
	--IF DATENAME(WEEKDAY, @holidiy) IN ('Суббота')
	--		Set @holidiy = Dateadd(Day, 4, @holidiy)	 
	
	
End	
		
		Execute my_sp_select_from_schudule 'PD_321'
	--Select 
	--		lesson_id,
	--		[Группа] = group_name,
	--		[Дисциплина] = discipline_name,
	--		[Преподаватель] = FORMATMESSAGE ('%s %s %s', last_name, first_name, middle_name),
	--		[День недели] = DATENAME(WEEKDAY,[Schudule].[date]),
	--		[Дата] = Schudule.[date],
	--		[Время] = Schudule.[time],
	--		[Статус] = IIF(Schudule.spent = 1, 'Проведено', 'Запланировано'),
	--		[номер занятия] = Schudule.number_of_lesson
	--	FROM Schudule 
	--		JOIN Groups ON ([group] = group_id)
	--		JOIN Disciplines ON (discipline = disciplin_id)
	--		JOIN Teacher ON (teacher = teacher_id)

--Create Procedure my_sp_select_from_schudule 
--@group_name NVARCHAR(10)
--AS
--	Select 
--		lesson_id,
--		[Группа] = group_name,
--		[Дисциплина] = discipline_name,
--		[Преподаватель] = FORMATMESSAGE ('%s %s %s', last_name, first_name, middle_name),
--		[День недели] = DATENAME(WEEKDAY,[Schudule].[date]),
--		[Дата] = Schudule.[date],
--		[Время] = Schudule.[time],
--		[Статус] = IIF(Schudule.spent = 1, 'Проведено', 'Запланировано'),
--		[номер занятия] = Schudule.number_of_lesson
--	FROM dbo.Schudule 
--		JOIN Groups ON ([group] = group_id)
	--	JOIN Disciplines ON (discipline = disciplin_id)
	--	JOIN Teacher ON (teacher = teacher_id)
	--Where group_name = @group_name