Create Procedure my_discipline_from_groups
@group NVARCHAR(10),
@discipline NVARCHAR(50)
AS 

Select 
	[Группа] = [Acad_PD321(class)].dbo.Groups.group_name,
	[Дисциплина] = [Acad_PD321(class)].dbo.Disciplines.discipline_name,
	[Преподаватель] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
	[дата] = [date],
	[День недели] = DATENAME(WEEKDAY,[date]),
	[время] = [time],
	[номер занятия] = [Acad_PD321(class)].dbo.Schudule.number_of_lesson,
	[тема занятия] = subject_of_lesson,
	[Статус] = IIF(spent = 1, 'Проведено', 'Запланировано')
From [Acad_PD321(class)].dbo.Schudule
JOIN [Acad_PD321(class)].dbo.Disciplines ON (discipline = disciplin_id)
JOIN [Acad_PD321(class)].dbo.Teacher ON (teacher = teacher_id)
JOIN [Acad_PD321(class)].dbo.Groups ON ([group]= group_id)

WHERE discipline_name LIKE (@discipline)
AND group_name = @group 