/***************************************************************************
* Bible Database: SQL Server
* bible-database-04-versions.sql
*
* Version: 2024.7.26
* 
* Script License: CC BY 4.0 - https://creativecommons.org/licenses/by/4.0/
* 
***************************************************************************/

IF EXISTS (SELECT * FROM SchemaUpdates WHERE [Code] = '2024.7.26.4.1') 
	THROW 90000, 'Schema Update has already been run', 1;


----------------------------------------------------------------------------
-- Versions
----------------------------------------------------------------------------
EXEC add_Version @id='RVA', @name='Reina-Valera Antigua', @lang='esp', @year=1569, @hebrew='MAS', @greek='TRG', @license=1
EXEC add_Version @id='RV-esp', @name='Reina Valera', @lang='esp', @year=1602, @hebrew='MAS', @greek='TRG', @license=1
EXEC add_Version @id='KJV', @name='King James Version', @lang='eng', @year=1611, @hebrew='MAS', @greek='TRG', @license=2
EXEC add_Version @id='BGS', @name='Brenton Greek Septuagint', @lang='grc', @year=1844, @hebrew='LXX', @license=1
EXEC add_Version @id='YLT', @name='Young’s Literal Translation', @lang='eng', @year=1862, @hebrew='MAS', @greek='TRG', @license=1
EXEC add_Version @id='Darby', @name='Darby Translation', @lang='eng', @year=1884, @license=1
EXEC add_Version @id='RV', @name='Revised Version', @lang='eng', @year=1885, @hebrew='MAS', @greek='AX', @license=1
EXEC add_Version @id='NRSV', @name='New Revised Standard Version', @lang='eng', @year=1889, @hebrew='MAS', @greek='AX', @license=7, @level=11.00
EXEC add_Version @id='NA', @name='Novum Testamentum Graece', @lang='grc', @year=1898, @sub='(Nestle-Aland GNT)', @greek='AX', @license=11
EXEC add_Version @id='ASV', @name='American Standard Version', @lang='eng', @year=1901, @hebrew='MAS', @greek='AX', @license=1
EXEC add_Version @id='TCNT', @name='Twentieth Century New Testament', @lang='eng', @year=1904, @greek='AX', @license=1
EXEC add_Version @id='BHK', @name='Biblia Hebraica', @lang='hbo', @year=1906, @sub='(Kittel)', @hebrew='MAS', @license=1
EXEC add_Version @id='JPS', @name='Jewish Publication Society of America Version', @lang='eng', @year=1917, @hebrew='MAS', @license=1, @level=10.00
EXEC add_Version @id='RSV', @name='Revised Standard Version', @lang='eng', @year=1952, @hebrew='MAS', @greek='AX', @license=7, @level=12.00
EXEC add_Version @id='AMP', @name='Amplified Bible, The', @lang='eng', @year=1965, @hebrew='MAS', @greek='AX', @license=7, @level=11.00
EXEC add_Version @id='BBE', @name='Bible in Basic English', @lang='eng', @year=1965, @license=1
EXEC add_Version @id='UBS', @name='United Bible Societies’s Greek New Testament', @lang='grc', @year=1966, @greek='AX', @license=11
EXEC add_Version @id='BHS', @name='Biblia Hebraica Stuttgartensia', @lang='hbo', @year=1968, @hebrew='MAS'
EXEC add_Version @id='NAB', @name='New American Bible', @lang='eng', @year=1970, @hebrew='MAS', @greek='AX', @license=7, @level=9.00
EXEC add_Version @id='NASB', @name='New American Standard Bible', @lang='eng', @year=1971, @hebrew='MAS', @greek='AX', @license=7, @level=11.00
EXEC add_Version @id='TLB', @name='Living Bible, The', @lang='eng', @year=1971, @hebrew='MAS', @greek='AX', @license=7, @level=4.00
EXEC add_Version @id='NIV', @name='New International Version', @lang='eng', @year=1978, @hebrew='MAS', @greek='AX', @license=7, @level=7.80
EXEC add_Version @id='EVD', @name='English Version for the Deaf', @lang='eng', @year=1978, @hebrew='MAS', @greek='AX', @license=7, @level=3.00
EXEC add_Version @id='GNTMT', @name='Greek New Testament According to the Majority Text, The', @lang='grc', @year=1982, @sub='Zane C. Hodges and Arthur L. Farstad', @greek='BYZ'
EXEC add_Version @id='NKJV', @name='New King James Version', @lang='eng', @year=1982, @hebrew='MAS', @greek='TRG', @license=7, @level=7.00
EXEC add_Version @id='ICB', @name='International Children’s Bible', @lang='eng', @year=1986, @hebrew='MAS', @greek='AX', @license=7, @level=3.00
EXEC add_Version @id='NCV', @name='New Century Version', @lang='eng', @year=1987, @hebrew='MAS', @greek='AX', @license=7, @level=5.00
EXEC add_Version @id='ERVE', @name='Easy-to-Read Version', @lang='eng', @year=1987, @hebrew='MAS', @greek='AX', @license=7, @level=3.00
EXEC add_Version @id='GNTBYZ', @name='New Testament in the Original Greek: Byzantine Textform, The', @lang='grc', @year=1991, @sub='Maurice A. Robinson and William G. Pierpont', @greek='BYZ', @license=1
EXEC add_Version @id='CEV', @name='Contemporary English Version', @lang='eng', @year=1995, @license=7
EXEC add_Version @id='NLT', @name='New Living Translation', @lang='eng', @year=1996, @hebrew='MAS', @greek='AX', @license=7, @level=6.00
EXEC add_Version @id='NIrV', @name='New International Reader’s Version', @lang='eng', @year=1996, @hebrew='MAS', @greek='AX', @license=7, @level=3.00
EXEC add_Version @id='NVI', @name='Nueva Versión Internacional', @lang='esp', @year=1999, @hebrew='MAS', @greek='AX', @license=7
EXEC add_Version @id='WEB', @name='World English Bible', @lang='eng', @year=2000, @hebrew='MAS', @greek='BYZ', @license=1, @level=11.00
EXEC add_Version @id='ESV', @name='English Standard Version', @lang='eng', @year=2001, @hebrew='MAS', @greek='AX', @license=7, @level=8.00
EXEC add_Version @id='NET', @name='New English Translation', @lang='eng', @year=2001, @hebrew='MAS', @greek='AX', @license=6, @level=7.00
EXEC add_Version @id='MSG', @name='Message, The', @lang='eng', @year=2002, @license=7, @level=5.00
EXEC add_Version @id='EMTV', @name='English Majority Text Version', @lang='eng', @year=2003, @greek='BYZ', @license=4
EXEC add_Version @id='HCSB', @name='Holman Christian Standard Bible', @lang='eng', @year=2004, @hebrew='MAS', @greek='AX', @license=7, @level=7.00
EXEC add_Version @id='TNIV', @name='Today’s New International Version', @lang='eng', @year=2005, @hebrew='MAS', @greek='AX', @license=7, @level=7.80
EXEC add_Version @id='ISV', @name='International Standard Version', @lang='eng', @year=2011, @hebrew='MAS', @greek='AX', @license=9, @level=7.00
EXEC add_Version @id='CEB', @name='Common English Bible', @lang='eng', @year=2011, @hebrew='MAS', @greek='AX', @license=7, @level=7.00
EXEC add_Version @id='LEB', @name='Lexham English Bible', @lang='eng', @year=2011, @greek='AX', @license=6, @level=11.00
EXEC add_Version @id='VOC', @name='Voice, The', @lang='eng', @year=2012, @license=7, @level=6.00
EXEC add_Version @id='MEV', @name='Modern English Version', @lang='eng', @year=2014, @hebrew='MAS', @greek='TRG', @license=7
EXEC add_Version @id='F35', @name='Sovereign Creator Has Spoken, The', @lang='eng', @year=2016, @sub='Objective Authority for Living: The New Testament Translation with Commentary', @greek='F35', @license=3
EXEC add_Version @id='BIB', @name='Berean Interlinear Bible', @lang='eng', @year=2016, @hebrew='MAS', @greek='AX', @license=6
EXEC add_Version @id='BSB', @name='Berean Standard Bible', @lang='eng', @year=2016, @hebrew='MAS', @greek='AX', @license=6
EXEC add_Version @id='CSB', @name='Christian Standard Bible', @lang='eng', @year=2017, @hebrew='MAS', @greek='AX', @license=7, @level=7.00
EXEC add_Version @id='FBV', @name='Free Bible Version', @lang='eng', @year=2018, @license=5
EXEC add_Version @id='GNTF35', @name='Greek New Testament According to Family 35, The', @lang='grc', @year=2020, @greek='F35'
EXEC add_Version @id='LSV', @name='Literal Standard Version', @lang='eng', @year=2020, @hebrew='MAS', @greek='TRG', @license=4, @level=10.00
EXEC add_Version @id='TCENT', @name='Text-Critical English New Testament, The', @lang='eng', @year=2021, @sub='Byzantine Text Version', @greek='AX', @license=12
EXEC add_Version @id='LSB', @name='Legacy Standard Bible', @lang='eng', @year=2021, @hebrew='MAS', @greek='AX', @license=7, @level=11.00
EXEC add_Version @id='ASVBT', @name='American Standard Version Byzantine Text', @lang='eng', @year=2021, @hebrew='MAS', @greek='BYZ', @license=1
EXEC add_Version @id='MSB', @name='Majority Standard Bible', @lang='eng', @year=2022, @hebrew='MAS', @greek='BYZ', @license=1

