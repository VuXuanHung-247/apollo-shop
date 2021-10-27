--create database ApolloShop
go
use ApolloShop
--================================ Create Table ================================
CREATE TABLE Brand (
	BrandId INT IDENTITY (1, 1) PRIMARY KEY,
	BrandName NVARCHAR (255) NOT NULL
);
CREATE TABLE Discount (
	DiscountId INT IDENTITY (1, 1) PRIMARY KEY,
	DiscountName NVARCHAR (255) NOT NULL,
	DiscountRate INT, 
	CreateDate DateTime2(7),
	CreateEnd DateTime2(7)
);
CREATE TABLE Supplier (
	SupplierId INT IDENTITY (1, 1) PRIMARY KEY,
	SupplierName NVARCHAR (255) NOT NULL,
	Phone NVARCHAR (255),
	Address NVARCHAR (255)
);
CREATE TABLE ProductType (
	ProductTypeId INT IDENTITY (1, 1) PRIMARY KEY,
	ProductTypeName NVARCHAR (255) NOT NULL,
	Description NVARCHAR (500) NOT NULL,
	ProductTypeImage NVARCHAR (1000) NOT NULL
);
CREATE TABLE Product (
	ProductId INT IDENTITY (1, 1) PRIMARY KEY,
	BrandId INT NOT NULL,
	ProductTypeId INT NOT NULL,
	DiscountId INT,
	ProductName NVARCHAR (255)  NOT NULL,
	Description NVARCHAR (500) ,
	ProductImage NVARCHAR (1000) NOT NULL,
	Size INT,
	Color NVARCHAR(50),
	Price FLOAT NOT NULL,
	DiscountPrice FLOAT, -- Trigger Gia * TyLeKhuyenMai
	InventoryQuantity INT, -- Trigger SoluongNhap (PhieuNhap) - SoLuongSanPham(ChiTietDonHang)
	IsNewProduct BIT ,
	FOREIGN KEY (ProductTypeId) REFERENCES ProductType(ProductTypeId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (BrandId) REFERENCES Brand (BrandId) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (DiscountId) REFERENCES Discount (DiscountId) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE UserLogin (
	UserLoginId INT IDENTITY (1, 1) PRIMARY KEY,
	UserLoginType INT NOT NULL,-- 1 - khách hàng, 2 - admin
	UserName NVARCHAR (255) NOT NULL,
	PassWord NVARCHAR (500) NOT NULL,
	CreateDate DateTime2(7)
);
CREATE TABLE Customer (
	CustomerId INT IDENTITY (1, 1) PRIMARY KEY,
	UserLoginId INT ,
	CustomerName NVARCHAR (255) NOT NULL,
	Phone NVARCHAR (255) NOT NULL,
	Email NVARCHAR (255) NOT NULL,
	Gender bit,
	DayOfBirth DateTime2(7),
	Address NVARCHAR (500),
	FOREIGN KEY (UserLoginId) REFERENCES UserLogin (UserLoginId) ON DELETE NO ACTION ON UPDATE NO ACTION,
);
CREATE TABLE Employee (
	EmployeeId INT IDENTITY (1, 1) PRIMARY KEY,
	UserLoginId INT NOT NULL,
	EmployeeName NVARCHAR (255) NOT NULL,
	Phone NVARCHAR (255),
	Email NVARCHAR (255),
	DayOfBirth DateTime2(7),
	Gender bit,
	Address NVARCHAR (255)
	FOREIGN KEY (UserLoginId) REFERENCES UserLogin (UserLoginId) ON DELETE NO ACTION ON UPDATE NO ACTION,
);
CREATE TABLE ImportBill(
	ImportBillId INT IDENTITY (1, 1) PRIMARY KEY,
	ProductId INT NOT NULL,
	SupplierId INT NOT NULL,
	EmployeeId INT NOT NULL,
	CreateDate DateTime2(7) NOT NULL,
	ImportPrice FLOAT NOT NULL,
	ImportQuantity INT NOT NULL,
	TotalMoney FLOAT -- GiaNhap * SoLuong - Trigger
	FOREIGN KEY (SupplierId) REFERENCES Supplier (SupplierId) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (EmployeeId) REFERENCES Employee (EmployeeId) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (ProductId) REFERENCES Product (ProductId) ON DELETE NO ACTION ON UPDATE NO ACTION
	--NgayThanhLy DateTime2(7) NOT NULL,
	--SoluongThanhLy INT NOT NULL,
	--NguoiXuLy NVARCHAR (255) NOT NULL
);
CREATE TABLE OnlinePayment (
	OnlinePaymentId INT IDENTITY (1, 1) PRIMARY KEY,
	PaymentDate DateTime2(7) NOT NULL,
	TotalMoneyPayment FLOAT
);
CREATE TABLE Orders (
	OrdersId INT IDENTITY (1, 1) PRIMARY KEY,
	EmployeeId INT NOT NULL,
	CustomerId INT,
	OnlinePaymentId INT ,
	CreatDate DateTime2(7) NOT NULL,
	OrderStatus INT,
	PaymentStatus INT,
	GhiChu NVARCHAR (255) NOT NULL,
	FOREIGN KEY (EmployeeId) REFERENCES Employee (EmployeeId) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (CustomerId) REFERENCES Customer (CustomerId) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (OnlinePaymentId) REFERENCES OnlinePayment (OnlinePaymentId) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE OrderDetail (
	OrdersId INT IDENTITY (1, 1) PRIMARY KEY,
	ProductId INT NOT NULL,
	ProductQuantity INT,
	TotalMoney FLOAT,
	FOREIGN KEY (OrdersId) REFERENCES Orders (OrdersId) ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (ProductId) REFERENCES Product (ProductId) ON DELETE NO ACTION ON UPDATE NO ACTION,
);
CREATE TABLE SystemLog (
	SystemLogId INT IDENTITY (1, 1) PRIMARY KEY,
	SystemLogName NVARCHAR (255)  NOT NULL,
	UserName NVARCHAR (255) NOT NULL, -- người xử lý(tạo log) - lấy user đăng nhập
	SystemLogType INT NOT NULL, -- enum tên bảng
	SystemLogActionType INT NOT NULL,-- enum thêm sửa xóa
	DataBefore NVARCHAR (max) NOT NULL,
	DataAfter NVARCHAR (max) NOT NULL,
	CreateDate DateTime2(7),
	UpdateDate DateTime2(7)
);
--go
--CREATE PROCEDURE Proc_GetAccount(@username NVARCHAR(255))
--AS
--BEGIN
--SELECT *
--FROM TaiKhoanKhachHang
--WHERE UserName = @username
--END
--GO

--EXEC Proc_GetAccount ''or 1=1--'

--select * from TaiKhoanKhachHang
--where UserName = ''or 1=1--' and PassWord = ''admin' or 1=1--'