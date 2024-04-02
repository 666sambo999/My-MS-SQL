

DECLARE @day_1 NVARCHAR(15) = 'Понедельник'
DECLARE @day_2 NVARCHAR(15) = 'Среда'
DECLARE @day_3 NVARCHAR(15) = 'Пятница'

DECLARE @start_day Date = '2024-03-27'
DECLARE @date Date = @start_day

DECLARE @number_of_lessons INT =24
DECLARE @number_of_lesson INT =1

While @number_of_lesson < @number_of_lessons
Begin 
	IF DATENAME(WEEKDAY, @date) IN (@day_1, @day_2,@day_3)
	Begin 
		Print (FORMATMESSAGE('%s, %s', CONVERT (VARCHAR(25),@date), DATENAME (WEEKDAY, @date)))
		--Print (DATENAME (WEEKDAY, @date))
		SET @number_of_lesson = @number_of_lesson +2
	End
		Set @date = DATEADD(DAY, 1, @date)

End