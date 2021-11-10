
--go
--create proc Register(
--		@UserLoginType int,
--		@UserName nvarchar(255),
--		@PassWord nvarchar(255),
--		@CreateDate datetime2(7))
--as
--begin 
--	INSERT INTO UserLogin(UserLoginType,UserName,PassWord,CreateDate)
--     VALUES
--           (@UserLoginType,@UserName,@PassWord,@CreateDate)
--end
--go
--exec Register 1,N'admin','123',''
--exec Register 2,N'hung247','hung1999','2021-10-09'
--go
--create proc Login(
--		@UserName nvarchar(255),
--		@PassWord nvarchar(255))
--as
--begin 
--	select * from UserLogin where UserName = @UserName and PassWord = @PassWord
--end
--go
--exec Login N'hungvx','hung1999'


-- ================================================== ProductType ==================================================
-- Proc_Get{_tableName}s 
						go
						create proc Proc_GetProductTypes
						as
						begin
							select * from ProductType
						end
						go
						exec Proc_GetProductTypes
--  Proc_Get{_tableName}ById 
						go
						create proc Proc_GetProductTypeById (@ProductTypeId int)
						as
						begin
							select * from ProductType where ProductTypeId = @ProductTypeId
						end
						go
						exec Proc_GetProductTypeById 1
-- Proc_Insert{_tableName} 
						go
						create proc Proc_InsertProductType(
															@ProductTypeName nvarchar(255), 
															@Description nvarchar(500), 
															@ProductTypeImage nvarchar(1000))
						as
						begin
							INSERT INTO [dbo].[ProductType]([ProductTypeName],[Description],[ProductTypeImage])
							VALUES
								   (@ProductTypeName,@Description,@ProductTypeImage)
						end
						go
						exec Proc_InsertProductType N'Giày Sneaker',N'Hàng cao cấp',''
--  Proc_Update{_tableName} 
						go
						create proc Proc_UpdateProductType(
															@ProductTypeId int, 
															@ProductTypeName nvarchar(255), 
															@Description nvarchar(500), 
															@ProductTypeImage nvarchar(1000))
						as
						begin
							UPDATE ProductType
							SET ProductTypeName = @ProductTypeName,
								Description = @Description,
								ProductTypeImage = @ProductTypeImage
							WHERE ProductTypeId = @ProductTypeId
						end
						go
						exec Proc_UpdateProductType 1, N'Giày Nike',N'Hàng nhập khẩu','abc.png'
--  Proc_Delete{_tableName}ById 
						go
						create proc Proc_DeleteProductTypeById (@ProductTypeId int)
						as
						begin
							delete from ProductType where ProductTypeId =@ProductTypeId
						end
						go
						exec Proc_DeleteProductTypeById 2


-- ================================================== Brand ==================================================
-- Proc_Get{_tableName}s 
						go
						create proc Proc_GetBrands
						as
						begin
							select * from Brand
						end
						go
						exec Proc_GetBrands
--  Proc_Get{_tableName}ById 
						go
						create proc Proc_GetBrandById (@BrandId int)
						as
						begin
							select * from Brand where BrandId = @BrandId
						end
						go
						exec Proc_GetBrandById 1
-- Proc_Insert{_tableName} 
						go
						create proc Proc_InsertBrand(@BrandName nvarchar(255))
						as
						begin
							INSERT INTO [dbo].[Brand]([BrandName])
							VALUES
								   (@BrandName)
						end
						go
						exec Proc_InsertBrand N'Sneaker'
--  Proc_Update{_tableName} 
						go
						create proc Proc_UpdateBrand(@BrandId int, @BrandName nvarchar(255))
						as
						begin
							UPDATE Brand
							SET BrandName = @BrandName
							WHERE BrandId = @BrandId
						end
						go
						exec Proc_UpdateBrand 1, N'Nike'
--  Proc_Delete{_tableName}ById 
						go
						create proc Proc_DeleteBrandById (@BrandId int)
						as
						begin
							delete from Brand where BrandId =@BrandId
						end
						go
						exec Proc_DeleteBrandById 2

