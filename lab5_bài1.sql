---Bài 1/1
CREATE PROCEDURE sp_hello
	@Ten nvarchar(30)
AS
BEGIN
	PRINT'Xin Chào '+@Ten;
END
EXEC sp_hello N'HÂN';
 --Bài 1/2
 CREATE PROCEDURE sp_tong 
	@s1 int,@s2 int
AS
BEGIN
	DECLARE @tg INT;
	SET @tg=@s1+@s2
	PRINT N'Tổng là: '+cast(@tg as varchar);
END
EXEC sp_tong 10,9;
--Bài 1/3
CREATE PROCEDURE sp_tongsochan
	@N int
AS
BEGIN
	DECLARE @SUM INT,@I INT;
	SET @SUM =0
	SET @I=1

	WHILE @I<=@N
	BEGIN
		IF @I % 2 =0
		BEGIN
			SET @SUM =@SUM+@I;
		END;
		SET @I=@I+1;
	END;
	PRINT N'Tổng các số chẵn: '+CAST (@SUM AS VARCHAR);
END;
EXEC sp_tongsochan 10
--Bài 1/4
CREATE PROCEDURE sp_ucln
	@a int,@b int
as
begin
	declare @temp int;
	if @a>@b
	begin
		select @temp=@a, @a = @b, @b = @temp;
	end
	while @b % @a !=0
	begin
		select @temp=@a, @a = @b % @a,@b = @temp;
	end
	print N'Ước số chung lớn nhất: '+cast(@a as varchar);
end
exec sp_ucln 20,9
