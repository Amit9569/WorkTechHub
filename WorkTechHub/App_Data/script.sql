USE [WorkTechHubDB]
GO
/****** Object:  Table [dbo].[DeveloperMaster]    Script Date: 23-09-2023 11:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeveloperMaster](
	[Name] [varchar](200) NULL,
	[Email_Id] [varchar](150) NOT NULL,
	[Mobile_No] [varchar](15) NULL,
	[Qualification] [varchar](90) NULL,
	[Gender] [varchar](15) NULL,
	[Address] [varchar](300) NULL,
	[Designation] [varchar](150) NULL,
	[ProfilePic] [varchar](300) NULL,
	[Registered_on] [datetime] NULL,
 CONSTRAINT [PK_DeveloperMaster] PRIMARY KEY CLUSTERED 
(
	[Email_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnquiryMaster]    Script Date: 23-09-2023 11:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryMaster](
	[Enq_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[EmailId] [varchar](100) NULL,
	[MobNo] [varchar](30) NULL,
	[Query] [varchar](max) NULL,
	[Enq_DT] [datetime] NULL,
 CONSTRAINT [PK_EnquiryMaster] PRIMARY KEY CLUSTERED 
(
	[Enq_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackMaster]    Script Date: 23-09-2023 11:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackMaster](
	[Fid] [int] IDENTITY(1,1) NOT NULL,
	[Feedback_Title] [varchar](70) NULL,
	[Feedback_detail] [varchar](max) NULL,
	[Developerid] [varchar](150) NULL,
	[MsgDT] [datetime] NULL,
 CONSTRAINT [PK_FeedbackMaster] PRIMARY KEY CLUSTERED 
(
	[Fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginMaster]    Script Date: 23-09-2023 11:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginMaster](
	[Email_Id] [varchar](150) NOT NULL,
	[Pass_word] [varchar](200) NULL,
	[Utype] [varchar](100) NULL,
 CONSTRAINT [PK_LoginMaster] PRIMARY KEY CLUSTERED 
(
	[Email_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationMaster]    Script Date: 23-09-2023 11:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationMaster](
	[Nid] [int] IDENTITY(1,1) NOT NULL,
	[NMsg] [varchar](max) NULL,
	[NDT] [varchar](30) NULL,
 CONSTRAINT [PK_NotificationMaster] PRIMARY KEY CLUSTERED 
(
	[Nid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectMaster]    Script Date: 23-09-2023 11:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectMaster](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](150) NULL,
	[Deadline] [datetime] NULL,
	[Descripition] [varchar](max) NULL,
	[ProjectFile] [varchar](150) NULL,
	[PostedOn] [datetime] NULL,
 CONSTRAINT [PK_ProjectMaster] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestMaster]    Script Date: 23-09-2023 11:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestMaster](
	[RequestId] [int] IDENTITY(1,1) NOT NULL,
	[RequestedFor] [int] NULL,
	[RequestMsg] [varchar](300) NULL,
	[RequestedBy] [varchar](150) NULL,
	[RequestDt] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_RequestMaster] PRIMARY KEY CLUSTERED 
(
	[RequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskMaster]    Script Date: 23-09-2023 11:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskMaster](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[ForDeveloper] [varchar](150) NULL,
	[ForDate] [datetime] NULL,
	[TaskTitle] [varchar](150) NULL,
	[TaskDescription] [varchar](max) NULL,
	[TaskFile] [varchar](250) NULL,
	[UploadedOn] [datetime] NULL,
 CONSTRAINT [PK_TaskMaster] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UploadCodeMaster]    Script Date: 23-09-2023 11:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UploadCodeMaster](
	[UploadId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](200) NULL,
	[Descripition] [varchar](max) NULL,
	[UploadedBy] [varchar](150) NULL,
	[CodeFileName] [varchar](150) NULL,
	[UploadedOn] [datetime] NULL,
 CONSTRAINT [PK_UploadCodeMaster] PRIMARY KEY CLUSTERED 
(
	[UploadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkReportMaster]    Script Date: 23-09-2023 11:50:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkReportMaster](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](200) NULL,
	[Description] [varchar](200) NULL,
	[WorkDate] [datetime] NULL,
	[IsHelpNeeded] [bit] NULL,
	[SubmittedBy] [varchar](150) NULL,
	[SubmittedOn] [datetime] NULL,
 CONSTRAINT [PK_WorkReportMaster] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[DeveloperMaster] ([Name], [Email_Id], [Mobile_No], [Qualification], [Gender], [Address], [Designation], [ProfilePic], [Registered_on]) VALUES (N'Vikash yadav', N'003yunew20@gmail.com', N'9569686454', N'Diploma(It)', N'Male', N'Village and post Kayar,Jaunpur.', N'Database Administrator (DBA)', NULL, CAST(N'2023-09-22T23:23:15.120' AS DateTime))
INSERT [dbo].[DeveloperMaster] ([Name], [Email_Id], [Mobile_No], [Qualification], [Gender], [Address], [Designation], [ProfilePic], [Registered_on]) VALUES (N'Akshat kumar', N'akshatkumar8709981902@gmail.com', N'8709981902', N'Diploma(cs)', N'Male', N'Bhiar, Aurangabad.', N'Software Engineer', N'hio5ktmq.5tcIMG20230816140323.jpg', CAST(N'2023-09-20T00:08:13.170' AS DateTime))
INSERT [dbo].[DeveloperMaster] ([Name], [Email_Id], [Mobile_No], [Qualification], [Gender], [Address], [Designation], [ProfilePic], [Registered_on]) VALUES (N'Amit Kumar Yadav', N'amit12@gmail.com', N'9569683207', N'Marticulation(10th)', N'Male', N'khalilpur', N'DevOps Engineer', N'ett2iedu.tjpIMG_20230820_155329.jpg', CAST(N'2023-09-12T16:52:01.410' AS DateTime))
INSERT [dbo].[DeveloperMaster] ([Name], [Email_Id], [Mobile_No], [Qualification], [Gender], [Address], [Designation], [ProfilePic], [Registered_on]) VALUES (N'Amit yadav', N'amit974403727250@gmail.com', N'9569683207', N'Diploma(cs)', N'Male', N'Khalilpur,Jaunpur', N'Software Engineer', NULL, CAST(N'2023-09-19T15:35:10.817' AS DateTime))
INSERT [dbo].[DeveloperMaster] ([Name], [Email_Id], [Mobile_No], [Qualification], [Gender], [Address], [Designation], [ProfilePic], [Registered_on]) VALUES (N'Ansh Yadav', N'anshyaduvanshi82@mail.com', N'9452340325', N'BSC', N'Male', N'Village and Post Khalilpur, Jaunpur.', N'Software Engineer', NULL, CAST(N'2023-09-22T12:56:19.000' AS DateTime))
INSERT [dbo].[DeveloperMaster] ([Name], [Email_Id], [Mobile_No], [Qualification], [Gender], [Address], [Designation], [ProfilePic], [Registered_on]) VALUES (N'Nikhil singh', N'nikh13435@gmail.com', N'9658321547', N'Diploma(cs)', N'Male', N'Martinganj, Azamgarh.', N'Database Administrator (DBA)', NULL, CAST(N'2023-09-21T12:53:09.977' AS DateTime))
INSERT [dbo].[DeveloperMaster] ([Name], [Email_Id], [Mobile_No], [Qualification], [Gender], [Address], [Designation], [ProfilePic], [Registered_on]) VALUES (N'Ram Yadav', N'ramachalyadav596@gmail.com', N'9321840778', N'BSC', N'Male', N' Village and Post Khalilpur,Jaunpur.', N'Junior/Associate Developer', NULL, CAST(N'2023-09-22T23:49:08.350' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[EnquiryMaster] ON 

INSERT [dbo].[EnquiryMaster] ([Enq_Id], [Name], [EmailId], [MobNo], [Query], [Enq_DT]) VALUES (4, N'Amit kumar yadav', N'amit@1234gmail.com', N'9569683207', N'this is infor you that it is very good for you.', CAST(N'2023-09-14T14:12:37.810' AS DateTime))
INSERT [dbo].[EnquiryMaster] ([Enq_Id], [Name], [EmailId], [MobNo], [Query], [Enq_DT]) VALUES (7, N'Vikas yadav', N'vikas@gmail.com', N'5896478451', N'how are you?', CAST(N'2023-09-18T12:34:29.400' AS DateTime))
INSERT [dbo].[EnquiryMaster] ([Enq_Id], [Name], [EmailId], [MobNo], [Query], [Enq_DT]) VALUES (8, N'Amit yadav', N'amit12@gmail.com', N'80521558645', N'There is no query?', CAST(N'2023-09-18T13:43:26.780' AS DateTime))
INSERT [dbo].[EnquiryMaster] ([Enq_Id], [Name], [EmailId], [MobNo], [Query], [Enq_DT]) VALUES (9, N'Amit Kumar Yadav', N'amit974403727250@gmail.com', N'9569683207', N'I have already done.', CAST(N'2023-09-19T15:37:34.990' AS DateTime))
INSERT [dbo].[EnquiryMaster] ([Enq_Id], [Name], [EmailId], [MobNo], [Query], [Enq_DT]) VALUES (10, N'Kaif ', N'009avaneesh@gmail.com', N'8948411270', N'I am interested in this portal. So I want to all about this portal.', CAST(N'2023-09-21T01:55:05.517' AS DateTime))
INSERT [dbo].[EnquiryMaster] ([Enq_Id], [Name], [EmailId], [MobNo], [Query], [Enq_DT]) VALUES (11, NULL, NULL, NULL, NULL, CAST(N'2023-09-23T11:28:50.063' AS DateTime))
SET IDENTITY_INSERT [dbo].[EnquiryMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedbackMaster] ON 

INSERT [dbo].[FeedbackMaster] ([Fid], [Feedback_Title], [Feedback_detail], [Developerid], [MsgDT]) VALUES (9, N'For me', N'Hii how are you? Are you better.', N'amit12@gmail.com', CAST(N'2023-09-22T02:44:45.627' AS DateTime))
INSERT [dbo].[FeedbackMaster] ([Fid], [Feedback_Title], [Feedback_detail], [Developerid], [MsgDT]) VALUES (10, N'Manager', N'Sir you are really great and brilliant.', N'amit12@gmail.com', CAST(N'2023-09-23T01:18:25.243' AS DateTime))
INSERT [dbo].[FeedbackMaster] ([Fid], [Feedback_Title], [Feedback_detail], [Developerid], [MsgDT]) VALUES (11, N'Project submission', N'Sir project submission of my team is completed sucessfully in your guidance.I really thanks thanks for this.', N'amit12@gmail.com', CAST(N'2023-09-23T10:17:04.343' AS DateTime))
SET IDENTITY_INSERT [dbo].[FeedbackMaster] OFF
GO
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'003yunew20@gmail.com', N'234567', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'akshatkumar8709981902@gmail.com', N'2345', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'amit@gmail.com', N'234567', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'amit12@gmail.com', N'ZMIT@3117', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'amit974403727250@gmail.com', N'2345', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'amityadav@gmail.com', N'ZMIT@3116', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'anshyaduvanshi82@mail.com', N'23456', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'm', NULL, NULL)
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'manager@gmail.com', N'ZMIT@3118', N'ADMIN')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'nikh13435@gmail.com', N'23456', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'nikhil@gmail.com', N'MIKHIL@3118', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'nikhil12@gmail.com', N'2345', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'rahul@2007', N'IAHUL@3118', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'ramachalyadav596@gmail.com', N'234567', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'satyam@gmail.com', N'23456', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'shubham@gmail.com', N'56789:', N'DEVELOPER')
INSERT [dbo].[LoginMaster] ([Email_Id], [Pass_word], [Utype]) VALUES (N'suresh@gmail.com', N'2345', N'DEVELOPER')
GO
SET IDENTITY_INSERT [dbo].[NotificationMaster] ON 

INSERT [dbo].[NotificationMaster] ([Nid], [NMsg], [NDT]) VALUES (6, N'This is to inform you that tomorrow is meeting of our team at zoom.', N'18-09-2023 00:42:13')
INSERT [dbo].[NotificationMaster] ([Nid], [NMsg], [NDT]) VALUES (14, N'Today is your pre project submission.Please submit your project on time.
', N'22-09-2023 06:25:41')
INSERT [dbo].[NotificationMaster] ([Nid], [NMsg], [NDT]) VALUES (15, N'Today is your final project submission so every one submit their project on time. ', N'22-09-2023 23:54:20')
INSERT [dbo].[NotificationMaster] ([Nid], [NMsg], [NDT]) VALUES (16, N'Tomorrow is your farewell party at kss .', N'23-09-2023 01:39:32')
SET IDENTITY_INSERT [dbo].[NotificationMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[ProjectMaster] ON 

INSERT [dbo].[ProjectMaster] ([ProjectId], [Title], [Deadline], [Descripition], [ProjectFile], [PostedOn]) VALUES (2, N'study corner', CAST(N'2023-09-21T00:00:00.000' AS DateTime), N'this project is completed', N'wcl5xad5.xvjglow.zip', CAST(N'2023-09-19T18:40:00.283' AS DateTime))
INSERT [dbo].[ProjectMaster] ([ProjectId], [Title], [Deadline], [Descripition], [ProjectFile], [PostedOn]) VALUES (3, N'lost and found ', CAST(N'2023-09-14T00:00:00.000' AS DateTime), N'This project is about lost and found thing', N'vsrgmiy1.zhfscholarshipstatusfirstyear.pdf', CAST(N'2023-09-19T18:41:09.823' AS DateTime))
INSERT [dbo].[ProjectMaster] ([ProjectId], [Title], [Deadline], [Descripition], [ProjectFile], [PostedOn]) VALUES (4, N'Personal Portfolio', CAST(N'2023-09-29T00:00:00.000' AS DateTime), N'These is personal portfolio project of a youtuber.', N'ywu4z0dy.hmzvsrgmiy1.zhfscholarshipstatusfirstyear.pdf', CAST(N'2023-09-19T23:18:06.613' AS DateTime))
INSERT [dbo].[ProjectMaster] ([ProjectId], [Title], [Deadline], [Descripition], [ProjectFile], [PostedOn]) VALUES (5, N'School website', CAST(N'2023-09-02T00:00:00.000' AS DateTime), N'This is very important project. So design it fast.', N'aou3ze3v.pv5wzcqkhfy.ykjbusiness-support-concept-illustration (1).zip', CAST(N'2023-09-20T11:45:00.093' AS DateTime))
INSERT [dbo].[ProjectMaster] ([ProjectId], [Title], [Deadline], [Descripition], [ProjectFile], [PostedOn]) VALUES (6, N'School website', CAST(N'2023-09-02T00:00:00.000' AS DateTime), N'This is very important project. So design it fast.', N'4w0fmrdm.uhfwzcqkhfy.ykjbusiness-support-concept-illustration (1).zip', CAST(N'2023-09-20T11:45:10.697' AS DateTime))
INSERT [dbo].[ProjectMaster] ([ProjectId], [Title], [Deadline], [Descripition], [ProjectFile], [PostedOn]) VALUES (7, N'Ak coaching centre', CAST(N'2023-09-09T00:00:00.000' AS DateTime), N'This is a project of coaching .This  project is important. ', N'wwuh5q50.y50isometric-time-management-concept-illustrated.zip', CAST(N'2023-09-21T02:27:20.097' AS DateTime))
INSERT [dbo].[ProjectMaster] ([ProjectId], [Title], [Deadline], [Descripition], [ProjectFile], [PostedOn]) VALUES (8, N'Local Tourist', CAST(N'2023-09-30T00:00:00.000' AS DateTime), N'In  this project we want to make  web portal of local tourist.', N'ckwefppm.e30scholarshipstatusfirstyear.pdf', CAST(N'2023-09-22T03:28:07.640' AS DateTime))
INSERT [dbo].[ProjectMaster] ([ProjectId], [Title], [Deadline], [Descripition], [ProjectFile], [PostedOn]) VALUES (9, N'Aditya Medical store', CAST(N'2023-09-29T00:00:00.000' AS DateTime), N'This project is about to make a website of a medical store .', N'slrea1kz.0xdbusiness-support-concept-illustration.zip', CAST(N'2023-09-23T09:12:50.900' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProjectMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestMaster] ON 

INSERT [dbo].[RequestMaster] ([RequestId], [RequestedFor], [RequestMsg], [RequestedBy], [RequestDt], [Status]) VALUES (2, 3, N'I want to work on this project.', N'amit12@gmail.com', CAST(N'2023-09-20T09:23:42.393' AS DateTime), NULL)
INSERT [dbo].[RequestMaster] ([RequestId], [RequestedFor], [RequestMsg], [RequestedBy], [RequestDt], [Status]) VALUES (3, 7, N'I am interested in this project.', N'amit12@gmail.com', CAST(N'2023-09-21T02:29:12.927' AS DateTime), NULL)
INSERT [dbo].[RequestMaster] ([RequestId], [RequestedFor], [RequestMsg], [RequestedBy], [RequestDt], [Status]) VALUES (5, 9, N'Sir ,I want to work on this project. So sir  please assign me this project.', N'amit12@gmail.com', CAST(N'2023-09-23T10:08:49.523' AS DateTime), NULL)
INSERT [dbo].[RequestMaster] ([RequestId], [RequestedFor], [RequestMsg], [RequestedBy], [RequestDt], [Status]) VALUES (6, 7, N'I am interested in this project. So sir you can handover this project to me.', N'amit12@gmail.com', CAST(N'2023-09-23T10:10:16.540' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[RequestMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskMaster] ON 

INSERT [dbo].[TaskMaster] ([TaskId], [ForDeveloper], [ForDate], [TaskTitle], [TaskDescription], [TaskFile], [UploadedOn]) VALUES (6, N'amit12@gmail.com', CAST(N'2023-09-09T00:00:00.000' AS DateTime), N'Home page', N'This is a special task for you', N'a5gfbwn4.vtcTechWorkPortal-logos (1).zip', CAST(N'2023-09-22T16:55:14.627' AS DateTime))
INSERT [dbo].[TaskMaster] ([TaskId], [ForDeveloper], [ForDate], [TaskTitle], [TaskDescription], [TaskFile], [UploadedOn]) VALUES (7, N'amit12@gmail.com', CAST(N'2023-09-29T00:00:00.000' AS DateTime), N'Bootstrap 5', N'Complete the task fast as soon as possible.', N'zinfo5x2.1xubusiness-support-concept-illustration.zip', CAST(N'2023-09-23T01:53:42.940' AS DateTime))
INSERT [dbo].[TaskMaster] ([TaskId], [ForDeveloper], [ForDate], [TaskTitle], [TaskDescription], [TaskFile], [UploadedOn]) VALUES (8, N'amit12@gmail.com', CAST(N'2023-09-28T00:00:00.000' AS DateTime), N'Random Code Generator', N'Your task is to create a random code generator .So complete your task on time. ', N'qpndesvs.lldwwuh5q50.y50isometric-time-management-concept-illustrated.zip', CAST(N'2023-09-23T10:06:59.817' AS DateTime))
SET IDENTITY_INSERT [dbo].[TaskMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[UploadCodeMaster] ON 

INSERT [dbo].[UploadCodeMaster] ([UploadId], [Title], [Descripition], [UploadedBy], [CodeFileName], [UploadedOn]) VALUES (1, N' Employee Portfolio', N'Code for this.', N'amit12@gmail.com', N'wzcqkhfy.ykjbusiness-support-concept-illustration.zip', CAST(N'2023-09-16T09:51:06.857' AS DateTime))
INSERT [dbo].[UploadCodeMaster] ([UploadId], [Title], [Descripition], [UploadedBy], [CodeFileName], [UploadedOn]) VALUES (2, N'Ecommerce website', N'Code for this', N'amit12@gmail.com', N'arq4i4u1.fpvTechWorkPortal-logos (1).zip', CAST(N'2023-09-18T17:21:03.280' AS DateTime))
INSERT [dbo].[UploadCodeMaster] ([UploadId], [Title], [Descripition], [UploadedBy], [CodeFileName], [UploadedOn]) VALUES (3, N'techwork website', N'This code is for this website', N'amit12@gmail.com', N'b1w2taux.qmjaou3ze3v.pv5wzcqkhfy.ykjbusiness-support-concept-illustration (1).zip', CAST(N'2023-09-22T02:39:23.547' AS DateTime))
INSERT [dbo].[UploadCodeMaster] ([UploadId], [Title], [Descripition], [UploadedBy], [CodeFileName], [UploadedOn]) VALUES (4, N'Index page', N'This code is for our index page of the website.', N'amit12@gmail.com', N'zzytnkwl.yv4scholarshipstatusfirstyear.pdf', CAST(N'2023-09-22T02:42:48.787' AS DateTime))
INSERT [dbo].[UploadCodeMaster] ([UploadId], [Title], [Descripition], [UploadedBy], [CodeFileName], [UploadedOn]) VALUES (5, N'  Javascript', N'   This is important code of javascript.', N'amit12@gmail.com', N'0ljaj21k.m1pwzcqkhfy.ykjbusiness-support-concept-illustration (1).zip', CAST(N'2023-09-23T00:57:21.747' AS DateTime))
SET IDENTITY_INSERT [dbo].[UploadCodeMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkReportMaster] ON 

INSERT [dbo].[WorkReportMaster] ([ReportId], [Title], [Description], [WorkDate], [IsHelpNeeded], [SubmittedBy], [SubmittedOn]) VALUES (15, N'Project work', N'Nearby 80% of  project work is done .', CAST(N'2023-09-29T00:00:00.000' AS DateTime), 1, N'amit12@gmail.com', CAST(N'2023-09-23T01:09:58.337' AS DateTime))
SET IDENTITY_INSERT [dbo].[WorkReportMaster] OFF
GO
ALTER TABLE [dbo].[FeedbackMaster]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackMaster_DeveloperMaster] FOREIGN KEY([Developerid])
REFERENCES [dbo].[DeveloperMaster] ([Email_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FeedbackMaster] CHECK CONSTRAINT [FK_FeedbackMaster_DeveloperMaster]
GO
ALTER TABLE [dbo].[RequestMaster]  WITH CHECK ADD  CONSTRAINT [FK_RequestMaster_DeveloperMaster] FOREIGN KEY([RequestedBy])
REFERENCES [dbo].[DeveloperMaster] ([Email_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RequestMaster] CHECK CONSTRAINT [FK_RequestMaster_DeveloperMaster]
GO
ALTER TABLE [dbo].[RequestMaster]  WITH CHECK ADD  CONSTRAINT [FK_RequestMaster_ProjectMaster] FOREIGN KEY([RequestedFor])
REFERENCES [dbo].[ProjectMaster] ([ProjectId])
GO
ALTER TABLE [dbo].[RequestMaster] CHECK CONSTRAINT [FK_RequestMaster_ProjectMaster]
GO
ALTER TABLE [dbo].[TaskMaster]  WITH CHECK ADD  CONSTRAINT [FK_TaskMaster_DeveloperMaster] FOREIGN KEY([ForDeveloper])
REFERENCES [dbo].[DeveloperMaster] ([Email_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaskMaster] CHECK CONSTRAINT [FK_TaskMaster_DeveloperMaster]
GO
ALTER TABLE [dbo].[UploadCodeMaster]  WITH CHECK ADD  CONSTRAINT [FK_UploadCodeMaster_DeveloperMaster] FOREIGN KEY([UploadedBy])
REFERENCES [dbo].[DeveloperMaster] ([Email_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UploadCodeMaster] CHECK CONSTRAINT [FK_UploadCodeMaster_DeveloperMaster]
GO
ALTER TABLE [dbo].[WorkReportMaster]  WITH CHECK ADD  CONSTRAINT [FK_WorkReportMaster_DeveloperMaster] FOREIGN KEY([SubmittedBy])
REFERENCES [dbo].[DeveloperMaster] ([Email_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkReportMaster] CHECK CONSTRAINT [FK_WorkReportMaster_DeveloperMaster]
GO
