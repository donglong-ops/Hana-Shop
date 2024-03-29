

USE [lab1_hanaShop]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 1/16/2021 9:52:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ImportedDate] [datetime] NOT NULL,
	[Total] [float] NOT NULL,
	[PayWith] [nvarchar](50) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingDetail]    Script Date: 1/16/2021 9:52:10 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 1/16/2021 9:52:10 AM ******/
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
/****** Object:  Table [dbo].[Food]    Script Date: 1/16/2021 9:52:10 AM ******/
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
	[createDate] [datetime] NOT NULL,
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
/****** Object:  Table [dbo].[Registration]    Script Date: 1/16/2021 9:52:10 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 1/16/2021 9:52:10 AM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 1/16/2021 9:52:10 AM ******/
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

INSERT [dbo].[Booking] ([Id], [UserId], [ImportedDate], [Total], [PayWith]) VALUES (1011, 2, CAST(N'2021-01-10 00:33:46.610' AS DateTime), 1600, N'NOPAYPAL')
INSERT [dbo].[Booking] ([Id], [UserId], [ImportedDate], [Total], [PayWith]) VALUES (1012, 2, CAST(N'2021-01-10 00:36:23.693' AS DateTime), 246, N'NOPAYPAL')
INSERT [dbo].[Booking] ([Id], [UserId], [ImportedDate], [Total], [PayWith]) VALUES (1013, 2, CAST(N'2021-01-15 00:36:23.693' AS DateTime), 1554, N'NOPAYPAL')
INSERT [dbo].[Booking] ([Id], [UserId], [ImportedDate], [Total], [PayWith]) VALUES (1023, 1003, CAST(N'2021-01-16 01:01:29.460' AS DateTime), 76000, N'NOPAYPAL')
INSERT [dbo].[Booking] ([Id], [UserId], [ImportedDate], [Total], [PayWith]) VALUES (1024, 3, CAST(N'2021-01-16 01:06:23.747' AS DateTime), 60000, N'NOPAYPAL')
SET IDENTITY_INSERT [dbo].[Booking] OFF
SET IDENTITY_INSERT [dbo].[BookingDetail] ON 

INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1007, 1011, 16, 13)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1008, 1011, 18, 1)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1009, 1012, 16, 2)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1010, 1011, 10, 5)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1011, 1023, 13, 5)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1012, 1024, 4, 1)
INSERT [dbo].[BookingDetail] ([Id], [BookingId], [FoodId], [Amount]) VALUES (1013, 1024, 6, 5)
SET IDENTITY_INSERT [dbo].[BookingDetail] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Cake')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Candy')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Coffee')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (2, N'Noodle', 10000, 55, 1, N'Good', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 2, CAST(N'2021-01-11 23:43:11.260' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (3, N'bun', 10000, 5, 1, N'Nice', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 2, CAST(N'2021-01-11 23:45:40.450' AS DateTime), 1)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (4, N'banh quy', 10000, 6, 1, N'cool', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (5, N'keo lac', 10000, 7, 1, N'ngon', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (6, N'sua', 10000, 8, 1, N'them', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (7, N'banh trung', 10000, 9, 1, N'Good', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (8, N'banh bong lan', 10000, 10, 1, N'Good', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (9, N'keo deo', 10000, 10, 2, N'Good', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (10, N'keo ho lo', 10000, 10, 2, N'Good', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (11, N'keo chuoi', 10000, 10, 2, N'Good', CAST(N'2021-01-15 00:00:00.000' AS DateTime), N'img/test.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (12, N'banh trang nuong', 66666, 10, 1, N'very good', CAST(N'2021-01-15 11:02:47.733' AS DateTime), N'img/ZYL9B6YEMB53XPF.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (13, N'banh me cuoi', 15200, 5, 1, N'Good For Everyone', CAST(N'2021-01-20 11:18:26.900' AS DateTime), N'img/2.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (14, N'Hi cc', 55555, 5555, 1, N'5555', CAST(N'2021-01-20 10:28:13.937' AS DateTime), N'', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (15, N'HI ban', 6666, 456, 2, N'NGON LAM', CAST(N'2021-01-15 09:42:32.290' AS DateTime), N'img/1.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (16, N'van', 123, 15, 3, N'ngon', CAST(N'2021-01-18 19:55:17.713' AS DateTime), N'img/16B520R2GPPT9ZA.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (17, N'LONG', 1, 1, 1, N'dep zai', CAST(N'2021-01-09 20:00:34.053' AS DateTime), N'img/ZDD1REO2VAX3I6R.jpg', 1, NULL, NULL)
INSERT [dbo].[Food] ([foodId], [foodname], [foodPrice], [quantity], [categoriId], [description], [createDate], [imageLink], [statusId], [updateDate], [userId]) VALUES (18, N'vkl', 1, 1, 2, N'ngon nghe', CAST(N'2021-01-09 20:04:57.710' AS DateTime), N'img/QITX33ZQLXSCYRK.jpg', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[Registration] ON 

INSERT [dbo].[Registration] ([Id], [Email], [Password], [Fullname], [Phone], [Avatar], [Address], [RoleID], [StatusID]) VALUES (1, N'long', N'123', N'Đồng Hữu Long', N'0931182303', N'deptrai.jpg', N'Quan 9', 1, 1)
INSERT [dbo].[Registration] ([Id], [Email], [Password], [Fullname], [Phone], [Avatar], [Address], [RoleID], [StatusID]) VALUES (2, N'van', N'123', N'Lê Thanh Vân', N'0931182303', N'deptrai.jpg', N'Quan 9', 2, 1)
INSERT [dbo].[Registration] ([Id], [Email], [Password], [Fullname], [Phone], [Avatar], [Address], [RoleID], [StatusID]) VALUES (3, N'donglong453@gmail.com', NULL, N'Đồng Long', NULL, N'https://lh3.googleusercontent.com/a-/AOh14Gg7NXllU9hOO43XOlloI-8pY2TKD9dtL0GJF29f2w=s96-c', NULL, 2, 1)
INSERT [dbo].[Registration] ([Id], [Email], [Password], [Fullname], [Phone], [Avatar], [Address], [RoleID], [StatusID]) VALUES (1003, N'longdhse130623@fpt.edu.vn', NULL, N'Dong Huu Long K13_HCM', NULL, N'https://lh3.googleusercontent.com/a-/AOh14GjhS8GKX_cnCqAr8M8FPA_UAkoxGA_ws0R-ewXTUg=s96-c', NULL, 2, 1)
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
