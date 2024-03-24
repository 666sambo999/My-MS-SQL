USE PD_321_SQL

--CREATE TABLE Disciplines
--(
--	discipline_id SMALLINT PRIMARY KEY IDENTITY(1,1),
--	discipline_name NVARCHAR(50) NOT NULL,
--	number_of_lesson TINYINT NOT NULL
--)
---------------------------------------
--CREATE TABLE DisciplineDirectionRelation
--(
--	discipline SMALLINT CONSTRAINT FK_DisciplinesDirectRelation FOREIGN KEY REFERENCES Disciplines(discipline_id),
--	direction TINYINT  CONSTRAINT FK_Discipline_Direction FOREIGN KEY REFERENCES Directions(direction_id),
--	PRIMARY KEY (discipline, direction)
--)

--CREATE TABLE Required_Disciplines
--(
--	discipline SMALLINT NOT NULL 
--	CONSTRAINT FK_discipline_Discipline  REFERENCES  Disciplines (discipline_id),
--	reqyired_discipline SMALLINT CONSTRAINT FK_Requires_Disciplines 
--	REFERENCES  Disciplines (discipline_id)
	
--	PRIMARY KEY (discipline, reqyired_discipline)
--)

--CREATE TABLE Dependend_Disciplines
--(
--	discipline SMALLINT NOT NULL 
--	CONSTRAINT FK_Current_dependent  REFERENCES  Disciplines (discipline_id),
--	dependend_discipline SMALLINT CONSTRAINT FK_DependentDiscipline_Disciplines 
--	REFERENCES  Disciplines (discipline_id)
--	PRIMARY KEY (discipline, dependend_discipline)
--)
---------------------------------------------
--CREATE Table TeacherDiscipline
--(
--	teacher SMALLINT  NOT NULL
--	CONSTRAINT FK_Teacher_discipline  
--	FOREIGN KEY REFERENCES Teacher (teacher_id),
	
--	discipline SMALLINT NOT NULL 
--	CONSTRAINT FK_Teacher_discipline_Relation
--	FOREIGN KEY REFERENCES Disciplines(discipline_id)

--	Primary Key (teacher, discipline)
--)

--Create Table CompleteDiscipline
--(
--	[group] INT NOT NULL 
--	CONSTRAINT FK_Complite_disciplineGroup  
--	FOREIGN KEY REFERENCES Groups (group_id),

--	discipline SMALLINT  
--	CONSTRAINT FK_Complite_discipline 
--	FOREIGN KEY REFERENCES Disciplines (discipline_id)
--	Primary Key ([group], discipline)
--)