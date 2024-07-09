/***************************************************************************
* Bible Database: SQL Server
* bible-database-01-schema.sql
*
* Version: 2024.7.9
* 
* License: CC BY 4.0 - https://creativecommons.org/licenses/by/4.0/
*
***************************************************************************/

----------------------------------------------------------------------------
-- Languages
----------------------------------------------------------------------------
CREATE TABLE [dbo].[Languages](
	[Id] [varchar](3) NOT NULL,
	[Name] [varchar](16) NOT NULL,
	[HtmlCode] [char](2) NOT NULL,
	[IsAncient] [bit] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED ([Id] ASC),
)

GO

ALTER TABLE [dbo].[Languages] ADD  CONSTRAINT [DF_Languages_IsAncient]  DEFAULT ((0)) FOR [IsAncient]
GO

----------------------------------------------------------------------------
-- Canons
----------------------------------------------------------------------------
CREATE TABLE [dbo].[Canons](
	[Id] [int] NOT NULL,
	[Code] [varchar](3) NOT NULL,
	[Name] [varchar](24) NOT NULL,
	[LanguageId] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Canons] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [dbo].[Canons]  WITH CHECK ADD  CONSTRAINT [FK_Canons_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
GO

ALTER TABLE [dbo].[Canons] CHECK CONSTRAINT [FK_Canons_Languages]
GO

----------------------------------------------------------------------------
-- Sections
----------------------------------------------------------------------------
CREATE TABLE [dbo].[Sections](
	[Id] [int] NOT NULL,
	[Name] [varchar](16) NOT NULL,
	[CanonId] [int] NOT NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [dbo].[Sections]  WITH CHECK ADD  CONSTRAINT [FK_Sections_Canons] FOREIGN KEY([CanonId])
REFERENCES [dbo].[Canons] ([Id])
GO

ALTER TABLE [dbo].[Sections] CHECK CONSTRAINT [FK_Sections_Canons]
GO

----------------------------------------------------------------------------
-- Books
----------------------------------------------------------------------------
CREATE TABLE [dbo].[Books](
	[Id] [int] NOT NULL,
	[Code] [varchar](4) NOT NULL,
	[Abbrev] [varchar](4) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[CanonId] [int] NOT NULL, -- denormalized
	[SectionId] [int] NOT NULL,
	[IsSectionEnd] bit NOT NULL,
	[ChapterCount] [tinyint] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Canons] FOREIGN KEY([CanonId])
REFERENCES [dbo].[Canons] ([Id])
GO

ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Canons]
GO

ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Sections] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Sections] ([Id])
GO

ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Sections]
GO