-- ================================================== Discount ==================================================
-- Proc_Get{_tableName}s 
						go
						create proc Proc_GetDiscounts
						as
						begin
							select * from Discount
						end
						go
						exec Proc_GetDiscounts
--  Proc_Get{_tableName}ById 
						go
						create proc Proc_GetDiscountById (@DiscountId int)
						as
						begin
							select * from Discount where DiscountId = @DiscountId
						end
						go
						exec Proc_GetDiscountById 1
-- Proc_Insert{_tableName} 
						go
						create proc Proc_InsertDiscount(
															@DiscountName nvarchar(255), 
															@DiscountRate float, 
															@CreateDate datetime2(7),
															@CreateEnd datetime2(7))
						as
						begin
						    DECLARE @date1 datetime2 = GETDATE();
							DECLARE @date2 datetime2 = DATEADD(month, 1,GETDATE());
						    if(@CreateDate = '')
								set @CreateDate = @date1 
							if(@CreateEnd = '')
								begin 
									set @CreateEnd = @date2 
									if(@CreateDate != '')
									set @CreateEnd =  DATEADD(month, 1,@CreateDate);
								end
							
							INSERT INTO [dbo].[Discount]([DiscountName],[DiscountRate],[CreateDate],[CreateEnd])
							VALUES
								   (@DiscountName,@DiscountRate,@CreateDate,@CreateEnd)
						end
						go
						exec Proc_InsertDiscount N'Tết Trung thu',0.2,'','' 
--  Proc_Update{_tableName} 
						go
						create proc Proc_UpdateDiscount(
															@DiscountId int, 
															@DiscountName nvarchar(255), 
															@DiscountRate float, 
															@CreateDate datetime2(7),
															@CreateEnd datetime2(7))
						as
						begin
							DECLARE @date1 datetime2 = GETDATE();
							DECLARE @date2 datetime2 = DATEADD(month, 1,GETDATE());
						    if(@CreateDate = '')
								set @CreateDate = @date1 
							if(@CreateEnd = '')
								begin 
									set @CreateEnd = @date2 
									if(@CreateDate != '')
									set @CreateEnd =  DATEADD(month, 1,@CreateDate);
								end
							UPDATE Discount
							SET DiscountName = @DiscountName,
								DiscountRate = @DiscountRate,
								CreateDate = @CreateDate,
								CreateEnd = @CreateEnd
							WHERE DiscountId = @DiscountId
						end
						go
						exec Proc_UpdateDiscount 2, N'Khai trương chi nhánh',0.5,'2021-10-10 7:00',''
--  Proc_Delete{_tableName}ById 
						go
						create proc Proc_DeleteDiscountById (@DiscountId int)
						as
						begin
							delete from Discount where DiscountId =@DiscountId
						end
						go
						exec Proc_DeleteDiscountById 7


-- ================================================== Supplier ==================================================
-- Proc_Get{_tableName}s 
						go
						create proc Proc_GetSuppliers
						as
						begin
							select * from Supplier
						end
						go
						exec Proc_GetSuppliers
--  Proc_Get{_tableName}ById 
						go
						create proc Proc_GetSupplierById (@SupplierId int)
						as
						begin
							select * from Supplier where SupplierId = @SupplierId
						end
						go
						exec Proc_GetSupplierById 1
-- Proc_Insert{_tableName} 
						go
						create proc Proc_InsertSupplier(
															@SupplierName nvarchar(255), 
															@Phone nvarchar(255), 
															@Address nvarchar(255))
						as
						begin
							INSERT INTO [dbo].[Supplier]([SupplierName],[Phone],[Address])
							VALUES
								   (@SupplierName,@Phone,@Address)
						end
						go
						exec Proc_InsertSupplier N'Porkun Sneakers','0944039526','New York'
