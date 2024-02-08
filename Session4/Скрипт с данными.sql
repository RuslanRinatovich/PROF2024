USE [master]
GO
/****** Object:  Database [PROF2024]    Script Date: 08.02.2024 15:37:28 ******/
CREATE DATABASE [PROF2024]
GO
USE [PROF2024]
GO
/****** Object:  Table [dbo].[DeseaseHistory]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeseaseHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VisitDate] [date] NOT NULL,
	[MedcardId] [int] NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[DoctorId] [int] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NULL,
	[Birthday] [date] NOT NULL,
	[PassportSeries] [int] NOT NULL,
	[PassportNumber] [int] NOT NULL,
	[Gender] [nvarchar](3) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nchar](100) NULL,
	[Photo] [nvarchar](100) NULL,
	[SpecializationId] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventType]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_EventType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalBed]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalBed](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](2) NOT NULL,
	[WardId] [int] NOT NULL,
	[IsFree] [bit] NULL,
 CONSTRAINT [PK_HospitalBed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitalization]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitalization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Datetime] [datetime] NULL,
	[HospitalizationReferralId] [int] NOT NULL,
	[RefusalByPatient] [bit] NULL,
	[Cancellation] [bit] NULL,
	[CancellationReason] [nvarchar](1000) NULL,
	[HospitalBedId] [int] NULL,
 CONSTRAINT [PK_Hospitalization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalizationDepartment]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalizationDepartment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_HospitalizationDepartment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalizationReferral]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalizationReferral](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[Diagnosis] [nvarchar](1000) NOT NULL,
	[Purpose] [nvarchar](1000) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Conditions] [bit] NOT NULL,
 CONSTRAINT [PK_HospitalizationReferral] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medcard]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medcard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IssueDate] [date] NOT NULL,
	[Diagnosis] [nvarchar](1000) NULL,
	[LastVisitDate] [date] NOT NULL,
	[NextVisitDate] [date] NULL,
	[QR] [nvarchar](100) NULL,
 CONSTRAINT [PK_Medcard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NULL,
	[Birthday] [date] NOT NULL,
	[PassportSeries] [int] NOT NULL,
	[PassportNumber] [int] NOT NULL,
	[Gender] [nvarchar](3) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nchar](100) NULL,
	[MedcardId] [int] NOT NULL,
	[PolicyNumber] [nvarchar](16) NOT NULL,
	[PolicyExpirationDate] [date] NOT NULL,
	[InsuranceCompany] [nvarchar](100) NOT NULL,
	[WorkPlace] [nvarchar](1000) NOT NULL,
	[Photo] [nvarchar](100) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientReception]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientReception](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TimeBegin] [time](7) NOT NULL,
	[TimeEnd] [time](7) NOT NULL,
	[PatientId] [int] NULL,
	[Status] [bit] NOT NULL,
	[TimeSheetId] [int] NOT NULL,
	[CouponNumber] [int] NOT NULL,
 CONSTRAINT [PK_PatientReception] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeseaseHistoryId] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Dosage] [nvarchar](100) NULL,
	[UsingFormat] [nvarchar](100) NULL,
 CONSTRAINT [PK_Recept] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Referral]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referral](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EventTypeId] [int] NOT NULL,
	[DeseaseHistoryId] [int] NOT NULL,
 CONSTRAINT [PK_Referral] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[AccessLevel] [int] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Code] [int] NOT NULL,
	[RoomTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialization]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Specialization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSheet]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSheet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[TimeBegin] [time](7) NOT NULL,
	[TimeEnd] [time](7) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[DurationPersonTime] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_TimeSheet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TreatmentEvent]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TreatmentEvent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[DoctorId] [int] NOT NULL,
	[EventTypeId] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Results] [nvarchar](max) NOT NULL,
	[Recommendations] [nvarchar](1000) NOT NULL,
	[PatientId] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_TreatmentEvents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ward]    Script Date: 08.02.2024 15:37:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ward](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](10) NULL,
	[DepartmentId] [int] NULL,
 CONSTRAINT [PK_Таблица1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DeseaseHistory] ON 

INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (1, CAST(N'2023-02-28' AS Date), 1001, N'Жалоб нет. Живот нормальный', 1)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (2, CAST(N'2022-10-02' AS Date), 1002, N'Жалобы есть. ', 2)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (3, CAST(N'2023-01-11' AS Date), 1003, N'Жалоб нет. Живот нормальный', 3)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (4, CAST(N'2023-04-30' AS Date), 1004, N'Жалобы есть. ', 4)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (5, CAST(N'2022-11-05' AS Date), 1005, N'Жалоб нет. Живот нормальный', 5)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (6, CAST(N'2024-12-02' AS Date), 1006, N'Жалобы есть. ', 6)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (7, CAST(N'2024-07-14' AS Date), 1007, N'Жалоб нет. Живот нормальный', 7)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (8, CAST(N'2023-03-03' AS Date), 1008, N'Жалобы есть. ', 8)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (9, CAST(N'2023-07-22' AS Date), 1009, N'Жалоб нет. Живот нормальный', 9)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (10, CAST(N'2024-12-20' AS Date), 1010, N'Жалобы есть. ', 10)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (11, CAST(N'2023-12-25' AS Date), 1011, N'Жалоб нет. Живот нормальный', 1)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (12, CAST(N'2023-05-05' AS Date), 1012, N'Жалобы есть. ', 2)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (13, CAST(N'2023-07-14' AS Date), 1013, N'Жалоб нет. Живот нормальный', 3)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (14, CAST(N'2024-10-31' AS Date), 1014, N'Жалобы есть. ', 4)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (15, CAST(N'2024-06-30' AS Date), 1015, N'Жалоб нет. Живот нормальный', 5)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (16, CAST(N'2023-10-15' AS Date), 1016, N'Жалобы есть. ', 6)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (17, CAST(N'2024-08-09' AS Date), 1017, N'Жалоб нет. Живот нормальный', 7)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (18, CAST(N'2024-01-18' AS Date), 1018, N'Жалобы есть. ', 8)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (19, CAST(N'2023-09-14' AS Date), 1019, N'Жалоб нет. Живот нормальный', 9)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (20, CAST(N'2024-04-22' AS Date), 1020, N'Жалобы есть. ', 10)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (21, CAST(N'2023-06-20' AS Date), 1021, N'Жалоб нет. Живот нормальный', 1)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (22, CAST(N'2024-10-02' AS Date), 1022, N'Жалобы есть. ', 2)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (23, CAST(N'2024-05-13' AS Date), 1023, N'Жалоб нет. Живот нормальный', 3)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (24, CAST(N'2023-11-21' AS Date), 1024, N'Жалобы есть. ', 4)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (25, CAST(N'2022-11-08' AS Date), 1025, N'Жалоб нет. Живот нормальный', 5)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (26, CAST(N'2024-04-08' AS Date), 1026, N'Жалобы есть. ', 6)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (27, CAST(N'2023-07-25' AS Date), 1027, N'Жалоб нет. Живот нормальный', 7)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (28, CAST(N'2022-11-19' AS Date), 1028, N'Жалобы есть. ', 8)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (29, CAST(N'2023-10-25' AS Date), 1029, N'Жалоб нет. Живот нормальный', 9)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (30, CAST(N'2024-04-25' AS Date), 1030, N'Жалобы есть. ', 10)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (31, CAST(N'2022-09-20' AS Date), 1031, N'Жалоб нет. Живот нормальный', 1)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (32, CAST(N'2022-09-28' AS Date), 1032, N'Жалобы есть. ', 2)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (33, CAST(N'2023-11-15' AS Date), 1033, N'Жалоб нет. Живот нормальный', 3)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (34, CAST(N'2024-12-11' AS Date), 1034, N'Жалобы есть. ', 4)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (35, CAST(N'2024-04-26' AS Date), 1035, N'Жалоб нет. Живот нормальный', 5)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (36, CAST(N'2022-11-04' AS Date), 1036, N'Жалобы есть. ', 6)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (37, CAST(N'2024-02-23' AS Date), 1037, N'Жалоб нет. Живот нормальный', 7)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (38, CAST(N'2022-09-10' AS Date), 1038, N'Жалобы есть. ', 8)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (39, CAST(N'2023-11-30' AS Date), 1039, N'Жалоб нет. Живот нормальный', 9)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (40, CAST(N'2024-07-23' AS Date), 1040, N'Жалобы есть. ', 10)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (41, CAST(N'2024-03-10' AS Date), 1041, N'Жалоб нет. Живот нормальный', 1)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (42, CAST(N'2024-12-26' AS Date), 1042, N'Жалобы есть. ', 2)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (43, CAST(N'2023-05-24' AS Date), 1043, N'Жалоб нет. Живот нормальный', 3)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (44, CAST(N'2024-06-25' AS Date), 1044, N'Жалобы есть. ', 4)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (45, CAST(N'2024-10-22' AS Date), 1045, N'Жалоб нет. Живот нормальный', 5)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (46, CAST(N'2023-06-16' AS Date), 1046, N'Жалобы есть. ', 6)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (47, CAST(N'2022-12-17' AS Date), 1047, N'Жалоб нет. Живот нормальный', 7)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (48, CAST(N'2022-11-01' AS Date), 1048, N'Жалобы есть. ', 8)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (49, CAST(N'2024-06-22' AS Date), 1049, N'Жалоб нет. Живот нормальный', 9)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (50, CAST(N'2023-09-10' AS Date), 1050, N'Жалобы есть. ', 10)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (51, CAST(N'2024-12-27' AS Date), 1051, N'Жалоб нет. Живот нормальный', 1)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (52, CAST(N'2024-07-29' AS Date), 1052, N'Жалобы есть. ', 2)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (53, CAST(N'2023-09-23' AS Date), 1053, N'Жалоб нет. Живот нормальный', 3)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (54, CAST(N'2023-04-07' AS Date), 1054, N'Жалобы есть. ', 4)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (55, CAST(N'2022-11-26' AS Date), 1055, N'Жалоб нет. Живот нормальный', 5)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (56, CAST(N'2025-01-13' AS Date), 1056, N'Жалобы есть. ', 6)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (57, CAST(N'2022-09-05' AS Date), 1057, N'Жалоб нет. Живот нормальный', 7)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (58, CAST(N'2024-05-07' AS Date), 1058, N'Жалобы есть. ', 8)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (59, CAST(N'2023-08-02' AS Date), 1059, N'Жалоб нет. Живот нормальный', 9)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (60, CAST(N'2024-09-17' AS Date), 1060, N'Жалобы есть. ', 10)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (61, CAST(N'2023-08-28' AS Date), 1061, N'Жалоб нет. Живот нормальный', 1)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (62, CAST(N'2024-02-15' AS Date), 1062, N'Жалобы есть. ', 2)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (63, CAST(N'2023-05-20' AS Date), 1063, N'Жалоб нет. Живот нормальный', 3)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (64, CAST(N'2023-04-29' AS Date), 1064, N'Жалобы есть. ', 4)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (65, CAST(N'2024-07-04' AS Date), 1065, N'Жалоб нет. Живот нормальный', 5)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (66, CAST(N'2024-08-03' AS Date), 1066, N'Жалобы есть. ', 6)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (67, CAST(N'2023-07-24' AS Date), 1067, N'Жалоб нет. Живот нормальный', 7)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (68, CAST(N'2023-07-31' AS Date), 1068, N'Жалобы есть. ', 8)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (69, CAST(N'2022-12-13' AS Date), 1069, N'Жалоб нет. Живот нормальный', 9)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (70, CAST(N'2023-03-20' AS Date), 1070, N'Жалобы есть. ', 10)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (71, CAST(N'2023-03-19' AS Date), 1071, N'Жалоб нет. Живот нормальный', 1)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (72, CAST(N'2024-05-26' AS Date), 1072, N'Жалобы есть. ', 2)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (73, CAST(N'2023-03-17' AS Date), 1073, N'Жалоб нет. Живот нормальный', 3)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (74, CAST(N'2023-08-20' AS Date), 1074, N'Жалобы есть. ', 4)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (75, CAST(N'2024-04-20' AS Date), 1075, N'Жалоб нет. Живот нормальный', 5)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (76, CAST(N'2023-03-05' AS Date), 1076, N'Жалобы есть. ', 6)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (77, CAST(N'2023-03-28' AS Date), 1077, N'Жалоб нет. Живот нормальный', 7)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (78, CAST(N'2024-03-14' AS Date), 1078, N'Жалобы есть. ', 8)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (79, CAST(N'2024-09-11' AS Date), 1079, N'Жалоб нет. Живот нормальный', 9)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (80, CAST(N'2022-10-20' AS Date), 1080, N'Жалобы есть. ', 10)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (81, CAST(N'2023-07-04' AS Date), 1081, N'Жалоб нет. Живот нормальный', 1)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (82, CAST(N'2022-11-10' AS Date), 1082, N'Жалобы есть. ', 2)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (83, CAST(N'2023-05-12' AS Date), 1083, N'Жалоб нет. Живот нормальный', 3)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (84, CAST(N'2023-11-20' AS Date), 1084, N'Жалобы есть. ', 4)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (85, CAST(N'2023-03-26' AS Date), 1085, N'Жалоб нет. Живот нормальный', 5)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (86, CAST(N'2024-09-18' AS Date), 1086, N'Жалобы есть. ', 6)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (87, CAST(N'2023-12-23' AS Date), 1087, N'Жалоб нет. Живот нормальный', 7)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (88, CAST(N'2024-07-09' AS Date), 1088, N'Жалобы есть. ', 8)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (89, CAST(N'2023-02-23' AS Date), 1089, N'Жалоб нет. Живот нормальный', 9)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (90, CAST(N'2022-10-22' AS Date), 1090, N'Жалобы есть. ', 10)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (91, CAST(N'2023-05-06' AS Date), 1091, N'Жалоб нет. Живот нормальный', 1)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (92, CAST(N'2024-05-08' AS Date), 1092, N'Жалобы есть. ', 2)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (93, CAST(N'2024-12-09' AS Date), 1093, N'Жалоб нет. Живот нормальный', 3)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (94, CAST(N'2024-07-19' AS Date), 1094, N'Жалобы есть. ', 4)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (95, CAST(N'2023-09-26' AS Date), 1095, N'Жалоб нет. Живот нормальный', 5)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (96, CAST(N'2022-11-18' AS Date), 1096, N'Жалобы есть. ', 6)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (97, CAST(N'2023-10-16' AS Date), 1097, N'Жалоб нет. Живот нормальный', 7)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (98, CAST(N'2023-08-15' AS Date), 1098, N'Жалобы есть. ', 8)
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (99, CAST(N'2024-11-05' AS Date), 1099, N'Жалоб нет. Живот нормальный', 9)
GO
INSERT [dbo].[DeseaseHistory] ([Id], [VisitDate], [MedcardId], [Description], [DoctorId]) VALUES (100, CAST(N'2024-11-08' AS Date), 1100, N'Жалобы есть. ', 10)
SET IDENTITY_INSERT [dbo].[DeseaseHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (1, N'Strickland', N'Aline', N'Lacey', CAST(N'2000-07-14' AS Date), 2203, 200901, N'F', N'P.O. Box 174, 2985 Suscipit Rd.', N'1-736-274-2523', N'aliquam.adipiscing@yahoo.couk                                                                       ', N'1.jpg', 1)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (2, N'Spears', N'Lee', N'Garrett', CAST(N'1971-10-27' AS Date), 3075, 872273, N'F', N'370 Et St.', N'1-485-623-4707', N'proin.vel@hotmail.com                                                                               ', N'2.jpg', 2)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (3, N'Pace', N'Cameran', N'Piper', CAST(N'2011-11-12' AS Date), 5445, 841550, N'F', N'2166 Cursus Avenue', N'1-365-857-4837', N'justo.faucibus@outlook.net                                                                          ', N'3.jpg', 3)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (4, N'Bryan', N'Riley', N'Blossom', CAST(N'2023-09-21' AS Date), 6701, 501054, N'F', N'Ap #929-4260 Massa. Rd.', N'1-157-608-5083', N'non@aol.edu                                                                                         ', N'4.jpg', 4)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (5, N'Perkins', N'Aphrodite', N'Daquan', CAST(N'1964-11-07' AS Date), 4491, 384368, N'F', N'4705 Justo Av.', N'1-750-355-4162', N'convallis.ligula@icloud.org                                                                         ', N'5.jpg', 14)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (6, N'Ortiz', N'Remedios', N'Xaviera', CAST(N'1962-11-01' AS Date), 9539, 672219, N'F', N'644-8512 Orci Street', N'1-687-974-2435', N'nisl.elementum@hotmail.org                                                                          ', N'6.jpg', 14)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (7, N'Lindsey', N'Claire', N'Charlotte', CAST(N'1968-03-27' AS Date), 1844, 956384, N'F', N'Ap #911-902 Morbi Av.', N'1-924-737-1671', N'urna.justo@aol.couk                                                                                 ', N'7.jpg', 7)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (8, N'Gillespie', N'Lana', N'Isabella', CAST(N'1998-04-25' AS Date), 9972, 806781, N'F', N'Ap #834-9959 Aliquam Avenue', N'1-646-426-7365', N'consectetuer.adipiscing.elit@yahoo.ca                                                               ', N'8.jpg', 8)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (9, N'Carson', N'Lael', N'Kiona', CAST(N'1993-11-28' AS Date), 9005, 641745, N'F', N'779 Ut Av.', N'1-351-113-2464', N'aliquam.arcu@hotmail.couk                                                                           ', N'9.jpg', 9)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (10, N'Dodson', N'Regan', N'Anika', CAST(N'1958-02-13' AS Date), 4341, 951730, N'F', N'Ap #730-9118 Egestas. Street', N'1-156-222-7576', N'tortor.integer.aliquam@icloud.couk                                                                  ', N'10.jpg', 10)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (11, N'Strickland', N'Aline', N'Lacey', CAST(N'2000-07-14' AS Date), 2203, 200901, N'M', N'P.O. Box 174, 2985 Suscipit Rd.', N'1-736-274-2523', N'nulla.integer.vulputate@aol.org                                                                     ', N'11.jpg', 11)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (12, N'Spears', N'Lee', N'Garrett', CAST(N'1971-10-27' AS Date), 3075, 872273, N'M', N'370 Et St.', N'1-485-623-4707', N'dictum@hotmail.net                                                                                  ', N'12.jpg', 12)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (13, N'Pace', N'Cameran', N'Piper', CAST(N'2011-11-12' AS Date), 5445, 841550, N'M', N'2166 Cursus Avenue', N'1-365-857-4837', N'egestas@hotmail.com                                                                                 ', N'13.jpg', 13)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (14, N'Bryan', N'Riley', N'Blossom', CAST(N'2023-09-21' AS Date), 6701, 501054, N'M', N'Ap #929-4260 Massa. Rd.', N'1-157-608-5083', N'diam@hotmail.com                                                                                    ', N'14.jpg', 14)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (15, N'Perkins', N'Aphrodite', N'Daquan', CAST(N'1964-11-07' AS Date), 4491, 384368, N'M', N'4705 Justo Av.', N'1-750-355-4162', N'mattis.ornare@aol.edu                                                                               ', N'15.jpg', 15)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (16, N'Ortiz', N'Remedios', N'Xaviera', CAST(N'1962-11-01' AS Date), 9539, 672219, N'M', N'644-8512 Orci Street', N'1-687-974-2435', N'quis.lectus@icloud.org                                                                              ', N'16.jpg', 6)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (17, N'Lindsey', N'Claire', N'Charlotte', CAST(N'1968-03-27' AS Date), 1844, 956384, N'M', N'Ap #911-902 Morbi Av.', N'1-924-737-1671', N'auctor.mauris@outlook.com                                                                           ', N'17.jpg', 7)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (18, N'Gillespie', N'Lana', N'Isabella', CAST(N'1998-04-25' AS Date), 9972, 806781, N'M', N'Ap #834-9959 Aliquam Avenue', N'1-646-426-7365', N'vitae@protonmail.org                                                                                ', N'18.jpg', 8)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (19, N'Carson', N'Lael', N'Kiona', CAST(N'1993-11-28' AS Date), 9005, 641745, N'M', N'779 Ut Av.', N'1-351-113-2464', N'integer.eu@yahoo.com                                                                                ', N'19.jpg', 9)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [Photo], [SpecializationId]) VALUES (20, N'Dodson', N'Regan', N'Anika', CAST(N'1958-02-13' AS Date), 4341, 951730, N'M', N'Ap #730-9118 Egestas. Street', N'1-156-222-7576', N'ac.eleifend.vitae@protonmail.com                                                                    ', N'20.jpg', 10)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[EventType] ON 

INSERT [dbo].[EventType] ([Id], [Title]) VALUES (1, N'лабораторное исследование')
INSERT [dbo].[EventType] ([Id], [Title]) VALUES (2, N'инструментальная диагностика')
INSERT [dbo].[EventType] ([Id], [Title]) VALUES (3, N'лекарственная терапия')
INSERT [dbo].[EventType] ([Id], [Title]) VALUES (4, N'физиотерапия')
INSERT [dbo].[EventType] ([Id], [Title]) VALUES (5, N'хирургическое лечение')
SET IDENTITY_INSERT [dbo].[EventType] OFF
GO
SET IDENTITY_INSERT [dbo].[HospitalBed] ON 

INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (1, N'А', 1, 1)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (2, N'Б', 1, 1)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (3, N'В', 1, 1)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (4, N'Г', 1, 1)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (5, N'Д', 1, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (6, N'А', 2, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (7, N'Б', 2, 1)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (8, N'В', 2, 1)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (9, N'Г', 2, 1)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (10, N'Д', 2, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (11, N'А', 3, 1)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (12, N'Б', 3, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (13, N'В', 3, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (14, N'Г', 3, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (15, N'Д', 3, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (16, N'Е', 3, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (17, N'А', 4, 1)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (18, N'Б', 4, 1)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (19, N'В', 4, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (20, N'Г', 4, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (21, N'А', 5, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (22, N'Б', 5, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (23, N'В', 5, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (24, N'Г', 5, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (25, N'А', 6, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (26, N'Б', 6, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (27, N'В', 6, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (28, N'Г', 6, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (29, N'А', 7, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (30, N'Б', 7, 1)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (31, N'В', 7, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (32, N'Г', 7, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (33, N'А', 8, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (34, N'Б', 8, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (35, N'В', 8, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (36, N'А', 9, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (37, N'Б', 9, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (38, N'В', 9, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (39, N'А', 10, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (40, N'Б', 10, 1)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (41, N'В', 10, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (42, N'А', 11, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (43, N'Б', 11, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (44, N'В', 11, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (45, N'Г', 11, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (46, N'А', 12, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (47, N'Б', 12, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (48, N'В', 12, 1)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (49, N'Г', 12, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (50, N'А', 13, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (51, N'Б', 13, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (52, N'В', 13, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (53, N'Г', 13, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (54, N'А', 14, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (55, N'Б', 14, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (56, N'В', 14, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (57, N'Г', 14, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (58, N'А', 15, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (59, N'Б', 15, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (60, N'В', 15, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (61, N'Г', 15, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (62, N'Д', 15, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (63, N'Е', 15, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (64, N'А', 16, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (65, N'Б', 16, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (66, N'А', 17, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (67, N'Б', 17, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (68, N'А', 18, 0)
INSERT [dbo].[HospitalBed] ([Id], [Title], [WardId], [IsFree]) VALUES (69, N'Б', 18, 0)
SET IDENTITY_INSERT [dbo].[HospitalBed] OFF
GO
SET IDENTITY_INSERT [dbo].[Hospitalization] ON 

INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (1, CAST(N'2023-12-09T22:36:00.000' AS DateTime), 1, 0, 0, N'', 1)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (2, CAST(N'2023-03-16T19:17:00.000' AS DateTime), 2, 0, 0, N'', 2)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (3, CAST(N'2024-01-08T08:00:00.000' AS DateTime), 3, 0, 0, N'', 3)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (4, CAST(N'2023-10-31T13:23:00.000' AS DateTime), 4, 0, 0, N'', 4)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (5, CAST(N'2023-10-16T10:10:00.000' AS DateTime), 5, 0, 0, N'', 5)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (6, CAST(N'2023-07-11T01:46:00.000' AS DateTime), 6, 0, 0, N'', 6)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (7, CAST(N'2024-02-06T05:29:00.000' AS DateTime), 7, 0, 0, N'', 7)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (8, CAST(N'2024-10-17T18:41:00.000' AS DateTime), 8, 0, 0, N'', 8)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (9, CAST(N'2023-09-06T03:48:00.000' AS DateTime), 9, 0, 0, N'', 9)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (10, CAST(N'2024-03-15T20:52:00.000' AS DateTime), 10, 0, 0, N'', 10)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (11, CAST(N'2024-04-02T08:38:00.000' AS DateTime), 11, 0, 0, N'', 11)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (12, CAST(N'2023-09-03T22:33:00.000' AS DateTime), 12, 0, 0, N'', 12)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (13, CAST(N'2024-06-09T11:32:00.000' AS DateTime), 13, 0, 0, N'', 13)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (14, CAST(N'2024-01-11T23:03:00.000' AS DateTime), 14, 0, 0, N'', 14)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (15, CAST(N'2023-10-31T01:23:00.000' AS DateTime), 15, 0, 0, N'', 15)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (16, CAST(N'2023-09-28T07:24:00.000' AS DateTime), 16, 0, 0, N'', 16)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (17, CAST(N'2024-06-04T14:12:00.000' AS DateTime), 17, 0, 0, N'', 17)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (18, CAST(N'2023-02-03T18:07:00.000' AS DateTime), 18, 0, 0, N'', 18)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (19, CAST(N'2024-02-16T15:20:00.000' AS DateTime), 19, 0, 0, N'', 19)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (20, CAST(N'2023-09-05T04:39:00.000' AS DateTime), 20, 0, 0, N'', 20)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (21, CAST(N'2024-11-24T06:29:00.000' AS DateTime), 21, 0, 0, N'', 21)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (22, CAST(N'2024-10-05T18:25:00.000' AS DateTime), 22, 0, 0, N'', 22)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (23, CAST(N'2024-02-01T17:03:00.000' AS DateTime), 23, 0, 0, N'', 23)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (24, CAST(N'2024-03-25T22:52:00.000' AS DateTime), 24, 0, 0, N'', 24)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (25, CAST(N'2024-02-07T23:43:00.000' AS DateTime), 25, 0, 0, N'', 25)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (26, CAST(N'2023-04-16T19:24:00.000' AS DateTime), 26, 0, 0, N'', 26)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (27, CAST(N'2024-09-18T18:34:00.000' AS DateTime), 27, 0, 0, N'', 27)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (28, CAST(N'2023-08-19T14:10:00.000' AS DateTime), 28, 0, 0, N'', 28)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (29, CAST(N'2023-11-29T10:48:00.000' AS DateTime), 29, 0, 0, N'', 29)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (30, CAST(N'2024-11-16T10:22:00.000' AS DateTime), 30, 0, 0, N'', 30)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (31, CAST(N'2023-11-26T05:16:00.000' AS DateTime), 31, 0, 0, N'', 31)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (32, CAST(N'2023-10-23T14:35:00.000' AS DateTime), 32, 0, 0, N'', 32)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (33, CAST(N'2023-03-26T20:49:00.000' AS DateTime), 33, 0, 0, N'', 33)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (34, CAST(N'2023-09-16T13:24:00.000' AS DateTime), 34, 0, 0, N'', 34)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (35, CAST(N'2023-02-15T18:35:00.000' AS DateTime), 35, 0, 0, N'', 35)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (36, CAST(N'2025-01-11T11:37:00.000' AS DateTime), 36, 0, 0, N'', 36)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (37, CAST(N'2024-11-06T23:00:00.000' AS DateTime), 37, 0, 0, N'', 37)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (38, CAST(N'2025-01-27T03:21:00.000' AS DateTime), 38, 0, 0, N'', 38)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (39, CAST(N'2023-03-01T10:58:00.000' AS DateTime), 39, 0, 0, N'', 39)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (40, CAST(N'2024-08-20T05:11:00.000' AS DateTime), 40, 0, 0, N'', 40)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (41, CAST(N'2023-10-14T04:36:00.000' AS DateTime), 41, 0, 0, N'', 41)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (42, CAST(N'2024-02-21T20:39:00.000' AS DateTime), 42, 0, 0, N'', 42)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (43, CAST(N'2023-03-17T01:42:00.000' AS DateTime), 43, 0, 0, N'', 43)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (44, CAST(N'2024-08-01T02:32:00.000' AS DateTime), 44, 0, 0, N'', 44)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (45, CAST(N'2023-02-26T17:44:00.000' AS DateTime), 45, 0, 0, N'', 45)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (46, CAST(N'2024-10-08T22:19:00.000' AS DateTime), 46, 0, 0, N'', 46)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (47, CAST(N'2023-09-27T03:23:00.000' AS DateTime), 47, 0, 0, N'', 47)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (48, CAST(N'2023-06-12T05:46:00.000' AS DateTime), 48, 0, 0, N'', 48)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (49, CAST(N'2023-10-19T22:09:00.000' AS DateTime), 49, 0, 0, N'', 49)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (50, CAST(N'2023-02-24T07:14:00.000' AS DateTime), 50, 0, 0, N'', 50)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (51, CAST(N'2024-08-06T11:38:00.000' AS DateTime), 51, 0, 0, N'', 51)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (52, CAST(N'2023-11-07T21:57:00.000' AS DateTime), 52, 0, 0, N'', 52)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (53, CAST(N'2024-01-01T04:54:00.000' AS DateTime), 53, 0, 0, N'', 53)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (54, CAST(N'2024-01-02T21:23:00.000' AS DateTime), 54, 0, 0, N'', 54)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (55, CAST(N'2023-11-01T14:15:00.000' AS DateTime), 55, 0, 0, N'', 55)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (56, CAST(N'2024-06-15T17:22:00.000' AS DateTime), 56, 0, 0, N'', 56)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (57, CAST(N'2024-12-21T22:14:00.000' AS DateTime), 57, 0, 0, N'', 57)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (58, CAST(N'2024-03-14T22:36:00.000' AS DateTime), 58, 0, 0, N'', 58)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (59, CAST(N'2023-11-11T21:16:00.000' AS DateTime), 59, 0, 0, N'', 59)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (60, CAST(N'2023-12-07T17:02:00.000' AS DateTime), 60, 0, 0, N'', 60)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (61, CAST(N'2023-11-17T02:10:00.000' AS DateTime), 61, 0, 0, N'', 61)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (62, CAST(N'2024-04-18T10:44:00.000' AS DateTime), 62, 0, 0, N'', 62)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (63, CAST(N'2025-01-16T07:01:00.000' AS DateTime), 63, 0, 0, N'', 63)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (64, CAST(N'2024-05-27T18:51:00.000' AS DateTime), 64, 0, 0, N'', 64)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (65, CAST(N'2024-10-22T04:52:00.000' AS DateTime), 65, 0, 0, N'', 65)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (66, CAST(N'2023-06-07T13:00:00.000' AS DateTime), 66, 0, 0, N'', 66)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (67, CAST(N'2023-11-18T12:45:00.000' AS DateTime), 67, 0, 0, N'', 67)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (68, CAST(N'2024-07-18T10:23:00.000' AS DateTime), 68, 0, 0, N'', 68)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (69, CAST(N'2023-10-29T23:43:00.000' AS DateTime), 69, 0, 0, N'', 69)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (70, CAST(N'2023-09-27T23:48:00.000' AS DateTime), 70, 0, 0, N'', 31)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (71, CAST(N'2023-10-29T12:17:00.000' AS DateTime), 71, 0, 0, N'', 30)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (72, CAST(N'2024-06-27T05:21:00.000' AS DateTime), 72, 0, 0, N'', 29)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (73, CAST(N'2023-09-05T08:03:00.000' AS DateTime), 73, 0, 0, N'', 28)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (74, CAST(N'2024-10-07T18:52:00.000' AS DateTime), 74, 0, 0, N'', 27)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (75, CAST(N'2024-10-09T23:49:00.000' AS DateTime), 75, 0, 0, N'', 26)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (76, CAST(N'2024-12-21T10:02:00.000' AS DateTime), 76, 0, 0, N'', 25)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (77, CAST(N'2023-07-11T22:07:00.000' AS DateTime), 77, 0, 0, N'', 24)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (78, CAST(N'2024-11-08T07:52:00.000' AS DateTime), 78, 0, 0, N'', 23)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (79, CAST(N'2023-04-10T21:51:00.000' AS DateTime), 79, 0, 0, N'', 22)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (80, CAST(N'2024-10-10T22:26:00.000' AS DateTime), 80, 0, 0, N'', 21)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (81, CAST(N'2024-12-04T03:08:00.000' AS DateTime), 81, 0, 0, N'', 20)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (82, CAST(N'2024-09-16T23:06:00.000' AS DateTime), 82, 0, 0, N'', 19)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (83, CAST(N'2023-06-28T23:27:00.000' AS DateTime), 83, 0, 0, N'', 18)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (84, CAST(N'2023-07-28T01:50:00.000' AS DateTime), 84, 0, 0, N'', 17)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (85, CAST(N'2024-06-06T16:04:00.000' AS DateTime), 85, 0, 0, N'', 16)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (86, CAST(N'2023-12-04T00:11:00.000' AS DateTime), 86, 0, 0, N'', 15)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (87, CAST(N'2024-05-11T07:37:00.000' AS DateTime), 87, 0, 0, N'', 14)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (88, CAST(N'2023-03-05T22:54:00.000' AS DateTime), 88, 0, 0, N'', 13)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (89, CAST(N'2024-09-11T05:52:00.000' AS DateTime), 89, 0, 0, N'', 12)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (90, CAST(N'2024-08-20T21:29:00.000' AS DateTime), 90, 0, 0, N'', 11)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (91, CAST(N'2024-04-29T02:16:00.000' AS DateTime), 91, 0, 0, N'', 10)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (92, CAST(N'2023-04-02T00:19:00.000' AS DateTime), 92, 0, 0, N'', 9)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (93, CAST(N'2023-02-06T17:03:00.000' AS DateTime), 93, 0, 0, N'', 8)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (94, CAST(N'2024-05-08T15:08:00.000' AS DateTime), 94, 0, 0, N'', 7)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (95, CAST(N'2023-12-02T00:26:00.000' AS DateTime), 95, 0, 0, N'', 6)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (96, CAST(N'2023-11-10T11:09:00.000' AS DateTime), 96, 0, 0, N'', 5)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (97, CAST(N'2023-04-04T19:37:00.000' AS DateTime), 97, 0, 0, N'', 4)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (98, CAST(N'2024-01-10T12:02:00.000' AS DateTime), 98, 0, 0, N'', 3)
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (99, CAST(N'2023-04-20T19:20:00.000' AS DateTime), 99, 0, 0, N'', 1)
GO
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason], [HospitalBedId]) VALUES (100, CAST(N'2023-11-05T22:07:00.000' AS DateTime), 100, 0, 0, N'', 2)
SET IDENTITY_INSERT [dbo].[Hospitalization] OFF
GO
SET IDENTITY_INSERT [dbo].[HospitalizationDepartment] ON 

INSERT [dbo].[HospitalizationDepartment] ([Id], [Title]) VALUES (1, N'Приемное отделение')
INSERT [dbo].[HospitalizationDepartment] ([Id], [Title]) VALUES (2, N'Кардиологическое отделение')
INSERT [dbo].[HospitalizationDepartment] ([Id], [Title]) VALUES (3, N'Хирургическое №1 (гнойное)')
INSERT [dbo].[HospitalizationDepartment] ([Id], [Title]) VALUES (4, N'Хирургическое №2 (чистое)')
INSERT [dbo].[HospitalizationDepartment] ([Id], [Title]) VALUES (5, N'Терапевтическое отделение')
INSERT [dbo].[HospitalizationDepartment] ([Id], [Title]) VALUES (6, N'Травматологическое отделение')
INSERT [dbo].[HospitalizationDepartment] ([Id], [Title]) VALUES (7, N'Ортопедическое отделение')
INSERT [dbo].[HospitalizationDepartment] ([Id], [Title]) VALUES (8, N'Гинекологическое отделение')
INSERT [dbo].[HospitalizationDepartment] ([Id], [Title]) VALUES (9, N'Урологическое отделение')
INSERT [dbo].[HospitalizationDepartment] ([Id], [Title]) VALUES (10, N'Анастезиолого-реанимационное отделение')
INSERT [dbo].[HospitalizationDepartment] ([Id], [Title]) VALUES (11, N'Кабинет стоматолога')
INSERT [dbo].[HospitalizationDepartment] ([Id], [Title]) VALUES (12, N'Кабинет офтальмолога')
SET IDENTITY_INSERT [dbo].[HospitalizationDepartment] OFF
GO
SET IDENTITY_INSERT [dbo].[HospitalizationReferral] ON 

INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (1, 1, N'Болит сердце', N'Обследование', 2, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (2, 2, N'Шишка на руке', N'Операция', 3, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (3, 3, N'Аппендицит', N'Операция', 4, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (4, 4, N'Отравление', N'Промыть', 5, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (5, 5, N'Перелом руки', N'Операция', 6, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (6, 6, N'Повреждениями опорно-двигательной системы', N'Восстановление', 7, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (7, 7, N'Болит зуб', N'Лечение', 11, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (8, 8, N'Коньюктивит', N'Лечение', 12, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (9, 9, N'Болит сердце', N'Обследование', 2, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (10, 10, N'Шишка на руке', N'Операция', 3, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (11, 11, N'Аппендицит', N'Операция', 4, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (12, 12, N'Отравление', N'Промыть', 5, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (13, 13, N'Перелом руки', N'Операция', 6, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (14, 14, N'Повреждениями опорно-двигательной системы', N'Восстановление', 7, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (15, 15, N'Болит зуб', N'Лечение', 11, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (16, 16, N'Коньюктивит', N'Лечение', 12, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (17, 17, N'Болит сердце', N'Обследование', 2, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (18, 18, N'Шишка на руке', N'Операция', 3, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (19, 19, N'Аппендицит', N'Операция', 4, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (20, 20, N'Отравление', N'Промыть', 5, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (21, 21, N'Перелом руки', N'Операция', 6, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (22, 22, N'Повреждениями опорно-двигательной системы', N'Восстановление', 7, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (23, 23, N'Болит зуб', N'Лечение', 11, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (24, 24, N'Коньюктивит', N'Лечение', 12, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (25, 25, N'Болит сердце', N'Обследование', 2, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (26, 26, N'Шишка на руке', N'Операция', 3, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (27, 27, N'Аппендицит', N'Операция', 4, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (28, 28, N'Отравление', N'Промыть', 5, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (29, 29, N'Перелом руки', N'Операция', 6, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (30, 30, N'Повреждениями опорно-двигательной системы', N'Восстановление', 7, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (31, 31, N'Болит зуб', N'Лечение', 11, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (32, 32, N'Коньюктивит', N'Лечение', 12, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (33, 33, N'Болит сердце', N'Обследование', 2, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (34, 34, N'Шишка на руке', N'Операция', 3, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (35, 35, N'Аппендицит', N'Операция', 4, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (36, 36, N'Отравление', N'Промыть', 5, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (37, 37, N'Перелом руки', N'Операция', 6, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (38, 38, N'Повреждениями опорно-двигательной системы', N'Восстановление', 7, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (39, 39, N'Болит зуб', N'Лечение', 11, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (40, 40, N'Коньюктивит', N'Лечение', 12, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (41, 41, N'Болит сердце', N'Обследование', 2, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (42, 42, N'Шишка на руке', N'Операция', 3, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (43, 43, N'Аппендицит', N'Операция', 4, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (44, 44, N'Отравление', N'Промыть', 5, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (45, 45, N'Перелом руки', N'Операция', 6, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (46, 46, N'Повреждениями опорно-двигательной системы', N'Восстановление', 7, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (47, 47, N'Болит зуб', N'Лечение', 11, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (48, 48, N'Коньюктивит', N'Лечение', 12, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (49, 49, N'Болит сердце', N'Обследование', 2, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (50, 50, N'Шишка на руке', N'Операция', 3, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (51, 51, N'Аппендицит', N'Операция', 4, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (52, 52, N'Отравление', N'Промыть', 5, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (53, 53, N'Перелом руки', N'Операция', 6, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (54, 54, N'Повреждениями опорно-двигательной системы', N'Восстановление', 7, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (55, 55, N'Болит зуб', N'Лечение', 11, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (56, 56, N'Коньюктивит', N'Лечение', 12, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (57, 57, N'Болит сердце', N'Обследование', 2, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (58, 58, N'Шишка на руке', N'Операция', 3, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (59, 59, N'Аппендицит', N'Операция', 4, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (60, 60, N'Отравление', N'Промыть', 5, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (61, 61, N'Перелом руки', N'Операция', 6, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (62, 62, N'Повреждениями опорно-двигательной системы', N'Восстановление', 7, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (63, 63, N'Болит зуб', N'Лечение', 11, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (64, 64, N'Коньюктивит', N'Лечение', 12, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (65, 65, N'Болит сердце', N'Обследование', 2, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (66, 66, N'Шишка на руке', N'Операция', 3, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (67, 67, N'Аппендицит', N'Операция', 4, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (68, 68, N'Отравление', N'Промыть', 5, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (69, 69, N'Перелом руки', N'Операция', 6, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (70, 70, N'Повреждениями опорно-двигательной системы', N'Восстановление', 7, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (71, 71, N'Болит зуб', N'Лечение', 11, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (72, 72, N'Коньюктивит', N'Лечение', 12, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (73, 73, N'Болит сердце', N'Обследование', 2, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (74, 74, N'Шишка на руке', N'Операция', 3, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (75, 75, N'Аппендицит', N'Операция', 4, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (76, 76, N'Отравление', N'Промыть', 5, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (77, 77, N'Перелом руки', N'Операция', 6, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (78, 78, N'Повреждениями опорно-двигательной системы', N'Восстановление', 7, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (79, 79, N'Болит зуб', N'Лечение', 11, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (80, 80, N'Коньюктивит', N'Лечение', 12, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (81, 81, N'Болит сердце', N'Обследование', 2, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (82, 82, N'Шишка на руке', N'Операция', 3, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (83, 83, N'Аппендицит', N'Операция', 4, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (84, 84, N'Отравление', N'Промыть', 5, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (85, 85, N'Перелом руки', N'Операция', 6, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (86, 86, N'Повреждениями опорно-двигательной системы', N'Восстановление', 7, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (87, 87, N'Болит зуб', N'Лечение', 11, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (88, 88, N'Коньюктивит', N'Лечение', 12, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (89, 89, N'Болит сердце', N'Обследование', 2, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (90, 90, N'Шишка на руке', N'Операция', 3, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (91, 91, N'Аппендицит', N'Операция', 4, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (92, 92, N'Отравление', N'Промыть', 5, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (93, 93, N'Перелом руки', N'Операция', 6, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (94, 94, N'Повреждениями опорно-двигательной системы', N'Восстановление', 7, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (95, 95, N'Болит зуб', N'Лечение', 11, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (96, 96, N'Коньюктивит', N'Лечение', 12, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (97, 97, N'Болит сердце', N'Обследование', 2, 0)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (98, 98, N'Шишка на руке', N'Операция', 3, 1)
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (99, 99, N'Аппендицит', N'Операция', 4, 1)
GO
INSERT [dbo].[HospitalizationReferral] ([Id], [PatientId], [Diagnosis], [Purpose], [DepartmentId], [Conditions]) VALUES (100, 100, N'Отравление', N'Промыть', 5, 0)
SET IDENTITY_INSERT [dbo].[HospitalizationReferral] OFF
GO
SET IDENTITY_INSERT [dbo].[Medcard] ON 

INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1001, CAST(N'2023-02-28' AS Date), N'Ожирение', CAST(N'2023-02-28' AS Date), NULL, N'QRcard1001.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1002, CAST(N'2022-10-02' AS Date), N'Здоров', CAST(N'2022-10-02' AS Date), NULL, N'QRcard1002.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1003, CAST(N'2023-01-11' AS Date), N'Геморрой', CAST(N'2023-01-11' AS Date), NULL, N'QRcard1003.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1004, CAST(N'2023-04-30' AS Date), N'', CAST(N'2023-04-30' AS Date), NULL, N'QRcard1004.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1005, CAST(N'2022-11-05' AS Date), N'', CAST(N'2022-11-05' AS Date), NULL, N'QRcard1005.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1006, CAST(N'2024-12-02' AS Date), N'', CAST(N'2024-12-02' AS Date), NULL, N'QRcard1006.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1007, CAST(N'2024-07-14' AS Date), N'', CAST(N'2024-07-14' AS Date), NULL, N'QRcard1007.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1008, CAST(N'2023-03-03' AS Date), N'', CAST(N'2023-03-03' AS Date), NULL, N'QRcard1008.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1009, CAST(N'2023-07-22' AS Date), N'', CAST(N'2023-07-22' AS Date), NULL, N'QRcard1009.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1010, CAST(N'2024-12-20' AS Date), N'', CAST(N'2024-12-20' AS Date), NULL, N'QRcard1010.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1011, CAST(N'2023-12-25' AS Date), N'', CAST(N'2023-12-25' AS Date), NULL, N'QRcard1011.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1012, CAST(N'2023-05-05' AS Date), N'', CAST(N'2023-05-05' AS Date), NULL, N'QRcard1012.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1013, CAST(N'2023-07-14' AS Date), N'', CAST(N'2023-07-14' AS Date), NULL, N'QRcard1013.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1014, CAST(N'2024-10-31' AS Date), N'', CAST(N'2024-10-31' AS Date), NULL, N'QRcard1014.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1015, CAST(N'2024-06-30' AS Date), N'', CAST(N'2024-06-30' AS Date), NULL, N'QRcard1015.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1016, CAST(N'2023-10-15' AS Date), N'', CAST(N'2023-10-15' AS Date), NULL, N'QRcard1016.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1017, CAST(N'2024-08-09' AS Date), N'', CAST(N'2024-08-09' AS Date), NULL, N'QRcard1017.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1018, CAST(N'2024-01-18' AS Date), N'', CAST(N'2024-01-18' AS Date), NULL, N'QRcard1018.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1019, CAST(N'2023-09-14' AS Date), N'', CAST(N'2023-09-14' AS Date), NULL, N'QRcard1019.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1020, CAST(N'2024-04-22' AS Date), N'', CAST(N'2024-04-22' AS Date), NULL, N'QRcard1020.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1021, CAST(N'2023-06-20' AS Date), N'', CAST(N'2023-06-20' AS Date), NULL, N'QRcard1021.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1022, CAST(N'2024-10-02' AS Date), N'', CAST(N'2024-10-02' AS Date), NULL, N'QRcard1022.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1023, CAST(N'2024-05-13' AS Date), N'', CAST(N'2024-05-13' AS Date), NULL, N'QRcard1023.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1024, CAST(N'2023-11-21' AS Date), N'', CAST(N'2023-11-21' AS Date), NULL, N'QRcard1024.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1025, CAST(N'2022-11-08' AS Date), N'', CAST(N'2022-11-08' AS Date), NULL, N'QRcard1025.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1026, CAST(N'2024-04-08' AS Date), N'', CAST(N'2024-04-08' AS Date), NULL, N'QRcard1026.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1027, CAST(N'2023-07-25' AS Date), N'', CAST(N'2023-07-25' AS Date), NULL, N'QRcard1027.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1028, CAST(N'2022-11-19' AS Date), N'', CAST(N'2022-11-19' AS Date), NULL, N'QRcard1028.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1029, CAST(N'2023-10-25' AS Date), N'', CAST(N'2023-10-25' AS Date), NULL, N'QRcard1029.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1030, CAST(N'2024-04-25' AS Date), N'', CAST(N'2024-04-25' AS Date), NULL, N'QRcard1030.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1031, CAST(N'2022-09-20' AS Date), N'', CAST(N'2022-09-20' AS Date), NULL, N'QRcard1031.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1032, CAST(N'2022-09-28' AS Date), N'', CAST(N'2022-09-28' AS Date), NULL, N'QRcard1032.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1033, CAST(N'2023-11-15' AS Date), N'', CAST(N'2023-11-15' AS Date), NULL, N'QRcard1033.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1034, CAST(N'2024-12-11' AS Date), N'', CAST(N'2024-12-11' AS Date), NULL, N'QRcard1034.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1035, CAST(N'2024-04-26' AS Date), N'', CAST(N'2024-04-26' AS Date), NULL, N'QRcard1035.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1036, CAST(N'2022-11-04' AS Date), N'', CAST(N'2022-11-04' AS Date), NULL, N'QRcard1036.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1037, CAST(N'2024-02-23' AS Date), N'', CAST(N'2024-02-23' AS Date), NULL, N'QRcard1037.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1038, CAST(N'2022-09-10' AS Date), N'', CAST(N'2022-09-10' AS Date), NULL, N'QRcard1038.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1039, CAST(N'2023-11-30' AS Date), N'', CAST(N'2023-11-30' AS Date), NULL, N'QRcard1039.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1040, CAST(N'2024-07-23' AS Date), N'', CAST(N'2024-07-23' AS Date), NULL, N'QRcard1040.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1041, CAST(N'2024-03-10' AS Date), N'', CAST(N'2024-03-10' AS Date), NULL, N'QRcard1041.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1042, CAST(N'2024-12-26' AS Date), N'', CAST(N'2024-12-26' AS Date), NULL, N'QRcard1042.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1043, CAST(N'2023-05-24' AS Date), N'', CAST(N'2023-05-24' AS Date), NULL, N'QRcard1043.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1044, CAST(N'2024-06-25' AS Date), N'', CAST(N'2024-06-25' AS Date), NULL, N'QRcard1044.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1045, CAST(N'2024-10-22' AS Date), N'', CAST(N'2024-10-22' AS Date), NULL, N'QRcard1045.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1046, CAST(N'2023-06-16' AS Date), N'', CAST(N'2023-06-16' AS Date), NULL, N'QRcard1046.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1047, CAST(N'2022-12-17' AS Date), N'', CAST(N'2022-12-17' AS Date), NULL, N'QRcard1047.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1048, CAST(N'2022-11-01' AS Date), N'', CAST(N'2022-11-01' AS Date), NULL, N'QRcard1048.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1049, CAST(N'2024-06-22' AS Date), N'', CAST(N'2024-06-22' AS Date), NULL, N'QRcard1049.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1050, CAST(N'2023-09-10' AS Date), N'', CAST(N'2023-09-10' AS Date), NULL, N'QRcard1050.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1051, CAST(N'2024-12-27' AS Date), N'', CAST(N'2024-12-27' AS Date), NULL, N'QRcard1051.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1052, CAST(N'2024-07-29' AS Date), N'', CAST(N'2024-07-29' AS Date), NULL, N'QRcard1052.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1053, CAST(N'2023-09-23' AS Date), N'', CAST(N'2023-09-23' AS Date), NULL, N'QRcard1053.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1054, CAST(N'2023-04-07' AS Date), N'', CAST(N'2023-04-07' AS Date), NULL, N'QRcard1054.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1055, CAST(N'2022-11-26' AS Date), N'', CAST(N'2022-11-26' AS Date), NULL, N'QRcard1055.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1056, CAST(N'2025-01-13' AS Date), N'', CAST(N'2025-01-13' AS Date), NULL, N'QRcard1056.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1057, CAST(N'2022-09-05' AS Date), N'', CAST(N'2022-09-05' AS Date), NULL, N'QRcard1057.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1058, CAST(N'2024-05-07' AS Date), N'', CAST(N'2024-05-07' AS Date), NULL, N'QRcard1058.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1059, CAST(N'2023-08-02' AS Date), N'', CAST(N'2023-08-02' AS Date), NULL, N'QRcard1059.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1060, CAST(N'2024-09-17' AS Date), N'', CAST(N'2024-09-17' AS Date), NULL, N'QRcard1060.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1061, CAST(N'2023-08-28' AS Date), N'', CAST(N'2023-08-28' AS Date), NULL, N'QRcard1061.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1062, CAST(N'2024-02-15' AS Date), N'', CAST(N'2024-02-15' AS Date), NULL, N'QRcard1062.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1063, CAST(N'2023-05-20' AS Date), N'', CAST(N'2023-05-20' AS Date), NULL, N'QRcard1063.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1064, CAST(N'2023-04-29' AS Date), N'', CAST(N'2023-04-29' AS Date), NULL, N'QRcard1064.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1065, CAST(N'2024-07-04' AS Date), N'', CAST(N'2024-07-04' AS Date), NULL, N'QRcard1065.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1066, CAST(N'2024-08-03' AS Date), N'', CAST(N'2024-08-03' AS Date), NULL, N'QRcard1066.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1067, CAST(N'2023-07-24' AS Date), N'', CAST(N'2023-07-24' AS Date), NULL, N'QRcard1067.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1068, CAST(N'2023-07-31' AS Date), N'', CAST(N'2023-07-31' AS Date), NULL, N'QRcard1068.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1069, CAST(N'2022-12-13' AS Date), N'', CAST(N'2022-12-13' AS Date), NULL, N'QRcard1069.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1070, CAST(N'2023-03-20' AS Date), N'', CAST(N'2023-03-20' AS Date), NULL, N'QRcard1070.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1071, CAST(N'2023-03-19' AS Date), N'', CAST(N'2023-03-19' AS Date), NULL, N'QRcard1071.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1072, CAST(N'2024-05-26' AS Date), N'', CAST(N'2024-05-26' AS Date), NULL, N'QRcard1072.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1073, CAST(N'2023-03-17' AS Date), N'', CAST(N'2023-03-17' AS Date), NULL, N'QRcard1073.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1074, CAST(N'2023-08-20' AS Date), N'', CAST(N'2023-08-20' AS Date), NULL, N'QRcard1074.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1075, CAST(N'2024-04-20' AS Date), N'', CAST(N'2024-04-20' AS Date), NULL, N'QRcard1075.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1076, CAST(N'2023-03-05' AS Date), N'', CAST(N'2023-03-05' AS Date), NULL, N'QRcard1076.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1077, CAST(N'2023-03-28' AS Date), N'', CAST(N'2023-03-28' AS Date), NULL, N'QRcard1077.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1078, CAST(N'2024-03-14' AS Date), N'', CAST(N'2024-03-14' AS Date), NULL, N'QRcard1078.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1079, CAST(N'2024-09-11' AS Date), N'', CAST(N'2024-09-11' AS Date), NULL, N'QRcard1079.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1080, CAST(N'2022-10-20' AS Date), N'', CAST(N'2022-10-20' AS Date), NULL, N'QRcard1080.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1081, CAST(N'2023-07-04' AS Date), N'', CAST(N'2023-07-04' AS Date), NULL, N'QRcard1081.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1082, CAST(N'2022-11-10' AS Date), N'', CAST(N'2022-11-10' AS Date), NULL, N'QRcard1082.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1083, CAST(N'2023-05-12' AS Date), N'', CAST(N'2023-05-12' AS Date), NULL, N'QRcard1083.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1084, CAST(N'2023-11-20' AS Date), N'', CAST(N'2023-11-20' AS Date), NULL, N'QRcard1084.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1085, CAST(N'2023-03-26' AS Date), N'', CAST(N'2023-03-26' AS Date), NULL, N'QRcard1085.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1086, CAST(N'2024-09-18' AS Date), N'', CAST(N'2024-09-18' AS Date), NULL, N'QRcard1086.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1087, CAST(N'2023-12-23' AS Date), N'', CAST(N'2023-12-23' AS Date), NULL, N'QRcard1087.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1088, CAST(N'2024-07-09' AS Date), N'', CAST(N'2024-07-09' AS Date), NULL, N'QRcard1088.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1089, CAST(N'2023-02-23' AS Date), N'', CAST(N'2023-02-23' AS Date), NULL, N'QRcard1089.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1090, CAST(N'2022-10-22' AS Date), N'', CAST(N'2022-10-22' AS Date), NULL, N'QRcard1090.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1091, CAST(N'2023-05-06' AS Date), N'', CAST(N'2023-05-06' AS Date), NULL, N'QRcard1091.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1092, CAST(N'2024-05-08' AS Date), N'', CAST(N'2024-05-08' AS Date), NULL, N'QRcard1092.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1093, CAST(N'2024-12-09' AS Date), N'', CAST(N'2024-12-09' AS Date), NULL, N'QRcard1093.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1094, CAST(N'2024-07-19' AS Date), N'', CAST(N'2024-07-19' AS Date), NULL, N'QRcard1094.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1095, CAST(N'2023-09-26' AS Date), N'', CAST(N'2023-09-26' AS Date), NULL, N'QRcard1095.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1096, CAST(N'2022-11-18' AS Date), N'', CAST(N'2022-11-18' AS Date), NULL, N'QRcard1096.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1097, CAST(N'2023-10-16' AS Date), N'', CAST(N'2023-10-16' AS Date), NULL, N'QRcard1097.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1098, CAST(N'2023-08-15' AS Date), N'', CAST(N'2023-08-15' AS Date), NULL, N'QRcard1098.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1099, CAST(N'2024-11-05' AS Date), N'', CAST(N'2024-11-05' AS Date), NULL, N'QRcard1099.jpg')
GO
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1100, CAST(N'2024-11-08' AS Date), N'', CAST(N'2024-11-08' AS Date), NULL, N'QRcard1100.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1101, CAST(N'2024-02-02' AS Date), NULL, CAST(N'2024-02-02' AS Date), NULL, N'QrCard103.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1102, CAST(N'2024-02-02' AS Date), NULL, CAST(N'2024-02-02' AS Date), NULL, N'QrCard104.jpg')
SET IDENTITY_INSERT [dbo].[Medcard] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (1, N'Joseph', N'Zephr', N'Brennan', CAST(N'2023-05-26' AS Date), 6716, 486932, N'F', N'P.O. Box 806, 9645 Molestie Av.', N'1-688-333-3845', N'vivamus.rhoncus.donec@protonmail.org                                                                ', 1001, N'4176256909145450', CAST(N'2024-03-10' AS Date), N'Vitae Erat Corp.', N'Nam Consequat Industries', N'1.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (2, N'Woodard', N'Wendy', N'Kathleen', CAST(N'2000-06-16' AS Date), 1208, 725761, N'F', N'Ap #578-3613 Purus. Ave', N'1-686-781-5281', N'elit@aol.net                                                                                        ', 1002, N'475159839881889', CAST(N'2023-05-23' AS Date), N'Sed Pede LLP', N'Mattis Ornare Corp.', N'2.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (3, N'Miranda', N'Hanae', N'Vernon', CAST(N'2016-05-31' AS Date), 9671, 512198, N'F', N'Ap #917-4658 Magna. Rd.', N'1-459-266-5376', N'ac.urna.ut@google.couk                                                                              ', 1003, N'4757435350968080', CAST(N'2024-02-08' AS Date), N'Scelerisque Dui Foundation', N'Neque Pellentesque Corp.', N'3.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (4, N'Decker', N'Uma', N'Orli', CAST(N'1968-12-04' AS Date), 6350, 976100, N'F', N'P.O. Box 218, 8684 Suspendisse Rd.', N'1-586-356-8986', N'auctor.quis@icloud.ca                                                                               ', 1004, N'8184785391001540', CAST(N'2024-12-03' AS Date), N'Enim Mi Incorporated', N'Euismod Industries', N'4.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (5, N'Shaw', N'Brynn', N'Raja', CAST(N'2006-10-03' AS Date), 7837, 350345, N'F', N'238-9932 Natoque Street', N'1-882-277-5092', N'pede.suspendisse.dui@aol.couk                                                                       ', 1005, N'6707172911167840', CAST(N'2023-06-07' AS Date), N'Sed Neque Sed Company', N'Consectetuer Adipiscing Associates', N'5.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (6, N'Stanley', N'Jenette', N'Lisandra', CAST(N'2017-11-23' AS Date), 7871, 376487, N'F', N'Ap #893-5856 Risus St.', N'1-265-412-5870', N'id.risus@aol.com                                                                                    ', 1006, N'1839826778502810', CAST(N'2024-05-23' AS Date), N'Sem Mollis Industries', N'Vitae Risus Duis Inc.', N'6.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (7, N'Boyd', N'Geraldine', N'Christian', CAST(N'2009-12-31' AS Date), 3536, 659283, N'F', N'781-3934 Tristique Ave', N'1-925-226-9711', N'adipiscing@icloud.ca                                                                                ', 1007, N'2418624765439240', CAST(N'2023-07-31' AS Date), N'Ultricies Dignissim Institute', N'Nostra Corp.', N'7.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (8, N'Benson', N'Julie', N'Sylvia', CAST(N'2011-11-25' AS Date), 1727, 626059, N'F', N'P.O. Box 154, 859 Gravida. St.', N'1-663-131-5774', N'nunc@protonmail.net                                                                                 ', 1008, N'9445251245327340', CAST(N'2023-06-02' AS Date), N'Nulla Facilisis Suspendisse Corp.', N'Aenean Gravida Associates', N'8.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (9, N'Estrada', N'Kim', N'Aaron', CAST(N'1991-03-20' AS Date), 2170, 574896, N'F', N'501-7532 Ornare. St.', N'1-823-256-4625', N'sollicitudin@yahoo.edu                                                                              ', 1009, N'4270477300805370', CAST(N'2023-04-18' AS Date), N'Maecenas Libero Est Associates', N'Dui Nec Associates', N'9.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (10, N'Ball', N'Dacey', N'Abbot', CAST(N'1979-02-24' AS Date), 8021, 456909, N'F', N'Ap #758-9170 Dui Av.', N'1-864-545-9746', N'ac.turpis@protonmail.org                                                                            ', 1010, N'3939756474627640', CAST(N'2024-01-07' AS Date), N'Ut Pharetra Ltd', N'Erat Volutpat PC', N'10.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (11, N'Branch', N'Lois', N'Melinda', CAST(N'1979-10-16' AS Date), 4666, 978450, N'F', N'6086 Nec Avenue', N'1-897-711-6571', N'turpis.aliquam@icloud.net                                                                           ', 1011, N'618295665910200', CAST(N'2023-04-22' AS Date), N'Dis Industries', N'Ac PC', N'11.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (12, N'Gonzalez', N'Zelda', N'Yuri', CAST(N'2003-06-12' AS Date), 1777, 864284, N'F', N'3269 Sollicitudin Road', N'1-412-638-8563', N'aliquet.magna@outlook.net                                                                           ', 1012, N'4838823227477620', CAST(N'2024-05-22' AS Date), N'Ut Cursus Inc.', N'Nunc Ut Erat Foundation', N'12.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (13, N'Klein', N'Pearl', N'Tarik', CAST(N'2003-08-19' AS Date), 1705, 317839, N'F', N'257-869 Mattis. Road', N'1-615-347-0698', N'et@hotmail.net                                                                                      ', 1013, N'6157297183277170', CAST(N'2024-09-12' AS Date), N'Risus Donec Incorporated', N'Mauris Sagittis Placerat Institute', N'13.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (14, N'Stone', N'Chantale', N'Kane', CAST(N'1958-10-15' AS Date), 7182, 242143, N'F', N'P.O. Box 498, 8503 Convallis Rd.', N'1-583-156-5131', N'tincidunt@hotmail.com                                                                               ', 1014, N'3287678512438480', CAST(N'2024-03-11' AS Date), N'A Malesuada Incorporated', N'Mi Lacinia Mattis Inc.', N'14.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (15, N'Burgess', N'Ivy', N'Evangeline', CAST(N'1997-03-19' AS Date), 9458, 700189, N'F', N'407-8548 Ullamcorper, Avenue', N'1-502-817-4684', N'ut.cursus@hotmail.net                                                                               ', 1015, N'2149709021846860', CAST(N'2024-11-06' AS Date), N'Convallis Inc.', N'Ullamcorper Viverra Maecenas Corp.', N'15.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (16, N'Solis', N'Karina', N'Armand', CAST(N'1976-07-23' AS Date), 8999, 866448, N'F', N'P.O. Box 585, 5990 Lectus, St.', N'1-662-201-6049', N'pulvinar@outlook.edu                                                                                ', 1016, N'2238990947184920', CAST(N'2024-05-19' AS Date), N'Tincidunt Orci Quis Industries', N'Magna Et LLP', N'16.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (17, N'Casey', N'Hanna', N'Harper', CAST(N'1955-11-17' AS Date), 9816, 497764, N'F', N'Ap #778-4390 Ipsum. St.', N'1-425-337-5877', N'magna.praesent@hotmail.couk                                                                         ', 1017, N'8684026042094160', CAST(N'2024-01-29' AS Date), N'Ornare Egestas Ltd', N'Pellentesque Sed Inc.', N'17.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (18, N'Weber', N'Keelie', N'Dara', CAST(N'1981-07-22' AS Date), 5265, 833678, N'F', N'Ap #510-6038 Justo Street', N'1-469-552-7388', N'ipsum@google.couk                                                                                   ', 1018, N'1188493505623950', CAST(N'2023-03-05' AS Date), N'Gravida Sit Amet LLP', N'Neque Nullam Industries', N'18.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (19, N'Thomas', N'Yael', N'Judith', CAST(N'1987-01-21' AS Date), 9935, 301830, N'F', N'411-1445 Velit Road', N'1-576-466-1773', N'ac.mattis@outlook.com                                                                               ', 1019, N'3391579360536390', CAST(N'2023-09-18' AS Date), N'Et Lacinia LLP', N'Suspendisse Corporation', N'19.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (20, N'Chan', N'Basia', N'Rosalyn', CAST(N'1987-03-03' AS Date), 6542, 570973, N'F', N'P.O. Box 789, 271 Proin Av.', N'1-821-860-6337', N'vel.mauris@outlook.com                                                                              ', 1020, N'4482539577608390', CAST(N'2023-12-12' AS Date), N'Auctor Odio Incorporated', N'Ligula Consectetuer Rhoncus Limited', N'20.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (21, N'Livingston', N'Ingrid', N'Darryl', CAST(N'1991-06-10' AS Date), 5976, 900875, N'F', N'474-8385 Odio Avenue', N'1-648-841-4815', N'eleifend.nec.malesuada@hotmail.edu                                                                  ', 1021, N'2087892711427880', CAST(N'2024-01-13' AS Date), N'Per Inceptos Company', N'Eleifend Non Ltd', N'21.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (22, N'Branch', N'Noelle', N'Alexa', CAST(N'1991-10-13' AS Date), 5933, 272569, N'F', N'Ap #769-3998 Libero. St.', N'1-677-585-3588', N'et@yahoo.net                                                                                        ', 1022, N'1706593288474060', CAST(N'2023-11-17' AS Date), N'Imperdiet Non Foundation', N'Mi Tempor Foundation', N'22.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (23, N'Harper', N'Aiko', N'Austin', CAST(N'1999-05-03' AS Date), 2760, 260707, N'F', N'930-8334 Congue. Street', N'1-276-340-0947', N'ante.iaculis@hotmail.net                                                                            ', 1023, N'4377512571288180', CAST(N'2023-03-15' AS Date), N'Parturient Montes Industries', N'Ultrices Iaculis Corp.', N'23.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (24, N'Burns', N'Lara', N'Raphael', CAST(N'1964-02-01' AS Date), 7591, 100577, N'F', N'P.O. Box 375, 7265 Est Rd.', N'1-111-784-8725', N'scelerisque.neque@icloud.com                                                                        ', 1024, N'8495222186992690', CAST(N'2023-02-19' AS Date), N'Sed Eget Industries', N'Ornare Libero At Limited', N'24.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (25, N'Snider', N'Ocean', N'Joan', CAST(N'2002-01-03' AS Date), 5733, 862483, N'F', N'Ap #521-8948 Nunc Av.', N'1-615-460-2248', N'ullamcorper.magna@icloud.net                                                                        ', 1025, N'3494279655000580', CAST(N'2024-06-23' AS Date), N'Enim Sed Foundation', N'Ultrices Sit Limited', N'25.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (26, N'Ortiz', N'Sydnee', N'Macey', CAST(N'2004-03-25' AS Date), 5535, 638345, N'F', N'Ap #582-4209 Metus Rd.', N'1-483-495-9765', N'non.leo.vivamus@aol.net                                                                             ', 1026, N'1751076156590440', CAST(N'2023-05-22' AS Date), N'Odio Sagittis Industries', N'Nulla Facilisi Sed Industries', N'26.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (27, N'Lynn', N'Aretha', N'Alexis', CAST(N'1998-04-02' AS Date), 1390, 302241, N'F', N'958-1738 Libero St.', N'1-476-818-1352', N'pharetra.felis@google.edu                                                                           ', 1027, N'2652908391352560', CAST(N'2024-05-23' AS Date), N'Semper Dui Lectus Associates', N'Libero Nec Ligula PC', N'27.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (28, N'Hutchinson', N'Petra', N'Xyla', CAST(N'2015-07-10' AS Date), 8403, 494457, N'F', N'4186 Auctor Rd.', N'1-675-703-0657', N'feugiat.tellus.lorem@icloud.org                                                                     ', 1028, N'6424581699833010', CAST(N'2024-05-09' AS Date), N'Eu Eros Nam PC', N'Commodo Ipsum Suspendisse PC', N'28.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (29, N'Todd', N'Georgia', N'Amity', CAST(N'2016-12-15' AS Date), 6402, 538308, N'F', N'773-6013 Sollicitudin Avenue', N'1-647-686-5164', N'nunc.laoreet@protonmail.net                                                                         ', 1029, N'7010159825180900', CAST(N'2023-02-13' AS Date), N'Velit Cras Limited', N'Risus Donec LLP', N'29.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (30, N'Roberts', N'Pamela', N'Anastasia', CAST(N'1983-05-06' AS Date), 9348, 398635, N'F', N'Ap #114-3887 Natoque St.', N'1-757-180-9635', N'mollis@yahoo.edu                                                                                    ', 1030, N'1488684281202920', CAST(N'2024-06-20' AS Date), N'Phasellus Elit Pede Foundation', N'Pede Cras Corp.', N'30.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (31, N'Rivers', N'Astra', N'Demetria', CAST(N'1964-03-24' AS Date), 3394, 804427, N'F', N'3543 Urna. Av.', N'1-189-582-1227', N'egestas.urna@outlook.ca                                                                             ', 1031, N'2771077059084940', CAST(N'2023-11-26' AS Date), N'Elit Sed Institute', N'Scelerisque Industries', N'31.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (32, N'Baird', N'Ivory', N'Declan', CAST(N'2015-04-11' AS Date), 6820, 920471, N'F', N'944-217 In, Street', N'1-314-442-1587', N'et@hotmail.org                                                                                      ', 1032, N'9158898108784340', CAST(N'2023-02-23' AS Date), N'Ac Turpis Egestas Corporation', N'Semper Nam Tempor LLC', N'32.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (33, N'Mullins', N'Briar', N'Charde', CAST(N'1968-01-06' AS Date), 7748, 486616, N'F', N'Ap #916-5366 Purus. St.', N'1-384-371-8842', N'lobortis.quam.a@protonmail.couk                                                                     ', 1033, N'5519502346664090', CAST(N'2023-03-15' AS Date), N'Malesuada Fames Company', N'In Faucibus Inc.', N'33.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (34, N'Franks', N'Anne', N'Ulysses', CAST(N'1954-09-30' AS Date), 9489, 950259, N'F', N'P.O. Box 722, 3222 Rutrum. Rd.', N'1-753-357-7593', N'risus.nunc@aol.org                                                                                  ', 1034, N'2591915703505750', CAST(N'2024-11-25' AS Date), N'Sagittis LLC', N'Pretium Neque Morbi Industries', N'34.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (35, N'Blackwell', N'Brielle', N'Brendan', CAST(N'1985-06-02' AS Date), 6444, 946577, N'F', N'P.O. Box 217, 8221 Dignissim St.', N'1-592-832-3413', N'tortor@icloud.edu                                                                                   ', 1035, N'3905662813147350', CAST(N'2024-09-13' AS Date), N'Sociis Natoque Corp.', N'Urna Nec LLC', N'35.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (36, N'Gonzalez', N'Imelda', N'Priscilla', CAST(N'1994-01-08' AS Date), 3058, 592145, N'F', N'588-5928 Nulla Street', N'1-608-321-1765', N'elit.sed.consequat@yahoo.couk                                                                       ', 1036, N'5511271663490360', CAST(N'2023-08-27' AS Date), N'Nulla Vulputate Incorporated', N'Viverra Corporation', N'36.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (37, N'Rosario', N'Noel', N'Charles', CAST(N'1998-02-03' AS Date), 9572, 579310, N'F', N'Ap #302-9555 Vitae Rd.', N'1-578-446-1729', N'rhoncus.nullam.velit@aol.couk                                                                       ', 1037, N'9713955243718340', CAST(N'2024-12-02' AS Date), N'Urna Associates', N'Vitae Diam Incorporated', N'37.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (38, N'Carson', N'Chloe', N'Shellie', CAST(N'1983-07-31' AS Date), 7728, 697343, N'F', N'824-2419 Luctus Avenue', N'1-492-205-4538', N'a.dui@hotmail.net                                                                                   ', 1038, N'2178520209958980', CAST(N'2024-04-07' AS Date), N'Ac Foundation', N'Sed Ltd', N'38.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (39, N'Robinson', N'Natalie', N'Brenden', CAST(N'2015-02-16' AS Date), 2037, 527023, N'F', N'P.O. Box 271, 7871 Rhoncus. St.', N'1-811-785-8106', N'dolor.fusce@yahoo.com                                                                               ', 1039, N'7968263958341460', CAST(N'2024-11-12' AS Date), N'Nisl Elementum Institute', N'Ullamcorper Duis Incorporated', N'39.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (40, N'Forbes', N'Clementine', N'Malcolm', CAST(N'2016-12-22' AS Date), 6245, 811763, N'F', N'976-7889 Cras Rd.', N'1-357-237-1931', N'sapien.molestie@yahoo.org                                                                           ', 1040, N'3713423393326950', CAST(N'2024-05-30' AS Date), N'In LLP', N'Aenean Massa Ltd', N'40.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (41, N'Santana', N'Hedy', N'Demetrius', CAST(N'2008-10-07' AS Date), 2707, 394751, N'F', N'543-9088 Ac Rd.', N'1-512-697-3374', N'tempus@outlook.couk                                                                                 ', 1041, N'157060586866819', CAST(N'2025-01-22' AS Date), N'Mi Eleifend Associates', N'Auctor Ltd', N'41.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (42, N'Bridges', N'Zelenia', N'James', CAST(N'1994-11-29' AS Date), 2627, 733211, N'F', N'Ap #613-6682 Eget, Avenue', N'1-223-648-0452', N'aenean.eget.metus@outlook.edu                                                                       ', 1042, N'1169577470671910', CAST(N'2023-12-08' AS Date), N'Nullam Incorporated', N'Feugiat Non Institute', N'42.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (43, N'Logan', N'Amy', N'Todd', CAST(N'1955-04-08' AS Date), 9778, 263689, N'F', N'Ap #774-3011 Ut, Rd.', N'1-345-522-7116', N'aliquet.vel.vulputate@outlook.edu                                                                   ', 1043, N'9349161122378080', CAST(N'2023-11-21' AS Date), N'Pellentesque Eget Dictum Institute', N'Dapibus Quam Corp.', N'43.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (44, N'Thompson', N'Katell', N'Audra', CAST(N'2005-01-15' AS Date), 5421, 912252, N'F', N'420-9789 Egestas St.', N'1-925-628-2108', N'mi.fringilla@outlook.org                                                                            ', 1044, N'1251270177678650', CAST(N'2024-07-25' AS Date), N'Montes Nascetur Inc.', N'Semper Foundation', N'44.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (45, N'Davidson', N'Cailin', N'Shelley', CAST(N'1995-04-08' AS Date), 7070, 122187, N'F', N'328-8082 Odio St.', N'1-643-687-1176', N'phasellus.nulla@aol.couk                                                                            ', 1045, N'5315907109071200', CAST(N'2023-05-25' AS Date), N'Sed Associates', N'Sed Dictum Inc.', N'45.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (46, N'Nichols', N'Gretchen', N'Ezra', CAST(N'2006-05-19' AS Date), 5461, 818683, N'F', N'P.O. Box 373, 8063 Odio. Rd.', N'1-932-175-9848', N'et.risus.quisque@yahoo.ca                                                                           ', 1046, N'9114923374865200', CAST(N'2024-08-01' AS Date), N'Quisque Libero Incorporated', N'Mauris Nulla Institute', N'46.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (47, N'Coffey', N'Danielle', N'Jasmine', CAST(N'2021-09-04' AS Date), 9638, 546041, N'F', N'806-7167 Neque Road', N'1-197-286-3151', N'fusce.dolor@outlook.couk                                                                            ', 1047, N'6442968992260730', CAST(N'2023-03-17' AS Date), N'Magna Duis Inc.', N'Convallis Industries', N'47.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (48, N'Gross', N'Quintessa', N'Murphy', CAST(N'1981-05-31' AS Date), 7028, 792734, N'F', N'P.O. Box 622, 3631 Purus, Street', N'1-652-463-7044', N'vitae.posuere@google.edu                                                                            ', 1048, N'4904018712933090', CAST(N'2023-03-25' AS Date), N'Consectetuer Euismod LLC', N'Morbi Limited', N'48.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (49, N'Shelton', N'Leslie', N'Carl', CAST(N'1956-06-28' AS Date), 7329, 881353, N'F', N'P.O. Box 506, 3955 Tellus St.', N'1-829-132-3935', N'posuere@protonmail.ca                                                                               ', 1049, N'9486683728117800', CAST(N'2023-05-03' AS Date), N'Integer LLC', N'Placerat Orci Corp.', N'49.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (50, N'Parrish', N'Cassady', N'Maya', CAST(N'2006-09-11' AS Date), 1148, 991951, N'F', N'486 Malesuada Road', N'1-975-776-2382', N'fusce.dolor.quam@hotmail.ca                                                                         ', 1050, N'7124126618656470', CAST(N'2023-07-29' AS Date), N'Ut Dolor Foundation', N'Metus In Nec Corp.', N'50.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (51, N'Hurley', N'Merrill', N'Curran', CAST(N'1975-02-26' AS Date), 4827, 852986, N'M', N'8816 Tellus. Rd.', N'1-546-627-9444', N'sapien@google.ca                                                                                    ', 1051, N'4423871366663350', CAST(N'2023-05-28' AS Date), N'Molestie Sodales Institute', N'Feugiat Placerat Velit LLP', N'51.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (52, N'Cooley', N'Logan', N'Cain', CAST(N'1996-10-31' AS Date), 4892, 984422, N'M', N'108-2649 A Road', N'1-444-287-3947', N'magna.ut@protonmail.ca                                                                              ', 1052, N'9606886345277240', CAST(N'2023-02-04' AS Date), N'Aliquam Fringilla Associates', N'Eu Tellus LLP', N'52.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (53, N'Burke', N'Cullen', N'Maris', CAST(N'1955-11-11' AS Date), 4908, 359865, N'M', N'584-7576 Et St.', N'1-221-747-0384', N'commodo.hendrerit.donec@google.com                                                                  ', 1053, N'7431994904057900', CAST(N'2025-01-03' AS Date), N'Mi Ac Mattis Company', N'Fringilla LLP', N'53.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (54, N'Hudson', N'Drew', N'Wyoming', CAST(N'2010-05-17' AS Date), 6793, 604764, N'M', N'P.O. Box 537, 1925 Nulla. St.', N'1-637-706-2643', N'mauris@hotmail.ca                                                                                   ', 1054, N'372513713093622', CAST(N'2024-09-14' AS Date), N'Est Arcu LLP', N'Metus Facilisis Lorem LLP', N'54.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (55, N'Singleton', N'Alfonso', N'Tate', CAST(N'1990-09-13' AS Date), 9849, 814533, N'M', N'194-7183 Tincidunt Road', N'1-648-531-8886', N'posuere.cubilia.curae@icloud.edu                                                                    ', 1055, N'693708225472895', CAST(N'2023-03-05' AS Date), N'Tempus Non Lacinia Incorporated', N'Malesuada Incorporated', N'55.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (56, N'Sykes', N'Nolan', N'Zephr', CAST(N'2008-03-11' AS Date), 3678, 451880, N'M', N'382-8101 Quisque St.', N'1-763-719-3268', N'senectus.et.netus@outlook.com                                                                       ', 1056, N'697762003025652', CAST(N'2023-02-18' AS Date), N'Lectus Quis Incorporated', N'Sapien Imperdiet Ornare Company', N'56.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (57, N'Evans', N'Harding', N'Todd', CAST(N'2018-05-07' AS Date), 2441, 925329, N'M', N'P.O. Box 491, 1781 Nec Av.', N'1-188-586-6604', N'eu.metus@protonmail.org                                                                             ', 1057, N'426772847604391', CAST(N'2023-06-12' AS Date), N'Lorem PC', N'Hendrerit Donec Industries', N'57.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (58, N'Lloyd', N'Ezra', N'Ivan', CAST(N'1986-07-10' AS Date), 9638, 386695, N'M', N'560-326 Eu, Av.', N'1-804-233-1187', N'taciti.sociosqu@google.edu                                                                          ', 1058, N'4347551954650650', CAST(N'2023-12-13' AS Date), N'Dolor Elit Corporation', N'Augue Sed Company', N'58.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (59, N'Deleon', N'Erasmus', N'Timon', CAST(N'2015-04-29' AS Date), 3674, 824906, N'M', N'692-9992 Sem Avenue', N'1-486-389-6115', N'quisque.ornare@hotmail.couk                                                                         ', 1059, N'6444349750961300', CAST(N'2023-09-09' AS Date), N'Sed PC', N'Vestibulum Accumsan Consulting', N'59.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (60, N'Joyner', N'Merritt', N'Colleen', CAST(N'2006-11-06' AS Date), 7045, 143349, N'M', N'518-1920 Eu, St.', N'1-613-312-8608', N'ut.odio@protonmail.net                                                                              ', 1060, N'7855910110213850', CAST(N'2024-09-08' AS Date), N'Non Lobortis Quis Institute', N'Nisl Sem Institute', N'60.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (61, N'Steele', N'Russell', N'Hoyt', CAST(N'1974-10-09' AS Date), 8947, 767637, N'M', N'983-6778 Cursus St.', N'1-337-587-4852', N'lacinia.sed@outlook.edu                                                                             ', 1061, N'9129901356194530', CAST(N'2024-04-03' AS Date), N'Gravida Sagittis Limited', N'Pede Sagittis Foundation', N'61.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (62, N'Sanchez', N'Linus', N'Amery', CAST(N'1981-12-01' AS Date), 5402, 234821, N'M', N'Ap #748-6219 Dis Ave', N'1-432-797-6037', N'tellus.sem@hotmail.com                                                                              ', 1062, N'5602705018848190', CAST(N'2023-04-26' AS Date), N'Molestie In Tempus PC', N'Pellentesque Ultricies Institute', N'62.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (63, N'Gentry', N'Elvis', N'Edan', CAST(N'2000-01-29' AS Date), 3338, 785816, N'M', N'Ap #141-7224 Metus. Av.', N'1-222-417-6543', N'nunc.commodo@protonmail.com                                                                         ', 1063, N'7000780833512480', CAST(N'2025-01-13' AS Date), N'Montes Nascetur Ridiculus Corporation', N'Fermentum Convallis Ligula Consulting', N'63.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (64, N'Gilliam', N'Davis', N'Britanni', CAST(N'2024-07-27' AS Date), 5414, 926717, N'M', N'P.O. Box 682, 3291 Mauris Av.', N'1-363-535-6074', N'velit.egestas@google.couk                                                                           ', 1064, N'3537337956379130', CAST(N'2023-04-30' AS Date), N'Facilisis Company', N'Auctor Ltd', N'64.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (65, N'Gay', N'Ezra', N'Tamara', CAST(N'2000-04-20' AS Date), 6414, 174708, N'M', N'675-3938 Tincidunt Rd.', N'1-583-229-0880', N'nibh.dolor@google.org                                                                               ', 1065, N'485150922435524', CAST(N'2024-10-03' AS Date), N'Integer Company', N'Diam Dictum PC', N'65.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (66, N'Villarreal', N'Chester', N'Cally', CAST(N'1999-06-17' AS Date), 9530, 436084, N'M', N'504-5594 Sed St.', N'1-671-514-8459', N'ac.urna@yahoo.edu                                                                                   ', 1066, N'6393036949637580', CAST(N'2023-12-13' AS Date), N'Lobortis Quam Limited', N'Nulla Dignissim Maecenas LLP', N'66.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (67, N'Harrell', N'Phelan', N'Margaret', CAST(N'1993-11-01' AS Date), 8046, 930276, N'M', N'355-1764 Fusce Street', N'1-143-637-5531', N'enim.etiam.imperdiet@yahoo.edu                                                                      ', 1067, N'8396287857072880', CAST(N'2024-02-25' AS Date), N'Vel Inc.', N'Amet Foundation', N'67.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (68, N'Galloway', N'Dillon', N'Nadine', CAST(N'1972-07-12' AS Date), 2813, 200109, N'M', N'3920 Proin Street', N'1-486-341-1182', N'mauris@hotmail.couk                                                                                 ', 1068, N'7805828892988770', CAST(N'2023-02-14' AS Date), N'Aliquam Incorporated', N'Cursus Industries', N'68.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (69, N'Strong', N'Neil', N'Calvin', CAST(N'1972-06-20' AS Date), 2385, 639765, N'M', N'4992 Nec Ave', N'1-482-926-6167', N'natoque.penatibus.et@aol.org                                                                        ', 1069, N'4370778949884070', CAST(N'2024-01-21' AS Date), N'Sed Eu Nibh Foundation', N'Fermentum Vel Foundation', N'69.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (70, N'Mckinney', N'Caesar', N'Silas', CAST(N'1989-08-25' AS Date), 4414, 399938, N'M', N'P.O. Box 371, 1808 At Rd.', N'1-871-472-5262', N'at.pretium@google.ca                                                                                ', 1070, N'2340302804283000', CAST(N'2024-11-14' AS Date), N'Mauris Ut Consulting', N'Aliquam Rutrum Foundation', N'70.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (71, N'Snider', N'Edan', N'Jolie', CAST(N'1972-06-22' AS Date), 4480, 449163, N'M', N'8440 Mattis Road', N'1-271-534-3662', N'enim@outlook.com                                                                                    ', 1071, N'6667340304365930', CAST(N'2023-12-25' AS Date), N'Parturient Montes Corp.', N'Euismod Enim PC', N'71.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (72, N'Fields', N'Lee', N'Marny', CAST(N'2021-06-16' AS Date), 9079, 170199, N'M', N'Ap #102-9086 Non Street', N'1-724-757-4915', N'pulvinar.arcu@aol.ca                                                                                ', 1072, N'1002398996256730', CAST(N'2023-02-06' AS Date), N'Malesuada Fames Incorporated', N'Urna Vivamus Corp.', N'72.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (73, N'Snyder', N'Kennedy', N'Jaden', CAST(N'2014-01-10' AS Date), 6000, 805774, N'M', N'7505 Tristique Av.', N'1-522-556-3181', N'duis.ac.arcu@hotmail.couk                                                                           ', 1073, N'4469217561331150', CAST(N'2025-01-14' AS Date), N'Lacus Incorporated', N'Lorem Tristique Industries', N'73.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (74, N'Love', N'Tarik', N'Hector', CAST(N'1995-04-11' AS Date), 8144, 567352, N'M', N'530-7057 Metus Street', N'1-241-576-4813', N'turpis.vitae@yahoo.edu                                                                              ', 1074, N'7335281403888510', CAST(N'2023-04-04' AS Date), N'Cras Dictum Institute', N'Sem Pellentesque LLC', N'74.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (75, N'Schroeder', N'Nolan', N'Benedict', CAST(N'1995-05-19' AS Date), 1838, 291710, N'M', N'8623 Nisi Road', N'1-457-860-2981', N'quis@google.edu                                                                                     ', 1075, N'3618114445427480', CAST(N'2023-08-18' AS Date), N'Sed Foundation', N'Parturient Company', N'75.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (76, N'Holden', N'Brett', N'Allen', CAST(N'1999-12-11' AS Date), 5330, 718923, N'M', N'776-6834 Sodales Avenue', N'1-266-492-4191', N'nulla@aol.org                                                                                       ', 1076, N'8893403679927980', CAST(N'2024-12-29' AS Date), N'Tempor Est Ac Ltd', N'Amet Orci Incorporated', N'76.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (77, N'Gamble', N'Grady', N'Lucius', CAST(N'2019-11-15' AS Date), 6708, 105644, N'M', N'1604 Non, Avenue', N'1-384-546-9441', N'odio.phasellus.at@outlook.com                                                                       ', 1077, N'6418908610790280', CAST(N'2024-03-13' AS Date), N'Aenean Massa Foundation', N'Euismod Ac Foundation', N'77.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (78, N'Pickett', N'Abdul', N'Moses', CAST(N'1958-01-26' AS Date), 3444, 872526, N'M', N'Ap #602-1614 Vitae St.', N'1-545-541-1147', N'sapien.nunc@yahoo.net                                                                               ', 1078, N'6439747189361290', CAST(N'2024-06-08' AS Date), N'In Molestie LLP', N'Iaculis PC', N'78.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (79, N'Pollard', N'Gil', N'Zoe', CAST(N'2009-07-06' AS Date), 9929, 759156, N'M', N'147 Eu, Ave', N'1-628-183-8590', N'diam.sed@icloud.ca                                                                                  ', 1079, N'8203072030578760', CAST(N'2023-06-23' AS Date), N'Interdum Inc.', N'Duis Limited', N'79.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (80, N'Moran', N'Nolan', N'Quin', CAST(N'2024-04-15' AS Date), 4964, 224143, N'M', N'Ap #453-2865 Et Road', N'1-456-187-8352', N'dis.parturient.montes@protonmail.com                                                                ', 1080, N'9495880847502110', CAST(N'2024-02-04' AS Date), N'Pulvinar Associates', N'Lorem Institute', N'80.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (81, N'Davis', N'Warren', N'Jemima', CAST(N'1992-05-14' AS Date), 5729, 638604, N'M', N'P.O. Box 557, 5596 Vel, Ave', N'1-861-461-4098', N'id.ante@google.ca                                                                                   ', 1081, N'8114887497680670', CAST(N'2023-08-10' AS Date), N'Leo Morbi Neque Inc.', N'Suspendisse Eleifend Cras Foundation', N'81.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (82, N'Olson', N'Luke', N'Lani', CAST(N'2015-03-14' AS Date), 8180, 575325, N'M', N'P.O. Box 956, 9268 Sagittis Rd.', N'1-648-874-4753', N'et.magnis.dis@hotmail.org                                                                           ', 1082, N'2984812362282100', CAST(N'2024-10-21' AS Date), N'Non Corp.', N'Ipsum Nunc PC', N'82.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (83, N'Burgess', N'Carson', N'Maia', CAST(N'1975-11-21' AS Date), 1153, 178802, N'M', N'7479 Neque Road', N'1-660-572-2616', N'dolor@outlook.net                                                                                   ', 1083, N'2700117484849340', CAST(N'2024-01-02' AS Date), N'Nunc Ac Mattis Corp.', N'Duis Elementum Institute', N'83.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (84, N'Ochoa', N'Hammett', N'Lewis', CAST(N'1984-10-25' AS Date), 4992, 793992, N'M', N'P.O. Box 565, 4559 Vivamus Rd.', N'1-486-585-4442', N'purus.gravida@icloud.com                                                                            ', 1084, N'4461721764158880', CAST(N'2024-01-01' AS Date), N'Adipiscing Elit LLC', N'Sapien Molestie Institute', N'84.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (85, N'Parks', N'Felix', N'Garrett', CAST(N'2004-04-26' AS Date), 1981, 903686, N'M', N'640-6458 Quam Street', N'1-555-445-2375', N'fringilla.donec@hotmail.edu                                                                         ', 1085, N'6576321530924360', CAST(N'2023-05-23' AS Date), N'Tellus Consulting', N'Nec Leo Consulting', N'85.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (86, N'Bass', N'Gage', N'Kiara', CAST(N'1991-06-10' AS Date), 9020, 438691, N'M', N'272-1450 Morbi St.', N'1-265-807-6978', N'massa@google.net                                                                                    ', 1086, N'4420703890029900', CAST(N'2023-02-01' AS Date), N'Risus In PC', N'Elit Fermentum Company', N'86.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (87, N'Hardy', N'Macon', N'Angelica', CAST(N'2024-04-17' AS Date), 2392, 777180, N'M', N'Ap #919-9975 Morbi Street', N'1-459-685-5579', N'id.erat@google.edu                                                                                  ', 1087, N'1182583532687710', CAST(N'2024-10-26' AS Date), N'Nam LLC', N'Orci Quis Corp.', N'87.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (88, N'Frederick', N'Prescott', N'Vaughan', CAST(N'1955-10-07' AS Date), 8101, 747693, N'M', N'P.O. Box 105, 9886 Eu Street', N'1-224-720-6338', N'in@outlook.edu                                                                                      ', 1088, N'1188960523307950', CAST(N'2024-09-26' AS Date), N'At Lacus LLC', N'Sed Hendrerit Company', N'88.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (89, N'Acevedo', N'Kamal', N'Beau', CAST(N'2014-11-16' AS Date), 8021, 620196, N'M', N'3346 Posuere Rd.', N'1-506-676-4278', N'vel.est@google.net                                                                                  ', 1089, N'4913193470938590', CAST(N'2024-02-23' AS Date), N'Suspendisse LLP', N'In Mi Foundation', N'89.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (90, N'Williamson', N'Clayton', N'Steven', CAST(N'1972-11-11' AS Date), 8336, 417169, N'M', N'P.O. Box 432, 2129 Enim Street', N'1-415-585-8959', N'nullam.velit.dui@icloud.ca                                                                          ', 1090, N'1649731765448060', CAST(N'2024-01-10' AS Date), N'Molestie Sodales Mauris Company', N'Nunc Foundation', N'90.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (91, N'Franks', N'Amery', N'Sacha', CAST(N'1957-09-06' AS Date), 3032, 550233, N'M', N'4780 Fusce Street', N'1-835-688-5588', N'senectus.et@yahoo.org                                                                               ', 1091, N'2471119514311240', CAST(N'2024-10-18' AS Date), N'Eros Nam Inc.', N'Malesuada Vel Limited', N'91.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (92, N'Mcknight', N'Hasad', N'Tana', CAST(N'1989-03-31' AS Date), 2829, 773781, N'M', N'Ap #509-9236 Fusce Av.', N'1-237-510-2135', N'sed.diam@yahoo.ca                                                                                   ', 1092, N'7612936134090470', CAST(N'2024-04-24' AS Date), N'Nunc Incorporated', N'Euismod In Corp.', N'92.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (93, N'Gay', N'Kaseem', N'Eric', CAST(N'1959-04-22' AS Date), 7013, 655409, N'M', N'Ap #423-4891 Eleifend Avenue', N'1-165-726-6873', N'orci.consectetuer@icloud.ca                                                                         ', 1093, N'2690721297094520', CAST(N'2024-04-04' AS Date), N'Duis Foundation', N'Fringilla LLC', N'93.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (94, N'Sandoval', N'Brett', N'Jillian', CAST(N'1977-03-11' AS Date), 1582, 869693, N'M', N'9630 A, Street', N'1-743-757-5258', N'ullamcorper.velit@outlook.org                                                                       ', 1094, N'8485852435134810', CAST(N'2024-04-24' AS Date), N'Diam LLC', N'Mauris Ut Institute', N'94.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (95, N'Mcmillan', N'Damian', N'Marshall', CAST(N'1981-07-02' AS Date), 8147, 621097, N'M', N'8511 Commodo Rd.', N'1-228-516-1513', N'dolor.dolor@google.edu                                                                              ', 1095, N'6456738997511280', CAST(N'2023-12-19' AS Date), N'Sed Turpis Institute', N'Libero Proin Institute', N'95.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (96, N'Ruiz', N'Blaze', N'Marsden', CAST(N'1978-01-12' AS Date), 2700, 962663, N'M', N'Ap #402-1611 Malesuada. St.', N'1-617-325-4631', N'vestibulum.accumsan@hotmail.com                                                                     ', 1096, N'3034217372669980', CAST(N'2023-04-24' AS Date), N'Netus Et Limited', N'Quis Diam PC', N'96.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (97, N'Barber', N'Lyle', N'Joshua', CAST(N'1980-04-06' AS Date), 3994, 917724, N'M', N'Ap #985-2517 Consequat, Rd.', N'1-127-874-5220', N'neque.vitae@icloud.com                                                                              ', 1097, N'9666658412719850', CAST(N'2023-11-24' AS Date), N'Tristique Associates', N'Interdum Nunc Limited', N'97.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (98, N'Wiggins', N'Brent', N'Brenda', CAST(N'1991-01-16' AS Date), 8029, 367110, N'M', N'Ap #547-7567 Nunc St.', N'1-833-701-1308', N'enim@hotmail.edu                                                                                    ', 1098, N'6823501218292840', CAST(N'2024-11-27' AS Date), N'Purus Ac Inc.', N'Euismod Est Inc.', N'98.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (99, N'Lawson', N'Levi', N'Lyle', CAST(N'1965-12-27' AS Date), 4106, 121936, N'M', N'834-9084 Vestibulum, St.', N'1-588-582-7878', N'consequat@outlook.com                                                                               ', 1099, N'1962965686925130', CAST(N'2024-09-05' AS Date), N'Malesuada Inc.', N'Tellus Justo LLC', N'99.jpg')
GO
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (100, N'Henson', N'Garth', N'Judah', CAST(N'1970-01-29' AS Date), 2942, 993115, N'M', N'464 Mi Street', N'1-275-830-8632', N'cras.eget@icloud.edu                                                                                ', 1100, N'6953953104352930', CAST(N'2025-01-04' AS Date), N'Pede Et Inc.', N'Libero Et Foundation', N'100.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (103, N'1', N'1', N'1', CAST(N'0111-01-01' AS Date), 1111, 111111, N'M', N'1', N'1', N'1                                                                                                   ', 1101, N'1111111111111111', CAST(N'1111-01-01' AS Date), N'1', N'1', N'2IMG-20231124-WA0019.jpg')
INSERT [dbo].[Patient] ([Id], [Surname], [Name], [Patronymic], [Birthday], [PassportSeries], [PassportNumber], [Gender], [Address], [Phone], [Email], [MedcardId], [PolicyNumber], [PolicyExpirationDate], [InsuranceCompany], [WorkPlace], [Photo]) VALUES (104, N'232', N'321', N'2313', CAST(N'0342-01-01' AS Date), 1110, 111111, N'F', N'1', N'1111111', N'1111111111                                                                                          ', 1102, N'1111111111111111', CAST(N'2233-01-01' AS Date), N'11', N'1', N'Product Roadmap - 8.jpg')
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[PatientReception] ON 

INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (1, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), 1, 1, 1, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (2, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 1, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (3, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 1, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (4, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 1, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (5, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 1, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (6, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), 20, 1, 1, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (7, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), 35, 1, 1, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (8, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 1, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (9, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), 35, 1, 1, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (10, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), 17, 1, 1, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (11, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 1, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (12, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 1, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (13, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 1, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (14, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), 2, 1, 1, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (15, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 1, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (16, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 2, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (17, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 2, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (18, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), 47, 1, 2, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (19, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 2, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (20, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 2, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (21, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), 14, 1, 2, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (22, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 2, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (23, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 2, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (24, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), 2, 1, 2, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (25, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 2, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (26, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 2, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (27, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 2, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (28, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 2, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (29, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), 47, 1, 2, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (30, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 2, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (31, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 3, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (32, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 3, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (33, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 3, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (34, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 3, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (35, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 3, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (36, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 3, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (37, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 3, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (38, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 3, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (39, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 3, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (40, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 3, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (41, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 3, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (42, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 3, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (43, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 3, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (44, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 3, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (45, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 3, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (46, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 4, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (47, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 4, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (48, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 4, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (49, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 4, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (50, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 4, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (51, CAST(N'15:30:00' AS Time), CAST(N'16:00:00' AS Time), NULL, 0, 4, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (52, CAST(N'16:00:00' AS Time), CAST(N'16:30:00' AS Time), NULL, 0, 4, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (53, CAST(N'16:30:00' AS Time), CAST(N'17:00:00' AS Time), NULL, 0, 4, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (54, CAST(N'17:00:00' AS Time), CAST(N'17:30:00' AS Time), NULL, 0, 4, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (55, CAST(N'17:30:00' AS Time), CAST(N'18:00:00' AS Time), NULL, 0, 4, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (56, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 5, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (57, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 5, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (58, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), 38, 1, 5, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (59, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 5, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (60, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 5, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (61, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 5, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (62, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 5, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (63, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 5, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (64, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 5, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (65, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 5, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (66, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 5, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (67, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 5, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (68, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 5, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (69, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 5, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (70, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 5, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (71, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 6, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (72, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 6, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (73, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 6, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (74, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 6, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (75, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 6, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (76, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 6, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (77, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 6, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (78, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 6, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (79, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 6, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (80, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 6, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (81, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 6, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (82, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 6, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (83, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 6, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (84, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 6, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (85, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 6, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (86, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 7, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (87, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 7, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (88, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 7, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (89, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 7, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (90, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 7, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (91, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 7, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (92, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 7, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (93, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 7, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (94, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 7, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (95, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 7, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (96, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 7, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (97, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 7, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (98, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 7, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (99, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 7, 14)
GO
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (100, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 7, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (101, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 8, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (102, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 8, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (103, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 8, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (104, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 8, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (105, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 8, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (106, CAST(N'15:30:00' AS Time), CAST(N'16:00:00' AS Time), NULL, 0, 8, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (107, CAST(N'16:00:00' AS Time), CAST(N'16:30:00' AS Time), NULL, 0, 8, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (108, CAST(N'16:30:00' AS Time), CAST(N'17:00:00' AS Time), NULL, 0, 8, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (109, CAST(N'17:00:00' AS Time), CAST(N'17:30:00' AS Time), NULL, 0, 8, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (110, CAST(N'17:30:00' AS Time), CAST(N'18:00:00' AS Time), NULL, 0, 8, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (111, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 9, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (112, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 9, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (113, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 9, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (114, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 9, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (115, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 9, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (116, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 9, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (117, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 9, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (118, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 9, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (119, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 9, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (120, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 9, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (121, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 9, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (122, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 9, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (123, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 9, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (124, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 9, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (125, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 9, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (126, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 10, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (127, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 10, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (128, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 10, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (129, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 10, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (130, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 10, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (131, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 10, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (132, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 10, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (133, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 10, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (134, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 10, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (135, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 10, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (136, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 10, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (137, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 10, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (138, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 10, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (139, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 10, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (140, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 10, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (141, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 11, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (142, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 11, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (143, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 11, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (144, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 11, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (145, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 11, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (146, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 11, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (147, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 11, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (148, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 11, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (149, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 11, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (150, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 11, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (151, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 11, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (152, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 11, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (153, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 11, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (154, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 11, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (155, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 11, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (156, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 12, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (157, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 12, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (158, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 12, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (159, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 12, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (160, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 12, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (161, CAST(N'15:30:00' AS Time), CAST(N'16:00:00' AS Time), NULL, 0, 12, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (162, CAST(N'16:00:00' AS Time), CAST(N'16:30:00' AS Time), NULL, 0, 12, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (163, CAST(N'16:30:00' AS Time), CAST(N'17:00:00' AS Time), NULL, 0, 12, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (164, CAST(N'17:00:00' AS Time), CAST(N'17:30:00' AS Time), NULL, 0, 12, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (165, CAST(N'17:30:00' AS Time), CAST(N'18:00:00' AS Time), NULL, 0, 12, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (166, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 13, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (167, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 13, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (168, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 13, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (169, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 13, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (170, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 13, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (171, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 13, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (172, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 13, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (173, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 13, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (174, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 13, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (175, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 13, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (176, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 13, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (177, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 13, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (178, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 13, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (179, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 13, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (180, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 13, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (181, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 14, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (182, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 14, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (183, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 14, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (184, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 14, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (185, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 14, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (186, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 14, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (187, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 14, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (188, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 14, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (189, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 14, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (190, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 14, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (191, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 14, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (192, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 14, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (193, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 14, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (194, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 14, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (195, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 14, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (196, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 15, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (197, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 15, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (198, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 15, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (199, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 15, 4)
GO
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (200, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 15, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (201, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 15, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (202, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 15, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (203, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 15, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (204, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 15, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (205, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 15, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (206, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 15, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (207, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 15, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (208, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 15, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (209, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 15, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (210, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 15, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (211, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 16, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (212, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 16, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (213, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 16, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (214, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 16, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (215, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 16, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (216, CAST(N'15:30:00' AS Time), CAST(N'16:00:00' AS Time), NULL, 0, 16, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (217, CAST(N'16:00:00' AS Time), CAST(N'16:30:00' AS Time), NULL, 0, 16, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (218, CAST(N'16:30:00' AS Time), CAST(N'17:00:00' AS Time), NULL, 0, 16, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (219, CAST(N'17:00:00' AS Time), CAST(N'17:30:00' AS Time), NULL, 0, 16, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (220, CAST(N'17:30:00' AS Time), CAST(N'18:00:00' AS Time), NULL, 0, 16, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (221, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 17, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (222, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 17, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (223, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 17, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (224, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 17, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (225, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 17, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (226, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 17, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (227, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 17, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (228, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 17, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (229, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 17, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (230, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 17, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (231, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 17, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (232, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 17, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (233, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 17, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (234, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 17, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (235, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 17, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (236, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 18, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (237, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 18, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (238, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 18, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (239, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 18, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (240, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 18, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (241, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 18, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (242, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 18, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (243, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 18, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (244, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 18, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (245, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 18, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (246, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 18, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (247, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 18, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (248, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 18, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (249, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 18, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (250, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 18, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (251, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 19, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (252, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 19, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (253, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 19, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (254, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 19, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (255, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 19, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (256, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 19, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (257, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 19, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (258, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 19, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (259, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 19, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (260, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 19, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (261, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 19, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (262, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 19, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (263, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 19, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (264, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 19, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (265, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 19, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (266, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 20, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (267, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 20, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (268, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 20, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (269, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 20, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (270, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 20, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (271, CAST(N'15:30:00' AS Time), CAST(N'16:00:00' AS Time), NULL, 0, 20, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (272, CAST(N'16:00:00' AS Time), CAST(N'16:30:00' AS Time), NULL, 0, 20, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (273, CAST(N'16:30:00' AS Time), CAST(N'17:00:00' AS Time), NULL, 0, 20, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (274, CAST(N'17:00:00' AS Time), CAST(N'17:30:00' AS Time), NULL, 0, 20, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (275, CAST(N'17:30:00' AS Time), CAST(N'18:00:00' AS Time), NULL, 0, 20, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (276, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 21, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (277, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 21, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (278, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 21, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (279, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 21, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (280, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 21, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (281, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 21, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (282, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 21, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (283, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 21, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (284, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 21, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (285, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 21, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (286, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 21, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (287, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 21, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (288, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 21, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (289, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 21, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (290, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 21, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (291, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 22, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (292, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 22, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (293, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 22, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (294, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 22, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (295, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 22, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (296, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 22, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (297, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 22, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (298, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 22, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (299, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 22, 9)
GO
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (300, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 22, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (301, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 22, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (302, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 22, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (303, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 22, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (304, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 22, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (305, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 22, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (306, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 23, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (307, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 23, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (308, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 23, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (309, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 23, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (310, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 23, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (311, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 23, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (312, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 23, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (313, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 23, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (314, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 23, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (315, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 23, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (316, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 23, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (317, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 23, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (318, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 23, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (319, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 23, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (320, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 23, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (321, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 24, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (322, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 24, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (323, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 24, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (324, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 24, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (325, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 24, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (326, CAST(N'15:30:00' AS Time), CAST(N'16:00:00' AS Time), NULL, 0, 24, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (327, CAST(N'16:00:00' AS Time), CAST(N'16:30:00' AS Time), NULL, 0, 24, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (328, CAST(N'16:30:00' AS Time), CAST(N'17:00:00' AS Time), NULL, 0, 24, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (329, CAST(N'17:00:00' AS Time), CAST(N'17:30:00' AS Time), NULL, 0, 24, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (330, CAST(N'17:30:00' AS Time), CAST(N'18:00:00' AS Time), NULL, 0, 24, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (331, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 25, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (332, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 25, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (333, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 25, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (334, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 25, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (335, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 25, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (336, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 25, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (337, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 25, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (338, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 25, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (339, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 25, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (340, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 25, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (341, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 25, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (342, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 25, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (343, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 25, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (344, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 25, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (345, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 25, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (346, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 26, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (347, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 26, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (348, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 26, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (349, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 26, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (350, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 26, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (351, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 26, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (352, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 26, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (353, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 26, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (354, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 26, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (355, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 26, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (356, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 26, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (357, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 26, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (358, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 26, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (359, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 26, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (360, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 26, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (361, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 27, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (362, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 27, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (363, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 27, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (364, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 27, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (365, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 27, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (366, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 27, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (367, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 27, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (368, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 27, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (369, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 27, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (370, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 27, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (371, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 27, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (372, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 27, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (373, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 27, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (374, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 27, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (375, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 27, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (376, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 28, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (377, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 28, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (378, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 28, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (379, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 28, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (380, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 28, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (381, CAST(N'15:30:00' AS Time), CAST(N'16:00:00' AS Time), NULL, 0, 28, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (382, CAST(N'16:00:00' AS Time), CAST(N'16:30:00' AS Time), NULL, 0, 28, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (383, CAST(N'16:30:00' AS Time), CAST(N'17:00:00' AS Time), NULL, 0, 28, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (384, CAST(N'17:00:00' AS Time), CAST(N'17:30:00' AS Time), NULL, 0, 28, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (385, CAST(N'17:30:00' AS Time), CAST(N'18:00:00' AS Time), NULL, 0, 28, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (386, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 29, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (387, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 29, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (388, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 29, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (389, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 29, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (390, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 29, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (391, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 29, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (392, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 29, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (393, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 29, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (394, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 29, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (395, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 29, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (396, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 29, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (397, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 29, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (398, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 29, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (399, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 29, 14)
GO
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (400, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 29, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (401, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 30, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (402, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 30, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (403, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 30, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (404, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 30, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (405, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 30, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (406, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 30, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (407, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 30, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (408, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 30, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (409, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 30, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (410, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 30, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (411, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 30, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (412, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 30, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (413, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 30, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (414, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 30, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (415, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 30, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (416, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 31, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (417, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 31, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (418, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 31, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (419, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 31, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (420, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 31, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (421, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 31, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (422, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 31, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (423, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 31, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (424, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 31, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (425, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 31, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (426, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 31, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (427, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 31, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (428, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 31, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (429, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 31, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (430, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 31, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (431, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 32, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (432, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 32, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (433, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 32, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (434, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 32, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (435, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 32, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (436, CAST(N'15:30:00' AS Time), CAST(N'16:00:00' AS Time), NULL, 0, 32, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (437, CAST(N'16:00:00' AS Time), CAST(N'16:30:00' AS Time), NULL, 0, 32, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (438, CAST(N'16:30:00' AS Time), CAST(N'17:00:00' AS Time), NULL, 0, 32, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (439, CAST(N'17:00:00' AS Time), CAST(N'17:30:00' AS Time), NULL, 0, 32, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (440, CAST(N'17:30:00' AS Time), CAST(N'18:00:00' AS Time), NULL, 0, 32, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (441, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 33, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (442, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 33, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (443, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 33, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (444, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 33, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (445, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 33, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (446, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 33, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (447, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 33, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (448, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 33, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (449, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 33, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (450, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 33, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (451, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 33, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (452, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 33, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (453, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 33, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (454, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 33, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (455, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 33, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (456, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 34, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (457, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 34, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (458, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 34, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (459, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 34, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (460, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 34, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (461, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 34, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (462, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 34, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (463, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 34, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (464, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 34, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (465, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 34, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (466, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 34, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (467, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 34, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (468, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 34, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (469, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 34, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (470, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 34, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (471, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 35, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (472, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 35, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (473, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 35, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (474, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 35, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (475, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 35, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (476, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 35, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (477, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 35, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (478, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 35, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (479, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 35, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (480, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 35, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (481, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 35, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (482, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 35, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (483, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 35, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (484, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 35, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (485, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 35, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (486, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 36, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (487, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 36, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (488, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 36, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (489, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 36, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (490, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 36, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (491, CAST(N'15:30:00' AS Time), CAST(N'16:00:00' AS Time), NULL, 0, 36, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (492, CAST(N'16:00:00' AS Time), CAST(N'16:30:00' AS Time), NULL, 0, 36, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (493, CAST(N'16:30:00' AS Time), CAST(N'17:00:00' AS Time), NULL, 0, 36, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (494, CAST(N'17:00:00' AS Time), CAST(N'17:30:00' AS Time), NULL, 0, 36, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (495, CAST(N'17:30:00' AS Time), CAST(N'18:00:00' AS Time), NULL, 0, 36, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (496, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 37, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (497, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 37, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (498, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 37, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (499, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 37, 4)
GO
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (500, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 37, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (501, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 37, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (502, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 37, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (503, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 37, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (504, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 37, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (505, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 37, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (506, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 37, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (507, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 37, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (508, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 37, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (509, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 37, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (510, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 37, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (511, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 38, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (512, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 38, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (513, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 38, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (514, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 38, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (515, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 38, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (516, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 38, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (517, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 38, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (518, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 38, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (519, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 38, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (520, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 38, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (521, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 38, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (522, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 38, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (523, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 38, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (524, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 38, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (525, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 38, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (526, CAST(N'08:00:00' AS Time), CAST(N'08:30:00' AS Time), NULL, 0, 39, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (527, CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), NULL, 0, 39, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (528, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 39, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (529, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 39, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (530, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 39, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (531, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 39, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (532, CAST(N'11:00:00' AS Time), CAST(N'11:30:00' AS Time), NULL, 0, 39, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (533, CAST(N'11:30:00' AS Time), CAST(N'12:00:00' AS Time), NULL, 0, 39, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (534, CAST(N'12:00:00' AS Time), CAST(N'12:30:00' AS Time), NULL, 0, 39, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (535, CAST(N'12:30:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 0, 39, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (536, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), NULL, 0, 39, 11)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (537, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 39, 12)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (538, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 39, 13)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (539, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 39, 14)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (540, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 39, 15)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (541, CAST(N'13:00:00' AS Time), CAST(N'13:30:00' AS Time), 20, 1, 40, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (542, CAST(N'13:30:00' AS Time), CAST(N'14:00:00' AS Time), NULL, 0, 40, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (543, CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), NULL, 0, 40, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (544, CAST(N'14:30:00' AS Time), CAST(N'15:00:00' AS Time), NULL, 0, 40, 4)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (545, CAST(N'15:00:00' AS Time), CAST(N'15:30:00' AS Time), NULL, 0, 40, 5)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (546, CAST(N'15:30:00' AS Time), CAST(N'16:00:00' AS Time), NULL, 0, 40, 6)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (547, CAST(N'16:00:00' AS Time), CAST(N'16:30:00' AS Time), NULL, 0, 40, 7)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (548, CAST(N'16:30:00' AS Time), CAST(N'17:00:00' AS Time), NULL, 0, 40, 8)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (549, CAST(N'17:00:00' AS Time), CAST(N'17:30:00' AS Time), NULL, 0, 40, 9)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (550, CAST(N'17:30:00' AS Time), CAST(N'18:00:00' AS Time), NULL, 0, 40, 10)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (551, CAST(N'09:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, 0, 44, 1)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (552, CAST(N'09:30:00' AS Time), CAST(N'10:00:00' AS Time), NULL, 0, 44, 2)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (553, CAST(N'10:00:00' AS Time), CAST(N'10:30:00' AS Time), NULL, 0, 44, 3)
INSERT [dbo].[PatientReception] ([Id], [TimeBegin], [TimeEnd], [PatientId], [Status], [TimeSheetId], [CouponNumber]) VALUES (554, CAST(N'10:30:00' AS Time), CAST(N'11:00:00' AS Time), NULL, 0, 44, 4)
SET IDENTITY_INSERT [dbo].[PatientReception] OFF
GO
INSERT [dbo].[Role] ([Id], [Title], [AccessLevel]) VALUES (1, N'администратор', 1)
INSERT [dbo].[Role] ([Id], [Title], [AccessLevel]) VALUES (2, N'сотрудник регистратуры', 2)
INSERT [dbo].[Role] ([Id], [Title], [AccessLevel]) VALUES (3, N'специалист основных подразделений', 3)
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (1, N'Вход', 0, 1)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (2, N'Регистратура', 1, 2)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (5, N'Комната утилизации медицинских расходов', 2, 3)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (6, N'Служебный туалет', 3, 3)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (7, N'Заведующая отделением', 4, 3)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (8, N'Главная медицинская сестра', 5, 3)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (9, N'Кабинет гигиены полости рта', 6, 2)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (10, N'Терапевтический кабинет', 7, 2)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (11, N'Терапевтический кабинет', 8, 2)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (12, N'Компьютерная', 9, 3)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (13, N'Гардеробная песонала', 10, 3)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (14, N'Бухгалтерия', 11, 3)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (15, N'Хирургический кабинет', 12, 2)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (16, N'Экономисты', 13, 3)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (17, N'Физиотерапевтический кабинет', 14, 2)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (18, N'Стоматологический кабинет', 15, 2)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (20, N'Заведующая хозяйством Специалист ОТ', 16, 3)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (21, N'Стерилизационная', 17, 2)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (22, N'Архив', 18, 3)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (24, N'Главный врач', 19, 3)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (25, N'Комната приёма пищи', 20, 3)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (26, N'Терапевтический кабинет', 21, 2)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (27, N'Санитарная комната', 22, 2)
INSERT [dbo].[Room] ([Id], [Title], [Code], [RoomTypeId]) VALUES (28, N'Общий туалет', 23, 1)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([Id], [Title]) VALUES (1, N'Общее')
INSERT [dbo].[RoomType] ([Id], [Title]) VALUES (2, N'Кабинет приема пациентов')
INSERT [dbo].[RoomType] ([Id], [Title]) VALUES (3, N'Кабинеты сотрудников')
SET IDENTITY_INSERT [dbo].[RoomType] OFF
GO
SET IDENTITY_INSERT [dbo].[Specialization] ON 

INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (1, N'Терапевт')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (2, N'Педиатр')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (3, N'Офтальмолог')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (4, N'Невролог')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (5, N'Стоматолог')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (6, N'Онколог')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (7, N'Врач общей практики')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (8, N'Акушер-гинеколог')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (9, N'Анестезиолог-реаниматолог')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (10, N'Травматолог')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (11, N'Врач ультразвуковой диагностики')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (12, N'Инфекционист')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (13, N'Диетолог')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (14, N'Сотрудник')
INSERT [dbo].[Specialization] ([Id], [Title]) VALUES (15, N'Программист')
SET IDENTITY_INSERT [dbo].[Specialization] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeSheet] ON 

INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (0, CAST(N'2024-01-04' AS Date), CAST(N'14:00:00' AS Time), CAST(N'17:00:00' AS Time), 4, 30, 11)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (1, CAST(N'2024-02-05' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, 30, 10)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (2, CAST(N'2024-02-05' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 2, 30, 11)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (3, CAST(N'2024-02-05' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 13, 30, 26)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (4, CAST(N'2024-02-05' AS Date), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 17, 30, 17)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (5, CAST(N'2024-02-06' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, 30, 10)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (6, CAST(N'2024-02-06' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 2, 30, 11)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (7, CAST(N'2024-02-06' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 13, 30, 26)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (8, CAST(N'2024-02-06' AS Date), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 17, 30, 17)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (9, CAST(N'2024-02-07' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, 30, 10)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (10, CAST(N'2024-02-07' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 2, 30, 11)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (11, CAST(N'2024-02-07' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 13, 30, 26)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (12, CAST(N'2024-02-07' AS Date), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 17, 30, 17)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (13, CAST(N'2024-02-08' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, 30, 10)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (14, CAST(N'2024-02-08' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 2, 30, 11)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (15, CAST(N'2024-02-08' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 13, 30, 26)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (16, CAST(N'2024-02-08' AS Date), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 17, 30, 17)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (17, CAST(N'2024-02-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, 30, 10)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (18, CAST(N'2024-02-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 2, 30, 11)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (19, CAST(N'2024-02-09' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 13, 30, 26)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (20, CAST(N'2024-02-09' AS Date), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 17, 30, 17)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (21, CAST(N'2024-02-12' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, 30, 10)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (22, CAST(N'2024-02-12' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 2, 30, 11)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (23, CAST(N'2024-02-12' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 13, 30, 26)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (24, CAST(N'2024-02-12' AS Date), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 17, 30, 17)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (25, CAST(N'2024-02-13' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, 30, 10)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (26, CAST(N'2024-02-13' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 2, 30, 11)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (27, CAST(N'2024-02-13' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 13, 30, 26)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (28, CAST(N'2024-02-13' AS Date), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 17, 30, 17)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (29, CAST(N'2024-02-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, 30, 10)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (30, CAST(N'2024-02-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 2, 30, 11)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (31, CAST(N'2024-02-14' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 13, 30, 26)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (32, CAST(N'2024-02-14' AS Date), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 17, 30, 17)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (33, CAST(N'2024-02-15' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, 30, 10)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (34, CAST(N'2024-02-15' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 2, 30, 11)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (35, CAST(N'2024-02-15' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 13, 30, 26)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (36, CAST(N'2024-02-15' AS Date), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 17, 30, 17)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (37, CAST(N'2024-02-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, 30, 10)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (38, CAST(N'2024-02-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 2, 30, 11)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (39, CAST(N'2024-02-16' AS Date), CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 13, 30, 26)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (40, CAST(N'2024-02-16' AS Date), CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 17, 30, 17)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (41, CAST(N'2024-02-08' AS Date), CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 3, 30, 18)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (42, CAST(N'2024-02-11' AS Date), CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 13, 30, 27)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (43, CAST(N'2024-02-13' AS Date), CAST(N'11:00:00' AS Time), CAST(N'14:00:00' AS Time), 7, 30, 11)
INSERT [dbo].[TimeSheet] ([Id], [Date], [TimeBegin], [TimeEnd], [EmployeeId], [DurationPersonTime], [RoomId]) VALUES (44, CAST(N'2024-02-11' AS Date), CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time), 9, 30, 26)
SET IDENTITY_INSERT [dbo].[TimeSheet] OFF
GO
SET IDENTITY_INSERT [dbo].[TreatmentEvent] ON 

INSERT [dbo].[TreatmentEvent] ([Id], [DateTime], [DoctorId], [EventTypeId], [Title], [Results], [Recommendations], [PatientId], [Price]) VALUES (1, CAST(N'2023-12-09T22:36:00.000' AS DateTime), 11, 2, N'УЗИ Сердца', N'Обнаружено', N'Консультация терапевта', 1, 1700)
INSERT [dbo].[TreatmentEvent] ([Id], [DateTime], [DoctorId], [EventTypeId], [Title], [Results], [Recommendations], [PatientId], [Price]) VALUES (2, CAST(N'2023-03-16T19:17:00.000' AS DateTime), 11, 2, N'УЗИ Печени', N'Не обнаружено', N'Консультация терапевта', 2, 1500)
INSERT [dbo].[TreatmentEvent] ([Id], [DateTime], [DoctorId], [EventTypeId], [Title], [Results], [Recommendations], [PatientId], [Price]) VALUES (3, CAST(N'2025-01-08T08:00:00.000' AS DateTime), 11, 2, N'УЗИ Почек', N'Обнаружено', N'Консультация терапевта', 3, 1300)
INSERT [dbo].[TreatmentEvent] ([Id], [DateTime], [DoctorId], [EventTypeId], [Title], [Results], [Recommendations], [PatientId], [Price]) VALUES (4, CAST(N'2023-10-31T13:23:00.000' AS DateTime), 11, 2, N'УЗИ Ног', N'Не обнаружено', N'Консультация терапевта', 4, 1500)
INSERT [dbo].[TreatmentEvent] ([Id], [DateTime], [DoctorId], [EventTypeId], [Title], [Results], [Recommendations], [PatientId], [Price]) VALUES (5, CAST(N'2023-10-16T10:10:00.000' AS DateTime), 11, 2, N'УЗИ Легких', N'Обнаружено', N'Консультация терапевта', 5, 1330)
INSERT [dbo].[TreatmentEvent] ([Id], [DateTime], [DoctorId], [EventTypeId], [Title], [Results], [Recommendations], [PatientId], [Price]) VALUES (6, CAST(N'2023-07-11T01:46:00.000' AS DateTime), 11, 2, N'УЗИ Сердца', N'Обнаружено', N'Консультация терапевта', 6, 1550)
INSERT [dbo].[TreatmentEvent] ([Id], [DateTime], [DoctorId], [EventTypeId], [Title], [Results], [Recommendations], [PatientId], [Price]) VALUES (7, CAST(N'2024-02-06T05:29:00.000' AS DateTime), 11, 2, N'УЗИ Печени', N'Не обнаружено', N'Консультация терапевта', 7, 1770)
INSERT [dbo].[TreatmentEvent] ([Id], [DateTime], [DoctorId], [EventTypeId], [Title], [Results], [Recommendations], [PatientId], [Price]) VALUES (8, CAST(N'2024-10-17T18:41:00.000' AS DateTime), 11, 2, N'УЗИ Почек', N'Обнаружено', N'Консультация терапевта', 8, 1880)
INSERT [dbo].[TreatmentEvent] ([Id], [DateTime], [DoctorId], [EventTypeId], [Title], [Results], [Recommendations], [PatientId], [Price]) VALUES (9, CAST(N'2023-09-06T03:48:00.000' AS DateTime), 11, 2, N'УЗИ Ног', N'Не обнаружено', N'Консультация терапевта', 9, 1330)
INSERT [dbo].[TreatmentEvent] ([Id], [DateTime], [DoctorId], [EventTypeId], [Title], [Results], [Recommendations], [PatientId], [Price]) VALUES (10, CAST(N'2024-03-15T20:52:00.000' AS DateTime), 11, 2, N'УЗИ Легких', N'Обнаружено', N'Консультация терапевта', 10, 1800)
SET IDENTITY_INSERT [dbo].[TreatmentEvent] OFF
GO
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (1, N'00KG', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (2, N'KGIF', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (3, N'PXGL', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (4, N'IHM2', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (5, N'DT84', 2)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (6, N'ITET', 2)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (7, N'M7GG', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (8, N'FF8B', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (9, N'61P2', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (10, N'KPH6', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (11, N'F3ZX', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (12, N'GO79', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (13, N'MYME', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (14, N'4QC8', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (15, N'TDPZ', 1)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (16, N'SIBZ', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (17, N'S140', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (18, N'V8MJ', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (19, N'YL7V', 3)
INSERT [dbo].[User] ([Id], [Password], [RoleId]) VALUES (20, N'MH7A', 3)
GO
SET IDENTITY_INSERT [dbo].[Ward] ON 

INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (1, N'101', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (2, N'102', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (3, N'103', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (4, N'104', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (5, N'105', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (6, N'106', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (7, N'107', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (8, N'108', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (9, N'109', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (10, N'110', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (11, N'111', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (12, N'112', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (13, N'113', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (14, N'114', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (15, N'115', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (16, N'116', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (17, N'117', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (18, N'118', 2)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (19, N'101', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (20, N'102', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (21, N'103', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (22, N'104', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (23, N'105', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (24, N'106', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (25, N'107', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (26, N'108', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (27, N'109', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (28, N'110', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (29, N'111', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (30, N'112', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (31, N'113', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (32, N'114', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (33, N'115', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (34, N'116', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (35, N'117', 3)
INSERT [dbo].[Ward] ([Id], [Title], [DepartmentId]) VALUES (36, N'118', 3)
SET IDENTITY_INSERT [dbo].[Ward] OFF
GO
/****** Object:  Index [IX_Hospitalization]    Script Date: 08.02.2024 15:37:28 ******/
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [IX_Hospitalization] UNIQUE NONCLUSTERED 
(
	[HospitalizationReferralId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patient]    Script Date: 08.02.2024 15:37:28 ******/
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [IX_Patient] UNIQUE NONCLUSTERED 
(
	[MedcardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DeseaseHistory]  WITH CHECK ADD  CONSTRAINT [FK_DeseaseHistory_Employee] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[DeseaseHistory] CHECK CONSTRAINT [FK_DeseaseHistory_Employee]
GO
ALTER TABLE [dbo].[DeseaseHistory]  WITH CHECK ADD  CONSTRAINT [FK_DeseaseHistory_Medcard] FOREIGN KEY([MedcardId])
REFERENCES [dbo].[Medcard] ([Id])
GO
ALTER TABLE [dbo].[DeseaseHistory] CHECK CONSTRAINT [FK_DeseaseHistory_Medcard]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Specialization] FOREIGN KEY([SpecializationId])
REFERENCES [dbo].[Specialization] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Specialization]
GO
ALTER TABLE [dbo].[HospitalBed]  WITH CHECK ADD  CONSTRAINT [FK_HospitalBed_Ward] FOREIGN KEY([WardId])
REFERENCES [dbo].[Ward] ([Id])
GO
ALTER TABLE [dbo].[HospitalBed] CHECK CONSTRAINT [FK_HospitalBed_Ward]
GO
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_HospitalBed] FOREIGN KEY([HospitalBedId])
REFERENCES [dbo].[HospitalBed] ([Id])
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_HospitalBed]
GO
ALTER TABLE [dbo].[Hospitalization]  WITH CHECK ADD  CONSTRAINT [FK_Hospitalization_HospitalizationReferral] FOREIGN KEY([HospitalizationReferralId])
REFERENCES [dbo].[HospitalizationReferral] ([Id])
GO
ALTER TABLE [dbo].[Hospitalization] CHECK CONSTRAINT [FK_Hospitalization_HospitalizationReferral]
GO
ALTER TABLE [dbo].[HospitalizationReferral]  WITH CHECK ADD  CONSTRAINT [FK_HospitalizationReferral_HospitalizationDepartment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[HospitalizationDepartment] ([Id])
GO
ALTER TABLE [dbo].[HospitalizationReferral] CHECK CONSTRAINT [FK_HospitalizationReferral_HospitalizationDepartment]
GO
ALTER TABLE [dbo].[HospitalizationReferral]  WITH CHECK ADD  CONSTRAINT [FK_HospitalizationReferral_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
ALTER TABLE [dbo].[HospitalizationReferral] CHECK CONSTRAINT [FK_HospitalizationReferral_Patient]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Medcard1] FOREIGN KEY([MedcardId])
REFERENCES [dbo].[Medcard] ([Id])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Medcard1]
GO
ALTER TABLE [dbo].[PatientReception]  WITH CHECK ADD  CONSTRAINT [FK_PatientReception_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
ALTER TABLE [dbo].[PatientReception] CHECK CONSTRAINT [FK_PatientReception_Patient]
GO
ALTER TABLE [dbo].[PatientReception]  WITH CHECK ADD  CONSTRAINT [FK_PatientReception_TimeSheet] FOREIGN KEY([TimeSheetId])
REFERENCES [dbo].[TimeSheet] ([Id])
GO
ALTER TABLE [dbo].[PatientReception] CHECK CONSTRAINT [FK_PatientReception_TimeSheet]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_Prescription_DeseaseHistory] FOREIGN KEY([DeseaseHistoryId])
REFERENCES [dbo].[DeseaseHistory] ([Id])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_Prescription_DeseaseHistory]
GO
ALTER TABLE [dbo].[Referral]  WITH CHECK ADD  CONSTRAINT [FK_Referral_DeseaseHistory] FOREIGN KEY([DeseaseHistoryId])
REFERENCES [dbo].[DeseaseHistory] ([Id])
GO
ALTER TABLE [dbo].[Referral] CHECK CONSTRAINT [FK_Referral_DeseaseHistory]
GO
ALTER TABLE [dbo].[Referral]  WITH CHECK ADD  CONSTRAINT [FK_Referral_EventType] FOREIGN KEY([EventTypeId])
REFERENCES [dbo].[EventType] ([Id])
GO
ALTER TABLE [dbo].[Referral] CHECK CONSTRAINT [FK_Referral_EventType]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomType] ([Id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Employee]
GO
ALTER TABLE [dbo].[TimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_TimeSheet_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[TimeSheet] CHECK CONSTRAINT [FK_TimeSheet_Room]
GO
ALTER TABLE [dbo].[TreatmentEvent]  WITH CHECK ADD  CONSTRAINT [FK_TreatmentEvents_Employee] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[TreatmentEvent] CHECK CONSTRAINT [FK_TreatmentEvents_Employee]
GO
ALTER TABLE [dbo].[TreatmentEvent]  WITH CHECK ADD  CONSTRAINT [FK_TreatmentEvents_EventType] FOREIGN KEY([EventTypeId])
REFERENCES [dbo].[EventType] ([Id])
GO
ALTER TABLE [dbo].[TreatmentEvent] CHECK CONSTRAINT [FK_TreatmentEvents_EventType]
GO
ALTER TABLE [dbo].[TreatmentEvent]  WITH CHECK ADD  CONSTRAINT [FK_TreatmentEvents_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
ALTER TABLE [dbo].[TreatmentEvent] CHECK CONSTRAINT [FK_TreatmentEvents_Patient]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_Users_Employee] FOREIGN KEY([Id])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_Users_Employee]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_Users_Role]
GO
ALTER TABLE [dbo].[Ward]  WITH CHECK ADD  CONSTRAINT [FK_Ward_HospitalizationDepartment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[HospitalizationDepartment] ([Id])
GO
ALTER TABLE [dbo].[Ward] CHECK CONSTRAINT [FK_Ward_HospitalizationDepartment]
GO
USE [master]
GO
ALTER DATABASE [PROF2024] SET  READ_WRITE 
GO
