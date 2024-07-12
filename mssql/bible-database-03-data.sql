/***************************************************************************
* Bible Database: SQL Server
* bible-database-03-data.sql
*
* Version: 2024.7.11
* 
* License: CC BY 4.0 - https://creativecommons.org/licenses/by/4.0/
* 
***************************************************************************/


----------------------------------------------------------------------------
-- Versions
----------------------------------------------------------------------------
INSERT INTO [dbo].[Versions]([Id], [Name], [SubTitle], [LanguageId], [YearPublished], [LicenseTypeId], [ReadingLevel] ,[HebrewFormId], [GreekFormId], [BibleUrl], [ReadUrl], [LicenseUrl])
     VALUES ('RVA', 'Reina-Valera Antigua', NULL, 'esp', 1569, 1, NULL, 'MAS', 'TRG', NULL, 'https://www.biblegateway.com/versions/Reina-Valera-Antigua-RVA-Biblia/', NULL)
	, ('RV', 'Reina Valera', NULL, 'esp', 1602, 1, NULL, 'MAS', 'TRG', NULL, NULL, NULL)
	, ('KJV', 'King James Version', NULL, 'eng', 1611, 2, 12.0, 'MAS', 'TRG', NULL, NULL, NULL)
	, ('BGS', 'Brenton Greek Septuagint', NULL, 'grc', 1851, 1, NULL, NULL, NULL, NULL, NULL, NULL)
	, ('YLT', 'Young’s Literal Translation', NULL, 'eng', 1862, 1, NULL, NULL, NULL, NULL, NULL, NULL)
	, ('ERV', 'Revised Version', NULL, 'eng', 1885, 1, NULL, NULL, NULL, 'https://ebible.org/find/show.php?id=eng-rv', NULL, NULL)
	, ('NRSV', 'New Revised Standard Version', NULL, 'eng', 1889, 7, 11.00, NULL, NULL, 'https://friendshippress.org/nrsv-updated-edition/', NULL, 'https://friendshippress.org/bible-licensing/licensing-and-permissions-guidelines/')
	, ('NA', 'Novum Testamentum Graece', '(Nestle-Aland GNT)', 'grc', 1898, 11, NULL, NULL, 'CT', 'https://www.academic-bible.com/en/scholarly-bible-editions/novum-testamentum-graece-nestle-aland', 'https://www.bibelwissenschaft.de/en/bible/NA28/', NULL)
	, ('ASV', 'American Standard Version', NULL, 'eng', 1901, 1, NULL, NULL, NULL, NULL, 'MAS', 'CT')
	, ('TCNT', 'Twentieth Century New Testament', NULL, 'eng', 1904, 1, NULL, NULL, NULL, NULL, NULL, NULL)
	, ('BHK', 'Biblia Hebraica', '(Kittel)', 'hbo', 1906, 1, NULL, 'JBC', NULL, 'https://www.academic-bible.com/en/rudolf-kittels-biblia-hebraica-bhk', NULL, NULL)
	, ('JPS', 'Jewish Publication Society of America Version', NULL, 'eng', 1917, 1, NULL, NULL, NULL, 'https://jps.org/download-the-tanakh-1917-translation/', NULL, NULL)
	, ('RSV', 'Revised Standard Version', NULL, 'eng', 1952, 7, 12.00, NULL, NULL, 'https://friendshippress.org/our-bibles/', NULL, 'https://friendshippress.org/bible-licensing/licensing-and-permissions-guidelines/')
	, ('AMP', 'Amplified Bible, The', NULL, 'eng', 1965, 7, 11.00, NULL, NULL, NULL, NULL, NULL)
	, ('BBE', 'Bible in Basic English', NULL, 'eng', 1965, 1, NULL, NULL, NULL, NULL, NULL, NULL)
	, ('UBS', 'United Bible Societies’s Greek New Testament', NULL, 'grc', 1966, 11, NULL, NULL, 'CT', NULL, NULL, NULL)
	, ('NAB', 'New American Bible', NULL, 'eng', 1970, 7, 9.00, 'MAS', 'Ax', 'https://bible.usccb.org/bible', 'https://bible.usccb.org/bible', 'https://www.usccb.org/offices/new-american-bible/permissions')
	, ('NASB', 'New American Standard Bible', NULL, 'eng', 1971, 7, 11.00, NULL, NULL, NULL, NULL, NULL)
	, ('EVD', 'English Version for the Deaf', NULL, 'eng', 1978, 7, NULL, NULL, NULL, NULL, NULL, NULL)
	, ('NIV', 'New International Version', NULL, 'eng', 1978, 7, 7.80, 'MAS', 'Ax', 'https://www.thenivbible.com/', NULL, NULL)
	, ('NKJV', 'New King James Version', NULL, 'eng', 1982, 7, 7.00, NULL, NULL, NULL, NULL, NULL)
	, ('GNTMT', 'The Greek New Testament According to the Majority Text', 'Zane C. Hodges and Arthur L. Farstad', 'grc', 1982, NULL, NULL, NULL, 'Byz', NULL, NULL, NULL)
	, ('ICB', 'International Children’s Bible', NULL, 'eng', 1986, 7, 3.00, NULL, NULL, 'https://www.thomasnelsonbibles.com/icb/', NULL, NULL)
	, ('ERVE', 'Easy-to-Read Version', NULL, 'eng', 1987, 7, 3.00, NULL, NULL, 'https://www.bibleleague.org/bible-translation/', 'https://web.archive.org/web/20051231232017/http://www.wbtc.com/downloads/english_downloads_main.htm', NULL)
	, ('NCV', 'New Century Version', NULL, 'eng', 1987, 7, 5.00, NULL, NULL, 'https://www.thomasnelsonbibles.com/ncv/', NULL, NULL)
	, ('GNTBYZ', 'The New Testament in the Original Greek: Byzantine Textform', 'Maurice A. Robinson and William G. Pierpont', 'grc', 1991, 1, NULL, NULL, NULL, 'https://github.com/byztxt/byzantine-majority-text', NULL, NULL)
	, ('CEV', 'Contemporary English Version', NULL, 'eng', 1995, 7, NULL, NULL, NULL, 'https://cev.bible/', NULL, NULL)
	, ('NLT', 'New Living Translation', NULL, 'eng', 1996, 7, 6.00, NULL, NULL, NULL, NULL, NULL)
	, ('NIrV', 'New International Reader’s Version', NULL, 'eng', 1996, 7, 3.00, NULL, NULL, 'https://www.thenivbible.com/nirv/', NULL, 'https://www.biblica.com/terms-of-use/')
	, ('NVI', 'Nueva Versión Internacional', NULL, 'esp', 1999, 7, NULL, 'MAS', 'Ax', 'http://nuevaversioninternacional.com/', NULL, NULL)
	, ('WEB', 'World English Bible', NULL, 'eng', 2000, 1, NULL, NULL, NULL, 'https://worldenglishbible.org/', NULL, NULL)
	, ('NET', 'New English Translation', NULL, 'eng', 2001, 6, 7.00, NULL, NULL, 'https://netbible.com/', NULL, 'https://berean.bible/terms.htm')
	, ('ESV', 'English Standard Version', NULL, 'eng', 2001, 7, 8.00, NULL, NULL, NULL, NULL, NULL)
	, ('MSG', 'Message, The', NULL, 'eng', 2002, 7, 5.00, NULL, NULL, 'https://messagebible.com/', NULL, 'https://www.tyndale.com/permissions')
	, ('HCSB', 'Holman Christian Standard Bible', NULL, 'eng', 2004, 7, 7.00, NULL, NULL, NULL, NULL, NULL)
	, ('TNIV', 'Today’s New International Version', NULL, 'eng', 2005, 7, 7.80, 'MAS', 'Ax', NULL, NULL, NULL)
	, ('EMTV', 'English Majority Text Version', NULL, 'eng', 2009, 4, NULL, NULL, NULL, 'http://www.majoritytext.com/', NULL, NULL)
	, ('LEB', 'Lexham English Bible', NULL, 'eng', 2011, 6, NULL, NULL, NULL, 'http://lexhamenglishbible.com/', NULL, 'https://lexhampress.com/LEB-License')
	, ('ISV', 'International Standard Version', NULL, 'eng', 2011, 7, 7.00, NULL, NULL, 'https://web.archive.org/web/20181216032202/https://www.isv.org/bible/', NULL, 'https://web.archive.org/web/20170418233626/https://www.isv.org/bible/legal/')
	, ('CEB', 'Common English Bible', NULL, 'eng', 2011, 7, 7.00, NULL, 'Ax', 'https://www.commonenglishbible.com/', NULL, NULL)
	, ('VOC', 'The Voice', NULL, 'eng', 2012, 7, 6.00, NULL, NULL, 'https://www.thomasnelsonbibles.com/product/the-voice-bible/', 'https://www.biblegateway.com/versions/The-Voice-Bible/', 'https://www.harpercollinschristian.com/sales-and-rights/permissions/#1')
	, ('MEV', 'Modern English Version', NULL, 'eng', 2014, 7, NULL, 'JBC', 'TRG', 'https://modernenglishversion.com/', NULL, NULL)
	, ('BSB', 'Berean Study Bible', NULL, 'eng', 2016, 6, NULL, NULL, NULL, 'https://bereanbible.com/', 'https://biblehub.com/bsb/genesis/1.htm', 'https://berean.bible/terms.htm')
	, ('BIB', 'Berean Interlinear Bible', NULL, 'eng', 2016, 6, NULL, NULL, NULL, 'https://interlinearbible.com/', NULL, 'https://berean.bible/terms.htm')
	, ('F35', 'THE SOVEREIGN CREATOR HAS SPOKEN', 'New Testament Translation with Commentary', 'eng', 2016, 3, NULL, NULL, 'F35', 'https://www.prunch.com.br/en/', 'https://www.prunch.com.br/en/studies/new-translation-of-the-new-testament/', 'https://ebible.org/find/show.php?id=engf35')
	, ('CSB', 'Christian Standard Bible', NULL, 'eng', 2017, 7, 7.00, NULL, NULL, 'https://csbible.com/', 'https://read.csbible.com/', 'https://csbible.com/about-the-csb/faqs/#faq/may-i-use-the-christian-standard-bible-in-my-writing')
	, ('FBV', 'Free Bible Version', NULL, 'eng', 2018, 5, NULL, NULL, NULL, 'http://www.freebibleversion.org/', NULL, 'https://ebible.org/find/details.php?id=engfbv')
	, ('LSV', 'Literal Standard Version', NULL, 'eng', 2020, 4, NULL, NULL, NULL, 'https://www.lsvbible.com/', NULL, NULL)
	, ('GNTF35', 'Greek New Testament According to Family 35, The', NULL, 'grc', 2020, NULL, NULL, NULL, 'F35', NULL, NULL, NULL)
	, ('ASVBT', 'American Standard Version Byzantine Text', NULL, 'eng', 2021, 1, NULL, NULL, NULL, 'https://ebible.org/find/show.php?id=engasvbt', NULL, NULL)
	, ('LSB', 'Legacy Standard Bible', NULL, 'eng', 2021, 7, NULL, NULL, NULL, 'https://lsbible.org/', 'https://read.lsbible.org/', NULL)
	, ('TCENT', 'Text-Critical English New Testament, The', 'Byzantine Text Version', 'eng', 2021, 12, NULL, NULL, 'Byz', NULL, NULL, NULL)
	, ('MSB', 'Majority Standard Bible', NULL, 'eng', 2022, 1, NULL, NULL, NULL, 'https://majoritybible.com/', 'https://biblehub.com/msb/matthew/1.htm', 'https://berean.bible/licensing.htm')

