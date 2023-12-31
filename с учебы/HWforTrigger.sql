CREATE DATABASE MCTEST1
go
USE MCTEST1
GO
/****** Object:  Table [dbo].[Disc]    Script Date: 28.08.2023 20:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disc](
	[id] [int] NOT NULL,
	[name] [varchar](max) NOT NULL,
	[singer] [int] NULL,
	[DatePublic] [date] NOT NULL,
	[style] [int] NULL,
	[publisher] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 28.08.2023 20:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[id] [int] NOT NULL,
	[name] [varchar](max) NOT NULL,
	[country] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sing]    Script Date: 28.08.2023 20:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sing](
	[id] [int] NOT NULL,
	[name] [varchar](max) NOT NULL,
	[disc] [int] NULL,
	[length] [int] NOT NULL,
	[style] [int] NULL,
	[singer] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Singers]    Script Date: 28.08.2023 20:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Singers](
	[id] [int] NOT NULL,
	[name] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Styles]    Script Date: 28.08.2023 20:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Styles](
	[id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK__Styles__3213E83F16E95C1D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (1, N'Living The Dream', 1, CAST(N'2018-09-21' AS Date), 1, 1)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (2, N'Infinity', 2, CAST(N'2009-05-29' AS Date), 1, 2)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (3, N'Departure', 2, CAST(N'2006-08-25' AS Date), 1, 2)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (4, N'All American Nightmare', 3, CAST(N'2010-01-01' AS Date), 1, 3)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (5, N'The Unseen: Instrumentals', 4, CAST(N'2000-06-13' AS Date), 2, 4)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (6, N'Free Rain', 5, CAST(N'2001-04-24' AS Date), 3, 5)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (7, N'100%', 6, CAST(N'2009-11-09' AS Date), 3, 6)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (8, N'Change Your Life', 7, CAST(N'2003-10-20' AS Date), 4, 7)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (9, N'Collide', 8, CAST(N'2004-05-25' AS Date), 1, 8)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (10, N'Mr.M', 9, CAST(N'2012-02-20' AS Date), 5, 9)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (11, N'With Oden On Our Side', 10, CAST(N'2006-09-22' AS Date), 6, 10)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (12, N'Tree Of Mystery', 11, CAST(N'2010-11-02' AS Date), 4, 11)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (13, N'Paganini Caprices', 12, CAST(N'1997-04-01' AS Date), 7, 12)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (14, N'Apocalyptic Nightmare', 13, CAST(N'1999-01-05' AS Date), 8, 13)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (15, N'Splinter', 14, CAST(N'1999-10-25' AS Date), 4, 14)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (16, N'Our Aim Is To Satisfy Red Snapper', 15, CAST(N'2000-10-09' AS Date), 9, 15)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (17, N'War Of The Wizards', 16, CAST(N'1992-03-07' AS Date), 10, 16)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (18, N'Feel The Fire', 17, CAST(N'1996-07-23' AS Date), 8, 17)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (19, N'Brazilian Girls', 18, CAST(N'2005-02-14' AS Date), 3, 18)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (20, N'Begin Again', 19, CAST(N'2019-04-12' AS Date), 11, 19)
INSERT [dbo].[Disc] ([id], [name], [singer], [DatePublic], [style], [publisher]) VALUES (21, N'Help!', 1, CAST(N'2222-12-12' AS Date), 11, 1)
GO
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (1, N'Roadrunner Records', N'Европа')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (2, N'Columbia', N'США')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (3, N'Universal Republic Records', N'Россия')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (4, N'Stones Throw Records', N'США')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (5, N'Shadow Records', N'Европа')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (6, N'Puget Sound', N'Европа')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (7, N'Silke Maurer', N'Европа')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (8, N'Lava/Ardent Records', N'США')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (9, N'City Slang', N'Европа')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (10, N'Metal Blade Records', N'Европа')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (11, N'Eighteenth Street Lounge Music', N'Европа')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (12, N'Deutsche Grammophon', N'Европа')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (13, N'Kraze', N'США')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (14, N'Clean Up Records', N'Англия')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (15, N'Warp Records', N'Англия')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (16, N'Steamhammer', N'Европа')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (17, N'Megaforce Records', N'США')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (18, N'Verve Forecast', N'Европа')
INSERT [dbo].[Publishers] ([id], [name], [country]) VALUES (19, N'Blue Note Records', N'Европа')
GO
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (1, N'The Call Of The Wild', 1, 245, 1, 1)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (2, N'Serve You Right', 1, 311, 1, 1)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (3, N'My Antidote', 1, 251, 1, 1)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (4, N'Mind Your Manners', 1, 211, 1, 1)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (5, N'Lost Inside The Girl', 1, 381, 1, 1)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (6, N'Read Between The Lines', 1, 200, 1, 1)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (7, N'Slow Grind', 1, 242, 1, 1)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (8, N'The One You Loved Is Gone', 1, 184, 1, 1)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (9, N'Driving Rain', 1, 252, 1, 1)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (10, N'Sugar Cane', 1, 215, 1, 1)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (11, N'The Great Pretender', 1, 167, 1, 1)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (12, N'Boulevard Of Broken Hearts', 1, 245, 1, 1)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (13, N'Lights', 2, 212, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (14, N'Feeling That Way', 2, 210, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (15, N'Anytime', 2, 215, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (16, N'La Do Da', 2, 253, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (17, N'Patiently', 2, 269, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (18, N'Wheel In The Sky', 2, 312, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (19, N'SomethinTo Hide', 2, 246, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (20, N'Winds Of March', 2, 305, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (21, N'Can Do', 2, 278, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (22, N'Opened The Door', 2, 211, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (23, N'Any Way You Want It', 3, 187, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (24, N'Walk Like A Lady', 3, 238, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (25, N'Someday Soon', 3, 220, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (26, N'People And Places', 3, 237, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (27, N'Precious Time', 3, 247, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (28, N'Where Were You', 3, 181, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (29, N'Im Cryin', 3, 166, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (30, N'Line Of Fire', 3, 211, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (31, N'Departure', 3, 184, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (32, N'Good Morning Girl', 3, 124, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (33, N'Stay Awhile', 3, 235, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (34, N'Homemade Love', 3, 261, 1, 2)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (35, N'2 Sides Of Me', 4, 244, 1, 3)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (36, N'All American Nightmare', 4, 243, 1, 3)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (37, N'What Ya Gonna Do', 4, 274, 1, 3)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (38, N'Hey Ho', 4, 249, 1, 3)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (39, N'The Life', 4, 210, 1, 3)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (40, N'Waking Up The Devil', 4, 251, 1, 3)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (41, N'Red Tail Lights', 4, 228, 1, 3)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (42, N'Striptease', 4, 249, 1, 3)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (43, N'Everybodys Wrong', 4, 221, 1, 3)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (44, N'Put That Record On', 4, 218, 1, 3)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (45, N'Welcome To Violence', 5, 255, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (46, N'Bad Character', 5, 146, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (47, N'Microphone Mathematics', 5, 194, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (48, N'Basic Instinct', 5, 289, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (49, N'Goodmorning Sunshine', 5, 243, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (50, N'Discipline 99 Pt.0', 5, 252, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (51, N'Discipline 99 Pt.1', 5, 216, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (52, N'Real Eyes', 5, 247, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (53, N'Low Class Conspiracy', 5, 146, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (54, N'Come On Feet', 5, 158, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (55, N'Bluffin', 5, 332, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (56, N'Boom Music', 5, 154, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (57, N'MHBs', 5, 122, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (58, N'Put A Curse On You', 5, 106, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (59, N'Astro Black', 5, 229, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (60, N'Green Power', 5, 116, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (61, N'Jazz Cats', 5, 179, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (62, N'24/7', 5, 189, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (63, N'The Unseen', 5, 290, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (64, N'Phony Game', 5, 116, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (65, N'Astro Travellin', 5, 178, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (66, N'Axe Puzzles', 5, 154, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (67, N'Blitz', 5, 183, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (68, N'Lord Suchs Otomsiauq Outro', 5, 288, 2, 4)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (69, N'Belgian Cappuccino', 6, 258, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (70, N'Untitled', 6, 187, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (71, N'Free The Rich', 6, 257, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (72, N'Work For Us', 6, 63, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (73, N'Joyride', 6, 240, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (74, N'Italian Waffle', 6, 201, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (75, N'Ate At The Zoo', 6, 214, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (76, N'Smooch', 6, 266, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (77, N'Southern Light Rollerama', 6, 199, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (78, N'Jihad (Intro)', 6, 25, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (79, N'Jihad (Continued)', 6, 356, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (80, N'Princess Latex (Intro)', 6, 9, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (81, N'Princess Latex (Intro)', 6, 191, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (82, N'The Fork', 6, 476, 3, 5)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (83, N'100%', 7, 221, 3, 6)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (84, N'Its All Over', 7, 207, 3, 6)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (85, N'Problem Child', 7, 167, 3, 6)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (86, N'You Turn Me Cold', 7, 201, 3, 6)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (87, N'Wrong Side Of The Tracks', 7, 239, 3, 6)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (88, N'Robbing Banks (Doin Time)', 7, 236, 3, 6)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (89, N'The Grinder', 7, 240, 3, 6)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (90, N'Shackled Soul', 7, 296, 3, 6)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (91, N'Southeast Soliloquy', 7, 269, 3, 6)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (92, N'Battle Of Heaven & Hell', 7, 338, 3, 6)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (93, N'Everyday', 8, 297, 4, 7)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (94, N'Morningsun', 8, 248, 4, 7)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (95, N'Sittin', 8, 395, 4, 7)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (96, N'Green Plane', 8, 353, 4, 7)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (97, N'Rockstar', 8, 247, 4, 7)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (98, N'Black Seed', 8, 365, 4, 7)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (99, N'Some Girls', 8, 485, 4, 7)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (100, N'Lucky People', 8, 415, 4, 7)
GO
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (101, N'Image', 8, 287, 4, 7)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (102, N'Stop Taking', 8, 225, 4, 7)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (103, N'Always Smiling', 8, 287, 4, 7)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (104, N'Coming Home', 8, 375, 4, 7)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (105, N'Around Me', 8, 293, 4, 7)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (106, N'Every Night', 8, 84, 4, 7)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (107, N'Forsaken', 9, 252, 1, 8)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (108, N'Savior', 9, 273, 1, 8)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (109, N'Open Wounds', 9, 194, 1, 8)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (110, N'A Little More', 9, 212, 1, 8)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (111, N'My Obsession', 9, 237, 1, 8)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (112, N'Collide', 9, 210, 1, 8)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (113, N'Fingernails', 9, 306, 1, 8)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (114, N'Imperfection', 9, 262, 1, 8)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (115, N'Under My Skin', 9, 211, 1, 8)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (116, N'Energy', 9, 182, 1, 8)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (117, N'Cycle Down', 9, 238, 1, 8)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (118, N'If Not Ill Just Die', 10, 265, 5, 9)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (119, N'2B2', 10, 339, 5, 9)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (120, N'Gone Tomorrow', 10, 417, 5, 9)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (121, N'Mr. Met', 10, 430, 5, 9)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (122, N'Gar', 10, 328, 5, 9)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (123, N'Nice Without Mercy', 10, 347, 5, 9)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (124, N'Buttons', 10, 321, 5, 9)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (125, N'The Good Life (Is Wasted)', 10, 199, 5, 9)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (126, N'Kind Of', 10, 328, 5, 9)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (127, N'Bettys Overture', 10, 201, 5, 9)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (128, N'Never My Love', 10, 182, 5, 9)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (129, N'Valhall Awaits Me', 11, 283, 6, 10)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (130, N'Runes To My Memory', 11, 272, 6, 10)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (131, N'Asator', 11, 184, 6, 10)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (132, N'Hermods Ride To Hel - Lokes Treachery Part I', 11, 280, 6, 10)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (133, N'Gods Of War Arise', 11, 362, 6, 10)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (134, N'With Oden On Our Side', 11, 274, 6, 10)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (135, N'Cry Of The Black Birds', 11, 229, 6, 10)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (136, N'Under The Northern Star', 11, 257, 6, 10)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (137, N'Prediction Of Warfare', 11, 398, 6, 10)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (138, N'Lullaby Of Leaves', 12, 78, 4, 11)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (139, N'Blind Lights', 12, 214, 4, 11)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (140, N'Evaflow', 12, 221, 4, 11)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (141, N'Dont Worry - feat. Sitali', 12, 229, 4, 11)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (142, N'High Priest', 12, 194, 4, 11)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (143, N'Follow The Storm', 12, 370, 4, 11)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (144, N'The Man Who Spoke Flames', 12, 254, 4, 11)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (145, N'Rhythm - feat. Azeem', 12, 260, 4, 11)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (146, N'Rubicon', 12, 264, 4, 11)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (147, N'Baby, Dont You Know? - feat. Rykarda Parasol', 12, 215, 4, 11)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (148, N'I Dont Want To Work Today', 12, 193, 4, 11)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (149, N'I Am A Tree', 12, 305, 4, 11)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (150, N'No. 1 In E', 13, 129, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (151, N'No. 2 In B Mino', 13, 164, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (152, N'No. 3 In E Minor', 13, 175, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (153, N'No. 4 In C Minor', 13, 384, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (154, N'No. 5 In A Minor', 13, 148, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (155, N'No. 6 In G Minor', 13, 207, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (156, N'No. 7 In A Minor', 13, 233, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (157, N'No. 8 In E Minor', 13, 159, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (158, N'No. 9 In E', 13, 152, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (159, N'No. 10 In G Minor', 13, 144, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (160, N'No. 11 In C', 13, 207, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (161, N'No. 12 In A Flat', 13, 169, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (162, N'No. 13 In B Flat', 13, 153, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (163, N'No. 14 In E Flat', 13, 122, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (164, N'No. 15 In E Minor', 13, 120, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (165, N'No. 16 In G Minor', 13, 86, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (166, N'No. 17 In E Flat', 13, 190, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (167, N'No. 18 In C', 13, 145, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (168, N'No. 19 In E Flat', 13, 167, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (169, N'No. 20 In D', 13, 219, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (170, N'No. 21 In A', 13, 174, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (171, N'No. 22 In F', 13, 170, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (172, N'No. 23 In E', 13, 234, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (173, N'No. 24 In A Minor', 13, 269, 7, 12)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (174, N'Rhetorical Dictum', 14, 315, 8, 13)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (175, N'In Memory', 14, 156, 8, 13)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (176, N'Broken Illusions', 14, 189, 8, 13)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (177, N'Retributive Stroke', 14, 362, 8, 13)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (178, N'The Ancient Ones', 14, 164, 8, 13)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (179, N'Apocalyptic Nightmare', 14, 179, 8, 13)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (180, N'The Following Century (Darkland II)', 14, 382, 8, 13)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (181, N'Half Life', 15, 293, 4, 14)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (182, N'Low Five', 15, 275, 4, 14)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (183, N'Lightning Field', 15, 251, 4, 14)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (184, N'Curl', 15, 295, 4, 14)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (185, N'Destroying Angel', 15, 266, 4, 14)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (186, N'Empathy', 15, 202, 4, 14)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (187, N'Superbug', 15, 267, 4, 14)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (188, N'Flowers And Silence', 15, 347, 4, 14)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (189, N'Cute Sushi Lunches', 15, 195, 4, 14)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (190, N'Ten To Twenty', 15, 436, 4, 14)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (191, N'Splinter', 15, 164, 4, 14)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (192, N'Wife By Two Thousand', 15, 377, 4, 14)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (193, N'Keeping Pigs Together', 16, 320, 9, 15)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (194, N'Some Kind Of Kink', 16, 327, 9, 15)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (195, N'Shellback', 16, 343, 9, 15)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (196, N'Dont Go Nowhere', 16, 290, 9, 15)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (197, N'The Rake', 16, 314, 9, 15)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (198, N'The Rough And The Quick', 16, 306, 9, 15)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (199, N'Bussing', 16, 323, 9, 15)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (200, N'I Stole Your Car', 16, 289, 9, 15)
GO
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (201, N'Alaska Street', 16, 300, 9, 15)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (202, N'Belladonna', 16, 268, 9, 15)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (203, N'Theyre Hanging Me Tonight', 16, 367, 9, 15)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (204, N'Listen To The Stories', 17, 241, 10, 16)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (205, N'Theja', 17, 269, 10, 16)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (206, N'Magic Mirror', 17, 303, 10, 16)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (207, N'Wooden Drum', 17, 248, 10, 16)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (208, N'War Of The Wizards', 17, 317, 10, 16)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (209, N'Dragons Day', 17, 217, 10, 16)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (210, N'Time', 17, 273, 10, 16)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (211, N'Fates On The Rise', 17, 263, 10, 16)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (212, N'A Promise Of Old', 17, 279, 10, 16)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (213, N'The Way To Go', 17, 232, 10, 16)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (214, N'Wanderer', 17, 196, 10, 16)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (215, N'Raise The Dead', 18, 252, 8, 17)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (216, N'Rotten To The Core', 18, 417, 8, 17)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (217, N'Theres No Tomorrow', 18, 225, 8, 17)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (218, N'Second Son', 18, 298, 8, 17)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (219, N'Hammerhead', 18, 235, 8, 17)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (220, N'Feel The Fire', 18, 440, 8, 17)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (221, N'Blood And Iron', 18, 251, 8, 17)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (222, N'Kill At Command', 18, 307, 8, 17)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (223, N'Overkill', 18, 360, 8, 17)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (224, N'Homme', 19, 321, 3, 18)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (225, N'Dont Stop', 19, 230, 3, 18)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (226, N'Lazy Lover', 19, 239, 3, 18)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (227, N'Sirenes De La Fete', 19, 284, 3, 18)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (228, N'Corner Store', 19, 253, 3, 18)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (229, N'Long', 19, 287, 3, 18)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (230, N'Pussy', 19, 303, 3, 18)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (231, N'Die Gedanken Sind Frei (Thoughts Are Free)', 19, 268, 3, 18)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (232, N'All We Have', 19, 226, 3, 18)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (233, N'Dance Till The Morning Sun', 19, 280, 3, 18)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (234, N'Me Gustas Cuando Callas', 19, 339, 3, 18)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (235, N'Ships In The Night', 19, 209, 3, 18)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (236, N'My Heart Is Full', 20, 186, 11, 19)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (237, N'Begin Again', 20, 239, 11, 19)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (238, N'It Was You', 20, 330, 11, 19)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (239, N'A Song With No Name', 20, 243, 11, 19)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (240, N'Uh Oh', 20, 217, 11, 19)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (241, N'Wintertime', 20, 228, 11, 19)
INSERT [dbo].[Sing] ([id], [name], [disc], [length], [style], [singer]) VALUES (242, N'Just A Little Bit', 20, 302, 11, 19)
GO
INSERT [dbo].[Singers] ([id], [name]) VALUES (1, N'Slash')
INSERT [dbo].[Singers] ([id], [name]) VALUES (2, N'Journey')
INSERT [dbo].[Singers] ([id], [name]) VALUES (3, N'Hinder')
INSERT [dbo].[Singers] ([id], [name]) VALUES (4, N'Quasimoto')
INSERT [dbo].[Singers] ([id], [name]) VALUES (5, N'Mujaji')
INSERT [dbo].[Singers] ([id], [name]) VALUES (6, N'Slew')
INSERT [dbo].[Singers] ([id], [name]) VALUES (7, N'Atmo. Brtschitsch')
INSERT [dbo].[Singers] ([id], [name]) VALUES (8, N'Skillet')
INSERT [dbo].[Singers] ([id], [name]) VALUES (9, N'Lambchop')
INSERT [dbo].[Singers] ([id], [name]) VALUES (10, N'Amon Amarth')
INSERT [dbo].[Singers] ([id], [name]) VALUES (11, N'Kabanjak')
INSERT [dbo].[Singers] ([id], [name]) VALUES (12, N'Дэвид Гарретт')
INSERT [dbo].[Singers] ([id], [name]) VALUES (13, N'Necronomicon')
INSERT [dbo].[Singers] ([id], [name]) VALUES (14, N'Sneaker Pimps')
INSERT [dbo].[Singers] ([id], [name]) VALUES (15, N'Red Snapper')
INSERT [dbo].[Singers] ([id], [name]) VALUES (16, N'Stormwitch')
INSERT [dbo].[Singers] ([id], [name]) VALUES (17, N'Overkill')
INSERT [dbo].[Singers] ([id], [name]) VALUES (18, N'Brazilian Girls')
INSERT [dbo].[Singers] ([id], [name]) VALUES (19, N'Нора Джонс')
GO
INSERT [dbo].[Styles] ([id], [name]) VALUES (9, N'альтернатива')
INSERT [dbo].[Styles] ([id], [name]) VALUES (5, N'инди-рок')
INSERT [dbo].[Styles] ([id], [name]) VALUES (6, N'мелодик-дэт-металл')
INSERT [dbo].[Styles] ([id], [name]) VALUES (1, N'рок')
INSERT [dbo].[Styles] ([id], [name]) VALUES (7, N'скрипка')
INSERT [dbo].[Styles] ([id], [name]) VALUES (11, N'соло')
INSERT [dbo].[Styles] ([id], [name]) VALUES (4, N'трип-хоп')
INSERT [dbo].[Styles] ([id], [name]) VALUES (8, N'трэш-металл')
INSERT [dbo].[Styles] ([id], [name]) VALUES (2, N'хип-хоп')
INSERT [dbo].[Styles] ([id], [name]) VALUES (10, N'хэви-метал')
INSERT [dbo].[Styles] ([id], [name]) VALUES (3, N'электронная музыка')
GO
ALTER TABLE [dbo].[Disc]  WITH CHECK ADD FOREIGN KEY([publisher])
REFERENCES [dbo].[Publishers] ([id])
GO
ALTER TABLE [dbo].[Disc]  WITH CHECK ADD FOREIGN KEY([singer])
REFERENCES [dbo].[Singers] ([id])
GO
ALTER TABLE [dbo].[Disc]  WITH CHECK ADD  CONSTRAINT [FK__Disc__style__5070F446] FOREIGN KEY([style])
REFERENCES [dbo].[Styles] ([id])
GO
ALTER TABLE [dbo].[Disc] CHECK CONSTRAINT [FK__Disc__style__5070F446]
GO
ALTER TABLE [dbo].[Sing]  WITH CHECK ADD FOREIGN KEY([disc])
REFERENCES [dbo].[Disc] ([id])
GO
ALTER TABLE [dbo].[Sing]  WITH CHECK ADD FOREIGN KEY([singer])
REFERENCES [dbo].[Singers] ([id])
GO
ALTER TABLE [dbo].[Sing]  WITH CHECK ADD  CONSTRAINT [FK__Sing__style__5535A963] FOREIGN KEY([style])
REFERENCES [dbo].[Styles] ([id])
GO
ALTER TABLE [dbo].[Sing] CHECK CONSTRAINT [FK__Sing__style__5535A963]
GO
