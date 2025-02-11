USE [master]
GO
/****** Object:  Database [Unilib]    Script Date: 11/05/2012 23:56:02 ******/
CREATE DATABASE [Unilib]
GO
ALTER DATABASE [Unilib] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Unilib].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Unilib] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Unilib] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Unilib] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Unilib] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Unilib] SET ARITHABORT OFF
GO
ALTER DATABASE [Unilib] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Unilib] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Unilib] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Unilib] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Unilib] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Unilib] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Unilib] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Unilib] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Unilib] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Unilib] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Unilib] SET  DISABLE_BROKER
GO
ALTER DATABASE [Unilib] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Unilib] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Unilib] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Unilib] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Unilib] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Unilib] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Unilib] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Unilib] SET  READ_WRITE
GO
ALTER DATABASE [Unilib] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Unilib] SET  MULTI_USER
GO
ALTER DATABASE [Unilib] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Unilib] SET DB_CHAINING OFF
GO
USE [Unilib]
GO
/****** Object:  Table [dbo].[ThemeClassification]    Script Date: 11/05/2012 23:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThemeClassification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Title] [nvarchar](1000) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsLeaf] [bit] NOT NULL,
 CONSTRAINT [PK_ThemeClasification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Records]    Script Date: 11/05/2012 23:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Records](
	[Id] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[SortTitle] [nvarchar](max) NOT NULL,
	[FullTitle] [nvarchar](max) NOT NULL,
	[OtherTitle] [nvarchar](max) NULL,
	[TitleDescription] [nvarchar](max) NULL,
	[Responsibility] [nvarchar](max) NOT NULL,
	[ChapterName] [nvarchar](max) NULL,
	[Publication] [nvarchar](max) NOT NULL,
	[PublicationInfo] [nvarchar](max) NULL,
	[PublicationYear] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Record] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 11/05/2012 23:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[FirstPart] [nvarchar](max) NOT NULL,
	[SufixPart] [nvarchar](max) NOT NULL,
	[OtherNames] [nvarchar](max) NULL,
	[NameAddition] [nvarchar](max) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthorRecord]    Script Date: 11/05/2012 23:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthorId] [uniqueidentifier] NOT NULL,
	[RecordId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AuthorRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecordContent]    Script Date: 11/05/2012 23:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordContent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [uniqueidentifier] NOT NULL,
	[DataType] [int] NOT NULL,
	[FileContent] [varbinary](max) NOT NULL,
	[DescriptionContent] [varbinary](max) NULL,
 CONSTRAINT [PK_RecordContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecordClassification]    Script Date: 11/05/2012 23:56:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordClassification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecordId] [uniqueidentifier] NOT NULL,
	[ISBN] [nvarchar](20) NULL,
	[ISSN] [nvarchar](10) NULL,
	[NationalNumber] [nvarchar](100) NULL,
	[OtherIdentifier] [nvarchar](100) NULL,
	[DocumentNumber] [nvarchar](100) NULL,
	[ThemeClassificationId] [int] NULL,
 CONSTRAINT [PK_RecordClassification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_ThemeClasification_IsLeaf]    Script Date: 11/05/2012 23:56:03 ******/
ALTER TABLE [dbo].[ThemeClassification] ADD  CONSTRAINT [DF_ThemeClasification_IsLeaf]  DEFAULT ((0)) FOR [IsLeaf]
GO
/****** Object:  Default [DF_Record_Id]    Script Date: 11/05/2012 23:56:03 ******/
ALTER TABLE [dbo].[Records] ADD  CONSTRAINT [DF_Record_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  ForeignKey [FK_AuthorRecord_Authors]    Script Date: 11/05/2012 23:56:03 ******/
ALTER TABLE [dbo].[AuthorRecord]  WITH CHECK ADD  CONSTRAINT [FK_AuthorRecord_Authors] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[AuthorRecord] CHECK CONSTRAINT [FK_AuthorRecord_Authors]
GO
/****** Object:  ForeignKey [FK_AuthorRecord_Records]    Script Date: 11/05/2012 23:56:03 ******/
ALTER TABLE [dbo].[AuthorRecord]  WITH CHECK ADD  CONSTRAINT [FK_AuthorRecord_Records] FOREIGN KEY([RecordId])
REFERENCES [dbo].[Records] ([Id])
GO
ALTER TABLE [dbo].[AuthorRecord] CHECK CONSTRAINT [FK_AuthorRecord_Records]
GO
/****** Object:  ForeignKey [FK_RecordContent_Records]    Script Date: 11/05/2012 23:56:03 ******/
ALTER TABLE [dbo].[RecordContent]  WITH CHECK ADD  CONSTRAINT [FK_RecordContent_Records] FOREIGN KEY([RecordId])
REFERENCES [dbo].[Records] ([Id])
GO
ALTER TABLE [dbo].[RecordContent] CHECK CONSTRAINT [FK_RecordContent_Records]
GO
/****** Object:  ForeignKey [FK_RecordClassification_Records]    Script Date: 11/05/2012 23:56:03 ******/
ALTER TABLE [dbo].[RecordClassification]  WITH CHECK ADD  CONSTRAINT [FK_RecordClassification_Records] FOREIGN KEY([RecordId])
REFERENCES [dbo].[Records] ([Id])
GO
ALTER TABLE [dbo].[RecordClassification] CHECK CONSTRAINT [FK_RecordClassification_Records]
GO
/****** Object:  ForeignKey [FK_RecordClassification_ThemeClassification]    Script Date: 11/05/2012 23:56:03 ******/
ALTER TABLE [dbo].[RecordClassification]  WITH CHECK ADD  CONSTRAINT [FK_RecordClassification_ThemeClassification] FOREIGN KEY([ThemeClassificationId])
REFERENCES [dbo].[ThemeClassification] ([Id])
GO
ALTER TABLE [dbo].[RecordClassification] CHECK CONSTRAINT [FK_RecordClassification_ThemeClassification]
GO
SET IDENTITY_INSERT [dbo].[ThemeClassification] ON
INSERT [dbo].[ThemeClassification] ([Id], [ParentId], [Title], [Description], [IsLeaf]) VALUES (1, NULL, N'Рівень підготовки', NULL, 0)
INSERT [dbo].[ThemeClassification] ([Id], [ParentId], [Title], [Description], [IsLeaf]) VALUES (2, 1, N'1 курс', NULL, 1)
INSERT [dbo].[ThemeClassification] ([Id], [ParentId], [Title], [Description], [IsLeaf]) VALUES (3, 1, N'2 курс', NULL, 1)
INSERT [dbo].[ThemeClassification] ([Id], [ParentId], [Title], [Description], [IsLeaf]) VALUES (4, 1, N'3 курс', NULL, 1)
INSERT [dbo].[ThemeClassification] ([Id], [ParentId], [Title], [Description], [IsLeaf]) VALUES (5, 1, N'4 курс', NULL, 1)
INSERT [dbo].[ThemeClassification] ([Id], [ParentId], [Title], [Description], [IsLeaf]) VALUES (6, 1, N'Магістр', NULL, 1)
INSERT [dbo].[ThemeClassification] ([Id], [ParentId], [Title], [Description], [IsLeaf]) VALUES (7, 1, N'Аспірант', NULL, 1)
SET IDENTITY_INSERT [dbo].[ThemeClassification] OFF