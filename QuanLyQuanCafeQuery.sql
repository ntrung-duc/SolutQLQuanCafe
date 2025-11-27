CREATE DATABASE QuanLyQuanCafe
ON PRIMARY 
(NAME='QuanLyQuanCafe_DAT', FILENAME='E:\project\QuanLyQuanCafe\QuanLyQuanCafe\DatabaseNew\QuanLyQuanCafe_DAT.MDF')
LOG ON 
(NAME='QuanLyQuanCafe_LOG', FILENAME='E:\project\QuanLyQuanCafe\QuanLyQuanCafe\DatabaseNew\QuanLyQuanCafe_LOG.LDF')

use QuanLyQuanCafe
go

-- FoodTable
create table FoodTable(
	id int IDENTITY(1,1) PRIMARY KEY,
	TableName nvarchar(100) not null DEFAULT N'Đặt tên vào đi',
	status nvarchar(100) not null default N'Trống' -- Trống || Có người
)

insert into FoodTable values('Bàn 1', N'Trống')
insert into FoodTable values('Bàn 2', N'Có người')
insert into FoodTable values('Bàn 3', N'Trống')
insert into FoodTable values('Bàn 4', N'Trống')
insert into FoodTable values('Bàn 5', N'Trống')
insert into FoodTable values('Bàn 6', N'Có người')


-- Account
create table Account(
	Username varchar(100) PRIMARY KEY,
	FullName nvarchar(100) not null DEFAULT N'Staff',
	Password varchar(100) not null DEFAULT '123456',
	address nvarchar(100) not null,
	phone int not null,
	gender bit not null,
	TypeAccount int not null default 0 -- 1 <=> admin, 0 <=> staff
)

insert into Account values('huyhop', N'Huy Hợp', '123456', N'Hà Nội', 01648956000, 'true', 1)
insert into Account values('tuanngoc', N'Tuấn Ngọc', '123456', N'Hưng Yên', 0975853000, 'true', 1)
insert into Account values('minhduc', N'Minh Đức', '123456', N'Thanh Hóa', 095856000, 'true', 1)
insert into Account values('staff', N'Thằng Test', '123456',  N'Việt Nam', 123456000, 'false', 0)


-- FoodCategory
create table FoodCategory(
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(100) not null DEFAULT N'Đặt tên vào đi'
)

insert into FoodCategory values(N'Đồ ăn')
insert into FoodCategory values(N'Đồ uống')


-- Food
create table Food(
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(100) not null DEFAULT N'Đặt tên vào đi',
	price float not null DEFAULT 0,
	idFoodCategory int not null,
	constraint FK_idFoodCategory_Food foreign key(idFoodCategory) references FoodCategory(id)
)

insert into Food values(N'Cafe đen', 20000, 2)
insert into Food values(N'Xúc xích', 10000, 1)
insert into Food values(N'Cafe trắng', 52000, 2)


-- FoodOrder
create table FoodOrder(
	id int IDENTITY(1,1) PRIMARY KEY,
	TimeCheckIn date not null DEFAULT GETDATE(),
	TimeCheckOut date,
	Status int not null DEFAULT 0, -- 0: Chưa thanh toán && 1 Đã thanh toán
	idFoodTable int not null,
	totalPrice float,
	constraint FK_idFoodTable_FoodOrder foreign key(idFoodTable) references FoodTable(id)
)

insert into FoodOrder values('2018-05-15', '2018-05-15', 0, 2, 150000)
insert into FoodOrder values('2018-05-14', '2018-05-14', 0, 6, 200000)
insert into FoodOrder values('2018-05-17', '2018-05-17', 0, 3, 100000)
select * from FoodOrder


-- OrderDetail
create table OrderDetail(
	id int IDENTITY(1,1) PRIMARY KEY,
	idFoodOrder int not null,
	idFood int not null,
	amount int not null DEFAULT 0,
	constraint FK_idFoodOrder_OrderDetail foreign key(idFoodOrder) references FoodOrder(id),
	constraint FK_idFood_OrderDetail foreign key(idFood) references Food(id)
)

insert into OrderDetail values(2, 1, 3)
insert into OrderDetail values(6, 7, 10)



----------------- Sql query
Select * From FoodTable
Select * From Account
Select * From FoodOrder
Select * From OrderDetail
Select * From Food



-- Bảng FoodOrder thêm 2 cột là totalPrice và discount nữa!
ALTER TABLE FoodOrder ADD totalPrice Float 
ALTER TABLE FoodOrder ADD discount INT
UPDATE FoodOrder SET discount = 0
GO


select * from FoodOrder
select * from OrderDetail




