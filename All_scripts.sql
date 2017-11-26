--!! Creating DataBase and tables

create database [Shop1]
go
use [Shop1]
go

CREATE TABLE [Product] (
	[Name] varchar(255) NOT NULL,
	[Price] float NOT NULL,
	[Amount_of_constant_discount] float NOT NULL,
	[Amount_of_stock_discount] float NOT NULL,
	[ProductID] int NOT NULL IDENTITY(1,1),
	[ManufacturerID] int NOT NULL,
  CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED
  (
  [ProductID] 
  ) 

)
GO
CREATE TABLE [Rack] (
	[Row_number] int NOT NULL,
	[Shelf_number] int NOT NULL,
	[ProductID] int NOT NULL,
  CONSTRAINT [PK_Rack] PRIMARY KEY CLUSTERED
  (
  [ProductID] 
  ) 

)
GO
CREATE TABLE [Manufacturer] (
	[ManufacturerName] varchar(255) NOT NULL,
	[Country] varchar(255) NOT NULL,
	[email] varchar(255),
	[ManufacturerID] int NOT NULL IDENTITY(1,1),
	[Amount] int,
  CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED
  (
  [ManufacturerID] 
  ) 

)
GO
CREATE TABLE [Consistance] (
	[Proteins] float,
	[Fats] float,
	[Carbohydrates] float,
	[Sugar] float,
	[Caloric_Value] float NOT NULL,
	[MadeOf] varchar(1000) NOT NULL,
	[Vitamins] varchar(255),
	[ProductID] int NOT NULL,
  CONSTRAINT [PK_Composition] PRIMARY KEY CLUSTERED
  (
  [ProductID] 
  ) 

)
GO
CREATE TABLE [Tags] (
	[Dietary] varchar NOT NULL, --Д -диетический, Н - все
	[Age] varchar NOT NULL, --В - все ; С - совершеннолетний
	[Diabetes] varchar NOT NULL, -- Д - диабетики ; Н - все
	[Category] varchar(255) NOT NULL, 
	[ProductID] int NOT NULL,
  CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED
  (
  [ProductID] 
  ) 

)
GO

ALTER TABLE [Rack] WITH CHECK ADD CONSTRAINT [FK_Rack_to_Product] FOREIGN KEY ([ProductID]) REFERENCES [Product]([ProductID])


ALTER TABLE [Product] WITH CHECK ADD CONSTRAINT [FK_Product_to_Manufacturer] FOREIGN KEY ([ManufacturerID]) REFERENCES [Manufacturer]([ManufacturerID])


ALTER TABLE [Consistance] WITH CHECK ADD CONSTRAINT [FK_Consistance_to_Product] FOREIGN KEY ([ProductID]) REFERENCES [Product]([ProductID])


ALTER TABLE [Tags] WITH CHECK ADD CONSTRAINT [FK_Tags_to_Product] FOREIGN KEY ([ProductID]) REFERENCES [Product]([ProductID])






--!! Adding new Values

go
use Shop1
go
INSERT INTO [Manufacturer] (Country,Amount,email,ManufacturerName)
Values
('USA',3,NULL,'Mars Chocolate'),
('Russia',1,NULL,'PepsiCo'),
('Austria',1,'flugtag@redbull.ru','Red Bull GmbH')



INSERT INTO [Product] (Name,Price,Amount_of_constant_discount,Amount_of_stock_discount,ManufacturerID)
Values
('Snickers', 60,0,0,1),
('Mars', 55,0,0,1),
('Picnic', 58,0,0,1),
('Молоко', 60,0,0,2),
('Red Bull', 85,0,0,3)



INSERT INTO [Consistance] (Proteins,Fats, Carbohydrates, Sugar, Caloric_Value,MadeOf,Vitamins,ProductID)
Values
(7.5,15.3,56,27.5,514, 'начинка: арахис, глюкозный сироп, сахар, пальмовое масло, обезжиренное сухое молоко, соль, сухой яичный белок, ароматизатор (ванилин), шоколад: сахар, какао масло, цельное сухое молоко, какао тёртое, лактоза, обезвоженный молочный жир, эмульгатор (соевый лецитин), ароматизатор (ванилин), молоко сухое обезжиренное',NULL,1),
(4.8,18,68,62,455, 'начинка: глюкозный сироп (кукурузный, пшеничный), сахар, масло пальмовое рафинированное дезодорированное, сухое молоко обезжиренное, какао порошок обезжиренный, ячменный солодовый экстракт, сухая молочная сыворотка, лактоза, соль, сухой яичный белок; шоколад: сахар, какао-масло, какао тёртое, молоко сухое обезжиренное, цельное сухое молоко, лактоза, сухая молочная сыворотка, обезвоженный молочный жир, эмульгатор (соевый лецитин), ароматизатор (ванилин)',NULL,2),
(7.4,28.8,56.6,50,504, ' сахар, арахис, сухое цельное молоко, какао масло, воздушный рис (рис, сахар, экстракт ячменно-солодовый, пальмовое масло, соль), растительный жир, мука пшеничная, какао тёртое, сухая молочная сыворотка, патока крахмальная, эмульгаторы (Е471, Е476), загуститель, соль, соевое масло, ароматизаторы идентичные натуральным (ванилин, карамельный, арахисовый), сода пищевая',' С, РР, группы В, Е',3),
(3,3.2,4.7,0,60, 'молоко ультрапастеризованное, молоко цельное',' С, РР, A',4),
(0,0,11.3,0,45, 'Вода,таурин,аргинин,кофеин,глюкуронолактон,сахароза,глюкоза,лимонокислый натрий (регулятор кислотности),инозитол,красители (сахарный колер, рибофлавин)','B3,B5,B6,B12',5)


