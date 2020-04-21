/*
Navicat SQL Server Data Transfer

Source Server         : Localhost
Source Server Version : 140000
Source Host           : DESKTOP-UN7E7G8\SQLEXPRESS:1433
Source Database       : TvShows
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 140000
File Encoding         : 65001

Date: 2020-04-20 22:24:10
*/


-- ----------------------------
-- Table structure for Roles
-- ----------------------------
DROP TABLE [dbo].[Roles]
GO
CREATE TABLE [dbo].[Roles] (
[RoleId] int NOT NULL IDENTITY(1,1) ,
[RoleName] varchar(50) NOT NULL ,
[State] bit NOT NULL DEFAULT ((1)) 
)


GO
DBCC CHECKIDENT(N'[dbo].[Roles]', RESEED, 2)
GO

-- ----------------------------
-- Records of Roles
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Roles] ON
GO
INSERT INTO [dbo].[Roles] ([RoleId], [RoleName], [State]) VALUES (N'1', N'Administrators', N'1')
GO
GO
INSERT INTO [dbo].[Roles] ([RoleId], [RoleName], [State]) VALUES (N'2', N'Users', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO

-- ----------------------------
-- Table structure for Shows
-- ----------------------------
DROP TABLE [dbo].[Shows]
GO
CREATE TABLE [dbo].[Shows] (
[ShowId] bigint NOT NULL ,
[Name] varchar(500) NOT NULL ,
[Genres] varchar(500) NOT NULL ,
[Language] varchar(100) NOT NULL ,
[Channel] varchar(200) NOT NULL ,
[ScheduleTime] time(7) NULL ,
[Thumbnail] nvarchar(MAX) NOT NULL 
)


GO

-- ----------------------------
-- Records of Shows
-- ----------------------------
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'1', N'Under the Dome', N'Drama,Science-Fiction,Thriller', N'English', N'CBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'2', N'Person of Interest', N'Action,Crime,Science-Fiction', N'English', N'CBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/163/407679.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'3', N'Bitten', N'Drama,Horror,Romance', N'English', N'CTV Sci-Fi Channel', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/15.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'4', N'Arrow', N'Drama,Action,Science-Fiction', N'English', N'The CW', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/213/534017.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'5', N'True Detective', N'Drama,Crime,Thriller', N'English', N'HBO', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/178/445621.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'6', N'The 100', N'Action,Adventure,Science-Fiction', N'English', N'The CW', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/189/474423.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'7', N'Homeland', N'Drama,Thriller,Espionage', N'English', N'Showtime', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/230/575652.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'8', N'Glee', N'Drama,Music,Romance', N'English', N'FOX', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/73.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'9', N'Revenge', N'Drama,Thriller,Mystery', N'English', N'ABC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/82/206879.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'10', N'Grimm', N'Drama,Crime,Supernatural', N'English', N'NBC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/69/174906.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'11', N'Gotham', N'Drama,Action,Crime', N'English', N'FOX', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/189/474715.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'12', N'Lost Girl', N'Drama,Fantasy,Horror', N'English', N'Showcase', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/137.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'13', N'The Flash', N'Drama,Action,Science-Fiction', N'English', N'The CW', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/210/527217.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'14', N'Continuum', N'Drama,Crime,Science-Fiction', N'English', N'Showcase', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/184.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'15', N'Constantine', N'Drama,Action,Horror', N'English', N'NBC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/154.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'16', N'Penny Dreadful', N'Horror,Thriller,Supernatural', N'English', N'Showtime', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/48/122237.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'18', N'The Amazing Race', N'Action,Adventure,Family', N'English', N'CBS', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/237/592579.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'19', N'Supernatural', N'Drama,Action,Supernatural', N'English', N'The CW', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/211/528024.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'20', N'The Strain', N'Drama,Horror,Thriller', N'English', N'FX', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/130/325621.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'21', N'The Last Ship', N'Drama,Action,Thriller', N'English', N'TNT', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/164/412464.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'22', N'True Blood', N'Drama,Romance,Supernatural', N'English', N'HBO', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/219/549596.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'23', N'Once Upon a Time in Wonderland', N'Drama,Adventure,Fantasy', N'English', N'ABC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/73/183661.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'24', N'Hawaii Five-0', N'Drama,Action,Crime', N'English', N'CBS', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/213/532575.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'25', N'Hellsing', N'Anime,Horror,Supernatural', N'Japanese', N'Fuji TV', 0x30303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/178/446544.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'26', N'Hellsing Ultimate', N'Drama,Action,Anime,Horror', N'Japanese', N'TBS', 0x31323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/178/446780.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'27', N'Berserk', N'Anime,Fantasy,Horror', N'Japanese', N'NTV', 0x30303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/249.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'28', N'Californication', N'Drama,Comedy', N'English', N'Showtime', 0x32313A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/38/95017.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'29', N'Vikings', N'Drama,Action,History', N'English', N'History', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/214/536315.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'30', N'American Horror Story', N'Drama,Horror,Thriller', N'English', N'FX', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/209/523439.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'31', N'Marvel''s Agents of S.H.I.E.L.D.', N'Action,Adventure,Science-Fiction', N'English', N'ABC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/251/629804.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'32', N'Fargo', N'Drama,Crime', N'English', N'FX', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/248/620754.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'33', N'Hemlock Grove', N'Drama,Horror,Thriller', N'English', N'Netflix', 0x30303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/305.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'34', N'Helix', N'Horror,Science-Fiction,Thriller', N'English', N'Syfy', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/126/316697.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'35', N'The Killing', N'Drama,Crime,Thriller', N'English', N'Netflix', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/216/540157.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'37', N'Intruders', N'Drama,Fantasy,Thriller', N'English', N'BBC America', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/126/316698.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'38', N'Z Nation', N'Action,Horror,Science-Fiction', N'English', N'Syfy', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/170/426759.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'39', N'Resurrection', N'Drama,Science-Fiction,Mystery', N'English', N'ABC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/350.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'40', N'Death Note', N'Drama,Anime,Thriller,Mystery', N'Japanese', N'NTV', 0x31333A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/361.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'41', N'Last Man Standing', N'Comedy,Family', N'English', N'FOX', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/225/563735.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'42', N'Sleepy Hollow', N'Drama,Mystery,Supernatural', N'English', N'FOX', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/81/204166.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'43', N'Outlander', N'Adventure,Romance,Science-Fiction', N'English', N'Starz', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/234/586470.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'44', N'Scorpion', N'Drama,Action,Thriller', N'English', N'CBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/128/322484.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'45', N'NCIS: New Orleans', N'Drama,Crime', N'English', N'CBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/237/592628.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'46', N'Forever', N'Drama,Crime,Supernatural', N'English', N'ABC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/383.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'47', N'Witches of East End', N'Drama,Fantasy,Romance', N'English', N'Lifetime', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/392.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'48', N'Madam Secretary', N'Drama', N'English', N'CBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/214/536175.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'49', N'Brooklyn Nine-Nine', N'Comedy,Action,Crime', N'English', N'NBC', 0x32303A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/235/587547.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'50', N'The Lottery', N'Drama,Science-Fiction,Thriller', N'English', N'Lifetime', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/146/366444.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'51', N'The Knick', N'Drama,Medical', N'English', N'Cinemax', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/417.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'52', N'How to Get Away with Murder', N'Drama,Thriller,Legal', N'English', N'ABC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/212/531512.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'53', N'Nashville', N'Drama,Music,Romance', N'English', N'CMT', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/142/357495.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'54', N'Legends', N'Drama,Crime,Thriller', N'English', N'TNT', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/36/92018.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'55', N'Red Band Society', N'Drama,Comedy', N'English', N'FOX', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/441.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'56', N'Chicago P.D.', N'Drama,Crime', N'English', N'NBC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/213/534318.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'57', N'black-ish', N'Comedy,Family', N'English', N'ABC', 0x32313A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/171/429564.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'58', N'New Girl', N'Comedy,Romance', N'English', N'FOX', 0x32313A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/145/364581.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'59', N'Chicago Fire', N'Drama,Action', N'English', N'NBC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/213/534316.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'60', N'NCIS', N'Drama,Action,Crime', N'English', N'CBS', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/237/592625.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'61', N'Orphan Black', N'Drama,Science-Fiction,Thriller', N'English', N'CTV Sci-Fi Channel', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/111/277730.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'62', N'The Originals', N'Drama,Romance,Supernatural', N'English', N'The CW', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/156/391233.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'63', N'The Vampire Diaries', N'Drama,Romance,Supernatural', N'English', N'The CW', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/88/220908.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'64', N'Utopia', N'Drama,Science-Fiction,Thriller', N'English', N'Channel 4', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/474.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'65', N'Bones', N'Drama,Crime,Medical', N'English', N'FOX', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/80/201202.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'66', N'The Big Bang Theory', N'Comedy', N'English', N'CBS', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/173/433868.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'67', N'Grey''s Anatomy', N'Drama,Romance,Medical', N'English', N'ABC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/211/529884.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'68', N'Castle', N'Drama,Crime', N'English', N'ABC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/490.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'69', N'The Blacklist', N'Drama,Crime,Thriller', N'English', N'NBC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/232/580032.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'70', N'The Voice', N'Music', N'English', N'NBC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/244/610794.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'71', N'Dancing with the Stars', N'Music', N'English', N'ABC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/211/529210.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'72', N'NCIS: Los Angeles', N'Drama,Action,Crime', N'English', N'CBS', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/237/592626.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'73', N'The Walking Dead', N'Drama,Action,Horror', N'English', N'AMC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/238/596840.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'74', N'Hell on Wheels', N'Drama,Action,Western', N'English', N'AMC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/526.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'75', N'The Mindy Project', N'Comedy,Romance,Medical', N'English', N'Hulu', 0x30303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/547.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'76', N'Sons of Anarchy', N'Drama,Action,Crime', N'English', N'FX', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/537.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'77', N'The Middle', N'Comedy,Family', N'English', N'ABC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/562.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'78', N'The Mysteries of Laura', N'Comedy,Crime', N'English', N'NBC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/568.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'79', N'The Goldbergs', N'Comedy,Family', N'English', N'ABC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/182/456855.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'80', N'Modern Family', N'Comedy,Family', N'English', N'ABC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/240/600519.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'81', N'Criminal Minds', N'Drama,Crime,Thriller', N'English', N'CBS', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/237/592589.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'82', N'Game of Thrones', N'Drama,Adventure,Fantasy', N'English', N'HBO Go', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/190/476117.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'83', N'The Simpsons', N'Comedy,Family', N'English', N'FOX', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/639.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'84', N'Family Guy', N'Comedy,Family', N'English', N'FOX', 0x30303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/641.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'86', N'Stalker', N'Crime,Thriller', N'English', N'CBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/647.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'87', N'The Bridge', N'Drama,Crime,Thriller', N'English', N'FX', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/649.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'88', N'Reign', N'Drama,Romance,History', N'English', N'The CW', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/81/204119.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'89', N'Unforgettable', N'Drama,Crime', N'English', N'A&E', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/663.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'90', N'Haven', N'Drama,Crime,Supernatural', N'English', N'Syfy', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/672.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'91', N'Bad Judge', N'Comedy,Family', N'English', N'NBC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/678.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'92', N'A to Z', N'Comedy,Romance', N'English', N'NBC', 0x32313A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/679.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'93', N'Parenthood', N'Drama,Comedy,Family', N'English', N'NBC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/685.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'94', N'Defiance', N'Action,Adventure,Science-Fiction', N'English', N'Syfy', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/700.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'95', N'Falling Skies', N'Drama,Action,Science-Fiction', N'English', N'TNT', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/716.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'96', N'Manhattan Love Story', N'Comedy,Romance', N'English', N'ABC', 0x32303A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/729.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'97', N'The Biggest Loser', N'Drama', N'English', N'USA Network', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/730.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'98', N'Scandal', N'Drama,Thriller', N'English', N'ABC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/124/310268.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'99', N'America''s Next Top Model', N'', N'English', N'VH1', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/147/369365.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'100', N'Blue Bloods', N'Drama,Crime', N'English', N'CBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/237/592580.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'101', N'The Good Wife', N'Drama,Crime,Legal', N'English', N'CBS', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/59/148162.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'102', N'Boardwalk Empire', N'Drama,Crime', N'English', N'HBO', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/759.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'103', N'Law & Order: Special Victims Unit', N'Drama,Crime', N'English', N'NBC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/227/567829.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'104', N'Dominion', N'Action,Adventure,Fantasy', N'English', N'Syfy', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/775.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'105', N'From Dusk Till Dawn: The Series', N'Action,Crime,Horror', N'English', N'El Rey Network', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/70/176381.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'106', N'Justified', N'Drama,Crime,Western', N'English', N'FX', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/808.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'107', N'Bob''s Burgers', N'Comedy,Family', N'English', N'FOX', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/840.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'108', N'Mulaney', N'Comedy,Family', N'English', N'FOX', 0x32313A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/846.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'109', N'CSI: Crime Scene Investigation', N'Drama,Action,Crime', N'English', N'CBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/887.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'110', N'Gracepoint', N'Drama,Crime,Mystery', N'English', N'FOX', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/862.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'111', N'Once Upon a Time', N'Drama,Fantasy,Romance', N'English', N'ABC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/127/319360.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'112', N'South Park', N'Comedy', N'English', N'Comedy Central', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/935.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'114', N'Survivor', N'Adventure', N'English', N'CBS', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/237/592561.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'115', N'King of the Hill', N'Comedy', N'English', N'FOX', 0x32303A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/45/113875.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'116', N'The Mentalist', N'Drama,Crime,Mystery', N'English', N'CBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/1239.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'117', N'Star Wars Rebels', N'Action,Adventure,Science-Fiction', N'English', N'DisneyNOW', 0x30393A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/26/66846.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'118', N'House', N'Drama,Mystery,Medical', N'English', N'FOX', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/43/109527.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'120', N'Transparent', N'Drama,Comedy', N'English', N'Amazon Prime', 0x30303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/210/525553.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'122', N'Nikita', N'Action', N'English', N'The CW', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/1366.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'123', N'Lost', N'Drama,Adventure,Supernatural', N'English', N'ABC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/1389.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'124', N'2 Broke Girls', N'Comedy', N'English', N'CBS', 0x32313A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/63/158548.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'125', N'Selfie', N'Comedy,Romance', N'English', N'ABC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/1756.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'126', N'Mom', N'Comedy,Family', N'English', N'CBS', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/237/592624.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'127', N'The Affair', N'Drama,Romance', N'English', N'Showtime', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/203/509941.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'128', N'Jane the Virgin', N'Drama,Comedy,Romance', N'English', N'The CW', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/186/466352.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'129', N'Marry Me', N'Comedy', N'English', N'NBC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/1836.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'130', N'Two and a Half Men', N'Comedy', N'English', N'CBS', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/118/296842.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'131', N'About a Boy', N'Drama,Comedy,Romance', N'English', N'NBC', 0x32313A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/1880.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'132', N'The Millers', N'Comedy', N'English', N'CBS', 0x32303A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/1886.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'133', N'Elementary', N'Drama,Crime,Mystery', N'English', N'CBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/195/488201.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'134', N'Heroes', N'Action,Science-Fiction', N'English', N'NBC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/1904.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'136', N'The McCarthys', N'Comedy,Family', N'English', N'CBS', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/1900.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'137', N'Cristela', N'Comedy,Legal', N'English', N'ABC', 0x32303A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/1932.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'138', N'The Leftovers', N'Drama,Science-Fiction,Thriller', N'English', N'HBO', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/107/267799.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'139', N'Girls', N'Drama,Romance', N'English', N'HBO', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/31/78286.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'140', N'Looking', N'Drama,Comedy,Romance', N'English', N'HBO', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/1961.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'141', N'Getting On', N'Comedy,Medical', N'English', N'HBO', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/1970.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'142', N'Veep', N'Comedy', N'English', N'HBO', 0x32323A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/189/472887.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'143', N'Silicon Valley', N'Comedy', N'English', N'HBO', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/215/538434.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'144', N'The Comeback', N'Comedy', N'English', N'HBO', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/1995.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'145', N'House of Lies', N'Drama,Comedy', N'English', N'Showtime', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2003.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'146', N'Episodes', N'Comedy', N'English', N'Showtime', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/123/309535.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'147', N'Nurse Jackie', N'Drama,Comedy,Thriller', N'English', N'Showtime', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2021.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'148', N'Web Therapy', N'Comedy', N'English', N'Showtime', 0x32333A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2036.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'149', N'Masters of Sex', N'Drama,Romance', N'English', N'Showtime', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/46/117234.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'150', N'Shameless', N'Drama,Comedy,Crime', N'English', N'Showtime', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/217/544992.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'151', N'The Newsroom', N'Drama', N'English', N'HBO', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2066.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'152', N'Ray Donovan', N'Drama,Action,Crime', N'English', N'Showtime', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/212/531511.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'153', N'Utopia', N'', N'English', N'FOX', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2090.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'154', N'Sanctuary', N'Drama,Adventure,Science-Fiction', N'English', N'Syfy', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2119.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'155', N'Beauty and the Beast', N'Drama,Horror,Romance', N'English', N'The CW', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2128.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'156', N'Twin Peaks', N'Drama,Crime,Supernatural', N'English', N'Amazon Prime', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/99/249543.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'157', N'The Americans', N'Drama,Espionage', N'English', N'FX', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/146/366911.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'158', N'Fringe', N'Drama,Action,Science-Fiction', N'English', N'FOX', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2245.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'159', N'State of Affairs', N'Drama', N'English', N'NBC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2215.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'160', N'Weeds', N'Drama,Comedy,Crime', N'English', N'Showtime', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2216.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'161', N'Dexter', N'Drama,Crime,Mystery', N'English', N'Showtime', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/39/99907.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'162', N'Carnivàle', N'Drama,Fantasy,Horror', N'English', N'HBO', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2256.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'163', N'Human Target', N'Action,Adventure,Crime', N'English', N'FOX', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/42/106702.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'164', N'Banshee', N'Drama,Action,Crime', N'English', N'Cinemax', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/80/201761.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'165', N'Bionic Woman', N'Action,Science-Fiction', N'English', N'NBC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2303.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'166', N'Battlestar Galactica', N'Drama,Science-Fiction,War', N'English', N'Syfy', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2313.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'167', N'24', N'Drama,Action,Thriller', N'English', N'FOX', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2330.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'168', N'Chuck', N'Drama,Comedy,Action', N'English', N'NBC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2385.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'169', N'Breaking Bad', N'Drama,Crime,Thriller', N'English', N'Netflix', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2400.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'170', N'Orange Is the New Black', N'Drama,Comedy,Crime', N'English', N'Netflix', 0x30303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/203/508250.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'171', N'How I Met Your Mother', N'Drama,Comedy,Romance', N'English', N'CBS', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2451.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'172', N'Suits', N'Drama,Legal', N'English', N'USA Network', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/205/513582.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'174', N'Parks and Recreation', N'Comedy', N'English', N'NBC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/0/2439.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'175', N'House of Cards', N'Drama,Thriller', N'English', N'Netflix', 0x30303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/169/424482.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'176', N'Teen Wolf', N'Drama,Romance,Supernatural', N'English', N'MTV', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/30/75365.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'177', N'Pretty Little Liars', N'Drama,Romance,Mystery', N'English', N'FreeForm', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/125/314775.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'178', N'The Legend of Korra', N'Action,Adventure,Fantasy', N'English', N'Nickelodeon', 0x31323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/42/106243.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'179', N'The Wire', N'Drama,Crime', N'English', N'HBO', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/2527.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'180', N'Firefly', N'Adventure,Science-Fiction,Western', N'English', N'FOX', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/2600.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'181', N'Extant', N'Drama,Science-Fiction,Thriller', N'English', N'CBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/54/136509.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'182', N'Black Sails', N'Drama,Action,Adventure', N'English', N'Starz', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/78/195951.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'183', N'Tyrant', N'Drama,Thriller', N'English', N'FX', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/2649.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'184', N'BoJack Horseman', N'Drama,Comedy', N'English', N'Netflix', 0x30303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/236/590384.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'185', N'Salem', N'Drama,Thriller,Supernatural', N'English', N'WGN America', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/73/184895.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'186', N'Turn: Washington''s Spies', N'Drama,War', N'English', N'AMC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/57/143037.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'187', N'Intelligence', N'Action,Science-Fiction', N'English', N'CBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/2715.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'188', N'Believe', N'Drama,Action,Fantasy', N'English', N'NBC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/51/127824.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'189', N'Star-Crossed', N'Drama,Romance,Science-Fiction', N'English', N'The CW', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/2776.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'190', N'Crisis', N'Drama,Action,Thriller', N'English', N'NBC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/2786.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'191', N'Halt and Catch Fire', N'Drama', N'English', N'AMC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/2798.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'192', N'Hello Ladies', N'Comedy', N'English', N'HBO', 0x32323A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/2826.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'193', N'Dads', N'Comedy', N'English', N'FOX', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/2831.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'194', N'Hannibal', N'Drama,Crime,Horror', N'English', N'NBC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/160/401855.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'195', N'Bates Motel', N'Drama,Horror,Thriller', N'English', N'A&E', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/177/444429.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'196', N'The Following', N'Drama,Crime,Thriller', N'English', N'FOX', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/2868.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'197', N'Da Vinci''s Demons', N'Drama,Horror', N'English', N'Starz Play', 0x30303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/2892.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'198', N'The Fosters', N'Drama,Family,Romance', N'English', N'FreeForm', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/116/292055.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'199', N'Mistresses', N'Drama,Romance', N'English', N'ABC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/2950.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'200', N'The Tomorrow People', N'Action,Science-Fiction', N'English', N'The CW', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/55/138044.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'201', N'Devious Maids', N'Drama,Crime', N'English', N'Lifetime', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3005.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'202', N'Almost Human', N'Drama,Crime,Science-Fiction', N'English', N'FOX', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3020.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'203', N'The Carrie Diaries', N'Drama,Comedy', N'English', N'The CW', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3037.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'204', N'Stargate SG-1', N'Action,Adventure,Science-Fiction', N'English', N'Syfy', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3027.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'205', N'Graceland', N'Drama,Action,Crime', N'English', N'USA Network', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/54/137054.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'206', N'Stargate Atlantis', N'Action,Adventure,Science-Fiction', N'English', N'Syfy', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3059.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'207', N'Stargate Universe', N'Action,Adventure,Science-Fiction', N'English', N'Syfy', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/81/204195.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'208', N'The Chair', N'', N'English', N'Starz', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3167.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'209', N'Survivor''s Remorse', N'Drama,Comedy,Sports', N'English', N'Starz Play', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3168.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'210', N'Doctor Who', N'Drama,Adventure,Science-Fiction', N'English', N'BBC One', 0x31393A31303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/231/579166.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'211', N'666 Park Avenue', N'Drama,Mystery,Supernatural', N'English', N'ABC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3523.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'212', N'Alcatraz', N'Drama,Science-Fiction,Thriller', N'English', N'FOX', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/120/302148.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'213', N'The Gates', N'Drama,Crime,Supernatural', N'English', N'ABC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/161/404453.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'214', N'Kingdom', N'Drama,Family,Sports', N'English', N'Audience Network', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/116/291395.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'215', N'American Dad!', N'Comedy,Family', N'English', N'TBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/249/624037.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'216', N'Rick and Morty', N'Comedy,Adventure,Science-Fiction', N'English', N'Adult Swim', 0x32333A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3603.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'217', N'Hostages', N'Drama,Thriller', N'English', N'CBS', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3617.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'218', N'Being Human', N'Drama,Horror,Romance', N'English', N'Syfy', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3627.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'219', N'Alphas', N'Drama,Science-Fiction,Supernatural', N'English', N'Syfy', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3632.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'220', N'Crossing Lines', N'Drama,Action,Crime', N'English', N'TF1', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/231/577869.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'221', N'Rectify', N'Drama,Crime', N'English', N'Sundance TV', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3655.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'222', N'Happyland', N'Drama,Comedy', N'English', N'MTV', 0x32333A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3681.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'224', N'Twisted', N'Drama,Thriller,Mystery', N'English', N'FreeForm', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3692.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'225', N'Ravenswood', N'Drama,Horror', N'English', N'FreeForm', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3700.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'226', N'The Crazy Ones', N'Comedy', N'English', N'CBS', 0x32313A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3713.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'227', N'Mob City', N'Drama,Crime', N'English', N'TNT', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/117/293987.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'228', N'Last Resort', N'Drama,Action,War', N'English', N'ABC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3741.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'229', N'The Neighbors', N'Comedy,Science-Fiction', N'English', N'ABC', 0x32303A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3763.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'230', N'Go On', N'Comedy', N'English', N'NBC', 0x32313A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3773.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'231', N'Vegas', N'Drama', N'English', N'CBS', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3781.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'232', N'The River', N'Drama,Horror,Supernatural', N'English', N'ABC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3788.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'233', N'Awake', N'Drama,Fantasy,Thriller', N'English', N'NBC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3799.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'234', N'Missing', N'Drama,Action,Thriller', N'English', N'ABC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3808.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'235', N'The New Normal', N'Comedy', N'English', N'NBC', 0x32313A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3817.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'236', N'GCB', N'Drama,Comedy,Romance', N'English', N'ABC', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/84/212122.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'237', N'Revolution', N'Action,Adventure,Science-Fiction', N'English', N'NBC', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/55/138043.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'238', N'Dallas', N'Drama,Family', N'English', N'TNT', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3848.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'239', N'Anger Management', N'Comedy', N'English', N'FX', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/3885.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'240', N'Cops', N'Action,Crime', N'English', N'Paramount Network', 0x32323A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/4185.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'241', N'Benched', N'Comedy,Legal', N'English', N'USA Network', 0x32323A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/4351.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'242', N'The Great Fire', N'Drama', N'English', N'ITV', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/4358.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'243', N'Conan', N'Comedy', N'English', N'TBS', 0x32333A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/4583.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'244', N'Strange Empire', N'Drama,Western', N'English', N'CBC', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/4585.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'245', N'Town of the Living Dead', N'', N'English', N'Syfy', 0x32323A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/4590.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'246', N'Long Shadow', N'War,History', N'English', N'BBC Two', 0x32303A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/4591.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'247', N'The Colbert Report', N'Comedy', N'English', N'Comedy Central', 0x32333A33303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/4592.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'248', N'Transporter: The Series', N'Action,Adventure', N'English', N'The Movie Network', 0x32313A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/4593.jpg')
GO
GO
INSERT INTO [dbo].[Shows] ([ShowId], [Name], [Genres], [Language], [Channel], [ScheduleTime], [Thumbnail]) VALUES (N'249', N'The Daily Show with Jon Stewart', N'Comedy', N'English', N'Comedy Central', 0x32333A30303A30302E30303030303030, N'http://static.tvmaze.com/uploads/images/original_untouched/1/4598.jpg')
GO
GO

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE [dbo].[Users]
GO
CREATE TABLE [dbo].[Users] (
[UserId] bigint NOT NULL IDENTITY(1,1) ,
[RoleId] int NOT NULL ,
[UserName] varchar(10) NOT NULL ,
[Password] varchar(80) NOT NULL ,
[Name] varchar(200) NOT NULL ,
[LastName] varchar(200) NOT NULL ,
[State] bit NOT NULL DEFAULT ((1)) 
)


GO

-- ----------------------------
-- Records of Users
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Users] ON
GO
INSERT INTO [dbo].[Users] ([UserId], [RoleId], [UserName], [Password], [Name], [LastName], [State]) VALUES (N'1', N'1', N'admin1', N'0vYFGugpwNuYXO3dEC906xMCP91aEYLxXNz//Tb8KMYQnr6a3v4PzqUoWzB/HZLm', N'Juan Sebastian', N'Puerta Nevado', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO

-- ----------------------------
-- Indexes structure for table Roles
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Roles
-- ----------------------------
ALTER TABLE [dbo].[Roles] ADD PRIMARY KEY ([RoleId])
GO

-- ----------------------------
-- Indexes structure for table Shows
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Shows
-- ----------------------------
ALTER TABLE [dbo].[Shows] ADD PRIMARY KEY ([ShowId])
GO

-- ----------------------------
-- Indexes structure for table Users
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Users
-- ----------------------------
ALTER TABLE [dbo].[Users] ADD PRIMARY KEY ([UserId])
GO

-- ----------------------------
-- Foreign Key structure for table [dbo].[Users]
-- ----------------------------
ALTER TABLE [dbo].[Users] ADD FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Roles] ([RoleId]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
