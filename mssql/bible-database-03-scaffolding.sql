/***************************************************************************
* Bible Database: SQL Server
* bible-database-03-scaffolding.sql
*
* Version: 2024.7.26
* 
* Script License: CC BY 4.0 - https://creativecommons.org/licenses/by/4.0/
* 
***************************************************************************/

----------------------------------------------------------------------------
-- add_Site
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Site')
	DROP PROCEDURE [add_Site]
GO

CREATE PROCEDURE add_Site
	@name nvarchar(64),
	@url varchar(255)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM [Sites] WHERE [Url] = @url)
		INSERT INTO [Sites]([Name], [Url]) VALUES (@name, @url)

END
GO


----------------------------------------------------------------------------
-- add_Resource
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Resource')
	DROP PROCEDURE [add_Resource]
GO

CREATE PROCEDURE add_Resource
	@version nvarchar(8),
	@type varchar(8), 
	@url varchar(255),

	@edition varchar(16) = NULL,
	@official bit = 0,
	@siteName varchar(64) = NULL,
	@siteUrl varchar(255) = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @edition IS NULL AND NOT EXISTS (SELECT * FROM [Resources] WHERE [VersionId] = @version AND [ResourceTypeId] = @type AND [Url] = @url)
			INSERT INTO [Resources]([VersionId], [ResourceTypeId], [Url], [IsOfficial]) VALUES (@version, @type, @url, @official)
	
	IF @edition IS NOT NULL AND NOT EXISTS (SELECT * FROM [Resources] WHERE [VersionId] = @version AND [EditionId] = @edition AND [ResourceTypeId] = @type AND [Url] = @url)
		INSERT INTO [Resources]([VersionId], [EditionId], [ResourceTypeId], [Url], [IsOfficial]) VALUES (@version, @edition, @type, @url, @official)


	IF @siteUrl IS NOT NULL AND @siteName IS NOT NULL
	BEGIN 
		EXEC add_Site @name = @siteName, @url = @siteUrl

		DECLARE @siteId int = (SELECT [Id] FROM [Sites] WHERE [Url] = @siteUrl)
		DECLARE @resourceId int = (SELECT [Id] FROM [Resources] WHERE [VersionId] = @version AND [ResourceTypeId] = @type AND [Url] = @url)

		UPDATE [Resources] SET [SiteId] = @siteId WHERE [Id] = @resourceId AND [SiteId] IS NULL
	END

END
GO


----------------------------------------------------------------------------
-- add_Version
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Version')
	DROP PROCEDURE [add_Version]
GO

CREATE PROCEDURE add_Version
	@id varchar(8), 
	@name nvarchar(64),
	@lang varchar(3),
	@year smallint,
	
	@sub nvarchar(128) = NULL,
	@hebrew varchar(3) = NULL,
	@greek varchar(3) = NULL,
	@parent varchar(8) = NULL, 
	@license int = NULL,
	@level [decimal](4, 2) = NULL,
	@versionUrl varchar(255) = NULL,
	@licenseUrl varchar(255) = NULL,
	@readUrl varchar(255) = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM [Versions] WHERE [Id] = @id)
		INSERT INTO [Versions]([Id], [Name], [LanguageId], [YearPublished]) VALUES (@id, @name, @lang, @year)

	UPDATE [Versions] SET [Subtitle] = @sub WHERE [Id] = @id AND @sub IS NOT NULL AND [Subtitle] IS NULL
	UPDATE [Versions] SET [HebrewFormId] = @hebrew WHERE [Id] = @id AND @hebrew IS NOT NULL AND [HebrewFormId] IS NULL
	UPDATE [Versions] SET [GreekFormId] = @greek WHERE [Id] = @id AND @greek IS NOT NULL AND [GreekFormId] IS NULL
	UPDATE [Versions] SET [LicenseTypeId] = @license WHERE [Id] = @id AND @license IS NOT NULL AND [LicenseTypeId] IS NULL
	UPDATE [Versions] SET [ReadingLevel] = @level WHERE [Id] = @id AND @level IS NOT NULL AND [ReadingLevel] IS NULL

	IF EXISTS (SELECT * FROM [Versions] WHERE Id = @parent)
		UPDATE [Versions] SET [ParentId] = @parent WHERE [Id] = @id AND @parent IS NOT NULL AND [ParentId] IS NULL

	IF @versionUrl IS NOT NULL EXEC add_Resource @version=@id, @type='version', @url=@versionUrl, @official=1
	IF @licenseUrl IS NOT NULL EXEC add_Resource @version=@id, @type='license', @url=@licenseUrl, @official=1
	IF @readUrl IS NOT NULL EXEC add_Resource @version=@id, @type='read', @url=@readUrl, @official=1