INSERT INTO [Rack] (Row_number,Shelf_number,ProductID)
Values
(1,1,1),
(1,1,2),
(1,1,3),
(5,3,4),
(3,2,5)




INSERT INTO [Tags] (Dietary,Age,Diabetes,Category,ProductID)
Values
('Н','В','Н','Сладости',1),
('Н','В','Н','Сладости',2),
('Н','В','Н','Сладости',3),
('Н','В','Н','Молочные',4),
('Н','С','Н','Лимонады',5)


--!! Creating procedures
go
use Shop1
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE All_products
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   Select Name From Product
END
GO









go
use Shop1
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[All_products_with_Manufacturer]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @Name varchar(255),
	        @Manufacturer varchar(255)
    declare Products_cursor CURSOR LOCAL FOR
	SELECT P.Name, M.ManufacturerName from Product AS P
	INNER JOIN Manufacturer AS M ON M.ManufacturerID=P.ManufacturerID
	OPEN Products_cursor
	FETCH NEXT FROM Products_cursor into @Name, @Manufacturer
	while @@FETCH_STATUS=0
	begin
	PRINT 'Товар -  ' + @Name +'  Производитель-  ' + @Manufacturer
	FETCH  NEXT FROM Products_cursor
	INTO @NAME, @Manufacturer
end
close Products_cursor
Deallocate Products_cursor
	 
   --Select Name From Product
END







go
use Shop1
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Delete_manufacturer_nulls]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @ManufacturerID varchar(255),
	        @Manufacturer varchar(255),
			@ManufacturerAmount int
    declare Manufacturer_cursor CURSOR LOCAL FOR
	SELECT ManufacturerID, ManufacturerName, Amount from Manufacturer where Amount=0
	
	OPEN Manufacturer_cursor
	FETCH NEXT FROM Manufacturer_cursor into @ManufacturerID, @Manufacturer, @ManufacturerAmount
	while @@FETCH_STATUS=0
	begin
	delete from Manufacturer where ManufacturerID=@ManufacturerID
	PRINT 'Производитель '+@Manufacturer+ '  C ID  '+ @ManufacturerID+' был удален '
	FETCH  NEXT FROM Manufacturer_cursor INTO @ManufacturerID, @Manufacturer, @ManufacturerAmount
	end	

close Manufacturer_cursor
Deallocate Manufacturer_cursor
END









go
use Shop1
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Find_by_tags] (@Category varchar(255),@Dietary varchar,@Age varchar, @Diabetes varchar)
AS
BEGIN
	SET NOCOUNT ON;
	Select Product.Name FROM Product
	JOIN Tags
	ON Product.ProductID=Tags.ProductID
    Where (Tags.Category=@Category) AND
	      (Tags.Dietary=@Dietary)   AND
		  (Tags.Age=@Age)           AND
		  (Tags.Diabetes=@Diabetes)  
END










go
use Shop1
go

/****** Object:  StoredProcedure [dbo].[Product_info]    Script Date: 29.04.2017 15:09:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Product_info] (@ProductName varchar(255))
AS
BEGIN
DECLARE @ID Int
SET @ID = ( Select Product.ProductID from Product where Product.Name=@ProductName)
 
	SET NOCOUNT ON;
	Select Product.Name, Rack.Row_number,Rack.Shelf_number,Consistance.MadeOf from Product,Rack,Consistance
    Where (Product.ProductID=@ID) AND (Rack.ProductID=@ID) AND (Consistance.ProductID=@ID)

END










--!! Creting functions
go
use Shop1
go

SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 

CREATE FUNCTION [dbo].[AmountOFCategory] 
( 
@category VARCHAR(255) 
) 
RETURNS INT 
AS 
BEGIN 
RETURN 
( 
(SELECT COUNT(ProductID) FROM Tags WHERE Category=@category) 
) 
END







go
use Shop1

GO
CREATE FUNCTION FindByTags (@Category varchar(255),@Dietary varchar,@Age varchar, @Diabetes varchar)
    RETURNS TABLE
    AS RETURN (Select Product.Name FROM Product
	JOIN Tags
	ON Product.ProductID=Tags.ProductID
    Where (Tags.Category=@Category) AND
	      (Tags.Dietary=@Dietary)   AND
		  (Tags.Age=@Age)           AND
		  (Tags.Diabetes=@Diabetes) )
		  






/*USE [Shop1]*/
GO 

SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
CREATE Function [dbo].[TotalDiscount]( @Name VARCHAR(255))
RETURNS Float 
AS 
BEGIN 
DECLARE @C float
DECLARE @S float
DECLARE @P float
SET @C=(SELECT TOP(1) Amount_of_constant_discount FROM Product WHERE Name = @Name)/100
SET @S=(SELECT TOP(1) Amount_of_stock_discount FROM Product WHERE Name = @Name)/100
SET @P=(SELECT TOP(1) Price FROM Product WHERE Name = @Name)
SET @P=@P-@P*@C
SET @P=@P-@P*@S
RETURN
(
 1-@P/(SELECT TOP(1) Price FROM Product WHERE Name = @Name)
)

END





--!! Creating Triggers


go
use Shop1
go
CREATE TRIGGER [dbo].[delProduct] on [Shop1].[dbo].[Product]
INSTEAD OF DELETE 
AS
begin
  DECLARE @ID INT
  DECLARE @MID int
  Select @ID = ProductID  FROM deleted
  Select @MID = ManufacturerID from Product where ProductID=@ID 
  -------------------------------------------------
  DELETE FROM [Consistance]
  where Consistance.ProductID=@ID
  -------------------------------------------------
 DELETE FROM [Rack]
  where Rack.ProductID=@ID
   -------------------------------------------------
 DELETE FROM [Tags]
  where Tags.ProductID=@ID
  --------------------------------------------------
 DELETE FROM [Product]
 where Product.ProductID=@ID

 UPDATE Manufacturer
  set Amount=(Select COUNT(ProductID) FROM Product where ManufacturerID=@MID)
  where ManufacturerID=@MID
 END







/*
go
USE [Shop1]
GO*/
/****** Object:  Trigger [dbo].[ins]    Script Date: 08.05.2017 12:15:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[ins]
ON [Shop1].[dbo].[Product] for INSERT
AS
--IF @@ROWCOUNT=1
begin
  DECLARE @ID INT
  DECLARE @MID int
  DECLARE @EMID int  
  Select @ID = ProductID  FROM inserted
  Select @MID = ManufacturerID from inserted 
  SELECT @EMID= ManufacturerID from Manufacturer Where ManufacturerID=@MID 
  -------------------------------------------------
 IF (@EMID IS NOT NULL) 
  UPDATE Manufacturer
  set Amount=(Select COUNT(ProductID) FROM Product where ManufacturerID=@MID)
  where ManufacturerID=@MID
  ELSE
  
  -------------------------------------------------
  INSERT INTO [Manufacturer] (Country,Amount,email,ManufacturerName)
  Values
  ('NA',1,NULL,'Unknown')
  -------------------------------------------------
  INSERT INTO [Consistance] (Proteins,Fats, Carbohydrates, Sugar, Caloric_Value,MadeOf,Vitamins,ProductID)
  Values
  (0,0,0,0,0, 'NULL',NULL,@ID)
  -------------------------------------------------
  INSERT INTO [Rack] (Row_number,Shelf_number,ProductID)
  Values
  (0,0,@ID)
   -------------------------------------------------
  INSERT INTO [Tags] (Dietary,Age,Diabetes,Category,ProductID)
  Values
  ('Н','В','Н','Unknown',@ID)
  
END









/*
go
USE [Shop1]
GO*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[updProduct]
ON [Shop1].[dbo].[Product] for UPDATE
AS
--IF @@ROWCOUNT=1
begin
  DECLARE @PID INT
  DECLARE @NID int 
  Select @PID = ManufacturerID  from deleted
  Select @NID = ManufacturerID from inserted   
  -------------------------------------------------
 
  UPDATE Manufacturer
  set Amount=(Select COUNT(ProductID) FROM Product where ManufacturerID=@PID)
  where ManufacturerID=@PID
  
  -------------------------------------------------
  UPDATE Manufacturer
  set Amount=(Select COUNT(ProductID) FROM Product where ManufacturerID=@NID)
  where ManufacturerID=@NID 
  
END


/*
--!! Inserting C# Example

go
USE Shop1;

EXEC sp_configure 'clr_enabled',1
RECONFIGURE
GO
CREATE ASSEMBLY CLRStoredProcedures
    FROM 'C:\Users\Никита\Documents\Visual Studio 2017\Projects\CLRStoredProcedureProductsCount\CLRStoredProcedureProductsCount\bin\Debug\CLRStoredProcedureProductsCount.dll'
    WITH PERMISSION_SET = SAFE

GO
CREATE PROCEDURE ProductsCount
    AS EXTERNAL NAME CLRStoredProcedures.StoredProcedure.ProductsCount 

DECLARE @count INT
EXECUTE @count = ProductsCount
PRINT @count	*/

