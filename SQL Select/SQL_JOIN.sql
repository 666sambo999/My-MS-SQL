USE [Acad_PD321(class)]

--SELECT 
-- last_name + ' ' + first_name + ' '+ middle_name AS '�.�.� ��������', 
-- DATEDIFF (hour, birth_date, GETDATE())/8766  AS '�������',
-- [������] = group_name 
 
--FROM Students
----WHERE Students.[group] = Groups.group_id
-- JOIN Groups ON (Students.[group] = Groups.group_id)  
--ORDER BY last_name

----------------------------------------------------------------
--SELECT 
--	[�.�.�. ��������] = FORMATMESSAGE ('%s %s %s', last_name, first_name, middle_name),   
--	[������] = group_name,
--	[����������� ��������] = direction_name
--FROM Students
-- JOIN Groups ON (Students.[group] = group_id)
--RIGHT OUTER JOIN Directions ON (Groups.direction = direction_id)
--ORDER BY last_name

-------------------------------------------------------------

SELECT 
	[����������] = discipline_name,
	[���������� ��������������] = COUNT (Teacher.teacher_id)
FROM Teacher
JOIN TeacherDiscipline ON (teacher = teacher_id)
RIGHT OUTER JOIN Disciplines ON (discipline = disciplin_id)

Group BY discipline_name
Having COUNT(teacher_id) >1 AND COUNT (teacher_id)<=3 
ORDER BY [���������� ��������������]