----------------------------------------------------------------------------
-- Version Lineage
----------------------------------------------------------------------------
UPDATE Versions SET [ParentId] = 'RVA' WHERE [Id] = 'RV-esp' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'KJV' WHERE [Id] = 'RV' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'RSV' WHERE [Id] = 'NRSV' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'RV' WHERE [Id] = 'ASV' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'ASV' WHERE [Id] = 'RSV' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'ASV' WHERE [Id] = 'AMP' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'BHK' WHERE [Id] = 'BHS' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'ASV' WHERE [Id] = 'NASB' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'ASV' WHERE [Id] = 'TLB' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'KJV' WHERE [Id] = 'NKJV' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'ERVE' WHERE [Id] = 'ICB' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'EVD' WHERE [Id] = 'ERVE' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'ICB' WHERE [Id] = 'NCV' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'NIV' WHERE [Id] = 'NIrV' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'TLB' WHERE [Id] = 'NLT' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'ASV' WHERE [Id] = 'WEB' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'RSV' WHERE [Id] = 'ESV' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'NIV' WHERE [Id] = 'TNIV' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'BIB' WHERE [Id] = 'BSB' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'HCSB' WHERE [Id] = 'CSB' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'YLT' WHERE [Id] = 'LSV' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'ASV' WHERE [Id] = 'ASVBT' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'NASB' WHERE [Id] = 'LSB' AND [ParentId] IS NULL
UPDATE Versions SET [ParentId] = 'BSB' WHERE [Id] = 'MSB' AND [ParentId] IS NULL

