USE [Acad_PD321(class)]

DELETE FROM Schudule WHERE lesson_id <10

IF NOT EXISTS 
(
	Select 
		[group], discipline, teacher, [date], [time], spent
	From Schudule
	JOIN Groups ON ([group] = group_id)
	JOIN Disciplines ON (discipline = disciplin_id)
	JOIN Teacher ON (teacher = teacher_id)
)
Begin
	INSERT INTO Schudule 
		([group], discipline, teacher, [date], [time], spent)

	Values 
	(
		(SELECT group_id FROM Groups WHERE group_name = 'PD_321'),
		(SELECT disciplin_id FROM Disciplines WHERE discipline_name LIKE ('% MS SQL%')),
		(SELECT teacher_id FROM Teacher WHERE first_name = 'Олег'),
		GETDATE(),
		'13:30',
		1
	)

	Select 
		lesson_id,
		[Группа] = group_name,
		[Дисциплина] = discipline_name,
		[Преподаватель] = FORMATMESSAGE ('%s %s %s', last_name, first_name, middle_name),
		[Дата] = Schudule.[date],
		[Время] = Schudule.[time],
		[Статус] = IIF(Schudule.spent = 1, 'Проведено', 'Запланировано')  
	FROM Schudule 
		JOIN Groups ON ([group] = group_id)
		JOIN Disciplines ON (discipline = disciplin_id)
		JOIN Teacher ON (teacher = teacher_id)
End