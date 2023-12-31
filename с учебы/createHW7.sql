USE [master]
GO
/****** Object:  Database [Homework7]    Script Date: 23.08.2023 20:49:04 ******/
CREATE DATABASE [Homework7] 
GO
ALTER DATABASE [Homework7] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Homework7] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Homework7] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Homework7] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Homework7] SET ARITHABORT OFF 
GO
ALTER DATABASE [Homework7] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Homework7] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Homework7] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Homework7] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Homework7] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Homework7] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Homework7] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Homework7] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Homework7] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Homework7] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Homework7] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Homework7] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Homework7] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Homework7] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Homework7] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Homework7] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Homework7] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Homework7] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Homework7] SET  MULTI_USER 
GO
ALTER DATABASE [Homework7] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Homework7] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Homework7] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Homework7] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Homework7] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Homework7] SET QUERY_STORE = OFF
GO
USE [Homework7]
GO
/****** Object:  Table [dbo].[Assistants]    Script Date: 23.08.2023 20:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assistants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curators]    Script Date: 23.08.2023 20:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deans]    Script Date: 23.08.2023 20:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 23.08.2023 20:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Building] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[FacultyId] [int] NOT NULL,
	[HeadId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 23.08.2023 20:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Building] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DeanId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 23.08.2023 20:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Year] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsCurators]    Script Date: 23.08.2023 20:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsCurators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CuratorId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupsLectures]    Script Date: 23.08.2023 20:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupsLectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[LectureId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Heads]    Script Date: 23.08.2023 20:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Heads](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LectureRooms]    Script Date: 23.08.2023 20:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LectureRooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Building] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 23.08.2023 20:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedules]    Script Date: 23.08.2023 20:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Class] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[Week] [int] NOT NULL,
	[LectureId] [int] NOT NULL,
	[LectureRoomId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 23.08.2023 20:49:05 ******/
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
/****** Object:  Table [dbo].[Teachers]    Script Date: 23.08.2023 20:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Surname] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assistants] ON 

INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (1, 1)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (2, 2)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (3, 3)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (4, 4)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (5, 5)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (6, 6)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (7, 7)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (8, 8)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (9, 9)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (10, 10)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (11, 11)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (12, 12)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (13, 13)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (14, 14)
INSERT [dbo].[Assistants] ([Id], [TeacherId]) VALUES (15, 15)
SET IDENTITY_INSERT [dbo].[Assistants] OFF
GO
SET IDENTITY_INSERT [dbo].[Curators] ON 

INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (1, 1)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (2, 2)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (3, 3)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (4, 4)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (5, 5)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (6, 6)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (7, 7)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (8, 8)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (9, 9)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (10, 10)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (11, 11)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (12, 12)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (13, 13)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (14, 14)
INSERT [dbo].[Curators] ([Id], [TeacherId]) VALUES (15, 15)
SET IDENTITY_INSERT [dbo].[Curators] OFF
GO
SET IDENTITY_INSERT [dbo].[Deans] ON 

INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (1, 1)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (2, 2)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (3, 3)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (4, 4)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (5, 5)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (6, 6)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (7, 7)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (8, 8)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (9, 9)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (10, 10)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (11, 11)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (12, 12)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (13, 13)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (14, 14)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (15, 15)
INSERT [dbo].[Deans] ([Id], [TeacherId]) VALUES (31, 16)
SET IDENTITY_INSERT [dbo].[Deans] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (4, 1, N'Математический', 1, 1)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (5, 2, N'Физический', 2, 2)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (6, 3, N'Юридический', 3, 3)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (7, 4, N'Информационных технологий', 4, 4)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (8, 5, N'Иностранных языков', 5, 5)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (9, 1, N'Химический', 6, 6)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (10, 2, N'Экономический', 7, 7)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (11, 3, N'Психологии', 8, 8)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (12, 4, N'Исторический', 9, 9)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (13, 5, N'Журналистики', 10, 10)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (14, 1, N'Педагогический', 11, 11)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (15, 2, N'Философский', 12, 12)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (16, 3, N'Социологии', 13, 13)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (17, 4, N'Медицинский', 14, 14)
INSERT [dbo].[Departments] ([Id], [Building], [Name], [FacultyId], [HeadId]) VALUES (18, 5, N'Биологический', 15, 15)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (1, 1, N'Математический', 1)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (2, 2, N'Физический', 2)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (3, 3, N'Юридический', 3)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (4, 4, N'Информационных технологий', 4)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (5, 5, N'Иностранных языков', 5)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (6, 1, N'Химический', 6)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (7, 2, N'Экономический', 7)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (8, 3, N'Психологии', 8)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (9, 4, N'Исторический', 9)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (10, 5, N'Журналистики', 10)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (11, 1, N'Педагогический', 11)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (12, 2, N'Философский', 12)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (13, 3, N'Социологии', 13)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (14, 4, N'Медицинский', 14)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (15, 5, N'Биологический', 15)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (16, 1, N'asdfasdf', 1)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (18, 1, N'asasdfdfasdf', 1)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (20, 1, N'asasdfdasdffasdf', 1)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (21, 1, N'asasdasdafdfasdf', 1)
INSERT [dbo].[Faculties] ([Id], [Building], [Name], [DeanId]) VALUES (22, 1, N'asasdasdafasddfasdf', 1)
SET IDENTITY_INSERT [dbo].[Faculties] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (3, N'Мат-01', 1, 4)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (4, N'Физ-01', 2, 4)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (5, N'Юр-01', 3, 6)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (6, N'ИТ-01', 4, 7)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (7, N'Англ-01', 1, 8)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (8, N'Хим-01', 2, 9)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (9, N'Эк-01', 3, 10)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (10, N'Псих-01', 4, 11)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (11, N'Ист-01', 1, 12)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (12, N'Журн-01', 2, 13)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (13, N'Пед-01', 3, 14)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (14, N'Фил-01', 4, 15)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (15, N'Соц-01', 1, 16)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (16, N'Мед-01', 2, 17)
INSERT [dbo].[Groups] ([Id], [Name], [Year], [DepartmentId]) VALUES (17, N'Био-01', 3, 18)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsCurators] ON 

INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (3, 1, 3)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (4, 2, 4)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (5, 3, 5)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (6, 4, 6)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (7, 5, 7)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (8, 6, 8)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (9, 7, 9)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (10, 8, 10)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (11, 9, 11)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (12, 10, 12)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (13, 11, 13)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (14, 12, 14)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (15, 13, 15)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (16, 14, 16)
INSERT [dbo].[GroupsCurators] ([Id], [CuratorId], [GroupId]) VALUES (17, 15, 17)
SET IDENTITY_INSERT [dbo].[GroupsCurators] OFF
GO
SET IDENTITY_INSERT [dbo].[GroupsLectures] ON 

INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (4, 4, 1)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (5, 5, 2)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (6, 6, 3)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (7, 7, 4)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (8, 8, 5)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (9, 9, 6)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (10, 10, 7)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (11, 11, 8)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (12, 12, 9)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (13, 13, 10)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (14, 14, 11)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (15, 15, 12)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (16, 16, 13)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (17, 17, 14)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (18, 15, 15)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (19, 4, 3)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (20, 5, 1)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (21, 6, 6)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (22, 7, 9)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (23, 8, 11)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (24, 9, 15)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (25, 10, 13)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (26, 11, 7)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (27, 12, 8)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (28, 13, 10)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (29, 14, 11)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (30, 15, 12)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (31, 16, 13)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (32, 17, 14)
INSERT [dbo].[GroupsLectures] ([Id], [GroupId], [LectureId]) VALUES (33, 15, 15)
SET IDENTITY_INSERT [dbo].[GroupsLectures] OFF
GO
SET IDENTITY_INSERT [dbo].[Heads] ON 

INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (1, 1)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (2, 2)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (3, 3)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (4, 4)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (5, 5)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (6, 6)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (7, 7)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (8, 8)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (9, 9)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (10, 10)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (11, 11)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (12, 12)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (13, 13)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (14, 14)
INSERT [dbo].[Heads] ([Id], [TeacherId]) VALUES (15, 15)
SET IDENTITY_INSERT [dbo].[Heads] OFF
GO
SET IDENTITY_INSERT [dbo].[LectureRooms] ON 

INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (6, 1, N'Ауд 101')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (7, 1, N'Ауд 102')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (8, 2, N'Ауд 201')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (9, 2, N'Ауд 202')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (10, 3, N'Ауд 301')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (11, 3, N'Ауд 302')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (12, 4, N'Ауд 401')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (13, 4, N'Ауд 402')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (14, 5, N'Ауд 501')
INSERT [dbo].[LectureRooms] ([Id], [Building], [Name]) VALUES (15, 5, N'Ауд 502')
SET IDENTITY_INSERT [dbo].[LectureRooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Lectures] ON 

INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (1, 1, 1)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (2, 2, 2)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (3, 3, 3)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (4, 4, 4)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (5, 5, 5)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (6, 6, 6)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (7, 7, 7)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (8, 8, 8)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (9, 9, 9)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (10, 10, 10)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (11, 11, 11)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (12, 12, 12)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (13, 13, 13)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (14, 14, 14)
INSERT [dbo].[Lectures] ([Id], [SubjectId], [TeacherId]) VALUES (15, 15, 15)
SET IDENTITY_INSERT [dbo].[Lectures] OFF
GO
SET IDENTITY_INSERT [dbo].[Schedules] ON 

INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (11, 1, 1, 1, 1, 6)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (12, 2, 2, 1, 2, 7)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (13, 3, 3, 1, 3, 8)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (14, 4, 4, 1, 4, 9)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (15, 5, 5, 1, 5, 10)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (16, 6, 1, 2, 6, 11)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (17, 7, 2, 2, 7, 12)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (24, 3, 3, 2, 8, 13)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (25, 3, 3, 2, 8, 13)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (26, 1, 4, 2, 9, 14)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (27, 2, 5, 2, 10, 15)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (28, 3, 1, 1, 11, 6)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (29, 4, 2, 1, 12, 7)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (30, 5, 3, 1, 13, 8)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (31, 6, 4, 1, 14, 9)
INSERT [dbo].[Schedules] ([Id], [Class], [DayOfWeek], [Week], [LectureId], [LectureRoomId]) VALUES (32, 7, 5, 1, 15, 10)
SET IDENTITY_INSERT [dbo].[Schedules] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (5, N'Английский язык')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (15, N'Биология')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (10, N'Журналистика')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (9, N'История')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (1, N'Математика')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (14, N'Медицина')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (11, N'Педагогика')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (3, N'Право')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (4, N'Программирование')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (8, N'Психология')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (13, N'Социология')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (2, N'Физика')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (12, N'Философия')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (6, N'Химия')
INSERT [dbo].[Subjects] ([Id], [Name]) VALUES (7, N'Экономика')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (1, N'Иван', N'Иванов')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (2, N'Петр', N'Петров')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (3, N'Сергей', N'Сергеев')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (4, N'Алексей', N'Алексеев')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (5, N'Дмитрий', N'Дмитриев')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (6, N'Николай', N'Николаев')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (7, N'Олег', N'Олегов')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (8, N'Елена', N'Еленова')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (9, N'Татьяна', N'Татьянова')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (10, N'Мария', N'Маринина')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (11, N'Ирина', N'Иринова')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (12, N'Анна', N'Аннова')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (13, N'Алена', N'Аленова')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (14, N'Андрей', N'Андреев')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (15, N'Галина', N'Галинова')
INSERT [dbo].[Teachers] ([Id], [Name], [Surname]) VALUES (16, N'aqwerqwe', N'qwerqwer')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Departme__737584F6D1D0FD4D]    Script Date: 23.08.2023 20:49:05 ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Facultie__737584F61C4A37D5]    Script Date: 23.08.2023 20:49:05 ******/
ALTER TABLE [dbo].[Faculties] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Groups__737584F683F25029]    Script Date: 23.08.2023 20:49:05 ******/
ALTER TABLE [dbo].[Groups] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LectureR__737584F69A00A50D]    Script Date: 23.08.2023 20:49:05 ******/
ALTER TABLE [dbo].[LectureRooms] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Subjects__737584F6375C528F]    Script Date: 23.08.2023 20:49:05 ******/
ALTER TABLE [dbo].[Subjects] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assistants]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Curators]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Deans]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculties] ([Id])
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD FOREIGN KEY([HeadId])
REFERENCES [dbo].[Heads] ([Id])
GO
ALTER TABLE [dbo].[Faculties]  WITH CHECK ADD FOREIGN KEY([DeanId])
REFERENCES [dbo].[Deans] ([Id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[GroupsCurators]  WITH CHECK ADD FOREIGN KEY([CuratorId])
REFERENCES [dbo].[Curators] ([Id])
GO
ALTER TABLE [dbo].[GroupsCurators]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectures]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[GroupsLectures]  WITH CHECK ADD FOREIGN KEY([LectureId])
REFERENCES [dbo].[Lectures] ([Id])
GO
ALTER TABLE [dbo].[Heads]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[Lectures]  WITH CHECK ADD FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([LectureId])
REFERENCES [dbo].[Lectures] ([Id])
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD FOREIGN KEY([LectureRoomId])
REFERENCES [dbo].[LectureRooms] ([Id])
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD CHECK  (([Building]>=(1) AND [Building]<=(5)))
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD CHECK  (([Name]<>N''))
GO
ALTER TABLE [dbo].[Faculties]  WITH CHECK ADD CHECK  (([Building]>=(1) AND [Building]<=(5)))
GO
ALTER TABLE [dbo].[Faculties]  WITH CHECK ADD CHECK  (([Name]<>N''))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([Name]<>N''))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([Year]>=(1) AND [Year]<=(5)))
GO
ALTER TABLE [dbo].[LectureRooms]  WITH CHECK ADD CHECK  (([Building]>=(1) AND [Building]<=(5)))
GO
ALTER TABLE [dbo].[LectureRooms]  WITH CHECK ADD CHECK  (([Name]<>N''))
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD CHECK  (([Class]>=(1) AND [Class]<=(8)))
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD CHECK  (([DayOfWeek]>=(1) AND [DayOfWeek]<=(7)))
GO
ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD CHECK  (([Week]>=(1) AND [Week]<=(52)))
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD CHECK  (([Name]<>N''))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Name]<>N''))
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD CHECK  (([Surname]<>N''))
GO
USE [master]
GO
ALTER DATABASE [Homework7] SET  READ_WRITE 
GO
