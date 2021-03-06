USE [LAB1SE141031]
GO
ALTER TABLE [dbo].[tblShoppingItem] DROP CONSTRAINT [FK_tblShoppingItem_tblShoppingItemCategory]
GO
ALTER TABLE [dbo].[tblBillItem] DROP CONSTRAINT [FK_tblBillItem_tblShoppingItem]
GO
ALTER TABLE [dbo].[tblBillItem] DROP CONSTRAINT [FK_tblBillItem_tblBill]
GO
ALTER TABLE [dbo].[tblBill] DROP CONSTRAINT [FK_tblBill_tblAccount2]
GO
ALTER TABLE [dbo].[tblAccount] DROP CONSTRAINT [FK_tblAccount_tblRole]
GO
/****** Object:  Table [dbo].[tblShoppingItemCategory]    Script Date: 1/23/2021 11:48:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblShoppingItemCategory]') AND type in (N'U'))
DROP TABLE [dbo].[tblShoppingItemCategory]
GO
/****** Object:  Table [dbo].[tblShoppingItem]    Script Date: 1/23/2021 11:48:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblShoppingItem]') AND type in (N'U'))
DROP TABLE [dbo].[tblShoppingItem]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 1/23/2021 11:48:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblRole]') AND type in (N'U'))
DROP TABLE [dbo].[tblRole]
GO
/****** Object:  Table [dbo].[tblBillItem]    Script Date: 1/23/2021 11:48:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblBillItem]') AND type in (N'U'))
DROP TABLE [dbo].[tblBillItem]
GO
/****** Object:  Table [dbo].[tblBill]    Script Date: 1/23/2021 11:48:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblBill]') AND type in (N'U'))
DROP TABLE [dbo].[tblBill]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 1/23/2021 11:48:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAccount]') AND type in (N'U'))
DROP TABLE [dbo].[tblAccount]
GO
USE [master]
GO
/****** Object:  Database [LAB1SE141031]    Script Date: 1/23/2021 11:48:09 PM ******/
DROP DATABASE [LAB1SE141031]
GO
/****** Object:  Database [LAB1SE141031]    Script Date: 1/23/2021 11:48:09 PM ******/
CREATE DATABASE [LAB1SE141031]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LAB1SE141031', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LAB1SE141031.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LAB1SE141031_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LAB1SE141031_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LAB1SE141031] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LAB1SE141031].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LAB1SE141031] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LAB1SE141031] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LAB1SE141031] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LAB1SE141031] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LAB1SE141031] SET ARITHABORT OFF 
GO
ALTER DATABASE [LAB1SE141031] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LAB1SE141031] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LAB1SE141031] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LAB1SE141031] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LAB1SE141031] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LAB1SE141031] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LAB1SE141031] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LAB1SE141031] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LAB1SE141031] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LAB1SE141031] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LAB1SE141031] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LAB1SE141031] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LAB1SE141031] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LAB1SE141031] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LAB1SE141031] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LAB1SE141031] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LAB1SE141031] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LAB1SE141031] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LAB1SE141031] SET  MULTI_USER 
GO
ALTER DATABASE [LAB1SE141031] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LAB1SE141031] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LAB1SE141031] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LAB1SE141031] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LAB1SE141031] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LAB1SE141031] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LAB1SE141031] SET QUERY_STORE = OFF
GO
USE [LAB1SE141031]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 1/23/2021 11:48:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[userId] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[roleId] [int] NOT NULL,
	[gmail] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBill]    Script Date: 1/23/2021 11:48:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBill](
	[billId] [uniqueidentifier] NOT NULL,
	[userId] [varchar](50) NOT NULL,
	[dateCheckOut] [datetime] NOT NULL,
	[isPayment] [bit] NOT NULL,
 CONSTRAINT [PK_tblBill] PRIMARY KEY CLUSTERED 
(
	[billId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBillItem]    Script Date: 1/23/2021 11:48:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBillItem](
	[billItemId] [uniqueidentifier] NOT NULL,
	[billId] [uniqueidentifier] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
 CONSTRAINT [PK_tblBillItemId] PRIMARY KEY CLUSTERED 
(
	[billItemId] ASC,
	[billId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 1/23/2021 11:48:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleId] [int] NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblShoppingItem]    Script Date: 1/23/2021 11:48:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShoppingItem](
	[shoppingItemName] [nvarchar](50) NOT NULL,
	[shoppingItemImage] [varchar](50) NOT NULL,
	[shoppingItemCategory] [nvarchar](50) NOT NULL,
	[shoppingItemDescription] [nvarchar](500) NOT NULL,
	[shoppingItemCreateDate] [datetime] NOT NULL,
	[shoppingItemStatus] [bit] NOT NULL,
	[shoppingItemQuantity] [int] NOT NULL,
	[shoppingItemPrice] [float] NOT NULL,
	[shoppingItemId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_tblShoppingItem] PRIMARY KEY CLUSTERED 
(
	[shoppingItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblShoppingItemCategory]    Script Date: 1/23/2021 11:48:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblShoppingItemCategory](
	[category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblShoppingItemCategory] PRIMARY KEY CLUSTERED 
(
	[category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblAccount] ([userId], [password], [fullName], [roleId], [gmail]) VALUES (N'lapl1412', N'test', N'Tiêu Trung Lập', 2, N'lapl1412@gmail.com')
INSERT [dbo].[tblAccount] ([userId], [password], [fullName], [roleId], [gmail]) VALUES (N'lapttse141031', N'test', N'Lập Xinh Gái', 1, N'lapttse141031@fpt.edu.vn')
GO
INSERT [dbo].[tblBill] ([billId], [userId], [dateCheckOut], [isPayment]) VALUES (N'f5acf0a3-60f5-49ff-88fd-482c3f1dce0e', N'lapl1412', CAST(N'2021-01-23T23:11:36.750' AS DateTime), 1)
INSERT [dbo].[tblBill] ([billId], [userId], [dateCheckOut], [isPayment]) VALUES (N'69572233-6b50-4686-8691-686c8d937545', N'lapl1412', CAST(N'2021-01-23T23:34:55.530' AS DateTime), 1)
INSERT [dbo].[tblBill] ([billId], [userId], [dateCheckOut], [isPayment]) VALUES (N'9ed2afe3-c2e5-4dda-8d17-b56c466263ca', N'lapl1412', CAST(N'2021-01-23T21:22:14.020' AS DateTime), 1)
GO
INSERT [dbo].[tblBillItem] ([billItemId], [billId], [quantity], [price]) VALUES (N'12190c06-393b-480d-b6b2-2c9d4370cc1b', N'9ed2afe3-c2e5-4dda-8d17-b56c466263ca', 2, 1)
INSERT [dbo].[tblBillItem] ([billItemId], [billId], [quantity], [price]) VALUES (N'bfed046c-b066-413b-a2b9-3e3f7190d7e1', N'9ed2afe3-c2e5-4dda-8d17-b56c466263ca', 1, 1)
INSERT [dbo].[tblBillItem] ([billItemId], [billId], [quantity], [price]) VALUES (N'b20339d0-5c98-4426-820b-41c927315c81', N'f5acf0a3-60f5-49ff-88fd-482c3f1dce0e', 1, 1)
INSERT [dbo].[tblBillItem] ([billItemId], [billId], [quantity], [price]) VALUES (N'2abef74b-569b-4157-b2cb-d407d6c7efdb', N'f5acf0a3-60f5-49ff-88fd-482c3f1dce0e', 1, 1)
INSERT [dbo].[tblBillItem] ([billItemId], [billId], [quantity], [price]) VALUES (N'fb3a21f0-0f27-4af6-adcc-f8a429457061', N'69572233-6b50-4686-8691-686c8d937545', 1, 1)
GO
INSERT [dbo].[tblRole] ([roleId], [roleName]) VALUES (1, N'administrator')
INSERT [dbo].[tblRole] ([roleId], [roleName]) VALUES (2, N'customer')
GO
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Lemon', N'assets/img/\product-img-3.jpg', N'Fruit', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2000-04-16T00:00:00.000' AS DateTime), 0, 9, 10.600000381469727, N'150e1a88-66d9-49e1-ab62-05db4aee0e54')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Green Apple', N'assets/img/products/product-img-5.jpg', N'Fruit', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2000-04-16T00:00:00.000' AS DateTime), 1, 1, 10, N'3563f888-25a8-4067-85ec-1d205e28f2bc')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Strawberry', N'assets/img/products/product-img-1.jpg', N'Fruit', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2000-04-16T00:00:00.000' AS DateTime), 1, 1, 1, N'12190c06-393b-480d-b6b2-2c9d4370cc1b')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Strawberry', N'assets/img/products/product-img-1.jpg', N'Fruit', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2000-04-16T00:00:00.000' AS DateTime), 1, 5, 25, N'cb919051-b2d6-4246-992b-38456f4b4e29')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Green Apple', N'assets/img/products/product-img-5.jpg', N'Fruit', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2000-04-16T00:00:00.000' AS DateTime), 1, 1000, 50, N'78af6561-8e11-4202-b5e2-3c49846a531b')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Berry', N'assets/img/products/product-img-2.jpg', N'Fruit', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2000-04-16T00:00:00.000' AS DateTime), 1, 1, 1, N'bfed046c-b066-413b-a2b9-3e3f7190d7e1')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Strawberry', N'assets/img/products/product-img-6.jpg', N'1', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'1999-04-16T00:00:00.000' AS DateTime), 1, 1, 1, N'9006e0c3-20db-488e-b7f3-3ed035634dce')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Lap', N'assets/img/product-img-1.jpg', N'Fruit', N'test crate', CAST(N'2021-01-23T20:42:14.877' AS DateTime), 0, 1, 1, N'b20339d0-5c98-4426-820b-41c927315c81')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Strawberry', N'assets/img/products/product-img-6.jpg', N'1', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2000-04-16T00:00:00.000' AS DateTime), 0, 1, 12, N'cb10a1f2-634e-4a1d-88d3-42df4301231f')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Berry', N'assets/img/products/product-img-2.jpg', N'1', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2000-04-16T00:00:00.000' AS DateTime), 0, 10, 15, N'e18d9b6d-ada8-41f5-9b39-47b53983a68b')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Green Apple', N'assets/img/products/product-img-5.jpg', N'1', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2000-04-16T00:00:00.000' AS DateTime), 0, 15, 1, N'd3bbeab8-896f-415c-a976-aa68cc4a8c3c')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Berry', N'assets/img/\product-img-6.jpg', N'1', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2001-04-16T00:00:00.000' AS DateTime), 1, 0, 1, N'd6850c4b-a093-4086-853a-b2b31a0f1553')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Avocado', N'assets/img/products/product-img-4.jpg', N'1', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2000-04-16T00:00:00.000' AS DateTime), 1, 10, 1, N'5e12660a-ac45-4763-98e9-b4cdd06e5a70')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Strawberry', N'assets/img/products/product-img-1.jpg', N'1', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2000-04-16T00:00:00.000' AS DateTime), 0, 1, 1, N'8cf7b728-1102-45d2-a6c9-c116063fd324')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Lemon', N'assets/img/products/product-img-3.jpg', N'1', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2000-04-16T00:00:00.000' AS DateTime), 1, 1, 1, N'2abef74b-569b-4157-b2cb-d407d6c7efdb')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'Avocado', N'assets/img/products/product-img-4.jpg', N'1', N'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta sint dignissimos, rem commodi cum voluptatem quae reprehenderit repudiandae ea tempora incidunt ipsa, quisquam animi perferendis eos eum modi! Te', CAST(N'2000-04-16T00:00:00.000' AS DateTime), 0, 1, 8, N'4c6f17b7-04f0-4959-8282-ed35f62dfd5e')
INSERT [dbo].[tblShoppingItem] ([shoppingItemName], [shoppingItemImage], [shoppingItemCategory], [shoppingItemDescription], [shoppingItemCreateDate], [shoppingItemStatus], [shoppingItemQuantity], [shoppingItemPrice], [shoppingItemId]) VALUES (N'testtt', N'assets/img/\product-img-2.jpg', N'Fruit', N'1', CAST(N'2021-01-23T20:46:24.953' AS DateTime), 1, 0, 1, N'fb3a21f0-0f27-4af6-adcc-f8a429457061')
GO
INSERT [dbo].[tblShoppingItemCategory] ([category]) VALUES (N'1')
INSERT [dbo].[tblShoppingItemCategory] ([category]) VALUES (N'Fruit')
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK_tblAccount_tblRole] FOREIGN KEY([roleId])
REFERENCES [dbo].[tblRole] ([roleId])
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [FK_tblAccount_tblRole]
GO
ALTER TABLE [dbo].[tblBill]  WITH CHECK ADD  CONSTRAINT [FK_tblBill_tblAccount2] FOREIGN KEY([userId])
REFERENCES [dbo].[tblAccount] ([userId])
GO
ALTER TABLE [dbo].[tblBill] CHECK CONSTRAINT [FK_tblBill_tblAccount2]
GO
ALTER TABLE [dbo].[tblBillItem]  WITH CHECK ADD  CONSTRAINT [FK_tblBillItem_tblBill] FOREIGN KEY([billId])
REFERENCES [dbo].[tblBill] ([billId])
GO
ALTER TABLE [dbo].[tblBillItem] CHECK CONSTRAINT [FK_tblBillItem_tblBill]
GO
ALTER TABLE [dbo].[tblBillItem]  WITH CHECK ADD  CONSTRAINT [FK_tblBillItem_tblShoppingItem] FOREIGN KEY([billItemId])
REFERENCES [dbo].[tblShoppingItem] ([shoppingItemId])
GO
ALTER TABLE [dbo].[tblBillItem] CHECK CONSTRAINT [FK_tblBillItem_tblShoppingItem]
GO
ALTER TABLE [dbo].[tblShoppingItem]  WITH CHECK ADD  CONSTRAINT [FK_tblShoppingItem_tblShoppingItemCategory] FOREIGN KEY([shoppingItemCategory])
REFERENCES [dbo].[tblShoppingItemCategory] ([category])
GO
ALTER TABLE [dbo].[tblShoppingItem] CHECK CONSTRAINT [FK_tblShoppingItem_tblShoppingItemCategory]
GO
USE [master]
GO
ALTER DATABASE [LAB1SE141031] SET  READ_WRITE 
GO
