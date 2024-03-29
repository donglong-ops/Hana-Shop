USE [master]
GO
/****** Object:  Database [lab1_hanaShop]    Script Date: 1/27/2021 7:23:59 PM ******/
CREATE DATABASE [lab1_hanaShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lab1_hanaShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\lab1_hanaShop.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'lab1_hanaShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\lab1_hanaShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [lab1_hanaShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lab1_hanaShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lab1_hanaShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lab1_hanaShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lab1_hanaShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [lab1_hanaShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lab1_hanaShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [lab1_hanaShop] SET  MULTI_USER 
GO
ALTER DATABASE [lab1_hanaShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lab1_hanaShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lab1_hanaShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lab1_hanaShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [lab1_hanaShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [lab1_hanaShop]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 1/27/2021 7:23:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ImportedDate] [date] NOT NULL,
	[Total] [float] NOT NULL,
	[PayWith] [nvarchar](50) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingDetail]    Script Date: 1/27/2021 7:23:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NOT NULL,
	[FoodId] [int] NOT NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_BookingDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/27/2021 7:23:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 1/27/2021 7:23:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[foodId] [int] IDENTITY(1,1) NOT NULL,
	[foodname] [nvarchar](50) NOT NULL,
	[foodPrice] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[categoriId] [int] NOT NULL,
	[description] [nvarchar](350) NOT NULL,
	[createDate] [date] NOT NULL,
	[imageLink] [nvarchar](50) NULL,
	[statusId] [int] NOT NULL,
	[updateDate] [datetime] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[foodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registration]    Script Date: 1/27/2021 7:23:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](250) NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Avatar] [nvarchar](250) NULL,
	[Address] [nvarchar](50) NULL,
	[RoleID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/27/2021 7:23:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 1/27/2021 7:23:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([Id], [UserId], [ImportedDate], [Total], [PayWith]) VALUES (1011, 2, CAST(N'2021-01-10' AS Date), 1600, N'NOPAYPAL')
INSERT [dbo].[Booking] ([Id], [UserId], [ImportedDate], [Total], [PayWith]) VALUES (1012, 2, CAST(N'2021-01-10' AS Date), 246, N'NOPAYPAL')
INSERT [dbo].[Booking] ([Id], [UserId], [ImportedDate], [Total], [PayWith]) VALUES (1013, 2, CAST(N'2021-01-15' AS Date), 1554, N'NOPAYPAL')
INSERT [dbo].[Booking] ([Id], [UserId], [ImportedDate], [Total], [PayWith]) VALUES (1023, 1003, CAST(N'2021-01-16' AS Date), 76000, N'NOPAYPAL')
INSERT [dbo].[Booking] ([Id], [UserId], [ImportedDate], [Total], [PayWith]) VALUES (1024, 3, CAST(N'2021-01-16' AS Date), 60000, N'NOPAYPAL')
INSERT [dbo].[Booking] ([Id], [UserId], [ImportedDate], [Total], [PayWith]) VALUES (1025, 1004, CAST(N'2021-01-19' AS Date), 30000, N'NOPAYPAL')
INSERT [dbo].[Booking] ([Id], [UserId], [ImportedDate], [Total], [PayWith]) VALUES (1026, 2, CAST(N'2021-01-19' AS Date), 20000, N'Cash')
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[BookingDetail] ON 

INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1007, 1011, 16, 13)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1008, 1011, 18, 1)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1009, 1012, 16, 2)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1010, 1011, 10, 5)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1011, 1023, 13, 5)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1012, 1024, 4, 1)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1013, 1024, 6, 5)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1014, 1013, 7, 2)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1015, 1013, 9, 1)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1016, 1025, 7, 2)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1017, 1025, 8, 1)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1018, 1026, 4, 1)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1019, 1026, 5, 1)
SET IDENTITY_INSERT [dbo].[BookingDetail] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Cake')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Candy')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Coffee')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (2, N'banh xeo', 10000, 60, 1, N'Good', CAST(N'2021-01-15' AS Date), N'img/N0QY69F5RGZR7XS.jfif', 1, CAST(N'2021-01-27 18:56:41.503' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (3, N'banh khot', 10000, 5, 1, N'Nice', CAST(N'2021-01-15' AS Date), N'img/QCVSNEGLHLVJTDX.jfif', 1, CAST(N'2021-01-27 18:56:50.973' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (4, N'banh quy', 10000, 6, 1, N'cool', CAST(N'2021-01-15' AS Date), N'img/NQYZPD1SEDHCEQ5.jfif', 2, CAST(N'2021-01-25 15:10:07.210' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (5, N'banh beo', 10000, 7, 1, N'ngon', CAST(N'2021-01-15' AS Date), N'img/23Z9B2BG7FK6O7R.jfif', 1, CAST(N'2021-01-27 18:57:00.143' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (6, N'banh dua', 10000, 8, 1, N'them', CAST(N'2021-01-15' AS Date), N'img/CM0FKSNBRK6MP42.jfif', 1, CAST(N'2021-01-27 18:57:16.500' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (7, N'banh chung', 10000, 9, 1, N'Good', CAST(N'2021-01-15' AS Date), N'img/HXN5IDQORLNKLRH.jfif', 1, CAST(N'2021-01-27 18:57:26.213' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (8, N'banh bong lan', 10000, 10, 1, N'Good', CAST(N'2021-01-15' AS Date), N'img/OIMHT0V6LYJKG6T.jfif', 1, CAST(N'2021-01-27 18:58:53.673' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (9, N'banh chuoi hap', 10000, 10, 1, N'Good', CAST(N'2021-01-15' AS Date), N'img/4Z297GM1XYF5WTU.jfif', 1, CAST(N'2021-01-27 18:59:05.663' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (10, N'banh bao', 10000, 10, 1, N'Good', CAST(N'2021-01-15' AS Date), N'img/N88LQP597QTCJAQ.jfif', 1, CAST(N'2021-01-27 18:59:15.793' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (11, N'banh khoai mo', 10000, 10, 1, N'Good', CAST(N'2021-01-15' AS Date), N'img/CXYBA595IK8PB3S.jfif', 1, CAST(N'2021-01-27 18:59:26.027' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (12, N'banh it', 66666, 10, 1, N'very good', CAST(N'2021-01-15' AS Date), N'img/OF5B9P0NPIO3RDV.jfif', 1, CAST(N'2021-01-27 18:59:34.930' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (13, N'banh cam', 15200, 5, 1, N'Good For Everyone', CAST(N'2021-01-20' AS Date), N'img/2.jpg', 1, CAST(N'2021-01-18 14:46:36.393' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (14, N'ca phe sua', 55555, 5555, 3, N'awake', CAST(N'2021-01-20' AS Date), N'img/TYYAT7XBXBDFLCL.jfif', 1, CAST(N'2021-01-27 18:59:44.893' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (15, N'banh tet', 6666, 456, 2, N'NGON LAM', CAST(N'2021-01-15' AS Date), N'img/3TLMKKWQD8O0J11.jfif', 1, CAST(N'2021-01-27 19:00:38.990' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (16, N'chuoi chien', 123, 15, 1, N'ngon', CAST(N'2021-01-18' AS Date), N'img/CZZ2QOUAH92OJXC.jfif', 1, CAST(N'2021-01-27 19:00:47.923' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (17, N'marshmallow', 1, 1, 1, N'Yummy', CAST(N'2021-01-09' AS Date), N'img/24LL8M9HTJZFLJS.jfif', 1, CAST(N'2021-01-27 18:59:55.790' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (18, N'vkl', 1, 1, 2, N'ngon nghe', CAST(N'2021-01-09' AS Date), N'img/QITX33ZQLXSCYRK.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (20, N'nuoc ngot', 15000, 15, 3, N'ngon', CAST(N'2021-01-17' AS Date), N'img/NNBPJ6A42MQTAC6.jfif', 1, CAST(N'2021-01-27 19:01:57.173' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (21, N'singum', 158000, 20, 2, N'thom mieng', CAST(N'2021-01-16' AS Date), N'img/42I41CPZQWEA6O0.jfif', 1, CAST(N'2021-01-27 19:01:47.633' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (22, N'banh ngot', 4500, 12, 1, N'ngon', CAST(N'2021-01-25' AS Date), N'img/FCNYKA8KFWHAUQS.jfif', 1, CAST(N'2021-01-27 19:01:38.230' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[Registration] ON 

INSERT [dbo].[Registration] ([Id], [Email], [Password], [Fullname], [Phone], [Avatar], [Address], [RoleID], [StatusID]) VALUES (1, N'long', N'123', N'Đồng Hữu Long', N'0931182303', N'deptrai.jpg', N'Quan 9', 1, 1)
INSERT [dbo].[Registration] ([Id], [Email], [Password], [Fullname], [Phone], [Avatar], [Address], [RoleID], [StatusID]) VALUES (2, N'van', N'123', N'Lê Thanh Vân', N'0931182303', N'deptrai.jpg', N'Quan 9', 2, 1)
INSERT [dbo].[Registration] ([Id], [Email], [Password], [Fullname], [Phone], [Avatar], [Address], [RoleID], [StatusID]) VALUES (3, N'donglong453@gmail.com', NULL, N'Đồng Long', NULL, N'https://lh3.googleusercontent.com/a-/AOh14Gg7NXllU9hOO43XOlloI-8pY2TKD9dtL0GJF29f2w=s96-c', NULL, 2, 1)
INSERT [dbo].[Registration] ([Id], [Email], [Password], [Fullname], [Phone], [Avatar], [Address], [RoleID], [StatusID]) VALUES (1003, N'longdhse130623@fpt.edu.vn', NULL, N'Dong Huu Long K13_HCM', NULL, N'https://lh3.googleusercontent.com/a-/AOh14GjhS8GKX_cnCqAr8M8FPA_UAkoxGA_ws0R-ewXTUg=s96-c', NULL, 2, 1)
INSERT [dbo].[Registration] ([Id], [Email], [Password], [Fullname], [Phone], [Avatar], [Address], [RoleID], [StatusID]) VALUES (1004, N'vanltse141176@fpt.edu.vn', NULL, N'Le Thanh Van (FU HCM)', NULL, N'https://lh4.googleusercontent.com/-be9tpPw5OlU/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucl1Jwby-o_MZsNFwTQuI1_RHkhNkg/s96-c/photo.jpg', NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[Registration] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'Active')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'Inactive')
SET IDENTITY_INSERT [dbo].[Status] OFF
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Registration] FOREIGN KEY([UserId])
REFERENCES [dbo].[Registration] ([Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Registration]
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetail_Booking] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([Id])
GO
ALTER TABLE [dbo].[BookingDetail] CHECK CONSTRAINT [FK_BookingDetail_Booking]
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetail_Food] FOREIGN KEY([FoodId])
REFERENCES [dbo].[Food] ([foodId])
GO
ALTER TABLE [dbo].[BookingDetail] CHECK CONSTRAINT [FK_BookingDetail_Food]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_Category] FOREIGN KEY([categoriId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_Category]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_Registration1] FOREIGN KEY([userId])
REFERENCES [dbo].[Registration] ([Id])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_Registration1]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_Status] FOREIGN KEY([statusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_Status]
GO
USE [master]
GO
ALTER DATABASE [lab1_hanaShop] SET  READ_WRITE 
GO