END
GO


----------------------------------------------------------------------------
-- add_Edition
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Edition')
	DROP PROCEDURE [add_Edition]
GO

CREATE PROCEDURE add_Edition
	@id varchar(16), 
	@version varchar(8),
	@year smallint,
	@sub nvarchar(128) = NULL,

	@editionUrl varchar(255) = NULL,
	@licenseUrl varchar(255) = NULL,
	@readUrl varchar(255) = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM [Editions] WHERE [Id] = @id)
		INSERT INTO [Editions]([Id], [VersionId], [YearPublished]) VALUES (@id, @version, @year)

	UPDATE [Editions] SET [Subtitle] = @sub WHERE [Id] = @id AND @sub IS NOT NULL AND [Subtitle] IS NULL

	IF @editionUrl IS NOT NULL EXEC add_Resource @version=@version, @edition=@id, @type='edition', @url=@editionUrl, @official=1
	IF @licenseUrl IS NOT NULL EXEC add_Resource @version=@version, @edition=@id, @type='license', @url=@licenseUrl, @official=1
	IF @readUrl IS NOT NULL EXEC add_Resource @version=@version, @edition=@id, @type='read', @url=@readUrl, @official=1

END
GO


----------------------------------------------------------------------------
-- add_Bible
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_Bible')
	DROP PROCEDURE [add_Bible]
GO

CREATE PROCEDURE add_Bible
	@id varchar(16), 
	@name nvarchar(64),
	@version varchar(8),
	@year smallint,
	
	@edition varchar(16) = NULL,
	@sub nvarchar(128) = NULL,
	@sourceUrl varchar(255) = NULL

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM [Bibles] WHERE [Id] = @id)
		INSERT INTO [Bibles]([Id], [VersionId], [Name], [YearPublished]) VALUES (@id, @version, @name, @year)

	UPDATE [Bibles] SET [EditionId] = @edition WHERE [Id] = @id AND @edition IS NOT NULL AND [EditionId] IS NULL

	IF @sourceUrl IS NOT NULL EXEC add_Resource @version=@id,@edition=@edition,@type='file',@url=@sourceUrl
	
END
GO


----------------------------------------------------------------------------
-- add_BookName
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_BookName')
	DROP PROCEDURE [add_BookName]
GO

CREATE PROCEDURE add_BookName
	@bookId int, 
	@name nvarchar(64)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM [BookNames] WHERE [Name] = @name)
		INSERT INTO [BookNames]([BookId], [Name]) VALUES (@bookId, LOWER(@Name))

END
GO


----------------------------------------------------------------------------
-- add_BibleVerse
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_BibleVerse')
	DROP PROCEDURE [add_BibleVerse]
GO

CREATE PROCEDURE add_BibleVerse
	@bibleId varchar(16), 
	@verseId int,
	@markup nvarchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT * FROM [BibleVerses] WHERE [BibleId] = @bibleId AND [VerseId] = @verseId)
		INSERT INTO [BibleVerses]([BibleId], [VerseId], [Markup]) VALUES (@bibleId, @verseId, @markup)

END
GO


----------------------------------------------------------------------------
-- add_BibleMarkup
----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'add_BibleMarkup')
	DROP PROCEDURE [add_BibleMarkup]
GO

CREATE PROCEDURE add_BibleMarkup
	@bibleId varchar(16), 
	@book varchar(64),
	@chapter smallint,
	@verse smallint,
	@markup nvarchar(max)

AS
BEGIN
	
	DECLARE @bookId int = (SELECT [Id] FROM [Books] WHERE @book IN ([Name], [Code], [Abbrev], [OsisCode], [ParaText], CONVERT(varchar(3),[Book])))

	IF @bookId IS NULL SET @bookId = (SELECT [BookId] FROM BookNames WHERE [Name] = @book)

	DECLARE @verseId int = (SELECT [Id] FROM [Verses] WHERE [BookId] = @bookId AND [Chapter] = @chapter AND [Verse] = @verse)
	EXEC add_BibleVerse @bibleId=@bibleId,@verseId=@verseId,@markup=@markup

END
GO


----------------------------------------------------------------------------
-- Schema 
----------------------------------------------------------------------------
INSERT INTO SchemaUpdates ([Code]) VALUES ('2024.7.26.3')