--  Proc_Update{_tableName} 
						go
						create proc Proc_UpdateSupplier(
															@SupplierId int, 
															@SupplierName nvarchar(255), 
															@Phone nvarchar(255), 
															@Address nvarchar(255))
						as
						begin
							UPDATE Supplier
							SET SupplierName = @SupplierName,
								Phone = @Phone,
								Address = @Address
							WHERE SupplierId = @SupplierId
						end
						go
						exec Proc_UpdateSupplier 1,  N'Porkun Sneakers','0944039526','Logs AngeLes'
--  Proc_Delete{_tableName}ById 
						go
						create proc Proc_DeleteSupplierById (@SupplierId int)
						as
						begin
							delete from Supplier where SupplierId =@SupplierId
						end
						go
						exec Proc_DeleteSupplierById 2

-- ================================================== OnlinePayment ==================================================
-- Proc_Get{_tableName}s 
						go
						create proc Proc_GetOnlinePayments
						as
						begin
							select * from OnlinePayment
						end
						go
						exec Proc_GetOnlinePayments
--  Proc_Get{_tableName}ById 
						go
						create proc Proc_GetOnlinePaymentById (@OnlinePaymentId int)
						as
						begin
							select * from OnlinePayment where OnlinePaymentId = @OnlinePaymentId
						end
						go
						exec Proc_GetOnlinePaymentById 1
-- Proc_Insert{_tableName} 
						go
						create proc Proc_InsertOnlinePayment(
															@PaymentDate datetime2(7), 
															@TotalMoneyPayment float)
						as
						begin
							DECLARE @date1 datetime2 = GETDATE();
						    if(@PaymentDate = '')
								set @PaymentDate = @date1 
							INSERT INTO [dbo].[OnlinePayment](PaymentDate,TotalMoneyPayment)
							VALUES
								   (@PaymentDate,@TotalMoneyPayment)
						end
						go
						exec Proc_InsertOnlinePayment '',32
--  Proc_Update{_tableName} 
						go
						create proc Proc_UpdateOnlinePayment(
															@OnlinePaymentId int, 
															@PaymentDate datetime2(7), 
															@TotalMoneyPayment float)
						as
						begin
							DECLARE @date1 datetime2 = GETDATE();
						    if(@PaymentDate = '')
								set @PaymentDate = @date1 
							UPDATE OnlinePayment
							SET PaymentDate = @PaymentDate,
								TotalMoneyPayment = @TotalMoneyPayment
							WHERE OnlinePaymentId = @OnlinePaymentId
						end
						go
						exec Proc_UpdateOnlinePayment 1, '',35.500
--  Proc_Delete{_tableName}ById 
						go
						create proc Proc_DeleteOnlinePaymentById (@OnlinePaymentId int)
						as
						begin
							delete from OnlinePayment where OnlinePaymentId =@OnlinePaymentId
						end
						go
						exec Proc_DeleteOnlinePaymentById 2


-- ================================================== Permision ==================================================
-- Proc_Get{_tableName}s 
						go
						create proc Proc_GetPermisions
						as
						begin
							select * from Permision
						end
						go
						exec Proc_GetPermisions
--  Proc_Get{_tableName}ById 
						go
						create proc Proc_GetPermisionById (@PermisionId int)
						as
						begin
							select * from Permision where PermisionId = @PermisionId
						end
						go
						exec Proc_GetPermisionById 1
-- Proc_Insert{_tableName} 
						go
						create proc Proc_InsertPermision(@PermisionName nvarchar(255))
						as
						begin
							INSERT INTO [dbo].[Permision]([PermisionName])
							VALUES
								   (@PermisionName)
						end
						go
						exec Proc_InsertPermision 'Full'
--  Proc_Update{_tableName} 
						go
						create proc Proc_UpdatePermision(
															@PermisionId int, 
															@PermisionName nvarchar(255))
						as
						begin
							UPDATE Permision
							SET PermisionName = @PermisionName
							WHERE PermisionId = @PermisionId
						end
						go
						exec Proc_UpdatePermision 1, 'Admin'
--  Proc_Delete{_tableName}ById 
						go
						create proc Proc_DeletePermisionById (@PermisionId int)
						as
						begin
							delete from Permision where PermisionId =@PermisionId
						end
						go
						exec Proc_DeletePermisionById 2