-- Code Sql của Ngọc
-- Thống kê doanh thu theo ngày	
CREATE PROC SP_LayDSThongKeTheoNgay @TimeCheckIn date, @TimeCheckOut date
AS
BEGIN
	SELECT FoodTable.TableName, FoodOrder.totalPrice, TimeCheckIn, TimeCheckOut, discount
	FROM FoodTable, FoodOrder 
	WHERE FoodTable.id = FoodOrder.idFoodTable 
	AND TimeCheckIn >= @TimeCheckIn AND TimeCheckOut <= @TimeCheckOut AND FoodOrder.status = 1
END
GO

SELECT FoodTable.TableName, FoodOrder.totalPrice, TimeCheckIn, TimeCheckOut, discount 
FROM FoodTable, FoodOrder 
WHERE FoodTable.id = FoodOrder.idFoodTable AND TimeCheckIn >= '2018-05-14' AND TimeCheckOut <=  '2018-05-21' AND FoodOrder.status = 1


SELECT f.id AS 'Mã món', f.name AS 'Tên món', f.price AS 'Giá', c.name AS 'Tên danh mục' FROM Food AS f, FoodCategory AS c WHERE f.idFoodCategory = c.id


Select * From FoodCategory Where name = N'Đồ uống'

Update Food Set name = N'', idFoodCategory = , price = 0 Where id = 


SELECT f.id AS 'Mã món', f.name AS 'Tên món', f.price AS 'Giá', c.name AS 'Tên danh mục' FROM Food AS f, FoodCategory AS c WHERE f.idFoodCategory = c.id AND f.name LIKE N'%en%'


Select * From FoodCategory
Delete FoodCategory Where id = 5

Select * From Account
Select Username, Fullname, address, phone, gender, typeAccount From Account


insert into Account values('huyhop', N'Huy Hợp', '123456', N'Hà Nội', 01648956000, 'true', 1)

-- DUC
select * from FoodCategory
select * from FoodTable
select * from Food
select * from FoodOrder
select * from OrderDetail

-- idOrder, Tên Món, Số lượng, Đơn giá

select id from FoodOrder where idFoodTable = 4 AND Status = 0;

select * from OrderDetail where OrderDetail.idFoodOrder = 6;


select FoodOrder.id, Food.name, OrderDetail.amount, Food.price from FoodOrder, Food, OrderDetail, FoodTable where 

-- odDAL.GetListOrderDetail(foDAL.GetUnCheckOrderByTableID(id));
-- Lấy ra DS của OrderDetail theo cái idFoodOrder vừa tìm được(Đưa ra id của FoodOrder theo idTable và có status = 0);
;
ALTER TABLE FoodOrder ALTER COLUMN discount int not null
ALTER TABLE FoodOrder ALTER COLUMN totalPrice float not null
ALTER TABLE FoodOrder ALTER COLUMN TimeCheckOut date not null
ALTER TABLE FoodOrder ALTER COLUMN discount int null
ALTER TABLE FoodOrder ALTER COLUMN totalPrice float null


select * from Food where idFoodCategory = 1;
delete Food where id = 8
delete FoodCategory where id = 4

select * from OrderDetail, FoodOrder, Food where OrderDetail.idFoodOrder = FoodOrder.id AND OrderDetail.idFood = Food.id AND FoodOrder.idFoodTable = 4;

select Food.name, OrderDetail.amount, Food.price, OrderDetail.amount*Food.price as TongTien from OrderDetail, FoodOrder, Food where OrderDetail.idFoodOrder = FoodOrder.id AND OrderDetail.idFood = Food.id AND FoodOrder.Status = 0 AND FoodOrder.idFoodTable = 2;

update FoodOrder SET Status = 1 where id = ;

-- END DUC
create proc proc_InsertOrder
	@idTable INT, @discount INT
AS
BEGIN
	INSERT FoodOrder(TimeCheckIn, TimeCheckOut, Status, idFoodTable, discount) values(GETDATE(), null, 0, @idTable, 0)
END
drop proc proc_InsertOrder
EXEC proc_InsertOrder 2

select * from FoodOrder
select * from OrderDetail
delete FoodOrder where id = 14
delete OrderDetail where id = 13

--------

create proc proc_InsertOrderDetail 
	@idFoodOrder INT, @idFood INT, @mount INT
AS
BEGIN
	INSERT OrderDetail(idFoodOrder, idFood, amount) values(@idFoodOrder, @idFood, @mount)
END
GO

create proc proc_InsertOrderDetail @idFoodOrder INT, @idFood INT, @amount INT
AS
BEGIN
	DECLARE @IsOrderDetail INT
	DECLARE @FoodAmount INT = 1

	SELECT @IsOrderDetail = id, @FoodAmount = OrderDetail.amount 
		FROM OrderDetail 
		where idFoodOrder = @idFoodOrder AND idFood = @idFood
	IF(@IsOrderDetail > 0)
	BEGIN
		DECLARE @newAmount INT = @FoodAmount + @amount
		IF(@newAmount > 0)
			UPDATE OrderDetail SET amount = @FoodAmount + @amount where idFood = @idFood
		ELSE
			DELETE OrderDetail WHERE idFoodOrder = @idFoodOrder AND idFood = @idFood
	END
	ELSE
	BEGIN
		INSERT OrderDetail(idFoodOrder, idFood, amount) values(@idFoodOrder, @idFood, @amount)
	END
