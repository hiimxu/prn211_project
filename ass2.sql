USE [master]
GO
/****** Object:  Database [Ass2PRN]    Script Date: 11/6/2023 6:02:48 PM ******/
CREATE DATABASE [Ass2PRN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ass2PRN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Ass2PRN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ass2PRN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Ass2PRN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Ass2PRN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ass2PRN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ass2PRN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ass2PRN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ass2PRN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ass2PRN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ass2PRN] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ass2PRN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ass2PRN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ass2PRN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ass2PRN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ass2PRN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ass2PRN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ass2PRN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ass2PRN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ass2PRN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ass2PRN] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Ass2PRN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ass2PRN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ass2PRN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ass2PRN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ass2PRN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ass2PRN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ass2PRN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ass2PRN] SET RECOVERY FULL 
GO
ALTER DATABASE [Ass2PRN] SET  MULTI_USER 
GO
ALTER DATABASE [Ass2PRN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ass2PRN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ass2PRN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ass2PRN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ass2PRN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ass2PRN] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ass2PRN', N'ON'
GO
ALTER DATABASE [Ass2PRN] SET QUERY_STORE = OFF
GO
USE [Ass2PRN]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 11/6/2023 6:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[MemberID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/6/2023 6:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[RequiredDate] [datetime] NOT NULL,
	[ShippedDate] [datetime] NOT NULL,
	[Freight] [money] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/6/2023 6:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/6/2023 6:02:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Weight] [varchar](50) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitInStock] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Member] ON 

INSERT [dbo].[Member] ([MemberID], [Email], [CompanyName], [City], [Country], [Password]) VALUES (1, N'admin@fstore.com', N'FStore', N'Ha Noi', N'Viet Nam', N'admin@@')
INSERT [dbo].[Member] ([MemberID], [Email], [CompanyName], [City], [Country], [Password]) VALUES (2, N'mai@fpt.edu.vn', N'FPT', N'Ha Noi', N'Viet Nam', N'mai')
INSERT [dbo].[Member] ([MemberID], [Email], [CompanyName], [City], [Country], [Password]) VALUES (3, N'banmai@gmail.com', N'FPT', N'Ha Noi ', N'Viet Nam', N'mai')
SET IDENTITY_INSERT [dbo].[Member] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (1, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime), 22000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (2, 2, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime), 22000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (3, 3, CAST(N'2022-03-07T00:00:00.000' AS DateTime), CAST(N'2022-03-07T00:00:00.000' AS DateTime), CAST(N'2022-03-07T00:00:00.000' AS DateTime), 20000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (4, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime), 20000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (5, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime), 20000.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (9, 3, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-05-03T00:00:00.000' AS DateTime), CAST(N'2022-06-03T00:00:00.000' AS DateTime), 200.0000)
INSERT [dbo].[Order] ([OrderID], [MemberID], [OrderDate], [RequiredDate], [ShippedDate], [Freight]) VALUES (10, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime), CAST(N'2022-03-03T00:00:00.000' AS DateTime), 22000.0000)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (1, 1, 50.0000, 5, 0.5)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (2, 2, 30.0000, 16, 3.6)
INSERT [dbo].[OrderDetail] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (3, 3, 40.0000, 10, 15)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (1, 1, N'Green Shoyu', N'100', 500.0000, 56)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (2, 1, N'Alice Mutton', N'150', 30.0000, 17)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (3, 3, N'NULLAniseed Syrup', N'50', 40.0000, 13)
INSERT [dbo].[Product] ([ProductID], [CategoryID], [ProductName], [Weight], [UnitPrice], [UnitInStock]) VALUES (4, 2, N'Perth Pasies', N'45', 22.0000, 53)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Member] FOREIGN KEY([MemberID])
REFERENCES [dbo].[Member] ([MemberID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Member]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
USE [master]
GO
ALTER DATABASE [Ass2PRN] SET  READ_WRITE 
GO
