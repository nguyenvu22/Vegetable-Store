USE [master]
GO
/****** Object:  Database [VegetableManagement]    Script Date: 3/12/2022 10:51:03 PM ******/
CREATE DATABASE [VegetableManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VegetableManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VegetableManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VegetableManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VegetableManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VegetableManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VegetableManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VegetableManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VegetableManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VegetableManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VegetableManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VegetableManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [VegetableManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [VegetableManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VegetableManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VegetableManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VegetableManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VegetableManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VegetableManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VegetableManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VegetableManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VegetableManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [VegetableManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VegetableManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VegetableManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VegetableManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VegetableManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VegetableManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VegetableManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VegetableManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VegetableManagement] SET  MULTI_USER 
GO
ALTER DATABASE [VegetableManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VegetableManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VegetableManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VegetableManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VegetableManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VegetableManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [VegetableManagement] SET QUERY_STORE = OFF
GO
USE [VegetableManagement]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 3/12/2022 10:51:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](255) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 3/12/2022 10:51:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NULL,
	[total] [money] NULL,
	[email] [varchar](255) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 3/12/2022 10:51:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[orderID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 3/12/2022 10:51:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](255) NOT NULL,
	[image] [varchar](255) NULL,
	[price] [money] NOT NULL,
	[quantity] [int] NOT NULL,
	[importDate] [date] NULL,
	[usingDate] [date] NULL,
	[categoryID] [int] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 3/12/2022 10:51:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](30) NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 3/12/2022 10:51:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[email] [varchar](255) NOT NULL,
	[fullName] [nvarchar](255) NULL,
	[password] [varchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[birthday] [date] NULL,
	[phone] [int] NULL,
	[roleID] [int] NOT NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([categoryID], [categoryName], [status]) VALUES (1, N'Rau', 1)
INSERT [dbo].[tblCategory] ([categoryID], [categoryName], [status]) VALUES (2, N'Củ', 1)
INSERT [dbo].[tblCategory] ([categoryID], [categoryName], [status]) VALUES (3, N'Quả', 1)
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (1, CAST(N'2021-03-01' AS Date), 65000.0000, N'boncon@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (2, CAST(N'2021-03-01' AS Date), 41000.0000, N'tonhuynh@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (3, CAST(N'2021-03-01' AS Date), 42000.0000, N'thiepngoo@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (4, CAST(N'2022-03-11' AS Date), 65000.0000, N'boncon@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (5, CAST(N'2022-03-11' AS Date), 65000.0000, N'boncon@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (6, CAST(N'2022-03-11' AS Date), 65000.0000, N'boncon@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (7, CAST(N'2022-03-11' AS Date), 20000.0000, N'boncon@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (8, CAST(N'2022-03-11' AS Date), 20000.0000, N'boncon@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (9, CAST(N'2022-03-11' AS Date), 20000.0000, N'boncon@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (10, CAST(N'2022-03-11' AS Date), 20000.0000, N'boncon@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (11, CAST(N'2022-03-11' AS Date), 20000.0000, N'boncon@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (13, CAST(N'2022-03-11' AS Date), 20000.0000, N'vuntnse151234@fpt.edu.vn', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (14, CAST(N'2022-03-11' AS Date), 82000.0000, N'boncon@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (15, CAST(N'2022-03-11' AS Date), 102000.0000, N'boncon@gmail.com', 1)
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [email], [status]) VALUES (16, CAST(N'2022-03-12' AS Date), 0.0000, N'vuntnse151234@fpt.edu.vn', 1)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (1, 15000.0000, 3, 1, 3, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (2, 20000.0000, 1, 1, 1, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (3, 5000.0000, 5, 2, 5, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (4, 8000.0000, 3, 2, 7, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (5, 21000.0000, 2, 3, 8, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (6, 15000.0000, 3, 1, 3, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (7, 20000.0000, 5, 15, 1, 1)
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID], [status]) VALUES (8, 2000.0000, 1, 15, 2, 1)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (1, N'Củ cà rốt', N'https://cf.shopee.vn/file/69f47628a745caf14d60913f8fbc72d8', 20000.0000, 5, CAST(N'2021-03-10' AS Date), CAST(N'2022-03-24' AS Date), 2, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (2, N'Rau dền', N'https://cuoifly.tuoitre.vn/820/0/ttc/r/2021/07/01/rau-den-1625101907.jpeg', 2000.0000, 4, CAST(N'2021-03-10' AS Date), CAST(N'2022-03-24' AS Date), 1, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (3, N'Củ cải trắng', N'https://png.pngtree.com/element_our/20190530/ourlarge/pngtree-hand-drawn-vegetable-white-radish-illustration-image_1240980.jpg', 15000.0000, 8, CAST(N'2021-03-10' AS Date), CAST(N'2022-03-24' AS Date), 2, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (4, N'Rau thơm', N'https://cooponline.vn/wp-content/uploads/2021/08/rau-thom-lam-sach.jpg', 2000.0000, 50, CAST(N'2021-03-10' AS Date), CAST(N'2022-03-24' AS Date), 1, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (5, N'Rau mùng tơi', N'https://photo-cms-baonghean.zadn.vn/w607/Uploaded/2022/nkdkswkqoc/201606/original/images1597017_0.jpg', 5000.0000, 40, CAST(N'2021-03-10' AS Date), CAST(N'2022-03-24' AS Date), 1, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (6, N'Rau muống', N'https://minhcaumart.vn/media/com_eshop/products/RAUMUONG.jpg', 10000.0000, 2, CAST(N'2021-03-10' AS Date), CAST(N'2022-03-24' AS Date), 1, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (7, N'Rau má', N'https://media.vov.vn/uploaded/69lwz2nmezg/2019_06_10/2_dfah.jpg', 8000.0000, 12, CAST(N'2021-03-10' AS Date), CAST(N'2022-03-24' AS Date), 1, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (8, N'Củ sắn', N'https://vinmec-prod.s3.amazonaws.com/images/20210225_005746_051154_ngo-doc-san.max-800x800.png', 20000.0000, 15, CAST(N'2021-03-10' AS Date), CAST(N'2022-03-24' AS Date), 2, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (9, N'Quả dưa hấu', N'https://e.khoahoc.tv/photos/image/2021/04/17/dua-hau-650.jpg', 50000.0000, 20, CAST(N'2021-03-10' AS Date), CAST(N'2022-03-24' AS Date), 3, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (10, N'Quả dừa', N'http://icdn.dantri.com.vn/thumb_w/640/2018/photo-1-1516160784292.jpg', 10000.0000, 4, CAST(N'2021-03-10' AS Date), CAST(N'2022-03-24' AS Date), 3, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (11, N'Quả táo', N'https://trungtamtienghan.edu.vn/uploads/blog/2019_07/cach-noi-qua-tao-bang-tieng-han_1.jpg', 8000.0000, 30, CAST(N'2021-03-10' AS Date), CAST(N'2022-03-24' AS Date), 3, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (12, N'Quả dứa', N'https://media.laodong.vn/Storage/NewsPortal/2019/11/17/766605/Tac-Dung-Giam-Can-Hi.jpg', 20000.0000, 11, CAST(N'2021-03-10' AS Date), CAST(N'2022-03-24' AS Date), 3, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (13, N'Quả sầu riêng', N'https://thuthuatnhanh.com/wp-content/uploads/2021/12/Hinh-anh-qua-Sau-Rieng-dep-mat-thom-ngon-hap-dan-nhat-1.jpg', 5000.0000, 10, CAST(N'2021-03-10' AS Date), CAST(N'2022-03-24' AS Date), 3, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (14, N'Quả thanh long', N'https://cf.shopee.vn/file/9e8ee39b4ae4d06d76de2d3286202805', 30000.0000, 30, CAST(N'2022-03-09' AS Date), CAST(N'2022-03-24' AS Date), 3, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (16, N'Quả chuối', N'https://vcdn-suckhoe.vnecdn.net/2018/03/25/chuoi11-6247-1521944592.jpg', 15000.0000, 0, CAST(N'2022-03-12' AS Date), CAST(N'2022-04-12' AS Date), 3, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (18, N'Quả chanh', N'https://minhcaumart.vn/media/com_eshop/products/chanh.jpg', 3000.0000, 12, CAST(N'2022-03-10' AS Date), CAST(N'2022-03-11' AS Date), 3, 1)
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [importDate], [usingDate], [categoryID], [status]) VALUES (19, N'Rau răm', N'https://nhathuoclongchau.com/upload/post/45005/images/an-rau-ram-co-mat-sua-khong-1.jpg', 10000.0000, 12, CAST(N'2022-03-12' AS Date), CAST(N'2022-03-19' AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[tblRoles] ON 

INSERT [dbo].[tblRoles] ([roleID], [roleName], [status]) VALUES (1, N'ADMIN', 1)
INSERT [dbo].[tblRoles] ([roleID], [roleName], [status]) VALUES (2, N'USER', 1)
SET IDENTITY_INSERT [dbo].[tblRoles] OFF
GO
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [address], [birthday], [phone], [roleID], [status]) VALUES (N'anthanh@gmail.com', N'Đinh Văn Thành An', N'1', N'FPT', CAST(N'2001-01-26' AS Date), 906954921, 2, 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [address], [birthday], [phone], [roleID], [status]) VALUES (N'boncon@gmail.com', N'Phan Nguyễn Đức Bốn', N'1', N'FPT', CAST(N'2001-06-12' AS Date), 906498711, 2, 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [address], [birthday], [phone], [roleID], [status]) VALUES (N'huydoan@gmail.com', N'Đoàn Vũ Quang Huy', N'1', N'FPT', CAST(N'2001-11-21' AS Date), 906918521, 1, 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [address], [birthday], [phone], [roleID], [status]) VALUES (N'huydoanmec@gmail.com', N'huyyyyyyyyyy', N'1', N'FPT', CAST(N'2022-03-11' AS Date), 909090909, 2, 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [address], [birthday], [phone], [roleID], [status]) VALUES (N'nguyenvu@gmail.com', N'Nguyễn Trọng Nguyên Vũ', N'1', N'FPT', CAST(N'2001-05-09' AS Date), 906918521, 1, 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [address], [birthday], [phone], [roleID], [status]) VALUES (N'otevipro@gmail.com', N'Otte', N'1', N'HCM-US', CAST(N'2001-05-05' AS Date), 123456789, 2, 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [address], [birthday], [phone], [roleID], [status]) VALUES (N'thiepngoo@gmail.com', N'Ngô Xuân Thịp', N'1', N'FPT', CAST(N'2001-12-12' AS Date), 908278521, 2, 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [address], [birthday], [phone], [roleID], [status]) VALUES (N'tonhuynh@gmail.com', N'Huỳnh Văn Tôn', N'1', N'FPT', CAST(N'2001-10-10' AS Date), 904426521, 2, 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [address], [birthday], [phone], [roleID], [status]) VALUES (N'tungnguyen@gmail.com', N'Nguyễn Thanh Tùng', N'1', N'FPT', CAST(N'2001-05-05' AS Date), 906982321, 2, 1)
INSERT [dbo].[tblUsers] ([email], [fullName], [password], [address], [birthday], [phone], [roleID], [status]) VALUES (N'vuntnse151234@fpt.edu.vn', N'test', N'1', N'FPT', NULL, 906918521, 2, 1)
GO
ALTER TABLE [dbo].[tblCategory] ADD  DEFAULT ('1') FOR [status]
GO
ALTER TABLE [dbo].[tblOrder] ADD  CONSTRAINT [DF_tblOrder_orderDate]  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[tblOrder] ADD  DEFAULT ('1') FOR [status]
GO
ALTER TABLE [dbo].[tblOrderDetail] ADD  DEFAULT ('1') FOR [status]
GO
ALTER TABLE [dbo].[tblProduct] ADD  CONSTRAINT [DF_tblProduct_importDate]  DEFAULT (getdate()) FOR [importDate]
GO
ALTER TABLE [dbo].[tblProduct] ADD  DEFAULT ('1') FOR [status]
GO
ALTER TABLE [dbo].[tblRoles] ADD  DEFAULT ('1') FOR [status]
GO
ALTER TABLE [dbo].[tblUsers] ADD  DEFAULT ('1') FOR [password]
GO
ALTER TABLE [dbo].[tblUsers] ADD  DEFAULT ('FPT University') FOR [address]
GO
ALTER TABLE [dbo].[tblUsers] ADD  DEFAULT ('1') FOR [status]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([email])
REFERENCES [dbo].[tblUsers] ([email])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [VegetableManagement] SET  READ_WRITE 
GO
