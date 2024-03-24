USE [Acad_PD321(class)]

--SELECT 
-- last_name + ' ' + first_name + ' '+ middle_name AS 'Ф.И.О студента', 
-- DATEDIFF (hour, birth_date, GETDATE())/8766  AS 'Возраст',
-- [группа] = group_name 
 
--FROM Students
----WHERE Students.[group] = Groups.group_id
-- JOIN Groups ON (Students.[group] = Groups.group_id)  
--ORDER BY last_name

----------------------------------------------------------------
--SELECT 
--	[Ф.И.О. студента] = FORMATMESSAGE ('%s %s %s', last_name, first_name, middle_name),   
--	[группа] = group_name,
--	[направления обучения] = direction_name
--FROM Students
-- JOIN Groups ON (Students.[group] = group_id)
--RIGHT OUTER JOIN Directions ON (Groups.direction = direction_id)
--ORDER BY last_name

-------------------------------------------------------------

SELECT 
	[дисциплина] = discipline_name,
	[Количество преподавателей] = COUNT (Teacher.teacher_id)
FROM Teacher
JOIN TeacherDiscipline ON (teacher = teacher_id)
RIGHT OUTER JOIN Disciplines ON (discipline = disciplin_id)

Group BY discipline_name
Having COUNT(teacher_id) >1 AND COUNT (teacher_id)<=3 
ORDER BY [Количество преподавателей]