-- ================================================== PermisionDetail ==================================================
-- Proc_Get{_tableName}s 
						go
						create proc Proc_GetPermisionDetails
						as
						begin
							select * from PermisionDetail
						end
						go
						exec Proc_GetPermisionDetails
--  Proc_Get{_tableName}ById 
						go
						create proc Proc_GetPermisionDetailById (@PermisionDetailId int)
						as
						begin
							select * from PermisionDetail where PermisionDetailId = @PermisionDetailId
						end
						go
						exec Proc_GetPermisionDetailById 2
-- Proc_Insert{_tableName} 
						go
						create proc Proc_InsertPermisionDetail(
															@PermisionId int, 
															@ActionCode nvarchar(50),
															@CheckAction int)
						as
						begin
							INSERT INTO [dbo].[PermisionDetail](PermisionId,ActionCode,CheckAction)
							VALUES
								   (@PermisionId,@ActionCode,@CheckAction)
						end
						go
						exec Proc_InsertPermisionDetail 1,'CREATE',1
--  Proc_Update{_tableName} 
						go
						create proc Proc_UpdatePermisionDetail(
															@PermisionDetailId int, 
															@PermisionId int, 
															@ActionCode nvarchar(50),
															@CheckAction int)
						as
						begin
							UPDATE PermisionDetail
							SET PermisionId = @PermisionId,
								ActionCode = @ActionCode,
								CheckAction = @CheckAction
							WHERE PermisionDetailId = @PermisionDetailId
						end
						go
						exec Proc_UpdatePermisionDetail 2, 1,'EDIT',1
--  Proc_Delete{_tableName}ById 
						go
						create proc Proc_DeletePermisionDetailById (@PermisionDetailId int)
						as
						begin
							delete from PermisionDetail where PermisionDetailId =@PermisionDetailId
						end
						go
						exec Proc_DeletePermisionDetailById 2

-- ================================================== Users ==================================================
-- Proc_Get{_tableName}s 
						go
						create proc Proc_GetUserss
						as
						begin
							select * from Users
						end
						go
						exec Proc_GetUserss
--  Proc_Get{_tableName}ById 
						go
						create proc Proc_GetUsersById (@UsersId int)
						as
						begin
							select * from Users where UsersId = @UsersId
						end
						go
						exec Proc_GetUsersById 1
-- Proc_Insert{_tableName} 
						go
						create proc Proc_InsertUsers(
															@UserType int,
															@UserName nvarchar(255),
															@PassWord nvarchar(500), 
															@CreateDate datetime2(7))
						as
						begin
							DECLARE @date1 datetime2 = GETDATE();
						    if(@CreateDate = '')
								set @CreateDate = @date1 
							INSERT INTO [dbo].[Users](UserType,UserName,PassWord,CreateDate)
							VALUES
								   (@UserType,@UserName,@PassWord,@CreateDate)
						end
						go
						exec Proc_InsertUsers 0,'hungvx','5678',''
--  Proc_Update{_tableName} 
						go
						create proc Proc_UpdateUsers(
															@UsersId int, 
															@UserType int,
															@UserName nvarchar(255),
															@PassWord nvarchar(500), 
															@CreateDate datetime2(7))
						as
						begin
							DECLARE @date1 datetime2 = GETDATE();
						    if(@CreateDate = '')
								set @CreateDate = @date1 
							UPDATE Users
							SET UserType = @UserType,
								UserName = @UserName,
								PassWord = @PassWord,
								CreateDate = @CreateDate
							WHERE UsersId = @UsersId
						end
						go
						exec Proc_UpdateUsers 1, 1,'hungvx','1234',''
--  Proc_Delete{_tableName}ById 
						go
						create proc Proc_DeleteUsersById (@UsersId int)
						as
						begin
							delete from Users where UsersId =@UsersId
						end
						go
						exec Proc_DeleteUsersById 2

