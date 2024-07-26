/***************************************************************************
* Bible Database: SQL Server
* bible-database-01-schema.sql
*
* Version: 2024.7.26
* 
* Script License: CC BY 4.0 - https://creativecommons.org/licenses/by/4.0/
*
***************************************************************************/

IF EXISTS (SELECT * FROM sys.tables WHERE name = 'SchemaUpdates')
	IF EXISTS (SELECT * FROM SchemaUpdates WHERE [Code] = '2024.7.26') 
		THROW 90000, 'Schema Update has already been run', 1;

----------------------------------------------------------------------------
-- SchemaUpdates
----------------------------------------------------------------------------
CREATE TABLE [SchemaUpdates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](16) NOT NULL,
	[Updated] [date] NOT NULL,
 CONSTRAINT [PK_SchemaUpdates] PRIMARY KEY CLUSTERED ([Id] ASC),
)

GO

ALTER TABLE [SchemaUpdates] ADD  CONSTRAINT [DF_SchemaUpdates_Updated]  DEFAULT (GETDATE()) FOR [Updated]
GO

----------------------------------------------------------------------------
-- Languages
----------------------------------------------------------------------------
CREATE TABLE [Languages](
	[Id] [varchar](3) NOT NULL,
	[Name] [varchar](16) NOT NULL,
	[HtmlCode] [char](2) NOT NULL,
	[IsAncient] [bit] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED ([Id] ASC),
)

GO

ALTER TABLE [Languages] ADD  CONSTRAINT [DF_Languages_IsAncient]  DEFAULT ((0)) FOR [IsAncient]
GO

----------------------------------------------------------------------------
-- Canons
----------------------------------------------------------------------------
CREATE TABLE [Canons](
	[Id] [int] NOT NULL,
	[Code] [varchar](3) NOT NULL,
	[Name] [varchar](24) NOT NULL,
	[LanguageId] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Canons] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [Canons]  WITH CHECK ADD  CONSTRAINT [FK_Canons_Languages] FOREIGN KEY([LanguageId])
REFERENCES [Languages] ([Id])
GO

ALTER TABLE [Canons] CHECK CONSTRAINT [FK_Canons_Languages]
GO