----------------------------------------------------------------------------
-- Chapters
----------------------------------------------------------------------------
CREATE TABLE [dbo].[Chapters](
	[Id] [int] NOT NULL,
	[Code] [varchar](7) NOT NULL,
	[Chapter] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[IsBookEnd] bit NOT NULL,
	[VerseCount] [int] NOT NULL,
 CONSTRAINT [PK_Chapters] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Chapters]  WITH CHECK ADD  CONSTRAINT [FK_Chapters_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO

ALTER TABLE [dbo].[Chapters] CHECK CONSTRAINT [FK_Chapters_Books]
GO

----------------------------------------------------------------------------
-- Verses
----------------------------------------------------------------------------

CREATE TABLE [dbo].[Verses](
	[Id] [int] NOT NULL,
	[Code] [varchar](16) NOT NULL,
	[Reference] [varchar](10) NOT NULL,
	[CanonId] [int] NOT NULL, --denormalized
	[SectionId] [int] NOT NULL, --denormalized
	[BookId] [int] NOT NULL, --denormalized
	[ChapterId] [int] NOT NULL,
	[Chapter] [int] NOT NULL, --denormalized
	[IsChapterEnd] bit NOT NULL,
	[Verse] [int] NOT NULL,
 CONSTRAINT [PK_Verses] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [dbo].[Verses]  WITH CHECK ADD  CONSTRAINT [FK_Verses_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO

ALTER TABLE [dbo].[Verses] CHECK CONSTRAINT [FK_Verses_Books]
GO

ALTER TABLE [dbo].[Verses]  WITH CHECK ADD  CONSTRAINT [FK_Verses_Chapters] FOREIGN KEY([ChapterId])
REFERENCES [dbo].[Chapters] ([Id])
GO

ALTER TABLE [dbo].[Verses] CHECK CONSTRAINT [FK_Verses_Chapters]
GO

ALTER TABLE [dbo].[Verses]  WITH CHECK ADD  CONSTRAINT [FK_Verses_Canons] FOREIGN KEY([CanonId])
REFERENCES [dbo].[Canons] ([Id])
GO

ALTER TABLE [dbo].[Verses] CHECK CONSTRAINT [FK_Verses_Canons]
GO

ALTER TABLE [dbo].[Verses]  WITH CHECK ADD  CONSTRAINT [FK_Verses_Sections] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Sections] ([Id])
GO

ALTER TABLE [dbo].[Verses] CHECK CONSTRAINT [FK_Verses_Sections]
GO

----------------------------------------------------------------------------
-- GreekTextForm
----------------------------------------------------------------------------
CREATE TABLE [dbo].[GreekTextForms](
	[Id] [varchar](3) NOT NULL,
	[Name] [varchar](48) NOT NULL,
	[ParentId] [varchar](3) NULL,
 CONSTRAINT [PK_GreekTextForms] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [dbo].[GreekTextForms]  WITH CHECK ADD  CONSTRAINT [FK_GreekTextForms_GreekTextForms] FOREIGN KEY([ParentId])
REFERENCES [dbo].[GreekTextForms] ([Id])
GO

ALTER TABLE [dbo].[GreekTextForms] CHECK CONSTRAINT [FK_GreekTextForms_GreekTextForms]
GO

----------------------------------------------------------------------------
-- HebrewTextForms
----------------------------------------------------------------------------
CREATE TABLE [dbo].[HebrewTextForms](
	[Id] [varchar](3) NOT NULL,
	[Name] [varchar](48) NOT NULL,
	[ParentId] [varchar](3) NULL,
 CONSTRAINT [PK_HebrewTextForms] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [dbo].[HebrewTextForms] WITH CHECK ADD CONSTRAINT [FK_HebrewTextForms_HebrewTextForms] FOREIGN KEY([ParentId])
REFERENCES [dbo].[HebrewTextForms] ([Id])
GO

ALTER TABLE [dbo].[HebrewTextForms] CHECK CONSTRAINT [FK_HebrewTextForms_HebrewTextForms]
GO


----------------------------------------------------------------------------
-- LicensePermissions
----------------------------------------------------------------------------
CREATE TABLE [dbo].[LicensePermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](48) NOT NULL,
	[Permissiveness] [int] NOT NULL,
 CONSTRAINT [PK_PermissionLevel] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

----------------------------------------------------------------------------
-- LicenseTypes
----------------------------------------------------------------------------
CREATE TABLE [dbo].[LicenseTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[IsFree] [bit] NOT NULL,
	[PermissionId] [int] NULL,
 CONSTRAINT [PK_LicenseType] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [dbo].[LicenseTypes]  WITH CHECK ADD  CONSTRAINT [FK_LicenseTypes_LicensePermissions] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[LicensePermissions] ([Id])
GO

ALTER TABLE [dbo].[LicenseTypes] CHECK CONSTRAINT [FK_LicenseTypes_LicensePermissions]
GO

----------------------------------------------------------------------------
-- Versions
----------------------------------------------------------------------------

CREATE TABLE [dbo].[Versions](
	[Id] [varchar](8) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Subtitle] [nvarchar](128) NOT NULL,
	[LanguageId] [varchar](3) NOT NULL,
	[YearPublished] [smallint] NOT NULL,
	[BibleUrl] [varchar](255) NULL,
	[ReadUrl] [varchar](255) NULL,
	[LicenseUrl] [varchar](255) NULL,
	[HebrewFormId] [varchar](3) NULL,
	[GreekFormId] [varchar](3) NULL,
	[ParentId] [varchar](4) NULL,
	[LicenseTypeId] [int] NULL,
	[ReadingLevel] [decimal](4, 2) NULL,
 CONSTRAINT [PK_Versions] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [dbo].[Versions]  WITH CHECK ADD  CONSTRAINT [FK_Versions_Languages] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
GO

ALTER TABLE [dbo].[Versions] CHECK CONSTRAINT [FK_Versions_Languages]
GO

ALTER TABLE [dbo].[Versions]  WITH CHECK ADD  CONSTRAINT [FK_Versions_Versions] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Versions] ([Id])
GO

ALTER TABLE [dbo].[Versions] CHECK CONSTRAINT [FK_Version_Versions]
GO

ALTER TABLE [dbo].[Versions]  WITH CHECK ADD  CONSTRAINT [FK_Version_TextForm_Greek] FOREIGN KEY([GreekFormId])
REFERENCES [dbo].[GreekTextForms] ([Id])
GO

ALTER TABLE [dbo].[Versions] CHECK CONSTRAINT [FK_Version_TextForm_Greek]
GO

ALTER TABLE [dbo].[Versions]  WITH CHECK ADD  CONSTRAINT [FK_Version_TextForm_Hebrew] FOREIGN KEY([HebrewFormId])
REFERENCES [dbo].[HebrewTextForms] ([Id])
GO

ALTER TABLE [dbo].[Versions] CHECK CONSTRAINT [FK_Version_TextForm_Hebrew]
GO

ALTER TABLE [dbo].[Versions]  WITH CHECK ADD  CONSTRAINT [FK_Versions_LicenseTypes] FOREIGN KEY([LicenseTypeId])
REFERENCES [dbo].[LicenseType] ([Id])
GO

ALTER TABLE [dbo].[Versions] CHECK CONSTRAINT [FK_Versions_LicenseTypes]
GO

ALTER TABLE [dbo].[Versions]  WITH CHECK ADD  CONSTRAINT [FK_Versions_LiteralRankings] FOREIGN KEY([LiteralRankingId])
REFERENCES [dbo].[LiteralRankings] ([Id])
GO

ALTER TABLE [dbo].[Versions] CHECK CONSTRAINT [FK_Versions_LiteralRankings]
GO

----------------------------------------------------------------------------
-- Version Verses
----------------------------------------------------------------------------

CREATE TABLE [dbo].[VersionVerses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VersionId] [varchar](8) NOT NULL,
	[VerseId] [int] NOT NULL,
	[TextFormat] [varchar](6) NULL,
	[Markup] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_VersionVerses] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO


ALTER TABLE [dbo].[VersionVerses]  WITH CHECK ADD  CONSTRAINT [FK_VersionVerses_Versions] FOREIGN KEY([VersionId])
REFERENCES [dbo].[Versions] ([Id])
GO

ALTER TABLE [dbo].[VersionVerses] CHECK CONSTRAINT [FK_VersionVerses_Versions]
GO

ALTER TABLE [dbo].[VersionVerses]  WITH CHECK ADD  CONSTRAINT [FK_VersionVerses_Verses] FOREIGN KEY([VerseId])
REFERENCES [dbo].[Verses] ([Id])
GO

ALTER TABLE [dbo].[[VersionVerses]] CHECK CONSTRAINT [FK_VersionVerses_Verses]
GO

