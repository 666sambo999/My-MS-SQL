USE PD_321_SQL

--CREATE TABLE Directions
--(
--	direction_id TINYINT PRIMARY KEY,
--	direction_name NVARCHAR(50) NOT NULL
--)

--ALTER TABLE Directions 
--	ALTER COLUMN direction_name NVARCHAR(50) NOT NULL

-------------------------------------------------------
--CREATE TABLE GROUPS
--(
--	group_id INT PRIMARY KEY IDENTITY (1,1),
--	group_name NVARCHAR(10) NOT NULL,
--	direction TINYINT CONSTRAINT FK_GROUP_Direction FOREIGN KEY  REFERENCES Directions(direction_id) 
--)

--ALTER TABLE GROUPS 
--	ALTER COLUMN direction TINYINT NOT NULL
--------------------------------------------------------------

--CREATE TABLE Students
--(
--	stud_id INT PRIMARY KEY IDENTITY (1,1),
--	last_name NVARCHAR(40) NOT NULL,
--	first_name NVARCHAR(30) NOT NULL,
--	middle_name NVARCHAR(40), 
--	birth_date DATE NOT NULL,
--	email NVARCHAR (30),
--	phone NVARCHAR(40) NOT NULL,
--	photo IMAGE, 
--	[group] INT  CONSTRAINT FK_Stud_Group FOREIGN KEY REFERENCES GROUPS (group_id)
--)
--------------------------------------------------------------
--CREATE Table Teacher 
--(
--	teacher_id SMALLINT PRIMARY KEY IDENTITY(1,1),
--	last_name NVARCHAR(50) NOT NULL,
--	first_name NVARCHAR(40) NOT NULL,
--	middle_name NVARCHAR(40), 
--	birth_date DATE		NOT NULL,
--	email NVARCHAR (30),
--	phone NVARCHAR(40) NOT NULL,
--	photo IMAGE
--)
----------------------------------------------------
--Create Table Exams
--(
--	student INT NOT NULL
--	CONSTRAINT FK_Stud_Exames 
--	FOREIGN KEY REFERENCES Students (stud_id),
	
--	discipline SMALLINT NOT NULL
--	CONSTRAINT FK_Stud_disciplineExames 
--	FOREIGN KEY REFERENCES Disciplines (discipline_id),
--	Primary Key (student, discipline),
	
--	[data] Date NOT NULL, 
--	grade TINYINT NOT NULL,
--)
------------------------------------------------
--CREATE Table Schudule
--(
--	lesson_id BIGINT Primary Key IDENTITY(1,1),
--	[group] INT NOT NULL
--	CONSTRAINT FK_Group_schudule 
--	FOREIGN KEY REFERENCES Groups (group_id),
--	discipline Smallint NOT NULL
--	CONSTRAINT FK_Discipline_schudule 
--	FOREIGN KEY REFERENCES Disciplines (discipline_id),
--	teacher Smallint NOT NULL
--	CONSTRAINT FK_Teacher_schudule 
--	FOREIGN KEY REFERENCES Teacher (teacher_id),
--	[data] Date NOT NULL, 
--	[time] Time NOT NULL,
--	spent Bit NOT NULL
--)
--CREATE Table Attendence
--(
--	student INT NOT NULL 
--	CONSTRAINT FK_Stud_Attendence  
--	FOREIGN KEY REFERENCES Students (stud_id),
--	lesson BIGINT NOT NULL
--	CONSTRAINT FK_lesson_Attendence  
--	FOREIGN KEY REFERENCES Schudule (lesson_id),
--	Primary Key (student, lesson),
--	pressent BIT NOT NULL
--)
-------------------------------------------------------
CREATE Table Grade
(
	student INT NOT NULL
	CONSTRAINT FK_Stud_Grade  	
	FOREIGN KEY REFERENCES Students (stud_id),
	
	lesson BIGINT NOT NULL 
	CONSTRAINT FK_Grade_Lesson  
	FOREIGN KEY REFERENCES Schudule (lesson_id)
	Primary Key (student, lesson),
	
	grade1 TINYINT NULL,
	grade2 TINYINT NULL
)