USE [Acad_PD321(class)]

Select  
 --last_name + ' ' + first_name + ' ' + middle_name + ' ' AS '�.�.� ��������',
 last_name + ' ' + first_name + ' ' + middle_name + ' ' AS '�.�.� �������������',
 DATEDIFF (hour, birth_date, GETDATE ())/8766 AS '�������',
 DATEDIFF (hour, work_since, GETDATE())/8766 AS '���� ������������'
 From Teacher 