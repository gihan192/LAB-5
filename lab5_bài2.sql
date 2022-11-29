--Bài 2/1
create procedure sp_timNVtheoma
	@MANV nvarchar(9)
as
begin
	select*from NHANVIEN where MANV=@MANV;
end
exec sp_timNVtheoma '005';
--Bài 2/2
create procedure sp_TongNVthamgiaDA
	@MADA int
as
begin
	select COUNT(MA_NVIEN) AS 'Số Lượng' from PHANCONG where  MADA=@MADA;
end
exec [dbo].[sp_TongNVthamgiaDA] 1;
--Bài 2/3
create procedure sp_ThongKeNVDeAn
	@MADA int,@DDIEM_DA nvarchar(15)
as
begin
	select count(b.MA_NVIEN) as 'Số Lượng'
		from DEAN a inner join PHANCONG b on a.MADA = b.MADA
		where a.MADA = @MADA and a.DDIEM_DA = @DDIEM_DA;
end
exec [dbo].[sp_ThongKeNVDeAn] 1 ,N'Vũng Tàu';
--Bài 2/4
create procedure sp_TimNVTheoTP
	@TRPHG nvarchar(9)
as
begin
	select b.*from PHONGBAN a inner join NHANVIEN b on a.MAPHG =b.PHG
		where a.TRPHG=@TRPHG and
			not exists(select * from THANNHAN where MANV =b.MANV)
end
exec [dbo].[sp_TimNVTheoTP] '001' 
--Bài 2/5
create procedure sp_KiemTraNVThuocPhong
	@MANV nvarchar(9),@MAPB int
as
begin
	declare @Dem int;
	select @Dem = count(MANV) from NHANVIEN where MANV =@MANV and PHG = @MAPB;
	return @Dem;
end

declare @result int;
exec @result = [dbo].[sp_KiemTraNVThuocPhong] '005',5;
select @result;