-- ================================================== UsersPermision ==================================================
-- Proc_Get{_tableName}s 
						go
						create proc Proc_GetUsersPermisions
						as
						begin
							select * from UsersPermision
						end
						go
						exec Proc_GetUsersPermisions
--  Proc_Get{_tableName}ById 
						go
						create proc Proc_GetUsersPermisionById (@UsersPermisionId int)
						as
						begin
							select * from UsersPermision where UsersPermisionId = @UsersPermisionId
						end
						go
						exec Proc_GetUsersPermisionById 1
-- Proc_Insert{_tableName} 
						go
						create proc Proc_InsertUsersPermision(
															@PermisionId int, 
															@UsersId int, 
															@Allowed int)
						as
						begin
							INSERT INTO [dbo].[UsersPermision](PermisionId,UsersId,Allowed)
							VALUES
								   (@PermisionId,@UsersId,@Allowed)
						end
						go
						exec Proc_InsertUsersPermision 1,1,1
--  Proc_Update{_tableName} 
						go
						create proc Proc_UpdateUsersPermision(
															@UsersPermisionId int,
															@PermisionId int, 
															@UsersId int, 
															@Allowed int)
						as
						begin
							UPDATE UsersPermision
							SET PermisionId = @PermisionId,
								UsersId = @UsersId,
								Allowed = @Allowed
							WHERE UsersPermisionId = @UsersPermisionId
						end
						go
						exec Proc_UpdateUsersPermision 1, 1, 1, 0
--  Proc_Delete{_tableName}ById 
						go
						create proc Proc_DeleteUsersPermisionById (@UsersPermisionId int)
						as
						begin
							delete from UsersPermision where UsersPermisionId =@UsersPermisionId
						end
						go
						exec Proc_DeleteUsersPermisionById 2


-- ================================================== Customer ==================================================
-- Proc_Get{_tableName}s 
						go
						create proc Proc_GetCustomers
						as
						begin
							select * from Customer
						end
						go
						exec Proc_GetCustomers
--  Proc_Get{_tableName}ById 
						go
						create proc Proc_GetCustomerById (@CustomerId int)
						as
						begin
							select * from Customer where CustomerId = @CustomerId
						end
						go
						exec Proc_GetCustomerById 1
-- Proc_Insert{_tableName} 
						go
						create proc Proc_InsertCustomer(
															@UsersId int,
															@CustomerName nvarchar(255), 
															@Phone nvarchar(255), 
															@Email nvarchar(255),
															@Gender bit,
															@DayOfBirth datetime2(7),
															@Address nvarchar(255))
						as
						begin
							INSERT INTO [dbo].[Customer](UsersId,[CustomerName],Phone,Email,Gender,DayOfBirth,Address)
							VALUES
								   (@UsersId,@CustomerName,@Phone,@Email,@Gender,@DayOfBirth,@Address)
						end
						go
						exec Proc_InsertCustomer 1,N'Vũ Xuân Hưng','0944039526','vuxuanhung247@gmail.com',0,'1999-07-24',N'Nam Định'
--  Proc_Update{_tableName} 
						go
						create proc Proc_UpdateCustomer(
															@CustomerId int, 
															@UsersId int,
															@CustomerName nvarchar(255), 
															@Phone nvarchar(255), 
															@Email nvarchar(255),
															@Gender bit,
															@DayOfBirth datetime2(7),
															@Address nvarchar(255))
						as
						begin
							UPDATE Customer
							SET UsersId = @UsersId,
								CustomerName = @CustomerName,
								Phone = @Phone,
								Email = @Email,
								Gender = @Gender,
								DayOfBirth = @DayOfBirth,
								Address = @Address
							WHERE CustomerId = @CustomerId
						end
						go
						exec Proc_UpdateCustomer 1, 1,N'Trần Minh Quân', '0944039526', 'minhtq@gmail.com', 0, '1999-07-24', N'Hà Nội'
--  Proc_Delete{_tableName}ById 
						go
						create proc Proc_DeleteCustomerById (@CustomerId int)
						as
						begin
							delete from Customer where CustomerId =@CustomerId
						end
						go
						exec Proc_DeleteCustomerById 2



