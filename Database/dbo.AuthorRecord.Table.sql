USE [UniLib]
GO
/****** Object:  Table [dbo].[AuthorRecord]    Script Date: 11/05/2012 23:56:33 ******/
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
ALTER TABLE [dbo].[AuthorRecord]  WITH CHECK ADD  CONSTRAINT [FK_AuthorRecord_Authors] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[AuthorRecord] CHECK CONSTRAINT [FK_AuthorRecord_Authors]
GO
ALTER TABLE [dbo].[AuthorRecord]  WITH CHECK ADD  CONSTRAINT [FK_AuthorRecord_Records] FOREIGN KEY([RecordId])
REFERENCES [dbo].[Records] ([Id])
GO
ALTER TABLE [dbo].[AuthorRecord] CHECK CONSTRAINT [FK_AuthorRecord_Records]
GO
