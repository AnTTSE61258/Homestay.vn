USE [Homestay]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/28/2014 14:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[CreatedDate] [date] NULL,
	[LastModifiedDate] [date] NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [numeric](18, 0) NULL,
	[Email] [nvarchar](50) NULL,
	[UserScore] [int] NULL,
	[ScoreDate] [date] NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScoreLog]    Script Date: 10/28/2014 14:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScoreLog](
	[UserID] [int] NOT NULL,
	[FromUserID] [int] NOT NULL,
	[Score] [int] NULL,
	[DateScore] [date] NULL,
 CONSTRAINT [PK_ValidateUserScore_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[FromUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 10/28/2014 14:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[House](
	[HouseID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Price] [money] NULL,
	[Title] [nvarchar](50) NULL,
	[Detail] [nvarchar](max) NOT NULL,
	[Status] [bit] NULL,
	[Address] [nvarchar](max) NOT NULL,
	[AvailableDate] [varchar](20) NULL,
	[HouseScore] [int] NOT NULL,
	[NORating] [int] NOT NULL,
	[RatingDate] [date] NULL,
 CONSTRAINT [PK_House] PRIMARY KEY CLUSTERED 
(
	[HouseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 10/28/2014 14:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[HouseID] [int] NOT NULL,
	[CommentDate] [date] NOT NULL,
	[Details] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Comment_1] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 10/28/2014 14:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[HouseID] [int] NOT NULL,
	[BookingDate] [date] NULL,
	[Status] [bit] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK_Booking_1] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RatingLog]    Script Date: 10/28/2014 14:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RatingLog](
	[UserID] [int] NOT NULL,
	[HouseID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[DateRating] [date] NOT NULL,
 CONSTRAINT [PK_ValidateHouseRating] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[HouseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImageSaver]    Script Date: 10/28/2014 14:57:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageSaver](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[HouseID] [int] NOT NULL,
	[Image] [image] NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Default [DF_House_HouseScore]    Script Date: 10/28/2014 14:57:48 ******/
ALTER TABLE [dbo].[House] ADD  CONSTRAINT [DF_House_HouseScore]  DEFAULT ((0)) FOR [HouseScore]
GO
/****** Object:  Default [DF_House_NORating]    Script Date: 10/28/2014 14:57:48 ******/
ALTER TABLE [dbo].[House] ADD  CONSTRAINT [DF_House_NORating]  DEFAULT ((0)) FOR [NORating]
GO
/****** Object:  ForeignKey [FK_ValidateUserScore_User2]    Script Date: 10/28/2014 14:57:48 ******/
ALTER TABLE [dbo].[ScoreLog]  WITH CHECK ADD  CONSTRAINT [FK_ValidateUserScore_User2] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ScoreLog] CHECK CONSTRAINT [FK_ValidateUserScore_User2]
GO
/****** Object:  ForeignKey [FK_ValidateUserScore_User3]    Script Date: 10/28/2014 14:57:48 ******/
ALTER TABLE [dbo].[ScoreLog]  WITH CHECK ADD  CONSTRAINT [FK_ValidateUserScore_User3] FOREIGN KEY([FromUserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ScoreLog] CHECK CONSTRAINT [FK_ValidateUserScore_User3]
GO
/****** Object:  ForeignKey [FK_House_User]    Script Date: 10/28/2014 14:57:48 ******/
ALTER TABLE [dbo].[House]  WITH CHECK ADD  CONSTRAINT [FK_House_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[House] CHECK CONSTRAINT [FK_House_User]
GO
/****** Object:  ForeignKey [FK_Comment_House]    Script Date: 10/28/2014 14:57:48 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_House] FOREIGN KEY([HouseID])
REFERENCES [dbo].[House] ([HouseID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_House]
GO
/****** Object:  ForeignKey [FK_Comment_User1]    Script Date: 10/28/2014 14:57:48 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User1]
GO
/****** Object:  ForeignKey [FK_Booking_House1]    Script Date: 10/28/2014 14:57:48 ******/
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_House1] FOREIGN KEY([HouseID])
REFERENCES [dbo].[House] ([HouseID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_House1]
GO
/****** Object:  ForeignKey [FK_Booking_User1]    Script Date: 10/28/2014 14:57:48 ******/
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_User1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_User1]
GO
/****** Object:  ForeignKey [FK_ValidateHouseRating_House1]    Script Date: 10/28/2014 14:57:48 ******/
ALTER TABLE [dbo].[RatingLog]  WITH CHECK ADD  CONSTRAINT [FK_ValidateHouseRating_House1] FOREIGN KEY([HouseID])
REFERENCES [dbo].[House] ([HouseID])
GO
ALTER TABLE [dbo].[RatingLog] CHECK CONSTRAINT [FK_ValidateHouseRating_House1]
GO
/****** Object:  ForeignKey [FK_ValidateHouseRating_User1]    Script Date: 10/28/2014 14:57:48 ******/
ALTER TABLE [dbo].[RatingLog]  WITH CHECK ADD  CONSTRAINT [FK_ValidateHouseRating_User1] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[RatingLog] CHECK CONSTRAINT [FK_ValidateHouseRating_User1]
GO
/****** Object:  ForeignKey [FK_ImageSaver_House]    Script Date: 10/28/2014 14:57:48 ******/
ALTER TABLE [dbo].[ImageSaver]  WITH CHECK ADD  CONSTRAINT [FK_ImageSaver_House] FOREIGN KEY([HouseID])
REFERENCES [dbo].[House] ([HouseID])
GO
ALTER TABLE [dbo].[ImageSaver] CHECK CONSTRAINT [FK_ImageSaver_House]
GO
