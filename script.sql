USE [ShopAccount]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/20/2023 7:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[imageLink] [varchar](max) NOT NULL,
	[accountName] [nchar](50) NOT NULL,
	[rank] [nvarchar](50) NOT NULL,
	[description] [nvarchar](150) NULL,
	[price] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/20/2023 7:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [int] NOT NULL,
	[AccountID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/20/2023 7:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[urlFB] [nvarchar](max) NOT NULL,
	[note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Checkout] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 3/20/2023 7:53:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[phone] [nchar](20) NULL,
	[name] [nvarchar](50) NULL,
	[role] [smallint] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [imageLink], [accountName], [rank], [description], [price]) VALUES (1, N'uploads/Account1.png', N'Account 1                                         ', N'UNRANK', N'SALE', 3400000)
INSERT [dbo].[Account] ([id], [imageLink], [accountName], [rank], [description], [price]) VALUES (2, N'uploads/Account2.png', N'Account 2                                         ', N'UNRANK', N'NEW', 4400000)
INSERT [dbo].[Account] ([id], [imageLink], [accountName], [rank], [description], [price]) VALUES (3, N'uploads/Account3.png', N'Account 3                                         ', N'PLANTINUM 3', N'SALE', 4500000)
INSERT [dbo].[Account] ([id], [imageLink], [accountName], [rank], [description], [price]) VALUES (4, N'uploads/Account4.png', N'Account 4                                         ', N'GOLD 2', N'NEW', 2400000)
INSERT [dbo].[Account] ([id], [imageLink], [accountName], [rank], [description], [price]) VALUES (5, N'uploads/Account5.png', N'Account 5                                         ', N'SILVER 3', N'SALE', 4400000)
INSERT [dbo].[Account] ([id], [imageLink], [accountName], [rank], [description], [price]) VALUES (6, N'uploads/Account6.png', N'Account 6                                         ', N'GOLD 3', N'SALE', 4200000)
INSERT [dbo].[Account] ([id], [imageLink], [accountName], [rank], [description], [price]) VALUES (7, N'uploads/Account7.png', N'Account 7                                         ', N'PLANTINUM 2', N'SALE', 3450000)
INSERT [dbo].[Account] ([id], [imageLink], [accountName], [rank], [description], [price]) VALUES (8, N'uploads/Account8.png', N'Account 8                                         ', N'ASCENDANT 3', N'SALE', 3000000)
INSERT [dbo].[Account] ([id], [imageLink], [accountName], [rank], [description], [price]) VALUES (9, N'uploads/Account9.png', N'Account 9                                         ', N'PLANTINUM 1', N'NEW', 5400000)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[OrderDetail] ([OrderID], [AccountID]) VALUES (3, 2)
INSERT [dbo].[OrderDetail] ([OrderID], [AccountID]) VALUES (3, 3)
INSERT [dbo].[OrderDetail] ([OrderID], [AccountID]) VALUES (4, 8)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [name], [email], [phone], [urlFB], [note]) VALUES (1, N'a', N'ankhoa@gmail.com', N'090', N'abc', N'test')
INSERT [dbo].[Orders] ([OrderID], [name], [email], [phone], [urlFB], [note]) VALUES (2, N'Khoa', N'ankhoa@gmail.com', N'090', N'abc', N'khoa')
INSERT [dbo].[Orders] ([OrderID], [name], [email], [phone], [urlFB], [note]) VALUES (3, N'User', N'user@gmail.com', N'090', N'abc', N'test')
INSERT [dbo].[Orders] ([OrderID], [name], [email], [phone], [urlFB], [note]) VALUES (4, N'Khoa', N'ankhoa@gmail.com', N'090', N'abc', N'test')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([id], [username], [password], [phone], [name], [role]) VALUES (1, N'admin', N'123', N'090                 ', N'ADMIN', 1)
INSERT [dbo].[Person] ([id], [username], [password], [phone], [name], [role]) VALUES (2, N'user', N'123', N'080                 ', N'USER', 0)
INSERT [dbo].[Person] ([id], [username], [password], [phone], [name], [role]) VALUES (3, N'ankhoa69@gmail.com', N'100977209917602542711', N'                    ', N'An', 1)
INSERT [dbo].[Person] ([id], [username], [password], [phone], [name], [role]) VALUES (4, N'khoanvase170043@fpt.edu.vn', N'100256510206731477263', N'                    ', N'Nguyen Khoa', 0)
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([id])
GO