----------------------------------------------------------------------------
-- Sections
----------------------------------------------------------------------------
CREATE TABLE [Sections](
	[Id] [int] NOT NULL,
	[Name] [varchar](16) NOT NULL,
	[CanonId] [int] NOT NULL,
 CONSTRAINT [PK_Sections] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [Sections]  WITH CHECK ADD  CONSTRAINT [FK_Sections_Canons] FOREIGN KEY([CanonId])
REFERENCES [Canons] ([Id])
GO

ALTER TABLE [Sections] CHECK CONSTRAINT [FK_Sections_Canons]
GO

----------------------------------------------------------------------------
-- Books
----------------------------------------------------------------------------
CREATE TABLE [Books](
	[Id] [int] NOT NULL,
	[Code] [varchar](5) NOT NULL,
	[Abbrev] [varchar](5) NOT NULL,
	[Name] [varchar](16) NOT NULL,
	[Book] [tinyint] NOT NULL,
	[CanonId] [int] NOT NULL, -- denormalized
	[SectionId] [int] NOT NULL,
	[IsSectionEnd] bit NOT NULL,
	[ChapterCount] [tinyint] NOT NULL,
	[OsisCode] [varchar](6) NOT NULL,
	[Paratext] [varchar](3) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Canons] FOREIGN KEY([CanonId])
REFERENCES [Canons] ([Id])
GO

ALTER TABLE [Books] CHECK CONSTRAINT [FK_Books_Canons]
GO

ALTER TABLE [Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Sections] FOREIGN KEY([SectionId])
REFERENCES [Sections] ([Id])
GO

ALTER TABLE [Books] CHECK CONSTRAINT [FK_Books_Sections]
GO


----------------------------------------------------------------------------
-- BookNames
----------------------------------------------------------------------------
CREATE TABLE [BookNames](
	[Name] [varchar](64) NOT NULL,
	[BookId] [int] NOT NULL,
 CONSTRAINT [PK_BookNames] PRIMARY KEY CLUSTERED ([Name] ASC)
)
GO


----------------------------------------------------------------------------
-- Chapters
----------------------------------------------------------------------------
CREATE TABLE [Chapters](
	[Id] [int] NOT NULL,
	[Code] [varchar](7) NOT NULL,
	[Chapter] [tinyint] NOT NULL,
	[BookId] [int] NOT NULL,
	[IsBookEnd] bit NOT NULL,
	[VerseCount] [int] NOT NULL,
 CONSTRAINT [PK_Chapters] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [Chapters]  WITH CHECK ADD  CONSTRAINT [FK_Chapters_Books] FOREIGN KEY([BookId])
REFERENCES [Books] ([Id])
GO

ALTER TABLE [Chapters] CHECK CONSTRAINT [FK_Chapters_Books]
GO

----------------------------------------------------------------------------
-- Verses
----------------------------------------------------------------------------
CREATE TABLE [Verses](
	[Id] [int] NOT NULL,
	[Code] [varchar](16) NOT NULL,
	[OsisCode] [varchar](12) NOT NULL,
	[Reference] [varchar](10) NOT NULL,
	[CanonId] [int] NOT NULL, --denormalized
	[SectionId] [int] NOT NULL, --denormalized
	[BookId] [int] NOT NULL, --denormalized
	[ChapterId] [int] NOT NULL,
	[IsChapterEnd] bit NOT NULL,
	[Book] [tinyint] NOT NULL, --denormalized
	[Chapter] [tinyint] NOT NULL, --denormalized
	[Verse] [tinyint] NOT NULL,
 CONSTRAINT [PK_Verses] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [Verses]  WITH CHECK ADD  CONSTRAINT [FK_Verses_Books] FOREIGN KEY([BookId])
REFERENCES [Books] ([Id])
GO

ALTER TABLE [Verses] CHECK CONSTRAINT [FK_Verses_Books]
GO

ALTER TABLE [Verses]  WITH CHECK ADD  CONSTRAINT [FK_Verses_Chapters] FOREIGN KEY([ChapterId])
REFERENCES [Chapters] ([Id])
GO

ALTER TABLE [Verses] CHECK CONSTRAINT [FK_Verses_Chapters]
GO

ALTER TABLE [Verses]  WITH CHECK ADD  CONSTRAINT [FK_Verses_Canons] FOREIGN KEY([CanonId])
REFERENCES [Canons] ([Id])
GO

ALTER TABLE [Verses] CHECK CONSTRAINT [FK_Verses_Canons]
GO

ALTER TABLE [Verses]  WITH CHECK ADD  CONSTRAINT [FK_Verses_Sections] FOREIGN KEY([SectionId])
REFERENCES [Sections] ([Id])
GO

ALTER TABLE [Verses] CHECK CONSTRAINT [FK_Verses_Sections]
GO

----------------------------------------------------------------------------
-- GreekTextForms
----------------------------------------------------------------------------
CREATE TABLE [GreekTextForms](
	[Id] [varchar](3) NOT NULL,
	[Name] [varchar](48) NOT NULL,
	[ParentId] [varchar](3) NULL,
 CONSTRAINT [PK_GreekTextForms] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [GreekTextForms]  WITH CHECK ADD  CONSTRAINT [FK_GreekTextForms_GreekTextForms] FOREIGN KEY([ParentId])
REFERENCES [GreekTextForms] ([Id])
GO

ALTER TABLE [GreekTextForms] CHECK CONSTRAINT [FK_GreekTextForms_GreekTextForms]
GO

----------------------------------------------------------------------------
-- HebrewTextForms
----------------------------------------------------------------------------
CREATE TABLE [HebrewTextForms](
	[Id] [varchar](3) NOT NULL,
	[Name] [varchar](48) NOT NULL,
	[ParentId] [varchar](3) NULL,
 CONSTRAINT [PK_HebrewTextForms] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [HebrewTextForms] WITH CHECK ADD CONSTRAINT [FK_HebrewTextForms_HebrewTextForms] FOREIGN KEY([ParentId])
REFERENCES [HebrewTextForms] ([Id])
GO

ALTER TABLE [HebrewTextForms] CHECK CONSTRAINT [FK_HebrewTextForms_HebrewTextForms]
GO


----------------------------------------------------------------------------
-- LicensePermissions
----------------------------------------------------------------------------
CREATE TABLE [LicensePermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](48) NOT NULL,
	[Permissiveness] [int] NOT NULL,
 CONSTRAINT [PK_PermissionLevel] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

----------------------------------------------------------------------------
-- LicenseTypes
----------------------------------------------------------------------------
CREATE TABLE [LicenseTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[IsFree] [bit] NOT NULL,
	[PermissionId] [int] NULL,
 CONSTRAINT [PK_LicenseType] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [LicenseTypes]  WITH CHECK ADD  CONSTRAINT [FK_LicenseTypes_LicensePermissions] FOREIGN KEY([PermissionId])
REFERENCES [LicensePermissions] ([Id])
GO

ALTER TABLE [LicenseTypes] CHECK CONSTRAINT [FK_LicenseTypes_LicensePermissions]
GO

----------------------------------------------------------------------------
-- Versions
----------------------------------------------------------------------------
CREATE TABLE [Versions](
	[Id] [varchar](8) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Subtitle] [nvarchar](128) NULL,
	[LanguageId] [varchar](3) NOT NULL,
	[YearPublished] [smallint] NOT NULL,
	[HebrewFormId] [varchar](3) NULL,
	[GreekFormId] [varchar](3) NULL,
	[ParentId] [varchar](8) NULL,
	[LicenseTypeId] [int] NULL,
	[ReadingLevel] [decimal](4, 2) NULL,
 CONSTRAINT [PK_Versions] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [Versions]  WITH CHECK ADD  CONSTRAINT [FK_Versions_Languages] FOREIGN KEY([LanguageId])
REFERENCES [Languages] ([Id])
GO

ALTER TABLE [Versions] CHECK CONSTRAINT [FK_Versions_Languages]
GO

ALTER TABLE [Versions]  WITH CHECK ADD  CONSTRAINT [FK_Versions_Versions] FOREIGN KEY([ParentId])
REFERENCES [Versions] ([Id])
GO

ALTER TABLE [Versions] CHECK CONSTRAINT [FK_Versions_Versions]
GO

ALTER TABLE [Versions]  WITH CHECK ADD  CONSTRAINT [FK_Version_TextForm_Greek] FOREIGN KEY([GreekFormId])
REFERENCES [GreekTextForms] ([Id])
GO

ALTER TABLE [Versions] CHECK CONSTRAINT [FK_Version_TextForm_Greek]
GO

ALTER TABLE [Versions]  WITH CHECK ADD  CONSTRAINT [FK_Version_TextForm_Hebrew] FOREIGN KEY([HebrewFormId])
REFERENCES [HebrewTextForms] ([Id])
GO

ALTER TABLE [Versions] CHECK CONSTRAINT [FK_Version_TextForm_Hebrew]
GO

ALTER TABLE [Versions]  WITH CHECK ADD  CONSTRAINT [FK_Versions_LicenseTypes] FOREIGN KEY([LicenseTypeId])
REFERENCES [LicenseTypes] ([Id])
GO

ALTER TABLE [Versions] CHECK CONSTRAINT [FK_Versions_LicenseTypes]
GO

----------------------------------------------------------------------------
-- Editions
----------------------------------------------------------------------------
CREATE TABLE [Editions](
	[Id] [varchar](16) NOT NULL,
	[VersionId] [varchar](8) NOT NULL,
	[YearPublished] [smallint] NOT NULL,
	[Subtitle] [nvarchar](128) NULL,
 CONSTRAINT [PK_Editions] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [Editions]  WITH CHECK ADD  CONSTRAINT [FK_Editions_Versions] FOREIGN KEY([VersionId])
REFERENCES [Versions] ([Id])
GO

ALTER TABLE [Editions] CHECK CONSTRAINT [FK_Editions_Versions]
GO


----------------------------------------------------------------------------
-- Sites
----------------------------------------------------------------------------
CREATE TABLE [Sites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[Url] [varchar](255) NULL,
 CONSTRAINT [PK_Sites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


----------------------------------------------------------------------------
-- ResourceTypes
----------------------------------------------------------------------------
CREATE TABLE [ResourceTypes](
	[Id] [varchar](8) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_ResourceTypes] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO


----------------------------------------------------------------------------
-- Resources
----------------------------------------------------------------------------
CREATE TABLE [Resources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResourceTypeId] [varchar](8) NOT NULL,
	[VersionId] [varchar](8) NOT NULL,
	[EditionId] [varchar](16) NULL,
	[Url] [varchar](255) NULL,
	[IsOfficial] [bit] NOT NULL,
	[SiteId] [int] NULL,
 CONSTRAINT [PK_Resources] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [Resources] ADD  CONSTRAINT [DF_Resources_IsOfficial]  DEFAULT ((0)) FOR [IsOfficial]
GO

ALTER TABLE [Resources]  WITH CHECK ADD  CONSTRAINT [FK_Resources_ResourceTypes] FOREIGN KEY([ResourceTypeId])
REFERENCES [ResourceTypes] ([Id])
GO

ALTER TABLE [Resources] CHECK CONSTRAINT [FK_Resources_ResourceTypes]
GO

ALTER TABLE [Resources]  WITH CHECK ADD  CONSTRAINT [FK_Resources_Editions] FOREIGN KEY([EditionId])
REFERENCES [Editions] ([Id])
GO

ALTER TABLE [Resources] CHECK CONSTRAINT [FK_Resources_Editions]
GO

ALTER TABLE [Resources]  WITH CHECK ADD  CONSTRAINT [FK_Resources_Versions] FOREIGN KEY([VersionId])
REFERENCES [Versions] ([Id])
GO

ALTER TABLE [Resources] CHECK CONSTRAINT [FK_Resources_Versions]
GO

ALTER TABLE [Resources]  WITH CHECK ADD  CONSTRAINT [FK_Resources_Sites] FOREIGN KEY([SiteId])
REFERENCES [Sites] ([Id])
GO

ALTER TABLE [Resources] CHECK CONSTRAINT [FK_Resources_Sites]
GO


----------------------------------------------------------------------------
-- Bibles
----------------------------------------------------------------------------
CREATE TABLE [Bibles](
	[Id] [varchar](16) NOT NULL,
	[Name] [nvarchar](64) NOT NULL,
	[Subtitle] [nvarchar](128) NULL,
	[VersionId] [varchar](8) NOT NULL,
	[EditionId] [varchar](16) NULL,
	[YearPublished] [smallint] NULL,
	[TextFormat] [varchar](6) NOT NULL,
 CONSTRAINT [PK_Bibles] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [Bibles]  WITH CHECK ADD  CONSTRAINT [FK_Bibles_Versions] FOREIGN KEY([VersionId])
REFERENCES [Versions] ([Id])
GO

ALTER TABLE [Bibles] CHECK CONSTRAINT [FK_Bibles_Versions]
GO

ALTER TABLE [Bibles]  WITH CHECK ADD  CONSTRAINT [FK_Bibles_Editions] FOREIGN KEY([EditionId])
REFERENCES [Editions] ([Id])
GO

ALTER TABLE [Bibles] CHECK CONSTRAINT [FK_Bibles_Editions]
GO

ALTER TABLE [Bibles] ADD  CONSTRAINT [DF_Bibles_TextFormat]  DEFAULT ('txt') FOR [TextFormat]
GO

----------------------------------------------------------------------------
-- BibleVerses
----------------------------------------------------------------------------
CREATE TABLE [BibleVerses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BibleId] [varchar](16) NOT NULL,
	[VerseId] [int] NOT NULL,
	[Markup] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BibleVerses] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [BibleVerses]  WITH CHECK ADD  CONSTRAINT [FK_BibleVerses_Bibles] FOREIGN KEY([BibleId])
REFERENCES [Bibles] ([Id])
GO

ALTER TABLE [BibleVerses] CHECK CONSTRAINT [FK_BibleVerses_Bibles]
GO

ALTER TABLE [BibleVerses]  WITH CHECK ADD  CONSTRAINT [FK_BibleVerses_Verses] FOREIGN KEY([VerseId])
REFERENCES [Verses] ([Id])
GO

ALTER TABLE [BibleVerses] CHECK CONSTRAINT [FK_BibleVerses_Verses]
GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_BibleVerses_Version_Verse] ON [BibleVerses]
(
	[BibleId] ASC,
	[VerseId] ASC
)
GO


----------------------------------------------------------------------------
-- VersionNotes
----------------------------------------------------------------------------
CREATE TABLE [VersionNotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VersionId] [varchar](8) NOT NULL,
	[EditionId] [varchar](16) NULL,
	[BibleId] [varchar](16) NULL,
	[CanonId] [int] NULL,
	[BookId] [int] NULL,
	[ChapterId] [int] NULL,
	[VerseId] [int] NULL,
	[Note] [nvarchar](max) NOT NULL,
	[Ranking] [int] NOT NULL,
 CONSTRAINT [PK_VersionNotes] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [VersionNotes]  WITH CHECK ADD  CONSTRAINT [FK_VersionNotes_Versions] FOREIGN KEY([VersionId])
REFERENCES [Versions] ([Id])
GO

ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Versions]
GO

ALTER TABLE [VersionNotes]  WITH CHECK ADD  CONSTRAINT [FK_VersionNotes_Canons] FOREIGN KEY([CanonId])
REFERENCES [Canons] ([Id])
GO

ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Canons]
GO

ALTER TABLE [VersionNotes]  WITH CHECK ADD  CONSTRAINT [FK_VersionNotes_Books] FOREIGN KEY([BookId])
REFERENCES [Books] ([Id])
GO

ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Books]
GO

ALTER TABLE [VersionNotes]  WITH CHECK ADD  CONSTRAINT [FK_VersionNotes_Chapters] FOREIGN KEY([ChapterId])
REFERENCES [Chapters] ([Id])
GO

ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Chapters]
GO

ALTER TABLE [VersionNotes]  WITH CHECK ADD  CONSTRAINT [FK_VersionNotes_Verses] FOREIGN KEY([VerseId])
REFERENCES [Verses] ([Id])
GO

ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Verses]
GO

ALTER TABLE [VersionNotes]  WITH CHECK ADD  CONSTRAINT [FK_VersionNotes_Bibles] FOREIGN KEY([BibleId])
REFERENCES [Bibles] ([Id])
GO

ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Bibles]
GO

ALTER TABLE [VersionNotes]  WITH CHECK ADD  CONSTRAINT [FK_VersionNotes_Editions] FOREIGN KEY([EditionId])
REFERENCES [Editions] ([Id])
GO

ALTER TABLE [VersionNotes] CHECK CONSTRAINT [FK_VersionNotes_Editions]
GO

----------------------------------------------------------------------------
-- ReferenceVerses
----------------------------------------------------------------------------
CREATE TABLE [ReferenceVerses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VerseId] [int] NOT NULL,
	[ReferenceId] [int] NOT NULL,
	[EndReferenceId] [int] NULL,
	[Ranking] [smallint] NOT NULL,
 CONSTRAINT [PK_ReferenceVerses] PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

ALTER TABLE [ReferenceVerses]  WITH CHECK ADD CONSTRAINT [FK_ReferenceVerses_Verse] FOREIGN KEY([VerseId])
REFERENCES [Verses] ([Id])
GO

ALTER TABLE [ReferenceVerses] CHECK CONSTRAINT [FK_ReferenceVerses_Verse]
GO

ALTER TABLE [ReferenceVerses]  WITH CHECK ADD  CONSTRAINT [FK_ReferenceVerses_Reference] FOREIGN KEY([ReferenceId])
REFERENCES [Verses] ([Id])
GO

ALTER TABLE [ReferenceVerses] CHECK CONSTRAINT [FK_ReferenceVerses_Reference]
GO

ALTER TABLE [ReferenceVerses]  WITH CHECK ADD  CONSTRAINT [FK_ReferenceVerses_EndReference] FOREIGN KEY([EndReferenceId])
REFERENCES [Verses] ([Id])
GO

ALTER TABLE [ReferenceVerses] CHECK CONSTRAINT [FK_ReferenceVerses_EndReference]
GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ReferenceVerses_Verses] ON [ReferenceVerses]
(
	[VerseId] ASC,
	[ReferenceId] ASC
)
GO

----------------------------------------------------------------------------
-- Schema 
----------------------------------------------------------------------------
INSERT INTO SchemaUpdates ([Code]) VALUES ('2024.7.26')