-- ================================================== Employee ==================================================
-- Proc_Get{_tableName}s 
						go
						create proc Proc_GetEmployees
						as
						begin
							select * from Employee
						end
						go
						exec Proc_GetEmployees
--  Proc_Get{_tableName}ById 
						go
						create proc Proc_GetEmployeeById (@EmployeeId int)
						as
						begin
							select * from Employee where EmployeeId = @EmployeeId
						end
						go
						exec Proc_GetEmployeeById 1
-- Proc_Insert{_tableName} 
						go
						create proc Proc_InsertEmployee(
															@UsersId int,
															@EmployeeName nvarchar(255), 
															@Phone nvarchar(255), 
															@Email nvarchar(255),
															@Gender bit,
															@DayOfBirth datetime2(7),
															@Address nvarchar(255))
						as
						begin
							INSERT INTO [dbo].[Employee](UsersId,EmployeeName,Phone,Email,Gender,DayOfBirth,Address)
							VALUES
								   (@UsersId,@EmployeeName,@Phone,@Email,@Gender,@DayOfBirth,@Address)
						end
						go
						exec Proc_InsertEmployee 2, N'Lê Hoàng Nam', '0944039526', 'minhtq@gmail.com', 0, '1999-07-24', N'Hà Nội'
--  Proc_Update{_tableName} 
						go
						create proc Proc_UpdateEmployee(
															@EmployeeId int, 
															@UsersId int,
															@EmployeeName nvarchar(255), 
															@Phone nvarchar(255), 
															@Email nvarchar(255),
															@Gender bit,
															@DayOfBirth datetime2(7),
															@Address nvarchar(255))
						as
						begin
							UPDATE Employee
							SET UsersId = @UsersId,
								EmployeeName = @EmployeeName,
								Phone = @Phone,
								Email = @Email,
								Gender = @Gender,
								DayOfBirth = @DayOfBirth,
								Address = @Address
							WHERE EmployeeId = @EmployeeId
						end
						go
						exec Proc_UpdateEmployee 1, 2, N'Lê Hoàng Long', '0944039526', 'longlh@gmail.com', 0, '1999-09-09', N'Hà Nội'
--  Proc_Delete{_tableName}ById 
						go
						create proc Proc_DeleteEmployeeById (@EmployeeId int)
						as
						begin
							delete from Employee where EmployeeId =@EmployeeId
						end
						go
						exec Proc_DeleteEmployeeById 2
						

-- ================================================== Product ==================================================
-- Proc_Get{_tableName}s 
						go
						create proc Proc_GetProducts
						as
						begin
							select * from Product
						end
						go
						exec Proc_GetProducts
--  Proc_Get{_tableName}ById 
						go
						create proc Proc_GetProductById (@ProductId int)
						as
						begin
							select * from Product where ProductId = @ProductId
						end
						go
						exec Proc_GetProductById 1
-- Proc_Insert{_tableName} 
						go
						create proc Proc_InsertProduct(
															@BrandId int,
															@ProductTypeId int,
															@DiscountId int,
															@ProductName nvarchar(255), 
															@Description nvarchar(500), 
															@ProductImage nvarchar(1000),
															@Size int,
															@Color nvarchar(50),
															@Price float,
															@DiscountPrice float,
															@InventoryQuantity int,
															@IsNewProduct bit)
						as
						begin
							INSERT INTO [dbo].[Product](BrandId,ProductTypeId,DiscountId,ProductName,Description,ProductImage,Size,Color,Price,DiscountPrice,InventoryQuantity,IsNewProduct)
							VALUES
								   (@BrandId,@ProductTypeId,@DiscountId,@ProductName,@Description,@ProductImage,@Size,@Color,@Price,@DiscountPrice,@InventoryQuantity,@IsNewProduct)
						end
						go
						exec Proc_InsertProduct 1, 1, 1, N'Giày Nike', N'Hàng mới về','abc.png', 40, N'Trắng', 500000, null, 100, 1
