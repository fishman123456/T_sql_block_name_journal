USE [master]
GO
/****** Object:  Database [Academy1122]    Script Date: 17.08.2023 21:11:36 ******/
CREATE DATABASE [Academy1122]
GO
ALTER DATABASE [Academy1122] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Academy1122] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Academy1122] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Academy1122] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Academy1122] SET ARITHABORT OFF 
GO
ALTER DATABASE [Academy1122] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Academy1122] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Academy1122] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Academy1122] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Academy1122] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Academy1122] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Academy1122] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Academy1122] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Academy1122] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Academy1122] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Academy1122] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Academy1122] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Academy1122] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Academy1122] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Academy1122] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Academy1122] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Academy1122] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Academy1122] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Academy1122] SET  MULTI_USER 
GO
ALTER DATABASE [Academy1122] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Academy1122] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Academy1122] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Academy1122] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Academy1122] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Academy1122] SET QUERY_STORE = OFF
GO
USE [Academy1122]
GO
/****** Object:  Table [dbo].[AdditionalLectures]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdditionalLectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddLectureRoom] [nvarchar](max) NOT NULL,
	[AddSubjectId] [int] NOT NULL,
	[AddTeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Financing] [money] NULL,
	[Name] [nvarchar](100) NULL,
	[FacultyId] [int] NULL,
 CONSTRAINT [PK__Departme__3214EC075447E959] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Example]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Example](
	[Name] [varchar](100) NULL,
	[BirthDay] [date] NULL,
	[Phone] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Example1]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Example1](
	[Name] [varchar](100) NULL,
	[BirthDay] [date] NULL,
	[Phone] [varchar](100) NULL,
	[Group_] [varchar](100) NULL,
	[Subject] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK__Facultie__3214EC070BCF63AA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Year] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsLectures]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsLectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[GroupId] [int] NULL,
	[LectureId] [int] NULL,
	[AddLectureId] [int] NULL,
 CONSTRAINT [PK__GroupsLe__3214EC07ACFFB42E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LectureRoom] [nvarchar](max) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableDate]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableDate](
	[id] [int] NOT NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_TableDate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Salary] [money] NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Premium] [money] NULL,
	[EmploymentDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers2]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Salary] [money] NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
	[Premium] [money] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp](
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test2]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test2](
	[Name] [varchar](50) NULL,
	[Surname] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[testtable]    Script Date: 17.08.2023 21:11:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[testtable](
	[Date] [date] NULL,
	[Name] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdditionalLectures] ON 

INSERT [dbo].[AdditionalLectures] ([Id], [AddLectureRoom], [AddSubjectId], [AddTeacherId]) VALUES (1, N'A205', 1, 1)
INSERT [dbo].[AdditionalLectures] ([Id], [AddLectureRoom], [AddSubjectId], [AddTeacherId]) VALUES (2, N'A210', 3, 5)
SET IDENTITY_INSERT [dbo].[AdditionalLectures] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Financing], [Name], [FacultyId]) VALUES (1, 40000.0000, N'Software Development', 1)
INSERT [dbo].[Departments] ([Id], [Financing], [Name], [FacultyId]) VALUES (2, 20000.0000, N'Foreign languages', 2)
INSERT [dbo].[Departments] ([Id], [Financing], [Name], [FacultyId]) VALUES (3, 16500.0000, N'Heat Engines', 3)
INSERT [dbo].[Departments] ([Id], [Financing], [Name], [FacultyId]) VALUES (1003, 26000.0000, N'Heat Engines Language', 1)
INSERT [dbo].[Departments] ([Id], [Financing], [Name], [FacultyId]) VALUES (1005, 4124234.0000, N'Gret', 1)
INSERT [dbo].[Departments] ([Id], [Financing], [Name], [FacultyId]) VALUES (1006, 42345.0000, N'Fgdg sfsf sfsf sfsf', 1)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
INSERT [dbo].[Example1] ([Name], [BirthDay], [Phone], [Group_], [Subject]) VALUES (N'Name1', CAST(N'2000-01-01' AS Date), N'11-11', N'A', N'DB')
INSERT [dbo].[Example1] ([Name], [BirthDay], [Phone], [Group_], [Subject]) VALUES (N'Name2', CAST(N'2000-01-01' AS Date), N'22-22', N'B', N'c#')
INSERT [dbo].[Example1] ([Name], [BirthDay], [Phone], [Group_], [Subject]) VALUES (N'Name3', CAST(N'2000-01-01' AS Date), N'11-11', N'A', N'JS')
GO
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (1, N'Computer Science')
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (2, N'Economics and Management')
INSERT [dbo].[Faculties] ([Id], [Name]) VALUES (3, N'Energy and Electronics')
SET IDENTITY_INSERT [dbo].[Faculties] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (1, N'C-22', 1, 1)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (2, N'B-20', 3, 2)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (3, N'A-18', 5, 3)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (4, N'G-19', 4, 1)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (1002, N'G-12', 5, 1)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsLectures] ON 

INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (1, 1, 1, 2, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (2, 1, 2, 2, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (3, 1, NULL, 3, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (4, 1, 4, 3, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (5, 2, 2, 2, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (6, 2, 4, 7, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (7, 3, 1, 5, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (8, 3, 3, NULL, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (9, 3, 3, 6, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (10, 4, 1, 4, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (11, 4, 2, 2, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (12, 4, 3, 3, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (13, 5, 1, 1, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (14, 5, 2, 5, NULL)
INSERT [dbo].[GroupsLectures] ([Id], [DayOfWeek], [GroupId], [LectureId], [AddLectureId]) VALUES (15, 5, 3, 3, NULL)
SET IDENTITY_INSERT [dbo].[GroupsLectures] OFF
GO
SET IDENTITY_INSERT [dbo].[Lectures] ON 

INSERT [dbo].[Lectures] ([Id], [LectureRoom], [SubjectId], [TeacherId]) VALUES (1, N'D201', 1, 1)
INSERT [dbo].[Lectures] ([Id], [LectureRoom], [SubjectId], [TeacherId]) VALUES (2, N'D205', 2, 2)
INSERT [dbo].[Lectures] ([Id], [LectureRoom], [SubjectId], [TeacherId]) VALUES (3, N'D210', 3, 3)
INSERT [dbo].[Lectures] ([Id], [LectureRoom], [SubjectId], [TeacherId]) VALUES (4, N'D212', 2, 2)
INSERT [dbo].[Lectures] ([Id], [LectureRoom], [SubjectId], [TeacherId]) VALUES (5, N'D201', 3, 2)
INSERT [dbo].[Lectures] ([Id], [LectureRoom], [SubjectId], [TeacherId]) VALUES (6, N'D205', 3, 3)
INSERT [dbo].[Lectures] ([Id], [LectureRoom], [SubjectId], [TeacherId]) VALUES (7, N'D201', 1, 5)
SET IDENTITY_INSERT [dbo].[Lectures] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (1, N'
Database Theory')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (2, N'Maths')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (3, N'Physics')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
INSERT [dbo].[TableDate] ([id], [Date]) VALUES (1, CAST(N'1900-01-01' AS Date))
INSERT [dbo].[TableDate] ([id], [Date]) VALUES (2, CAST(N'2000-02-02' AS Date))
INSERT [dbo].[TableDate] ([id], [Date]) VALUES (3, CAST(N'1990-01-10' AS Date))
INSERT [dbo].[TableDate] ([id], [Date]) VALUES (4, NULL)
INSERT [dbo].[TableDate] ([id], [Date]) VALUES (5, NULL)
INSERT [dbo].[TableDate] ([id], [Date]) VALUES (6, NULL)
INSERT [dbo].[TableDate] ([id], [Date]) VALUES (7, NULL)
INSERT [dbo].[TableDate] ([id], [Date]) VALUES (8, CAST(N'1999-09-09' AS Date))
INSERT [dbo].[TableDate] ([id], [Date]) VALUES (9, CAST(N'1999-09-09' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [Name], [Salary], [Surname], [Premium], [EmploymentDate]) VALUES (1, N'Jack', 26000.0000, N'Petrov', 3430234.0000, NULL)
INSERT [dbo].[Teachers] ([Id], [Name], [Salary], [Surname], [Premium], [EmploymentDate]) VALUES (2, N'Jack', 450000.0000, N'Underhill', 10000.0000, NULL)
INSERT [dbo].[Teachers] ([Id], [Name], [Salary], [Surname], [Premium], [EmploymentDate]) VALUES (3, N'Dave ', 16000.0000, N'McQueen', 12000.0000, NULL)
INSERT [dbo].[Teachers] ([Id], [Name], [Salary], [Surname], [Premium], [EmploymentDate]) VALUES (5, N'Ben', 16000.0000, N'Jonson', 7000.0000, NULL)
INSERT [dbo].[Teachers] ([Id], [Name], [Salary], [Surname], [Premium], [EmploymentDate]) VALUES (7, N'Jack', 26000.0000, N'Petrov', 6000.0000, NULL)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
INSERT [dbo].[Temp] ([Name], [Surname]) VALUES (N'Jack', N'Petrov')
INSERT [dbo].[Temp] ([Name], [Surname]) VALUES (N'Jack', N'Underhill')
INSERT [dbo].[Temp] ([Name], [Surname]) VALUES (N'Name1', N'Surname1')
GO
INSERT [dbo].[testtable] ([Date], [Name]) VALUES (CAST(N'1900-01-01' AS Date), N'qwerqwer')
INSERT [dbo].[testtable] ([Date], [Name]) VALUES (CAST(N'1900-02-01' AS Date), NULL)
INSERT [dbo].[testtable] ([Date], [Name]) VALUES (CAST(N'2000-01-01' AS Date), N'qwasdfasd')
INSERT [dbo].[testtable] ([Date], [Name]) VALUES (CAST(N'2000-02-02' AS Date), N'gfdsh')
INSERT [dbo].[testtable] ([Date], [Name]) VALUES (CAST(N'2002-02-02' AS Date), N'asdasd')
INSERT [dbo].[testtable] ([Date], [Name]) VALUES (CAST(N'2002-02-02' AS Date), N'qowie[pqowio')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__737584F64AB297D4]    Script Date: 17.08.2023 21:11:37 ******/
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [UQ__Departme__737584F64AB297D4] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Facultie__737584F65A32880B]    Script Date: 17.08.2023 21:11:37 ******/
ALTER TABLE [dbo].[Faculties] ADD  CONSTRAINT [UQ__Facultie__737584F65A32880B] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Groups__737584F65FD980C8]    Script Date: 17.08.2023 21:11:37 ******/
ALTER TABLE [dbo].[Groups] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Subjects__737584F6E67256DB]    Script Date: 17.08.2023 21:11:37 ******/
ALTER TABLE [dbo].[Subjects] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [DF__Departmen__Finan__398D8EEE]  DEFAULT ((0.0)) FOR [Financing]
GO
ALTER TABLE [dbo].[AdditionalLectures]  WITH CHECK ADD FOREIGN KEY([AddSubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[AdditionalLectures]  WITH CHECK ADD FOREIGN KEY([AddSubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[AdditionalLectures]  WITH CHECK ADD FOREIGN KEY([AddTeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[AdditionalLectures]  WITH CHECK ADD FOREIGN KEY([AddTeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK__Departmen__Facul__52593CB8] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([Id])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK__Departmen__Facul__52593CB8]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD  CONSTRAINT [FK__Groups__Departme__534D60F1] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Groups] CHECK CONSTRAINT [FK__Groups__Departme__534D60F1]
GO
ALTER TABLE [dbo].[GroupsLectures]  WITH CHECK ADD  CONSTRAINT [FK__GroupsLec__AddLe__6383C8BA] FOREIGN KEY([AddLectureId])
REFERENCES [dbo].[AdditionalLectures] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectures] CHECK CONSTRAINT [FK__GroupsLec__AddLe__6383C8BA]
GO
ALTER TABLE [dbo].[GroupsLectures]  WITH CHECK ADD  CONSTRAINT [FK__GroupsLec__Group__5441852A] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectures] CHECK CONSTRAINT [FK__GroupsLec__Group__5441852A]
GO
ALTER TABLE [dbo].[GroupsLectures]  WITH CHECK ADD  CONSTRAINT [FK__GroupsLec__Lectu__5535A963] FOREIGN KEY([LectureId])
REFERENCES [dbo].[Lectures] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectures] CHECK CONSTRAINT [FK__GroupsLec__Lectu__5535A963]
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[AdditionalLectures]  WITH CHECK ADD CHECK  (([AddLectureRoom]<>N''))
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [CK__Departmen__Finan__38996AB5] CHECK  (([Financing]>=(0.0)))
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [CK__Departmen__Finan__38996AB5]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [CK__Department__Name__3A81B327] CHECK  (([Name]<>N''))
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [CK__Department__Name__3A81B327]
GO
ALTER TABLE [dbo].[Faculties]  WITH CHECK ADD  CONSTRAINT [CK__Faculties__Name__3E52440B] CHECK  (([Name]<>N''))
GO
ALTER TABLE [dbo].[Faculties] CHECK CONSTRAINT [CK__Faculties__Name__3E52440B]
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([Name]<>N''))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([Year]>=(1) AND [Year]<=(5)))
GO
ALTER TABLE [dbo].[GroupsLectures]  WITH CHECK ADD  CONSTRAINT [CK__GroupsLec__DayOf__45F365D3] CHECK  (([DayOfWeek]>=(1) AND [DayOfWeek]<=(7)))
GO
ALTER TABLE [dbo].[GroupsLectures] CHECK CONSTRAINT [CK__GroupsLec__DayOf__45F365D3]
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD CHECK  (([LectureRoom]<>N''))
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD CHECK  (([Name]<>N''))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Name]<>N''))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Salary]>(0.0)))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Surname]<>N''))
GO
USE [master]
GO
ALTER DATABASE [Academy1122] SET  READ_WRITE 
GO