END
GO
exec proc_InsertOrderDetail 20, 2, 4


select * from OrderDetail
select * from FoodOrder
select * from FoodTable

-------------------------
create trigger TRG_UpdateOrderDetail
on OrderDetail
for insert, update
as
begin
	declare @idOrder INT
	select @idOrder = idFoodOrder from inserted
	declare @idTable INT
	select @idTable = idFoodTable from FoodOrder where id = @idOrder AND Status = 0
		update dbo.FoodTable SET status = N'Có người' where id = @idTable
end
go

update FoodOrder SET Status = 1, totalPrice = 30000 where id = 22
create trigger TRG_UpdateFoodOrder ON FoodOrder
FOR UPDATE
as
BEGIN
	declare @idOrder INT
	SELECT @idOrder = id from inserted
	declare @idTable INT
	select @idTable = idFoodTable from FoodOrder where id = @idOrder

	declare @amount int = 0
	SELECT @amount = COUNT(*) from FoodOrder where idFoodTable = @idTable AND Status = 0
	IF(@amount = 0)
		UPDATE FoodTable SET status = N'Trống' where id = @idTable
END
-- END DUC
--- HOP
select * from Account;

create proc USP_GetAccountByUserName
@userName nvarchar(100)
AS
BEGIN
	SELECT * FROM dbo.Account WHERE UserName=@userName
END
GO

EXEC dbo.USP_GetAccountByUserName @userName ='huyhop' --varchar(100)

-- END HOP
alter proc proc_InsertOrder
	@idTable INT, @discount INT
AS
BEGIN
	INSERT FoodOrder(TimeCheckIn, TimeCheckOut, Status, idFoodTable, discount) values(GETDATE(), GETDATE(), 0, @idTable, 0)
END

drop proc proc_InsertOrder
EXEC proc_InsertOrder 2

select * from FoodOrder
select * from OrderDetail
delete FoodOrder where id = 14
delete OrderDetail where id = 13



create proc proc_InsertOrderDetail 
	@idFoodOrder INT, @idFood INT, @mount INT
AS
BEGIN
	INSERT OrderDetail(idFoodOrder, idFood, amount) values(@idFoodOrder, @idFood, @mount)
END
GO


-- Phần xem thêm số món âm thì xóa Orderdetail
alter proc proc_InsertOrderDetail @idFoodOrder INT, @idFood INT, @amount INT
AS
BEGIN
	DECLARE @IsOrderDetail INT
	DECLARE @FoodAmount INT = 0

	SELECT @IsOrderDetail = id, @FoodAmount = OrderDetail.amount 
		FROM OrderDetail 
		where idFoodOrder = @idFoodOrder AND idFood = @idFood

	IF(@IsOrderDetail > 0)
		BEGIN
			DECLARE @newAmount INT = @FoodAmount + @amount
			IF(@newAmount > 0)
				UPDATE OrderDetail SET amount = @FoodAmount + @amount where idFood = @idFood
			ELSE
				delete OrderDetail WHERE idFoodOrder = @idFoodOrder AND idFood = @idFood
		END
	ELSE
		BEGIN
			INSERT into OrderDetail(idFoodOrder, idFood, amount) values(@idFoodOrder, @idFood, @amount)
		END
END
GO
select * from OrderDetail
exec proc_InsertOrderDetail 20, 2, 4


select * from OrderDetail
select * from FoodOrder
select * from FoodTable

-------------------------
create trigger TRG_UpdateOrderDetail
on OrderDetail
for insert, update
as
begin
	declare @idOrder INT
	select @idOrder = idFoodOrder from inserted

	declare @idTable INT
	select @idTable = idFoodTable from FoodOrder where id = @idOrder AND Status = 0

		update dbo.FoodTable SET status = N'Có người' where id = @idTable
end
go

update FoodOrder SET Status = 1, totalPrice = 30000 where id = 22

create trigger TRG_UpdateFoodOrder 
ON FoodOrder
FOR UPDATE
as
BEGIN
	declare @idOrder INT
	SELECT @idOrder = id from inserted

	declare @idTable INT
	select @idTable = idFoodTable from FoodOrder where id = @idOrder

	declare @amount int = 0
	SELECT @amount = COUNT(*) from FoodOrder where idFoodTable = @idTable AND Status = 0

	IF(@amount = 0)
		UPDATE FoodTable SET status = N'Trống' where id = @idTable
END


select * from foodorder 


