USE [master]
GO
/****** Object:  Database [LapShop]    Script Date: 6/23/2023 6:07:09 PM ******/
CREATE DATABASE [LapShop]

GO
ALTER DATABASE [LapShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LapShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LapShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LapShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LapShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LapShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LapShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [LapShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LapShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LapShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LapShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LapShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LapShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LapShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LapShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LapShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LapShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LapShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LapShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LapShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LapShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LapShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LapShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LapShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LapShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LapShop] SET  MULTI_USER 
GO
ALTER DATABASE [LapShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LapShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LapShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LapShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LapShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LapShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LapShop] SET QUERY_STORE = OFF
GO
USE [LapShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/23/2023 6:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountId] [int] IDENTITY(1,1) NOT NULL,
	[accountEmail] [nvarchar](200) NULL,
	[accountPassword] [nvarchar](200) NULL,
	[roleId] [int] NULL,
	[accountDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountContact]    Script Date: 6/23/2023 6:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountContact](
	[accountContactId] [int] IDENTITY(1,1) NOT NULL,
	[accountId] [int] NULL,
	[accountContactAddress] [nvarchar](200) NULL,
	[accountContactName] [nvarchar](200) NULL,
	[accountContactMobile] [nvarchar](200) NULL,
	[accountContactDefault] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[accountContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountDetail]    Script Date: 6/23/2023 6:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountDetail](
	[accountDetailId] [int] IDENTITY(1,1) NOT NULL,
	[accountId] [int] NULL,
	[accountDetailName] [nvarchar](200) NULL,
	[accountDetailAvatar] [nvarchar](500) NULL,
	[accountDetailDob] [date] NULL,
	[accountDetailDoc] [date] NULL,
 CONSTRAINT [PK__AccountD__A0EB5AE9B967181A] PRIMARY KEY CLUSTERED 
(
	[accountDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/23/2023 6:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](200) NULL,
	[categoryIcon] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Order]    Script Date: 6/23/2023 6:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[accountId] [int] NULL,
	[orderCreateDate] [date] NULL,
	[orderExpectedDate] [date] NULL,
	[orderDoneDate] [date] NULL,
	[orderNameContact] [nvarchar](200) NULL,
	[orderPhoneContact] [nvarchar](200) NULL,
	[orderAddressContact] [nvarchar](200) NULL,
	[orderTotalMoney] [int] NULL,
	[orderStatusId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/23/2023 6:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NULL,
	[productId] [int] NULL,
	[orderDetailProductImg] [nvarchar](500) NULL,
	[orderDetailProductName] [nvarchar](200) NULL,
	[orderDetailPriceProduct] [bigint] NULL,
	[orderDetailSizeValue] [nvarchar](200) NULL,
	[orderDetailQuantity] [int] NULL,
	[orderDetailTotalMoney] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 6/23/2023 6:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[orderStatusId] [int] IDENTITY(1,1) NOT NULL,
	[orderStatusName] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/23/2023 6:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](200) NULL,
	[productImg] [nvarchar](200) NULL,
	[productPrice] [int] NULL,
	[productDescription] [nvarchar](1000) NULL,
	[categoryId] [int] NULL,
	[productIsFeatured] [bit] NULL,
	[productIsRecent] [bit] NULL,
	[productDeleted] [bit] NULL,
	[URL] [nvarchar](1000) NULL,
 CONSTRAINT [PK__Product__2D10D16AAE70013D] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImgDetail]    Script Date: 6/23/2023 6:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImgDetail](
	[productImgDetailId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[productImgDetailPath] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[productImgDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Role]    Script Date: 6/23/2023 6:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (1, N'quoc', N'sdasd', 2, 0)
INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (2, N'quyquoc2002@gmail.com', N'Shironeko02', 2, 0)
INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (3, N'linhnvhe170399@fpt.edu.vn', N'123', 2, 0)
INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (4, N'quyquoc2002@gmail.com', N'123456', 2, 0)
INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (5, N'Linh Linh', N'123456', 2, 0)
INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (6, N'asd', N'asd', 2, 0)
INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (7, N'asd', N'asd', 2, 0)
INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (8, N'asd', N'asd', 2, 0)
INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (9, N'asd', N'asd', 2, 0)
INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (10, N'asd', N'asd', 2, 0)
INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (11, N'quocpqhe163061@fpt.edu.vn', N'123456789', 2, 0)
INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (12, N'quocpqhe163061@fpt.edu.vn', N'123456789', 2, 0)
INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (13, N'quocpqhe163061@fpt.edu.vn', N'0987654321', 2, 0)
INSERT [dbo].[Account] ([accountId], [accountEmail], [accountPassword], [roleId], [accountDeleted]) VALUES (14, N'admin@gmail.com', N'admin', 1, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountContact] ON 

INSERT [dbo].[AccountContact] ([accountContactId], [accountId], [accountContactAddress], [accountContactName], [accountContactMobile], [accountContactDefault]) VALUES (1, 3, N'Tuan cuongâ', N'Quoc', N'0911092002', 0)
INSERT [dbo].[AccountContact] ([accountContactId], [accountId], [accountContactAddress], [accountContactName], [accountContactMobile], [accountContactDefault]) VALUES (2, 3, N'Fenikaaaa', N'HuyTQ', N'0912345678', 1)
INSERT [dbo].[AccountContact] ([accountContactId], [accountId], [accountContactAddress], [accountContactName], [accountContactMobile], [accountContactDefault]) VALUES (4, 4, N'asdasd', N'sada', N'sadasd', 0)
INSERT [dbo].[AccountContact] ([accountContactId], [accountId], [accountContactAddress], [accountContactName], [accountContactMobile], [accountContactDefault]) VALUES (5, 4, N'dasdasd', N'asdasdad', N'asdasd', 0)
INSERT [dbo].[AccountContact] ([accountContactId], [accountId], [accountContactAddress], [accountContactName], [accountContactMobile], [accountContactDefault]) VALUES (6, 3, N'Hoàng Nam', N'Quốc', N'0912345678', 0)
INSERT [dbo].[AccountContact] ([accountContactId], [accountId], [accountContactAddress], [accountContactName], [accountContactMobile], [accountContactDefault]) VALUES (7, 3, N'TC', N'Quốc', N'0911092002', 0)
INSERT [dbo].[AccountContact] ([accountContactId], [accountId], [accountContactAddress], [accountContactName], [accountContactMobile], [accountContactDefault]) VALUES (8, 3, N'Ở đâu đó', N'Linh', N'0942342341', 0)
INSERT [dbo].[AccountContact] ([accountContactId], [accountId], [accountContactAddress], [accountContactName], [accountContactMobile], [accountContactDefault]) VALUES (9, 3, N'đâsad', N'TÙn', N'0123123122', 0)
INSERT [dbo].[AccountContact] ([accountContactId], [accountId], [accountContactAddress], [accountContactName], [accountContactMobile], [accountContactDefault]) VALUES (10, 3, N'ádsa', N'dsadasdsad', N'0123123122', 0)
INSERT [dbo].[AccountContact] ([accountContactId], [accountId], [accountContactAddress], [accountContactName], [accountContactMobile], [accountContactDefault]) VALUES (11, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountContact] ([accountContactId], [accountId], [accountContactAddress], [accountContactName], [accountContactMobile], [accountContactDefault]) VALUES (12, 4, NULL, N'Quoc', NULL, 0)
SET IDENTITY_INSERT [dbo].[AccountContact] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountDetail] ON 

INSERT [dbo].[AccountDetail] ([accountDetailId], [accountId], [accountDetailName], [accountDetailAvatar], [accountDetailDob], [accountDetailDoc]) VALUES (3, 3, N'Linh', NULL, NULL, CAST(N'2023-05-21' AS Date))
INSERT [dbo].[AccountDetail] ([accountDetailId], [accountId], [accountDetailName], [accountDetailAvatar], [accountDetailDob], [accountDetailDoc]) VALUES (4, 4, N'Linh Linh', NULL, NULL, CAST(N'2023-05-23' AS Date))
INSERT [dbo].[AccountDetail] ([accountDetailId], [accountId], [accountDetailName], [accountDetailAvatar], [accountDetailDob], [accountDetailDoc]) VALUES (5, 11, N'Quoc HUY', NULL, NULL, CAST(N'2023-05-28' AS Date))
INSERT [dbo].[AccountDetail] ([accountDetailId], [accountId], [accountDetailName], [accountDetailAvatar], [accountDetailDob], [accountDetailDoc]) VALUES (6, 12, NULL, NULL, NULL, CAST(N'2023-05-28' AS Date))
INSERT [dbo].[AccountDetail] ([accountDetailId], [accountId], [accountDetailName], [accountDetailAvatar], [accountDetailDob], [accountDetailDoc]) VALUES (7, 13, N'Huy Quocccccccccccccccccc', NULL, NULL, CAST(N'2023-05-28' AS Date))
SET IDENTITY_INSERT [dbo].[AccountDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryId], [categoryName], [categoryIcon]) VALUES (1, N'Shirts', N'assets/img/Heavyweight-100_-Cotton-T-Shirts-with-Pocket---Made-in-USA-Bayside-1651086371_600x.webp')
INSERT [dbo].[Category] ([categoryId], [categoryName], [categoryIcon]) VALUES (2, N'Jeans', N'assets/img/goods_453504_sub14.webp')
INSERT [dbo].[Category] ([categoryId], [categoryName], [categoryIcon]) VALUES (3, N'Swimwear', N'assets/img/fcaaf89478618719fa72e9d2bc9807fd.jpg_1200x1200q80.jpg_.webp')
INSERT [dbo].[Category] ([categoryId], [categoryName], [categoryIcon]) VALUES (4, N'Sleepwear', N'assets/img/s-l500.jpg')
INSERT [dbo].[Category] ([categoryId], [categoryName], [categoryIcon]) VALUES (5, N'Sportswear', N'assets/img/Bo-quan-ao-Nike-nam-Sportswear-Tracksuit-BV3031-010-3.jpg')
INSERT [dbo].[Category] ([categoryId], [categoryName], [categoryIcon]) VALUES (6, N'Jumpsuits', N'assets/img/images.jpg')
INSERT [dbo].[Category] ([categoryId], [categoryName], [categoryIcon]) VALUES (7, N'Blazers', N'assets/img/taixuong.jpg')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO

SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (1, N'ADMIN')
INSERT [dbo].[Role] ([roleId], [roleName]) VALUES (2, N'USER')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO

ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([roleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[AccountContact]  WITH CHECK ADD  CONSTRAINT [FK_AccountContact_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[AccountContact] CHECK CONSTRAINT [FK_AccountContact_Account]
GO
ALTER TABLE [dbo].[AccountDetail]  WITH CHECK ADD  CONSTRAINT [FK_AccountDetail_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[AccountDetail] CHECK CONSTRAINT [FK_AccountDetail_Account]
GO

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([accountId])
REFERENCES [dbo].[Account] ([accountId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([orderStatusId])
REFERENCES [dbo].[OrderStatus] ([orderStatusId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([orderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[ProductImgDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductImgDetail_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[ProductImgDetail] CHECK CONSTRAINT [FK_ProductImgDetail_Product]
GO




USE [master]
GO
ALTER DATABASE [LapShop] SET  READ_WRITE 
GO
