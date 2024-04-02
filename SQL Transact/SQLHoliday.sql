USE [Acad_PD321(class)]
Delete From Calibration WHERE Calibration.holidays_month =5

DECLARE @day TINYINT = 3
DECLARE @end_day TINYINT = 4
Declare @month TINYINT = 11
Declare @name NVARCHAR(50) = 'День народного единства'

WHILE @day < @end_day
Begin 
	IF (NOT EXISTS (Select * From Calibration WHERE @day = holidays_day AND @month = holidays_month)) 
	Begin
		INSERT INTO Calibration (holidays_day, holidays_month, holidays_name) 
		Values (@day, @month, @name)
	End
	Set @day = @day+1
End 

Select * From Calibration  Order By Calibration.holidays_month