----------------------------------------------------------------------------
-- Editions
----------------------------------------------------------------------------
EXEC add_Edition @id='KJV-1611', @version='KJV', @year=1611
EXEC add_Edition @id='KJV-1769', @version='KJV', @year=1769
EXEC add_Edition @id='ASV-1901', @version='ASV', @year=1901
EXEC add_Edition @id='AMP65', @version='AMP', @year=1965
EXEC add_Edition @id='NASB77', @version='NASB', @year=1977
EXEC add_Edition @id='NKJV82', @version='NKJV', @year=1982
EXEC add_Edition @id='NKJV84', @version='NKJV', @year=1984
EXEC add_Edition @id='NIV84', @version='NIV', @year=1984
EXEC add_Edition @id='AMP87', @version='AMP', @year=1987
EXEC add_Edition @id='GNTBYZ-1991', @version='GNTBYZ', @year=1991
EXEC add_Edition @id='NASB95', @version='NASB', @year=1995
EXEC add_Edition @id='NLT96', @version='NLT', @year=1996
EXEC add_Edition @id='NET2001', @version='NET', @year=2001
EXEC add_Edition @id='ESV2001', @version='ESV', @year=2001
EXEC add_Edition @id='EMTV2003', @version='EMTV', @year=2003
EXEC add_Edition @id='NET2003', @version='NET', @year=2003
EXEC add_Edition @id='NLT2004', @version='NLT', @year=2004
EXEC add_Edition @id='GNTBYZ-2005', @version='GNTBYZ', @year=2005
EXEC add_Edition @id='NLT2007', @version='NLT', @year=2007
EXEC add_Edition @id='ESV2007', @version='ESV', @year=2007
EXEC add_Edition @id='EMTV2009', @version='EMTV', @year=2009
EXEC add_Edition @id='ESV2011', @version='ESV', @year=2011
EXEC add_Edition @id='NIV2011', @version='NIV', @year=2011
EXEC add_Edition @id='NA28', @version='NA', @year=2012
EXEC add_Edition @id='EMTV2012', @version='EMTV', @year=2012
EXEC add_Edition @id='NLT2013', @version='NLT', @year=2013
EXEC add_Edition @id='EMTV2014', @version='EMTV', @year=2014
EXEC add_Edition @id='NLT2015', @version='NLT', @year=2015
EXEC add_Edition @id='AMP2015', @version='AMP', @year=2015
EXEC add_Edition @id='ESV2016', @version='ESV', @year=2016
EXEC add_Edition @id='CSB2017', @version='CSB', @year=2017
EXEC add_Edition @id='NET2017', @version='NET', @year=2017
EXEC add_Edition @id='GNTBYZ-2018', @version='GNTBYZ', @year=2018
EXEC add_Edition @id='NET2019', @version='NET', @year=2019
EXEC add_Edition @id='CSB2020', @version='CSB', @year=2020
EXEC add_Edition @id='NASB2020', @version='NASB', @year=2020
EXEC add_Edition @id='F35-2023', @version='F35', @year=2023