----------------------------------------------------------------------------
-- Version Lineage
----------------------------------------------------------------------------

UPDATE Versions SET ParentId = 'ERV' WHERE Id = 'ASV'
UPDATE Versions SET ParentId = 'ASV' WHERE Id = 'ASVBT'
UPDATE Versions SET ParentId = 'ASV' WHERE Id = 'NASB'
UPDATE Versions SET ParentId = 'ASV' WHERE Id = 'WEB'
UPDATE Versions SET ParentId = 'BIB' WHERE Id = 'BSB'
UPDATE Versions SET ParentId = 'KJV' WHERE Id = 'ERV'
UPDATE Versions SET ParentId = 'KJV' WHERE Id = 'NKJV'
UPDATE Versions SET ParentId = 'ASV' WHERE Id = 'NASB'
UPDATE Versions SET ParentId = 'ASV' WHERE Id = 'AMP'
UPDATE Versions SET ParentId = 'RSV' WHERE Id = 'ESV'
UPDATE Versions SET ParentId = 'NASB' WHERE Id = 'LSB'
UPDATE Versions SET ParentId = 'HCSB' WHERE Id = 'CSB'
UPDATE Versions SET ParentId = 'RSV' WHERE Id = 'NRSV'
UPDATE Versions SET ParentId = 'ASV' WHERE Id = 'RSV'
UPDATE Versions SET ParentId = 'ICB' WHERE Id = 'NCV'
UPDATE Versions SET ParentId = 'ERVE' WHERE Id = 'ICB'
UPDATE Versions SET ParentId = 'EVD' WHERE Id = 'ERVE'
UPDATE Versions SET ParentId = 'RVA' WHERE Id = 'RV'
UPDATE Versions SET ParentId = 'NIV' WHERE Id = 'TNIV'
