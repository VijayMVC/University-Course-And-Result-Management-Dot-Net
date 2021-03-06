USE [master]
GO
/****** Object:  Database [UniversityCourse_ResultManagementSystemDB]    Script Date: 06-Jun-18 1:48:36 AM ******/
CREATE DATABASE [UniversityCourse_ResultManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityCourse_ResultManagementSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\UniversityCourse_ResultManagementSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityCourse_ResultManagementSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\UniversityCourse_ResultManagementSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityCourse_ResultManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityCourse_ResultManagementSystemDB]
GO
/****** Object:  Table [dbo].[AllocateClassroom]    Script Date: 06-Jun-18 1:48:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllocateClassroom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[FromTime] [varchar](10) NOT NULL,
	[ToTime] [varchar](10) NOT NULL,
	[Allocate] [bit] NULL,
	[Day] [varchar](10) NULL,
 CONSTRAINT [PK_AllocateClassroom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 06-Jun-18 1:48:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [decimal](18, 2) NOT NULL,
	[Description] [varchar](100) NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssignToTeacher]    Script Date: 06-Jun-18 1:48:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignToTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[Assign] [bit] NOT NULL,
 CONSTRAINT [PK_CourseAssignToTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseEnrollment]    Script Date: 06-Jun-18 1:48:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseEnrollment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Grade] [varchar](10) NULL,
 CONSTRAINT [PK_CourseEnrollment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 06-Jun-18 1:48:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 06-Jun-18 1:48:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [varchar](50) NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 06-Jun-18 1:48:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNo] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 06-Jun-18 1:48:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](5) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 06-Jun-18 1:48:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[ContactNo] [varchar](15) NOT NULL,
	[Address] [varchar](60) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[RegNo] [varchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentsResult]    Script Date: 06-Jun-18 1:48:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentsResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Grade] [varchar](5) NOT NULL,
 CONSTRAINT [PK_StudentsResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 06-Jun-18 1:48:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](60) NULL,
	[ContactNo] [varchar](15) NOT NULL,
	[CreditToBeTaken] [decimal](18, 2) NOT NULL,
	[RemainingCredit] [decimal](18, 2) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[rooms]    Script Date: 06-Jun-18 1:48:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[rooms] as
SELECT r.RoomNo,a.Day,a.FromTime,a.ToTime FROM AllocateClassroom a JOIN Room r ON r.Id = a.RoomId WHERE a.CourseId = 1



GO
SET IDENTITY_INSERT [dbo].[AllocateClassroom] ON 

INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (1, 1, 1, 1, N'600', N'720', 1, N'Sat')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (2, 2, 9, 2, N'600', N'720', 1, N'Sat')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (3, 1, 4, 4, N'600', N'720', 1, N'Wed')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (4, 1, 5, 3, N'600', N'135', 1, N'Sun')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (5, 3, 11, 7, N'600', N'120', 1, N'Thu')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (6, 2, 10, 11, N'720', N'740', 1, N'Mon')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (1002, 1002, 12, 9, N'75', N'135', 1, N'Sat')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [FromTime], [ToTime], [Allocate], [Day]) VALUES (1003, 1, 5, 5, N'600', N'540', 1, N'Wed')
SET IDENTITY_INSERT [dbo].[AllocateClassroom] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1, N'CSE-1101', N'Computer Fundamental', CAST(3.00 AS Decimal(18, 2)), N'Basic computation', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (2, N'CSE-1203', N'C Programming', CAST(4.00 AS Decimal(18, 2)), N'Basic language', 1, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (3, N'CSE-2304', N'Data Structure', CAST(2.00 AS Decimal(18, 2)), N'Structural Functions', 1, 3)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (4, N'CSE-2405', N'Algorithm', CAST(3.00 AS Decimal(18, 2)), N'Clauses and rules', 1, 4)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (5, N'CSE-3503', N'Java', CAST(4.00 AS Decimal(18, 2)), N'Structural Programming', 1, 5)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (6, N'CSE-3601', N'Data Communication', CAST(3.00 AS Decimal(18, 2)), N'Basic Communication', 1, 6)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (7, N'CSE-4705', N'Networking', CAST(2.00 AS Decimal(18, 2)), N'Communication System', 1, 7)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (8, N'CSE-4803', N'Artificial Intelligence', CAST(4.00 AS Decimal(18, 2)), N'Smart Devices', 1, 8)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (9, N'EEE-1203', N'Electrical and Electronics Devices', CAST(4.00 AS Decimal(18, 2)), N'Device Introduction', 2, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (10, N'EEE-2405', N'Electrical Drives', CAST(3.00 AS Decimal(18, 2)), N'Drive Introduction', 2, 4)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (11, N'ETE-3506', N'Computer Networking', CAST(3.00 AS Decimal(18, 2)), N'Network System', 3, 5)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (12, N'ME-2303', N'Mechanical Drawing', CAST(2.00 AS Decimal(18, 2)), N'Structural Drawing', 1002, 3)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignToTeacher] ON 

INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (2, 1, 3, 1, 1)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (3, 1, 2, 2, 1)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (4, 1, 4, 2, 1)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (5, 1, 8, 6, 1)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (6, 1, 5, 6, 1)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (7, 2, 9, 3, 1)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (8, 2, 10, 7, 1)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (9, 3, 11, 4, 1)
INSERT [dbo].[CourseAssignToTeacher] ([Id], [DepartmentId], [CourseId], [TeacherId], [Assign]) VALUES (10, 1, 6, 2, 1)
SET IDENTITY_INSERT [dbo].[CourseAssignToTeacher] OFF
SET IDENTITY_INSERT [dbo].[CourseEnrollment] ON 

INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (1, 1, 1, CAST(0x503E0B00 AS Date), N'A+')
INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (2, 2, 2, CAST(0x503E0B00 AS Date), N'A')
INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (3, 3, 9, CAST(0x503E0B00 AS Date), N'A+')
INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (4, 4, 11, CAST(0x4C3E0B00 AS Date), N'A-')
INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (5, 5, 5, CAST(0x4C3E0B00 AS Date), N'A')
INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (6, 6, 9, CAST(0x883E0B00 AS Date), N'')
INSERT [dbo].[CourseEnrollment] ([Id], [StudentId], [CourseId], [Date], [Grade]) VALUES (1006, 12, 12, CAST(0x4C3E0B00 AS Date), N'')
SET IDENTITY_INSERT [dbo].[CourseEnrollment] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1, N'CSE', N'Computer Science and Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2, N'EEE', N'Electrical and Electronics Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (3, N'ETE', N'Electrical and Telecommunication Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1002, N'ME', N'Mechanical Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1003, N'CE', N'Civil Engineering')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (1, N'Lecturer')
INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (2, N'Assistant Lecturer')
INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (3, N'Professor')
INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (4, N'Assistant Professor')
INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (5, N'Associate Professor')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (1, N'101')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (2, N'102')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (3, N'103')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (4, N'201')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (5, N'202')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (6, N'203')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (7, N'301')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (8, N'302')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (9, N'303')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (10, N'401')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (11, N'402')
INSERT [dbo].[Room] ([Id], [RoomNo]) VALUES (12, N'403')
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([Id], [Name]) VALUES (1, N'1st')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (2, N'2nd')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (3, N'3rd')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (4, N'4th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (5, N'5th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (6, N'6th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (7, N'7th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (1, N'Aria Kaifa', N'ak@gmail.com', N'0169853247', N'Ctg', 1, CAST(0x503E0B00 AS Date), N'CSE-2018-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (2, N'Asfia Kawnine', N'asfia@gmail.com', N'01258968578', N'Ctg', 1, CAST(0x503E0B00 AS Date), N'CSE-2018-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (3, N'Arafa Ferdous', N'arafa@gmail.com', N'01369854786', N'Ctg', 2, CAST(0x4D3E0B00 AS Date), N'EEE-2018-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (4, N'Ashraful', N'ash@gmail.com', N'01789654853', N'Ctg', 3, CAST(0x123E0B00 AS Date), N'ETE-2018-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (5, N'Nusrat', N'nusratjahan1995461995@gmail.com', N'01698532479', N'Ctg', 1, CAST(0x503E0B00 AS Date), N'CSE-2018-003')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (6, N'Fohada', N'fr@gmail.com', N'01698532471', N'Ctg', 2, CAST(0x503E0B00 AS Date), N'EEE-2018-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (7, N'Mymuna', N'my@gmail.com', N'01478523698', N'Ctg', 3, CAST(0x4C3E0B00 AS Date), N'ETE-2018-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (8, N'Ruhi', N'ru@gmail.com', N'01598742369', N'Ctg', 1, CAST(0x4B3E0B00 AS Date), N'CSE-2018-004')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (9, N'Tusha', N't@gmail.com', N'01698532475', N'Ctg', 2, CAST(0x4A3E0B00 AS Date), N'EEE-2018-003')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (10, N'Warin', N'w@gmail.com', N'01963258741', N'Ctg', 3, CAST(0x4B3E0B00 AS Date), N'ETE-2018-003')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (11, N'Hossain', N'h@gmail.com', N'01369852147', N'Ctg', 1, CAST(0x4C3E0B00 AS Date), N'CSE-2018-005')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (12, N'Meher', N'meher.iqra44@gmail.com', N'01362547896', N'Ctg', 1002, CAST(0x513E0B00 AS Date), N'ME-2018-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [DepartmentId], [Date], [RegNo]) VALUES (13, N'Ruhul', N'rh@gmail.com', N'01245986375', N'Ctg', 1003, CAST(0x4E3E0B00 AS Date), N'CE-2018-001')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Email], [Address], [ContactNo], [CreditToBeTaken], [RemainingCredit], [DesignationId], [DepartmentId]) VALUES (1, N'Jamshed Alam', N'ja@gmail.com', N'Ctg', N'01562469875', CAST(20.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), 4, 1)
INSERT [dbo].[Teacher] ([Id], [Name], [Email], [Address], [ContactNo], [CreditToBeTaken], [RemainingCredit], [DesignationId], [DepartmentId]) VALUES (2, N'Rohima Akther', N'ra@gmail.com', N'Ctg', N'01259876345', CAST(20.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[Teacher] ([Id], [Name], [Email], [Address], [ContactNo], [CreditToBeTaken], [RemainingCredit], [DesignationId], [DepartmentId]) VALUES (3, N'Lutfur Nahar', N'ln@gmail.com', N'Ctg', N'01698756214', CAST(25.00 AS Decimal(18, 2)), CAST(21.00 AS Decimal(18, 2)), 4, 2)
INSERT [dbo].[Teacher] ([Id], [Name], [Email], [Address], [ContactNo], [CreditToBeTaken], [RemainingCredit], [DesignationId], [DepartmentId]) VALUES (4, N'Sanjida Sarmin', N'ss@gmail.com', N'Ctg', N'01789654239', CAST(21.00 AS Decimal(18, 2)), CAST(18.00 AS Decimal(18, 2)), 1, 3)
INSERT [dbo].[Teacher] ([Id], [Name], [Email], [Address], [ContactNo], [CreditToBeTaken], [RemainingCredit], [DesignationId], [DepartmentId]) VALUES (5, N'Adil Mohammad', N'am@gmail.com', N'Ctg', N'01985684547', CAST(21.00 AS Decimal(18, 2)), CAST(21.00 AS Decimal(18, 2)), 5, 3)
INSERT [dbo].[Teacher] ([Id], [Name], [Email], [Address], [ContactNo], [CreditToBeTaken], [RemainingCredit], [DesignationId], [DepartmentId]) VALUES (6, N'Shahadath Hossain', N'sh@gmail.com', N'Ctg', N'01698532478', CAST(30.00 AS Decimal(18, 2)), CAST(22.00 AS Decimal(18, 2)), 3, 1)
INSERT [dbo].[Teacher] ([Id], [Name], [Email], [Address], [ContactNo], [CreditToBeTaken], [RemainingCredit], [DesignationId], [DepartmentId]) VALUES (7, N'Israt Jahan', N'ij@gmail.com', N'Ctg', N'01825697432', CAST(20.00 AS Decimal(18, 2)), CAST(17.00 AS Decimal(18, 2)), 2, 2)
INSERT [dbo].[Teacher] ([Id], [Name], [Email], [Address], [ContactNo], [CreditToBeTaken], [RemainingCredit], [DesignationId], [DepartmentId]) VALUES (8, N'Parvin', N'par@gmail.com', N'Ctg', N'01896325963', CAST(20.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), 2, 1002)
INSERT [dbo].[Teacher] ([Id], [Name], [Email], [Address], [ContactNo], [CreditToBeTaken], [RemainingCredit], [DesignationId], [DepartmentId]) VALUES (9, N'Yeasmin', N'ya@gmail.com', N'Ctg', N'01632597412', CAST(30.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), 4, 1003)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department]    Script Date: 06-Jun-18 1:48:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department] ON [dbo].[Department]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department_1]    Script Date: 06-Jun-18 1:48:37 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department_1] ON [dbo].[Department]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Course]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Department]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Room]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Course] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Course]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Course1] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Course1]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_Course]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_Department]
GO
ALTER TABLE [dbo].[CourseAssignToTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignToTeacher_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignToTeacher] CHECK CONSTRAINT [FK_CourseAssignToTeacher_Teacher]
GO
ALTER TABLE [dbo].[CourseEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_CourseEnrollment_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[CourseEnrollment] CHECK CONSTRAINT [FK_CourseEnrollment_Course]
GO
ALTER TABLE [dbo].[CourseEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_CourseEnrollment_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[CourseEnrollment] CHECK CONSTRAINT [FK_CourseEnrollment_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[StudentsResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentsResult_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[StudentsResult] CHECK CONSTRAINT [FK_StudentsResult_Course]
GO
ALTER TABLE [dbo].[StudentsResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentsResult_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[StudentsResult] CHECK CONSTRAINT [FK_StudentsResult_Student]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Designation]
GO
USE [master]
GO
ALTER DATABASE [UniversityCourse_ResultManagementSystemDB] SET  READ_WRITE 
GO