----------------------------------------------------------------------------
-- Bibles
----------------------------------------------------------------------------
-- these are added individually

----------------------------------------------------------------------------
-- Sites
----------------------------------------------------------------------------
EXEC add_Site @name='German Bible Society', @url='https://www.die-bibel.de/en'
EXEC add_Site @name='jsonBible.com', @url='https://jsonbible.com/'
EXEC add_Site @name='Lockman Foundation', @url='https://www.lockman.org/'
EXEC add_Site @name='eBible.org', @url='https://ebible.org/'

----------------------------------------------------------------------------
-- Resources
----------------------------------------------------------------------------
EXEC add_Resource @version='NA', @type='read', @url='https://www.die-bibel.de/en/bible/NA28/', @official=1, @edition='NA28', @siteName='German Bible Society', @siteUrl='https://www.die-bibel.de/en'
EXEC add_Resource @version='NAB', @type='read', @url='https://bible.usccb.org/bible', @official=1
EXEC add_Resource @version='ERVE', @type='read', @url='https://web.archive.org/web/20051231232017/http://www.wbtc.com/downloads/english_downloads_main.htm', @official=1
EXEC add_Resource @version='VOC', @type='read', @url='https://www.biblegateway.com/versions/The-Voice-Bible/', @official=0
EXEC add_Resource @version='BSB', @type='read', @url='https://biblehub.com/bsb/genesis/1.htm', @official=1
EXEC add_Resource @version='F35', @type='read', @url='https://www.prunch.com.br/en/studies/new-translation-of-the-new-testament/', @official=1, @edition='F35-2023'
EXEC add_Resource @version='CSB', @type='read', @url='https://read.csbible.com/', @official=1
EXEC add_Resource @version='LSB', @type='read', @url='https://read.lsbible.org/', @official=1
EXEC add_Resource @version='MSB', @type='read', @url='https://biblehub.com/msb/matthew/1.htm', @official=1
EXEC add_Resource @version='RVA', @type='read', @url='https://www.biblegateway.com/versions/Reina-Valera-Antigua-RVA-Biblia/', @official=0
EXEC add_Resource @version='RV', @type='file', @url='https://ebible.org/find/show.php?id=eng-rv', @official=0, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='ASVBT', @type='version', @url='https://ebible.org/find/show.php?id=engasvbt', @official=1, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='BHK', @type='version', @url='https://www.die-bibel.de/en/rudolf-kittels-biblia-hebraica-bhk', @official=1, @siteName='German Bible Society', @siteUrl='https://www.die-bibel.de/en'
EXEC add_Resource @version='BIB', @type='version', @url='https://interlinearbible.com/', @official=1
EXEC add_Resource @version='CEB', @type='version', @url='https://www.commonenglishbible.com/', @official=1
EXEC add_Resource @version='CEV', @type='version', @url='https://cev.bible/', @official=1
EXEC add_Resource @version='CSB', @type='version', @url='https://csbible.com/', @official=1
EXEC add_Resource @version='EMTV', @type='version', @url='http://www.majoritytext.com/', @official=1
EXEC add_Resource @version='ERVE', @type='version', @url='https://www.bibleleague.org/bible-translation/', @official=1
EXEC add_Resource @version='FBV', @type='version', @url='http://www.freebibleversion.org/', @official=1
EXEC add_Resource @version='GNTBYZ', @type='file', @url='https://github.com/byztxt/byzantine-majority-text', @official=1, @edition='GNTBYZ-2018'
EXEC add_Resource @version='ICB', @type='version', @url='https://www.thomasnelsonbibles.com/icb/', @official=1
EXEC add_Resource @version='ISV', @type='version', @url='https://web.archive.org/web/20181216032202/https://www.isv.org/bible/', @official=1
EXEC add_Resource @version='JPS', @type='version', @url='https://jps.org/download-the-tanakh-1917-translation/', @official=1
EXEC add_Resource @version='LEB', @type='version', @url='http://lexhamenglishbible.com/', @official=1
EXEC add_Resource @version='LSB', @type='version', @url='https://lsbible.org/', @official=1
EXEC add_Resource @version='LSV', @type='version', @url='https://www.lsvbible.com/', @official=1
EXEC add_Resource @version='MEV', @type='version', @url='https://modernenglishversion.com/', @official=1
EXEC add_Resource @version='MSB', @type='version', @url='https://majoritybible.com/', @official=1
EXEC add_Resource @version='MSG', @type='version', @url='https://messagebible.com/', @official=1
EXEC add_Resource @version='NA', @type='version', @url='https://www.die-bibel.de/en/novum-testamentum-graece-nestle-aland', @official=1, @siteName='German Bible Society', @siteUrl='https://www.die-bibel.de/en'
EXEC add_Resource @version='NAB', @type='version', @url='https://bible.usccb.org/bible', @official=1
EXEC add_Resource @version='NCV', @type='version', @url='https://www.thomasnelsonbibles.com/ncv/', @official=1
EXEC add_Resource @version='NET', @type='version', @url='https://netbible.com/', @official=1
EXEC add_Resource @version='NIrV', @type='version', @url='https://www.thenivbible.com/nirv/', @official=1
EXEC add_Resource @version='NIV', @type='version', @url='https://www.thenivbible.com/', @official=1
EXEC add_Resource @version='NRSV', @type='version', @url='https://friendshippress.org/nrsv-updated-edition/', @official=1
EXEC add_Resource @version='NVI', @type='version', @url='http://nuevaversioninternacional.com/', @official=1
EXEC add_Resource @version='RSV', @type='version', @url='https://friendshippress.org/our-bibles/', @official=1
EXEC add_Resource @version='VOC', @type='version', @url='https://www.thomasnelsonbibles.com/product/the-voice-bible/', @official=1
EXEC add_Resource @version='WEB', @type='version', @url='https://worldenglishbible.org/', @official=1
EXEC add_Resource @version='BIB', @type='license', @url='https://berean.bible/terms.htm', @official=1
EXEC add_Resource @version='BSB', @type='license', @url='https://berean.bible/terms.htm', @official=1
EXEC add_Resource @version='CSB', @type='license', @url='https://csbible.com/about-the-csb/faqs/#faq/may-i-use-the-christian-standard-bible-in-my-writing', @official=1
EXEC add_Resource @version='F35', @type='license', @url='https://ebible.org/find/show.php?id=engf35', @official=0, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='FBV', @type='license', @url='https://ebible.org/find/details.php?id=engfbv', @official=0, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='ISV', @type='license', @url='https://web.archive.org/web/20170418233626/https://www.isv.org/bible/legal/', @official=1
EXEC add_Resource @version='LEB', @type='license', @url='https://lexhampress.com/LEB-License', @official=1
EXEC add_Resource @version='MSB', @type='license', @url='https://berean.bible/licensing.htm', @official=1
EXEC add_Resource @version='MSG', @type='license', @url='https://www.tyndale.com/permissions', @official=1
EXEC add_Resource @version='NAB', @type='license', @url='https://www.usccb.org/offices/new-american-bible/permissions', @official=1
EXEC add_Resource @version='NET', @type='license', @url='https://berean.bible/terms.htm', @official=1
EXEC add_Resource @version='NIrV', @type='license', @url='https://www.biblica.com/terms-of-use/', @official=1
EXEC add_Resource @version='NRSV', @type='license', @url='https://friendshippress.org/bible-licensing/licensing-and-permissions-guidelines/', @official=1
EXEC add_Resource @version='RSV', @type='license', @url='https://friendshippress.org/bible-licensing/licensing-and-permissions-guidelines/', @official=1
EXEC add_Resource @version='VOC', @type='license', @url='https://www.harpercollinschristian.com/sales-and-rights/permissions/#1', @official=1
EXEC add_Resource @version='BSB', @type='version', @url='https://berean.bible/', @official=1
EXEC add_Resource @version='GNTBYZ', @type='version', @url='https://byzantinetext.com/', @official=1
EXEC add_Resource @version='GNTBYZ', @type='license', @url='https://byzantinetext.com/study/editions/robinson-pierpont/', @official=1
EXEC add_Resource @version='GNTBYZ', @type='file', @url='https://archive.org/details/newtestamentrobinsonpierpontbyzantine/', @official=0, @edition='GNTBYZ-2005'
EXEC add_Resource @version='KJV', @type='api', @url='https://jsonbible.com/', @official=0, @edition='KJV-1769', @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='ASV', @type='api', @url='https://jsonbible.com/', @official=0, @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='NIV', @type='api', @url='https://jsonbible.com/', @official=0, @edition='NIV84', @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='NKJV', @type='api', @url='https://jsonbible.com/', @official=0, @edition='NKJV84', @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='ESV', @type='api', @url='https://jsonbible.com/', @official=0, @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='NASB', @type='api', @url='https://jsonbible.com/', @official=0, @edition='NASB95', @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='AMP', @type='api', @url='https://jsonbible.com/', @official=0, @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='BBE', @type='api', @url='https://jsonbible.com/', @official=0, @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='Darby', @type='api', @url='https://jsonbible.com/', @official=0, @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='NLT', @type='api', @url='https://jsonbible.com/', @official=0, @siteName='jsonBible.com', @siteUrl='https://jsonbible.com/'
EXEC add_Resource @version='WEB', @type='file', @url='https://biblehub.info/data/bibles.xlsx', @official=0
EXEC add_Resource @version='RV', @type='file', @url='https://biblehub.info/data/bibles.xlsx', @official=0
EXEC add_Resource @version='BHS', @type='read', @url='https://www.die-bibel.de/en/bible/BHS/', @official=1, @siteName='German Bible Society', @siteUrl='https://www.die-bibel.de/en'
EXEC add_Resource @version='AMP', @type='version', @url='https://www.lockman.org/amplified-bible-amp/', @official=1, @siteName='Lockman Foundation', @siteUrl='https://www.lockman.org/'
EXEC add_Resource @version='NASB', @type='version', @url='https://www.lockman.org/new-american-standard-bible-nasb/', @official=1, @siteName='Lockman Foundation', @siteUrl='https://www.lockman.org/'
EXEC add_Resource @version='NASB', @type='edition', @url='https://www.lockman.org/new-american-standard-bible-nasb/more-information-nasb-1995/', @official=1, @edition='NASB95', @siteName='Lockman Foundation', @siteUrl='https://www.lockman.org/'
EXEC add_Resource @version='NASB', @type='edition', @url='https://www.lockman.org/new-american-standard-bible-nasb/more-information-about-nasb-2020/', @official=1, @edition='NASB2020', @siteName='Lockman Foundation', @siteUrl='https://www.lockman.org/'
EXEC add_Resource @version='LSB', @type='version', @url='https://www.lockman.org/legacy-standard-bible-lsb/', @official=0, @siteName='Lockman Foundation', @siteUrl='https://www.lockman.org/'
EXEC add_Resource @version='BBE', @type='read', @url='https://o-bible.com/bbe.html', @official=0
EXEC add_Resource @version='BBE', @type='license', @url='http://www.bible-discovery.com/bible-license-bbe.php', @official=0
EXEC add_Resource @version='EMTV', @type='read', @url='https://majoritytext.com/', @official=1, @edition='EMTV2009'
EXEC add_Resource @version='EMTV', @type='read', @url='https://textusreceptusbibles.com/EMTV', @official=0, @edition='EMTV2009'
EXEC add_Resource @version='EMTV', @type='read', @url='https://ebible.org/engemtv/INT01.htm', @official=0, @edition='EMTV2014', @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='EMTV', @type='file', @url='https://ebible.org/find/show.php?id=engemtv', @official=0, @edition='EMTV2014', @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='EMTV', @type='read', @url='https://nocr.net/hbm/english/engemt/index.php', @official=0, @edition='EMTV2003'
EXEC add_Resource @version='EMTV', @type='file', @url='https://www.crosswire.org/sword/modules/ModInfo.jsp?modName=EMTV', @official=0, @edition='EMTV2012'
EXEC add_Resource @version='FBV', @type='file', @url='https://ebible.org/find/show.php?id=engfbv', @official=0, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='FBV', @type='read', @url='https://ebible.org/study/?w1=bible&t1=local%3Aengfbv&v1=JN1_1', @official=0, @siteName='eBible.org', @siteUrl='https://ebible.org/'
EXEC add_Resource @version='FBV', @type='read', @url='https://ebible.org/engfbv/', @official=0, @siteName='eBible.org', @siteUrl='https://ebible.org/'



----------------------------------------------------------------------------
-- Schema 
----------------------------------------------------------------------------
INSERT INTO SchemaUpdates ([Code]) VALUES ('2024.7.26.4.1')
