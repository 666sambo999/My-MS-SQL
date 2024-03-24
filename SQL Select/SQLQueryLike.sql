USE [Acad_PD321(class)]

Select * 
FROM Disciplines
--WHERE discipline_name LIKE ('%[A-Z]%')
WHERE discipline_name NOT LIKE ('%[A-Z]%')