--  Proc_Update{_tableName} 
						go
						create proc Proc_UpdateProduct(
															@ProductId int, 
															@BrandId int,
															@ProductTypeId int,
															@DiscountId int,
															@ProductName nvarchar(255), 
															@Description nvarchar(500), 
															@ProductImage nvarchar(1000),
															@Size int,
															@Color nvarchar(50),
															@Price float,
															@DiscountPrice float,
															@InventoryQuantity int,
															@IsNewProduct bit)
						as
						begin
							UPDATE Product
							SET BrandId = @BrandId,
								ProductTypeId = @ProductTypeId,
								DiscountId = @DiscountId,
								ProductName = @ProductName,
								Description = @Description,
								ProductImage = @ProductImage,
								Size = @Size,
								Color = @Color,
								Price = @Price,
								DiscountPrice = @DiscountPrice,
								InventoryQuantity = @InventoryQuantity,
								IsNewProduct = @IsNewProduct
							WHERE ProductId = @ProductId
						end
						go
						exec Proc_UpdateProduct 2, 1, 1, 1, N'Giày Sneakers', N'Hàng mới về','abc.png', 40, N'Trắng', 500000, null, 100, 1
--  Proc_Delete{_tableName}ById 
						go
						create proc Proc_DeleteProductById (@ProductId int)
						as
						begin
							delete from Product where ProductId =@ProductId
						end
						go
						exec Proc_DeleteProductById 1


-- ================================================== ImportBill ==================================================
-- Proc_Get{_tableName}s 
						go
						create proc Proc_GetImportBills
						as
						begin
							select * from ImportBill
						end
						go
						exec Proc_GetImportBills
--  Proc_Get{_tableName}ById 
						go
						create proc Proc_GetImportBillById (@ImportBillId int)
						as
						begin
							select * from ImportBill where ImportBillId = @ImportBillId
						end
						go
						exec Proc_GetImportBillById 1
-- Proc_Insert{_tableName} 
						go
						create proc Proc_InsertImportBill(
															@ImportBillId int,
															@ProductId int, 
															@SupplierId int, 
															@EmployeeId int,
															@CreateDate datetime2(7),
															@ImportPrice float,
															@ImportQuantity int,
															@TotalMoney float
															)
						as
						begin
							DECLARE @date1 datetime2 = GETDATE();
						    if(@CreateDate = '')
								set @CreateDate = @date1 
							INSERT INTO [dbo].[ImportBill](ImportBillId,ProductId,SupplierId,EmployeeId,CreateDate,ImportPrice,ImportQuantity,TotalMoney)
							VALUES
								   (@ImportBillId,@ProductId,@SupplierId,@EmployeeId,@CreateDate,@ImportPrice,@ImportQuantity,@TotalMoney)
						end
						go
						exec Proc_InsertImportBill 1,2,1,1,'',100000,100,10000000
--  Proc_Update{_tableName} 
						go
						create proc Proc_UpdateImportBill(
															@ImportBillId int,
															@ProductId int, 
															@SupplierId int, 
															@EmployeeId int,
															@CreateDate datetime2(7),
															@ImportPrice float,
															@ImportQuantity int,
															@TotalMoney float)
						as
						begin
							DECLARE @date1 datetime2 = GETDATE();
						    if(@CreateDate = '')
								set @CreateDate = @date1 
							UPDATE ImportBill
							SET ProductId = @ProductId,
								SupplierId = @SupplierId,
								EmployeeId = @EmployeeId,
								CreateDate = @CreateDate,
								ImportPrice = @ImportPrice,
								ImportQuantity = @ImportQuantity,
								TotalMoney = @TotalMoney
							WHERE ImportBillId = @ImportBillId
						end
						go
						exec Proc_UpdateImportBill 1,2,1,1,'',200000,100,20000000
--  Proc_Delete{_tableName}ById 
						go
						create proc Proc_DeleteImportBillById (@ImportBillId int)
						as
						begin
							delete from ImportBill where ImportBillId =@ImportBillId
						end
						go
						exec Proc_DeleteImportBillById 2
