Create Procedure my_discipline_from_groups
@group NVARCHAR(10),
@discipline NVARCHAR(50)
AS 

Select 
	[������] = [Acad_PD321(class)].dbo.Groups.group_name,
	[����������] = [Acad_PD321(class)].dbo.Disciplines.discipline_name,
	[�������������] = FORMATMESSAGE('%s %s %s', last_name, first_name, middle_name),
	[����] = [date],
	[���� ������] = DATENAME(WEEKDAY,[date]),
	[�����] = [time],
	[����� �������] = [Acad_PD321(class)].dbo.Schudule.number_of_lesson,
	[���� �������] = subject_of_lesson,
	[������] = IIF(spent = 1, '���������', '�������������')
From [Acad_PD321(class)].dbo.Schudule
JOIN [Acad_PD321(class)].dbo.Disciplines ON (discipline = disciplin_id)
JOIN [Acad_PD321(class)].dbo.Teacher ON (teacher = teacher_id)
JOIN [Acad_PD321(class)].dbo.Groups ON ([group]= group_id)

WHERE discipline_name LIKE (@discipline)
AND group_name = @group 