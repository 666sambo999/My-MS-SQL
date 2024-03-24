--Create Procedure my_select_from_schudule AS 

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
--	FROM dbo.Schudule 
--		JOIN Groups ON ([group] = group_id)
--		JOIN Disciplines ON (discipline = disciplin_id)
--		JOIN Teacher ON (teacher = teacher_id)

Create Procedure my_sp_select_from_schudule 
@group_name NVARCHAR(10)
AS
	Select 
		lesson_id,
		[Группа] = group_name,
		[Дисциплина] = discipline_name,
		[Преподаватель] = FORMATMESSAGE ('%s %s %s', last_name, first_name, middle_name),
		[День недели] = DATENAME(WEEKDAY,[Schudule].[date]),
		[Дата] = Schudule.[date],
		[Время] = Schudule.[time],
		[Статус] = IIF(Schudule.spent = 1, 'Проведено', 'Запланировано'),
		[номер занятия] = Schudule.number_of_lesson
	FROM dbo.Schudule 
		JOIN Groups ON ([group] = group_id)
		JOIN Disciplines ON (discipline = disciplin_id)
		JOIN Teacher ON (teacher = teacher_id)
	Where group_name = @group_name