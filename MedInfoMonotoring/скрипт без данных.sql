USE [master]
GO
/****** Object:  Database [PROF2024]    Script Date: 05.02.2024 16:28:59 ******/
CREATE DATABASE [PROF2024]
GO
USE [PROF2024]
GO
/****** Object:  Table [dbo].[DeseaseHistory]    Script Date: 05.02.2024 16:28:59 ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 05.02.2024 16:28:59 ******/
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
/****** Object:  Table [dbo].[EventType]    Script Date: 05.02.2024 16:28:59 ******/
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
/****** Object:  Table [dbo].[HospitalBed]    Script Date: 05.02.2024 16:28:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HospitalBed](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](2) NOT NULL,
	[WardId] [int] NOT NULL,
 CONSTRAINT [PK_HospitalBed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitalization]    Script Date: 05.02.2024 16:28:59 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Hospitalization] UNIQUE NONCLUSTERED 
(
	[HospitalizationReferralId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HospitalizationDepartment]    Script Date: 05.02.2024 16:28:59 ******/
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
/****** Object:  Table [dbo].[HospitalizationReferral]    Script Date: 05.02.2024 16:28:59 ******/
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
/****** Object:  Table [dbo].[Medcard]    Script Date: 05.02.2024 16:28:59 ******/
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
/****** Object:  Table [dbo].[Patient]    Script Date: 05.02.2024 16:28:59 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Patient] UNIQUE NONCLUSTERED 
(
	[MedcardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 05.02.2024 16:28:59 ******/
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
/****** Object:  Table [dbo].[Referral]    Script Date: 05.02.2024 16:28:59 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 05.02.2024 16:28:59 ******/
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
/****** Object:  Table [dbo].[Specialization]    Script Date: 05.02.2024 16:28:59 ******/
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
/****** Object:  Table [dbo].[TreatmentEvent]    Script Date: 05.02.2024 16:28:59 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 05.02.2024 16:28:59 ******/
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
/****** Object:  Table [dbo].[Ward]    Script Date: 05.02.2024 16:28:59 ******/
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
ALTER TABLE [dbo].[Ward]  WITH CHECK ADD  CONSTRAINT [FK_Ward_HospitalizationDepartment] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[HospitalizationDepartment] ([Id])
GO
ALTER TABLE [dbo].[Ward] CHECK CONSTRAINT [FK_Ward_HospitalizationDepartment]
GO
USE [master]
GO
ALTER DATABASE [PROF2024] SET  READ_WRITE 
GO
