/*    ==Параметры сценариев==

    Версия исходного сервера : SQL Server 2017 (14.0.1000)
    Выпуск исходного ядра СУБД : Выпуск Microsoft SQL Server Express Edition
    Тип исходного ядра СУБД : Изолированный SQL Server

    Версия целевого сервера : SQL Server 2017
    Выпуск целевого ядра СУБД : Выпуск Microsoft SQL Server Standard Edition
    Тип целевого ядра СУБД : Изолированный SQL Server
*/
USE [master]
GO
/****** Object:  Database [PROF2024]    Script Date: 01.02.2024 0:29:52 ******/
CREATE DATABASE [PROF2024]

GO
USE [PROF2024]
GO
/****** Object:  Table [dbo].[DeseaseHistory]    Script Date: 01.02.2024 0:29:53 ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 01.02.2024 0:29:53 ******/
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
/****** Object:  Table [dbo].[EventType]    Script Date: 01.02.2024 0:29:53 ******/
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
/****** Object:  Table [dbo].[Hospitalization]    Script Date: 01.02.2024 0:29:53 ******/
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
 CONSTRAINT [PK_Hospitalization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalizationDepartment]    Script Date: 01.02.2024 0:29:53 ******/
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
/****** Object:  Table [dbo].[HospitalizationReferral]    Script Date: 01.02.2024 0:29:53 ******/
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
/****** Object:  Table [dbo].[Medcard]    Script Date: 01.02.2024 0:29:53 ******/
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
/****** Object:  Table [dbo].[Patient]    Script Date: 01.02.2024 0:29:53 ******/
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
/****** Object:  Table [dbo].[Prescription]    Script Date: 01.02.2024 0:29:53 ******/
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
/****** Object:  Table [dbo].[Referral]    Script Date: 01.02.2024 0:29:53 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 01.02.2024 0:29:53 ******/
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
/****** Object:  Table [dbo].[Specialization]    Script Date: 01.02.2024 0:29:53 ******/
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
/****** Object:  Table [dbo].[TreatmentEvent]    Script Date: 01.02.2024 0:29:53 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 01.02.2024 0:29:53 ******/
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
SET IDENTITY_INSERT [dbo].[EventType] ON 

INSERT [dbo].[EventType] ([Id], [Title]) VALUES (1, N'лабораторное исследование')
INSERT [dbo].[EventType] ([Id], [Title]) VALUES (2, N'инструментальная диагностика')
INSERT [dbo].[EventType] ([Id], [Title]) VALUES (3, N'лекарственная терапия')
INSERT [dbo].[EventType] ([Id], [Title]) VALUES (4, N'физиотерапия')
INSERT [dbo].[EventType] ([Id], [Title]) VALUES (5, N'хирургическое лечение')
SET IDENTITY_INSERT [dbo].[EventType] OFF
SET IDENTITY_INSERT [dbo].[Hospitalization] ON 

INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (1, CAST(N'2023-12-09T22:36:00.000' AS DateTime), 1, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (2, CAST(N'2023-03-16T19:17:00.000' AS DateTime), 2, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (3, CAST(N'2025-01-08T08:00:00.000' AS DateTime), 3, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (4, CAST(N'2023-10-31T13:23:00.000' AS DateTime), 4, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (5, CAST(N'2023-10-16T10:10:00.000' AS DateTime), 5, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (6, CAST(N'2023-07-11T01:46:00.000' AS DateTime), 6, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (7, CAST(N'2024-02-06T05:29:00.000' AS DateTime), 7, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (8, CAST(N'2024-10-17T18:41:00.000' AS DateTime), 8, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (9, CAST(N'2023-09-06T03:48:00.000' AS DateTime), 9, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (10, CAST(N'2024-03-15T20:52:00.000' AS DateTime), 10, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (11, CAST(N'2024-04-02T08:38:00.000' AS DateTime), 11, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (12, CAST(N'2023-09-03T22:33:00.000' AS DateTime), 12, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (13, CAST(N'2024-06-09T11:32:00.000' AS DateTime), 13, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (14, CAST(N'2024-01-11T23:03:00.000' AS DateTime), 14, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (15, CAST(N'2023-10-31T01:23:00.000' AS DateTime), 15, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (16, CAST(N'2023-09-28T07:24:00.000' AS DateTime), 16, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (17, CAST(N'2024-06-04T14:12:00.000' AS DateTime), 17, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (18, CAST(N'2023-02-03T18:07:00.000' AS DateTime), 18, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (19, CAST(N'2024-02-16T15:20:00.000' AS DateTime), 19, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (20, CAST(N'2023-09-05T04:39:00.000' AS DateTime), 20, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (21, CAST(N'2024-11-24T06:29:00.000' AS DateTime), 21, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (22, CAST(N'2024-10-05T18:25:00.000' AS DateTime), 22, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (23, CAST(N'2024-02-01T17:03:00.000' AS DateTime), 23, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (24, CAST(N'2024-03-25T22:52:00.000' AS DateTime), 24, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (25, CAST(N'2024-02-07T23:43:00.000' AS DateTime), 25, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (26, CAST(N'2023-04-16T19:24:00.000' AS DateTime), 26, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (27, CAST(N'2024-09-18T18:34:00.000' AS DateTime), 27, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (28, CAST(N'2023-08-19T14:10:00.000' AS DateTime), 28, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (29, CAST(N'2023-11-29T10:48:00.000' AS DateTime), 29, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (30, CAST(N'2024-11-16T10:22:00.000' AS DateTime), 30, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (31, CAST(N'2023-11-26T05:16:00.000' AS DateTime), 31, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (32, CAST(N'2023-10-23T14:35:00.000' AS DateTime), 32, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (33, CAST(N'2023-03-26T20:49:00.000' AS DateTime), 33, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (34, CAST(N'2023-09-16T13:24:00.000' AS DateTime), 34, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (35, CAST(N'2023-02-15T18:35:00.000' AS DateTime), 35, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (36, CAST(N'2025-01-11T11:37:00.000' AS DateTime), 36, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (37, CAST(N'2024-11-06T23:00:00.000' AS DateTime), 37, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (38, CAST(N'2025-01-27T03:21:00.000' AS DateTime), 38, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (39, CAST(N'2023-03-01T10:58:00.000' AS DateTime), 39, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (40, CAST(N'2024-08-20T05:11:00.000' AS DateTime), 40, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (41, CAST(N'2023-10-14T04:36:00.000' AS DateTime), 41, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (42, CAST(N'2024-02-21T20:39:00.000' AS DateTime), 42, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (43, CAST(N'2023-03-17T01:42:00.000' AS DateTime), 43, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (44, CAST(N'2024-08-01T02:32:00.000' AS DateTime), 44, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (45, CAST(N'2023-02-26T17:44:00.000' AS DateTime), 45, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (46, CAST(N'2024-10-08T22:19:00.000' AS DateTime), 46, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (47, CAST(N'2023-09-27T03:23:00.000' AS DateTime), 47, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (48, CAST(N'2023-06-12T05:46:00.000' AS DateTime), 48, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (49, CAST(N'2023-10-19T22:09:00.000' AS DateTime), 49, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (50, CAST(N'2023-02-24T07:14:00.000' AS DateTime), 50, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (51, CAST(N'2024-08-06T11:38:00.000' AS DateTime), 51, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (52, CAST(N'2023-11-07T21:57:00.000' AS DateTime), 52, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (53, CAST(N'2024-01-01T04:54:00.000' AS DateTime), 53, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (54, CAST(N'2024-01-02T21:23:00.000' AS DateTime), 54, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (55, CAST(N'2023-11-01T14:15:00.000' AS DateTime), 55, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (56, CAST(N'2024-06-15T17:22:00.000' AS DateTime), 56, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (57, CAST(N'2024-12-21T22:14:00.000' AS DateTime), 57, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (58, CAST(N'2024-03-14T22:36:00.000' AS DateTime), 58, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (59, CAST(N'2023-11-11T21:16:00.000' AS DateTime), 59, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (60, CAST(N'2023-12-07T17:02:00.000' AS DateTime), 60, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (61, CAST(N'2023-11-17T02:10:00.000' AS DateTime), 61, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (62, CAST(N'2024-04-18T10:44:00.000' AS DateTime), 62, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (63, CAST(N'2025-01-16T07:01:00.000' AS DateTime), 63, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (64, CAST(N'2024-05-27T18:51:00.000' AS DateTime), 64, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (65, CAST(N'2024-10-22T04:52:00.000' AS DateTime), 65, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (66, CAST(N'2023-06-07T13:00:00.000' AS DateTime), 66, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (67, CAST(N'2023-11-18T12:45:00.000' AS DateTime), 67, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (68, CAST(N'2024-07-18T10:23:00.000' AS DateTime), 68, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (69, CAST(N'2023-10-29T23:43:00.000' AS DateTime), 69, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (70, CAST(N'2023-09-27T23:48:00.000' AS DateTime), 70, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (71, CAST(N'2023-10-29T12:17:00.000' AS DateTime), 71, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (72, CAST(N'2024-06-27T05:21:00.000' AS DateTime), 72, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (73, CAST(N'2023-09-05T08:03:00.000' AS DateTime), 73, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (74, CAST(N'2024-10-07T18:52:00.000' AS DateTime), 74, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (75, CAST(N'2024-10-09T23:49:00.000' AS DateTime), 75, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (76, CAST(N'2024-12-21T10:02:00.000' AS DateTime), 76, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (77, CAST(N'2023-07-11T22:07:00.000' AS DateTime), 77, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (78, CAST(N'2024-11-08T07:52:00.000' AS DateTime), 78, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (79, CAST(N'2023-04-10T21:51:00.000' AS DateTime), 79, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (80, CAST(N'2024-10-10T22:26:00.000' AS DateTime), 80, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (81, CAST(N'2024-12-04T03:08:00.000' AS DateTime), 81, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (82, CAST(N'2024-09-16T23:06:00.000' AS DateTime), 82, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (83, CAST(N'2023-06-28T23:27:00.000' AS DateTime), 83, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (84, CAST(N'2023-07-28T01:50:00.000' AS DateTime), 84, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (85, CAST(N'2024-06-06T16:04:00.000' AS DateTime), 85, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (86, CAST(N'2023-12-04T00:11:00.000' AS DateTime), 86, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (87, CAST(N'2024-05-11T07:37:00.000' AS DateTime), 87, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (88, CAST(N'2023-03-05T22:54:00.000' AS DateTime), 88, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (89, CAST(N'2024-09-11T05:52:00.000' AS DateTime), 89, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (90, CAST(N'2024-08-20T21:29:00.000' AS DateTime), 90, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (91, CAST(N'2024-04-29T02:16:00.000' AS DateTime), 91, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (92, CAST(N'2023-04-02T00:19:00.000' AS DateTime), 92, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (93, CAST(N'2023-02-06T17:03:00.000' AS DateTime), 93, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (94, CAST(N'2024-05-08T15:08:00.000' AS DateTime), 94, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (95, CAST(N'2023-12-02T00:26:00.000' AS DateTime), 95, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (96, CAST(N'2023-11-10T11:09:00.000' AS DateTime), 96, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (97, CAST(N'2023-04-04T19:37:00.000' AS DateTime), 97, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (98, CAST(N'2024-01-10T12:02:00.000' AS DateTime), 98, 0, 0, N'')
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (99, CAST(N'2023-04-20T19:20:00.000' AS DateTime), 99, 0, 0, N'')
GO
INSERT [dbo].[Hospitalization] ([Id], [Datetime], [HospitalizationReferralId], [RefusalByPatient], [Cancellation], [CancellationReason]) VALUES (100, CAST(N'2023-11-05T22:07:00.000' AS DateTime), 100, 0, 0, N'')
SET IDENTITY_INSERT [dbo].[Hospitalization] OFF
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
SET IDENTITY_INSERT [dbo].[Medcard] ON 

INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1001, CAST(N'2023-02-28' AS Date), N'', CAST(N'2023-02-28' AS Date), NULL, N'QRcard1001.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1002, CAST(N'2022-10-02' AS Date), N'', CAST(N'2022-10-02' AS Date), NULL, N'QRcard1002.jpg')
INSERT [dbo].[Medcard] ([Id], [IssueDate], [Diagnosis], [LastVisitDate], [NextVisitDate], [QR]) VALUES (1003, CAST(N'2023-01-11' AS Date), N'', CAST(N'2023-01-11' AS Date), NULL, N'QRcard1003.jpg')
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
SET IDENTITY_INSERT [dbo].[Medcard] OFF
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
SET IDENTITY_INSERT [dbo].[Patient] OFF
INSERT [dbo].[Role] ([Id], [Title], [AccessLevel]) VALUES (1, N'администратор', 1)
INSERT [dbo].[Role] ([Id], [Title], [AccessLevel]) VALUES (2, N'сотрудник регистратуры', 2)
INSERT [dbo].[Role] ([Id], [Title], [AccessLevel]) VALUES (3, N'специалист основных подразделений', 3)
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
/****** Object:  Index [IX_Hospitalization]    Script Date: 01.02.2024 0:29:53 ******/
ALTER TABLE [dbo].[Hospitalization] ADD  CONSTRAINT [IX_Hospitalization] UNIQUE NONCLUSTERED 
(
	[HospitalizationReferralId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Patient]    Script Date: 01.02.2024 0:29:53 ******/
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
USE [master]
GO
ALTER DATABASE [PROF2024] SET  READ_WRITE 
GO
