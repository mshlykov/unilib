USE [UniLib]
GO
/****** Object:  Table [dbo].[RecordClassification]    Script Date: 11/05/2012 23:56:33 ******/
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
ALTER TABLE [dbo].[RecordClassification]  WITH CHECK ADD  CONSTRAINT [FK_RecordClassification_Records] FOREIGN KEY([RecordId])
REFERENCES [dbo].[Records] ([Id])
GO
ALTER TABLE [dbo].[RecordClassification] CHECK CONSTRAINT [FK_RecordClassification_Records]
GO
ALTER TABLE [dbo].[RecordClassification]  WITH CHECK ADD  CONSTRAINT [FK_RecordClassification_ThemeClassification] FOREIGN KEY([ThemeClassificationId])
REFERENCES [dbo].[ThemeClassification] ([Id])
GO
ALTER TABLE [dbo].[RecordClassification] CHECK CONSTRAINT [FK_RecordClassification_ThemeClassification]
GO
