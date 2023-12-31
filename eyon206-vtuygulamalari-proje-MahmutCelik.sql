USE [db_MahmutCelik]
GO
/****** Object:  Table [dbo].[tbl_Departments]    Script Date: 12.06.2023 17:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Departments](
	[Dept_ID] [int] NOT NULL,
	[Dept_Name] [nvarchar](50) NULL,
	[Dept_Phone] [nvarchar](50) NULL,
	[Manager_ID] [int] NULL,
 CONSTRAINT [PK_tbl_Departments] PRIMARY KEY CLUSTERED 
(
	[Dept_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Employees]    Script Date: 12.06.2023 17:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Employees](
	[Empl_ID] [int] IDENTITY(1,1) NOT NULL,
	[Empl_FName] [nvarchar](50) NULL,
	[Empl_LName] [nvarchar](50) NULL,
	[Empl_BDate] [smalldatetime] NULL,
	[Is_Empl_Active] [bit] NULL,
	[Empl_Start_Date] [smalldatetime] NULL,
	[Empl_Wage] [money] NULL,
	[Gender_ID] [int] NULL,
	[Title_ID] [int] NULL,
	[Empl_Email] [nvarchar](50) NULL,
	[Empl_Cell] [nchar](15) NULL,
	[Dept_ID] [int] NULL,
	[Empl_Address] [nvarchar](200) NULL,
	[Empl_Province] [nvarchar](50) NULL,
	[Empl_City] [nvarchar](50) NULL,
	[Empl_Name]  AS (([Empl_FName]+' ')+[Empl_LName]),
 CONSTRAINT [PK_dbo.tbl_Employees] PRIMARY KEY CLUSTERED 
(
	[Empl_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_EmployeeWages]    Script Date: 12.06.2023 17:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_EmployeeWages](
	[Wage_ID] [int] IDENTITY(1,1) NOT NULL,
	[Empl_ID] [int] NULL,
	[Wage_Paid_Date] [smalldatetime] NULL,
	[Wage_Amount] [money] NULL,
	[Wage_Commission] [money] NULL,
	[Month_ID] [int] NULL,
	[Wage_Year]  AS (datepart(year,[Wage_Paid_Date])),
	[Wage_Total]  AS ([Wage_Amount]+[Wage_Commission]),
 CONSTRAINT [PK_tbl_EmployeeWages] PRIMARY KEY CLUSTERED 
(
	[Wage_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Lookups]    Script Date: 12.06.2023 17:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Lookups](
	[LK_ID] [int] IDENTITY(1,1) NOT NULL,
	[Empl_Title] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Month_Name] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Province] [nvarchar](50) NULL,
	[User_Type] [nvarchar](50) NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_tbl_Lookups] PRIMARY KEY CLUSTERED 
(
	[LK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 12.06.2023 17:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nvarchar](50) NULL,
	[User_Password] [nvarchar](50) NULL,
	[User_Type_ID] [int] NULL,
	[Role_ID] [int] NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_Departments] ([Dept_ID], [Dept_Name], [Dept_Phone], [Manager_ID]) VALUES (1, N'Bilgi İşlem', N'546', 11)
INSERT [dbo].[tbl_Departments] ([Dept_ID], [Dept_Name], [Dept_Phone], [Manager_ID]) VALUES (2, N'Pazarlama', N'326', 12)
INSERT [dbo].[tbl_Departments] ([Dept_ID], [Dept_Name], [Dept_Phone], [Manager_ID]) VALUES (3, N'Satış', N'326', 13)
INSERT [dbo].[tbl_Departments] ([Dept_ID], [Dept_Name], [Dept_Phone], [Manager_ID]) VALUES (4, N'Muhasebe', N'245', 14)
GO
SET IDENTITY_INSERT [dbo].[tbl_Employees] ON 

INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Is_Empl_Active], [Empl_Start_Date], [Empl_Wage], [Gender_ID], [Title_ID], [Empl_Email], [Empl_Cell], [Dept_ID], [Empl_Address], [Empl_Province], [Empl_City]) VALUES (11, N'Ahmetcan', N'Yıl', CAST(N'1980-01-15T00:00:00' AS SmallDateTime), 1, CAST(N'2012-05-10T00:00:00' AS SmallDateTime), NULL, 1, 1, N'ahmet.yilmaz@example.com', N'05551234567    ', 1, N'Çankaya', N'Ankara', N'Ankara')
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Is_Empl_Active], [Empl_Start_Date], [Empl_Wage], [Gender_ID], [Title_ID], [Empl_Email], [Empl_Cell], [Dept_ID], [Empl_Address], [Empl_Province], [Empl_City]) VALUES (12, N'Ayşenur', N'Kaya', CAST(N'1985-05-20T00:00:00' AS SmallDateTime), 1, CAST(N'2012-05-10T00:00:00' AS SmallDateTime), NULL, 2, 2, N'ayse.kaya@example.com', N'05559876543    ', 2, N'Kasımpaşa', N'İstanbul ', N'İstanbul')
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Is_Empl_Active], [Empl_Start_Date], [Empl_Wage], [Gender_ID], [Title_ID], [Empl_Email], [Empl_Cell], [Dept_ID], [Empl_Address], [Empl_Province], [Empl_City]) VALUES (13, N'Mahmut', N'Dem', CAST(N'1990-09-10T00:00:00' AS SmallDateTime), 1, CAST(N'2012-05-10T00:00:00' AS SmallDateTime), NULL, 1, 3, N'mehmet.demir@example.com', N'05548765432    ', 3, N'Beşiktaş', N'Diyarbakır', N'İstanbul')
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Is_Empl_Active], [Empl_Start_Date], [Empl_Wage], [Gender_ID], [Title_ID], [Empl_Email], [Empl_Cell], [Dept_ID], [Empl_Address], [Empl_Province], [Empl_City]) VALUES (14, N'Fatoş', N'Öztür', CAST(N'1995-03-25T00:00:00' AS SmallDateTime), 1, CAST(N'2012-05-10T00:00:00' AS SmallDateTime), NULL, 2, 4, N'fatma.ozturk@example.com', N'05542345678    ', 4, N'Etiler', N'Gaziantep', N'İstanbul')
SET IDENTITY_INSERT [dbo].[tbl_Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_EmployeeWages] ON 

INSERT [dbo].[tbl_EmployeeWages] ([Wage_ID], [Empl_ID], [Wage_Paid_Date], [Wage_Amount], [Wage_Commission], [Month_ID]) VALUES (1, 11, CAST(N'2023-05-05T00:00:00' AS SmallDateTime), 3.0000, 1.0000, 1)
INSERT [dbo].[tbl_EmployeeWages] ([Wage_ID], [Empl_ID], [Wage_Paid_Date], [Wage_Amount], [Wage_Commission], [Month_ID]) VALUES (2, 12, CAST(N'2023-05-05T00:00:00' AS SmallDateTime), 3.0000, 1.0000, 2)
INSERT [dbo].[tbl_EmployeeWages] ([Wage_ID], [Empl_ID], [Wage_Paid_Date], [Wage_Amount], [Wage_Commission], [Month_ID]) VALUES (3, 13, CAST(N'2023-05-05T00:00:00' AS SmallDateTime), 3.0000, 1.0000, 3)
INSERT [dbo].[tbl_EmployeeWages] ([Wage_ID], [Empl_ID], [Wage_Paid_Date], [Wage_Amount], [Wage_Commission], [Month_ID]) VALUES (4, 14, CAST(N'2023-05-05T00:00:00' AS SmallDateTime), 3.0000, 2.0000, 4)
SET IDENTITY_INSERT [dbo].[tbl_EmployeeWages] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Lookups] ON 

INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Role]) VALUES (1, N'Müdür', N'Erkek', N'Ocak', N'Çankaya', N'Ankara', N'Admin', 1)
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Role]) VALUES (2, N'İşçi', N'Kadın', N'Şubat', N'Kasımpaşa', N'İstanbul', N'Admin', 4)
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Role]) VALUES (3, N'Müdür Yardımcısı', N'Erkek', N'Mart', N'Beşiktaş', N'İstanbul', N'Admin', 2)
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Role]) VALUES (4, N'Sekreter', N'Kadın', N'Nisan', N'Etiler', N'Çanakkale', N'Admin', 3)
SET IDENTITY_INSERT [dbo].[tbl_Lookups] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Users] ON 

INSERT [dbo].[tbl_Users] ([User_ID], [User_Name], [User_Password], [User_Type_ID], [Role_ID]) VALUES (1, N'Ahmetcan', N'251214', 1, 1)
INSERT [dbo].[tbl_Users] ([User_ID], [User_Name], [User_Password], [User_Type_ID], [Role_ID]) VALUES (2, N'Ayşenur', N'514352', 2, 4)
INSERT [dbo].[tbl_Users] ([User_ID], [User_Name], [User_Password], [User_Type_ID], [Role_ID]) VALUES (3, N'Mahmut', N'545558', 3, 2)
INSERT [dbo].[tbl_Users] ([User_ID], [User_Name], [User_Password], [User_Type_ID], [Role_ID]) VALUES (4, N'Fatoş', N'521455', 4, 3)
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
GO
ALTER TABLE [dbo].[tbl_Departments]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Departments_Manager_ID] FOREIGN KEY([Manager_ID])
REFERENCES [dbo].[tbl_Employees] ([Empl_ID])
GO
ALTER TABLE [dbo].[tbl_Departments] CHECK CONSTRAINT [FK_tbl_Departments_Manager_ID]
GO
ALTER TABLE [dbo].[tbl_Employees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Employees_Gender_ID] FOREIGN KEY([Gender_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO
ALTER TABLE [dbo].[tbl_Employees] CHECK CONSTRAINT [FK_tbl_Employees_Gender_ID]
GO
ALTER TABLE [dbo].[tbl_Employees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Employees_Title_ID] FOREIGN KEY([Title_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO
ALTER TABLE [dbo].[tbl_Employees] CHECK CONSTRAINT [FK_tbl_Employees_Title_ID]
GO
ALTER TABLE [dbo].[tbl_EmployeeWages]  WITH CHECK ADD  CONSTRAINT [FK_tbl_EmployeeWages_tbl_Employees] FOREIGN KEY([Empl_ID])
REFERENCES [dbo].[tbl_Employees] ([Empl_ID])
GO
ALTER TABLE [dbo].[tbl_EmployeeWages] CHECK CONSTRAINT [FK_tbl_EmployeeWages_tbl_Employees]
GO
ALTER TABLE [dbo].[tbl_EmployeeWages]  WITH CHECK ADD  CONSTRAINT [FK_tbl_EmployeeWages_tbl_Lookups] FOREIGN KEY([Month_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO
ALTER TABLE [dbo].[tbl_EmployeeWages] CHECK CONSTRAINT [FK_tbl_EmployeeWages_tbl_Lookups]
GO
ALTER TABLE [dbo].[tbl_Users]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Users_tbl_Lookups] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO
ALTER TABLE [dbo].[tbl_Users] CHECK CONSTRAINT [FK_tbl_Users_tbl_Lookups]
GO
