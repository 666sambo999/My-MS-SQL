USE [Acad_PD321(class)]

Select  
 --last_name + ' ' + first_name + ' ' + middle_name + ' ' AS 'Ф.И.О студента',
 last_name + ' ' + first_name + ' ' + middle_name + ' ' AS 'Ф.И.О преподавателя',
 DATEDIFF (hour, birth_date, GETDATE ())/8766 AS 'Возраст',
 DATEDIFF (hour, work_since, GETDATE())/8766 AS 'Опыт преподавания'
 From Teacher 