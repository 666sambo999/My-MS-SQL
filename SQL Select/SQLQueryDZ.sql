USE [Acad_PD321(class)]

				--1--
Select 
--last_name + ' ' + first_name +' '+ middle_name AS '�.�.� ��������',
[�.�.� ��������]  = FORMATMESSAGE ('%s %s %s', last_name, first_name, middle_name), 
--direction_name AS '�����������',
[����������� ��������] = direction_name,
group_name AS '������' 

FROM Students, Directions, Groups
Where Students.[group] = Groups.group_id AND 
	Groups.direction = Directions.direction_id
	
ORDER BY last_name,direction_name,group_name
------------------------------------------------------

			--2--
Select 
last_name + ' ' + first_name +' '+ middle_name AS '�.�.� �������������',
DATEDIFF (hour, birth_date, GETDATE())/8766  AS '�������',
discipline_name AS '����������' 

FROM Disciplines, Teacher, TeacherDiscipline
Where Disciplines.disciplin_id = TeacherDiscipline.discipline 
AND TeacherDiscipline.teacher = Teacher.teacher_id
--AND Teacher.last_name  = '�������'
----------------------------------------------------------

		--3--
Select 
last_name + ' ' + first_name +' '+ middle_name AS '�.�.� �������������',
DATEDIFF (hour, birth_date, GETDATE())/8766  AS '�������',
discipline_name AS '����������'

FROM Teacher, Disciplines, TeacherDiscipline
WHere Teacher.teacher_id = teacher AND 
TeacherDiscipline.discipline = disciplin_id 
AND Disciplines.disciplin_id = 4
--Disciplines.disciplin_name = '�������� ����������'
--Disciplines.disciplin_name LIKE (%SQL)
AND Disciplines.discipline_name LIKE ('%[A-Z]%')

-----------------------------------------------------------------------

				--4--

Select 
--discipline_name AS '����������',
--direction_name AS '����������� ��������'
	[����������] = discipline_name,
	[����������� ��������] = direction_name
From Disciplines, Directions, DisciplinesDirectionRelation

WHERE Disciplines.disciplin_id = DisciplinesDirectionRelation.discipline 
AND
	DisciplinesDirectionRelation.direction = direction_id
	AND Directions.direction_name LIKE ('%C%')
--------------------------------------------------------------

		--5--
Select 

	direction_name AS '�����������', 
	[���������� ���������] = COUNT (Students.[group])
	
FROM Students, Directions, Groups
WHERE Directions.direction_id = Groups.direction  AND 
	Students.[group] = group_id
GROUP BY Directions.direction_name;

----------------------------------------------

		--6--
Select 

	group_name AS '������', 
	[���������� ���������] = COUNT (Students.[group])
	
FROM Students,  Groups
WHERE Students.[group] = group_id
GROUP BY Groups.group_name
Having COUNT ([group])<10
ORDER BY [���������� ���������] DESC -- � ������� ��������
------------------------------------------- ------

		--7--
Select 

	--discipline_name AS '����������', 
	[���������] = discipline_name,
	[���������� ��������������] = COUNT (Teacher.teacher_id)
	
FROM Teacher, Disciplines, TeacherDiscipline
WHERE Teacher.teacher_id = TeacherDiscipline.teacher AND
TeacherDiscipline.discipline = Disciplines.disciplin_id
GROUP BY Disciplines.discipline_name

---------------------------------------------------

		--8--

