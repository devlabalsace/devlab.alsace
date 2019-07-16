USE [master]
GO
/****** Object:  Database [Orchard]    Script Date: 16/07/2019 16:07:16 ******/
CREATE DATABASE [Orchard]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Orchard', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Orchard.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Orchard_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Orchard_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Orchard] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Orchard].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Orchard] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Orchard] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Orchard] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Orchard] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Orchard] SET ARITHABORT OFF 
GO
ALTER DATABASE [Orchard] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Orchard] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Orchard] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Orchard] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Orchard] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Orchard] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Orchard] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Orchard] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Orchard] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Orchard] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Orchard] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Orchard] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Orchard] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Orchard] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Orchard] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Orchard] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Orchard] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Orchard] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Orchard] SET  MULTI_USER 
GO
ALTER DATABASE [Orchard] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Orchard] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Orchard] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Orchard] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Orchard] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Orchard] SET QUERY_STORE = OFF
GO
USE [Orchard]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Orchard]
GO
/****** Object:  Table [dbo].[main_Document]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[main_Document](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[main_Identifiers]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[main_Identifiers](
	[dimension] [nvarchar](255) NOT NULL,
	[nextval] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[dimension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[main_UserByLoginInfoIndex]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[main_UserByLoginInfoIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NULL,
	[LoginProvider] [nvarchar](255) NULL,
	[ProviderKey] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[main_UserByRoleNameIndex]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[main_UserByRoleNameIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NULL,
	[Count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[main_UserByRoleNameIndex_Document]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[main_UserByRoleNameIndex_Document](
	[UserByRoleNameIndexId] [int] NOT NULL,
	[DocumentId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[main_UserIndex]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[main_UserIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NULL,
	[NormalizedUserName] [nvarchar](255) NULL,
	[NormalizedEmail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marina_AliasPartIndex]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marina_AliasPartIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NULL,
	[Alias] [nvarchar](64) NULL,
	[ContentItemId] [nvarchar](26) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marina_AutoroutePartIndex]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marina_AutoroutePartIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NULL,
	[ContentItemId] [nvarchar](26) NULL,
	[Path] [nvarchar](1024) NULL,
	[Published] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marina_ContainedPartIndex]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marina_ContainedPartIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NULL,
	[ListContentItemId] [nvarchar](26) NULL,
	[Order] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marina_ContentItemIndex]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marina_ContentItemIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NULL,
	[ContentItemId] [nvarchar](26) NULL,
	[ContentItemVersionId] [nvarchar](26) NULL,
	[Latest] [bit] NULL,
	[Published] [bit] NULL,
	[ContentType] [nvarchar](255) NULL,
	[ModifiedUtc] [datetime] NULL,
	[PublishedUtc] [datetime] NULL,
	[CreatedUtc] [datetime] NULL,
	[Owner] [nvarchar](255) NULL,
	[Author] [nvarchar](255) NULL,
	[DisplayText] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marina_DeploymentPlanIndex]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marina_DeploymentPlanIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NULL,
	[Name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marina_Document]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marina_Document](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marina_Identifiers]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marina_Identifiers](
	[dimension] [nvarchar](255) NOT NULL,
	[nextval] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[dimension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marina_LayerMetadataIndex]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marina_LayerMetadataIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NULL,
	[Zone] [nvarchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marina_UserByLoginInfoIndex]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marina_UserByLoginInfoIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NULL,
	[LoginProvider] [nvarchar](255) NULL,
	[ProviderKey] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marina_UserByRoleNameIndex]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marina_UserByRoleNameIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NULL,
	[Count] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marina_UserByRoleNameIndex_Document]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marina_UserByRoleNameIndex_Document](
	[UserByRoleNameIndexId] [int] NOT NULL,
	[DocumentId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marina_UserIndex]    Script Date: 16/07/2019 16:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marina_UserIndex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentId] [int] NULL,
	[NormalizedUserName] [nvarchar](255) NULL,
	[NormalizedEmail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[main_Document] ([Id], [Type], [Content]) VALUES (1, N'OrchardCore.Data.Migration.Records.DataMigrationRecord, OrchardCore.Data', N'{"Id":1,"DataMigrations":[{"DataMigrationClass":"OrchardCore.Users.Migrations","Version":2}]}')
INSERT [dbo].[main_Document] ([Id], [Type], [Content]) VALUES (21, N'OrchardCore.Environment.Shell.Descriptor.Models.ShellDescriptor, OrchardCore.Abstractions', N'{"Id":21,"SerialNumber":2,"Features":[{"Id":"DevLabAlsace","AlwaysEnabled":true},{"Id":"OrchardCore.Features","AlwaysEnabled":false},{"Id":"OrchardCore.Scripting","AlwaysEnabled":false},{"Id":"OrchardCore.Recipes","AlwaysEnabled":false},{"Id":"OrchardCore.Settings","AlwaysEnabled":false},{"Id":"OrchardCore.Admin","AlwaysEnabled":false},{"Id":"OrchardCore.Localization","AlwaysEnabled":false},{"Id":"OrchardCore.Diagnostics","AlwaysEnabled":false},{"Id":"OrchardCore.DynamicCache","AlwaysEnabled":false},{"Id":"OrchardCore.Resources","AlwaysEnabled":false},{"Id":"OrchardCore.HomeRoute","AlwaysEnabled":false},{"Id":"OrchardCore.Navigation","AlwaysEnabled":false},{"Id":"OrchardCore.Users","AlwaysEnabled":false},{"Id":"OrchardCore.Roles","AlwaysEnabled":false},{"Id":"OrchardCore.Tenants","AlwaysEnabled":false},{"Id":"OrchardCore.Themes","AlwaysEnabled":false},{"Id":"SafeMode","AlwaysEnabled":false},{"Id":"TheAdmin","AlwaysEnabled":false},{"Id":"TheTheme","AlwaysEnabled":false}],"Parameters":[]}')
INSERT [dbo].[main_Document] ([Id], [Type], [Content]) VALUES (22, N'OrchardCore.Environment.Shell.State.ShellState, OrchardCore.Abstractions', N'{"Features":[{"Id":"DevLabAlsace","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Features","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Scripting","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Recipes","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Settings","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Admin","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Localization","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Diagnostics","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.DynamicCache","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Resources","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.HomeRoute","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Navigation","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Users","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Roles","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Tenants","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Themes","InstallState":"Up","EnableState":"Up"},{"Id":"SafeMode","InstallState":"Up","EnableState":"Up"},{"Id":"TheAdmin","InstallState":"Up","EnableState":"Up"},{"Id":"TheTheme","InstallState":"Up","EnableState":"Up"}]}')
INSERT [dbo].[main_Document] ([Id], [Type], [Content]) VALUES (41, N'OrchardCore.Roles.Models.RolesDocument, OrchardCore.Roles', N'{"Id":41,"Roles":[{"RoleName":"Moderator","NormalizedRoleName":"MODERATOR","RoleClaims":[{"ClaimType":"Permission","ClaimValue":"AccessAdminPanel"}]},{"RoleName":"Author","NormalizedRoleName":"AUTHOR","RoleClaims":[{"ClaimType":"Permission","ClaimValue":"AccessAdminPanel"}]},{"RoleName":"Contributor","NormalizedRoleName":"CONTRIBUTOR","RoleClaims":[{"ClaimType":"Permission","ClaimValue":"AccessAdminPanel"}]},{"RoleName":"Editor","NormalizedRoleName":"EDITOR","RoleClaims":[{"ClaimType":"Permission","ClaimValue":"AccessAdminPanel"},{"ClaimType":"Permission","ClaimValue":"ManageCultures"}]},{"RoleName":"Administrator","NormalizedRoleName":"ADMINISTRATOR","RoleClaims":[{"ClaimType":"Permission","ClaimValue":"ManageSettings"},{"ClaimType":"Permission","ClaimValue":"AccessAdminPanel"},{"ClaimType":"Permission","ClaimValue":"ManageCultures"},{"ClaimType":"Permission","ClaimValue":"ManageUsers"},{"ClaimType":"Permission","ClaimValue":"ManageRoles"},{"ClaimType":"Permission","ClaimValue":"AssignRoles"},{"ClaimType":"Permission","ClaimValue":"SiteOwner"},{"ClaimType":"Permission","ClaimValue":"ManageTenants"},{"ClaimType":"Permission","ClaimValue":"ApplyTheme"}]}],"Serial":19}')
INSERT [dbo].[main_Document] ([Id], [Type], [Content]) VALUES (42, N'OrchardCore.Settings.SiteSettings, OrchardCore.Settings', N'{"Id":42,"BaseUrl":null,"Calendar":null,"MaxPagedCount":0,"MaxPageSize":100,"PageSize":10,"TimeZoneId":"Europe/Paris","ResourceDebugMode":0,"SiteName":"devlab.alsace","SiteSalt":"2471943cfe0b406488dd22a141f6af45","SuperUser":"MarinaPhilippe","UseCdn":false,"CdnBaseUrl":null,"HomeRoute":{"Action":"Index","Controller":"Home","Area":"TheTheme"},"Properties":{"CurrentThemeName":"TheTheme","CurrentAdminThemeName":"TheAdmin","name":"settings"}}')
INSERT [dbo].[main_Document] ([Id], [Type], [Content]) VALUES (61, N'OrchardCore.Users.Models.User, OrchardCore.Users.Core', N'{"Id":61,"UserName":"MarinaPhilippe","NormalizedUserName":"MARINAPHILIPPE","Email":"marina.philippe@outlook.com","NormalizedEmail":"MARINA.PHILIPPE@OUTLOOK.COM","PasswordHash":"AQAAAAEAACcQAAAAEK3Sg1+OA1/MaLbtIMk7X9Eur+3400ZpBGnN0IVfGn3KPDTQLcx8RTLihLHCIkJqaw==","SecurityStamp":"G4DNUTPBFMX65RXTC3TIPNOHA5D2BVGQ","EmailConfirmed":true,"ResetToken":null,"RoleNames":{"$type":"System.String[], System.Private.CoreLib","$values":["Administrator"]},"LoginInfos":[],"Properties":{}}')
INSERT [dbo].[main_Identifiers] ([dimension], [nextval]) VALUES (N'', 81)
SET IDENTITY_INSERT [dbo].[main_UserByRoleNameIndex] ON 

INSERT [dbo].[main_UserByRoleNameIndex] ([Id], [RoleName], [Count]) VALUES (1, N'ADMINISTRATOR', 1)
SET IDENTITY_INSERT [dbo].[main_UserByRoleNameIndex] OFF
INSERT [dbo].[main_UserByRoleNameIndex_Document] ([UserByRoleNameIndexId], [DocumentId]) VALUES (1, 61)
SET IDENTITY_INSERT [dbo].[main_UserIndex] ON 

INSERT [dbo].[main_UserIndex] ([Id], [DocumentId], [NormalizedUserName], [NormalizedEmail]) VALUES (1, 61, N'MARINAPHILIPPE', N'MARINA.PHILIPPE@OUTLOOK.COM')
SET IDENTITY_INSERT [dbo].[main_UserIndex] OFF
SET IDENTITY_INSERT [dbo].[marina_AliasPartIndex] ON 

INSERT [dbo].[marina_AliasPartIndex] ([Id], [DocumentId], [Alias], [ContentItemId]) VALUES (1, 25, N'main-menu', N'478r6dxkbtgcd4pb10ps9wpndn')
SET IDENTITY_INSERT [dbo].[marina_AliasPartIndex] OFF
SET IDENTITY_INSERT [dbo].[marina_AutoroutePartIndex] ON 

INSERT [dbo].[marina_AutoroutePartIndex] ([Id], [DocumentId], [ContentItemId], [Path], [Published]) VALUES (1, 26, N'4zngqttxyq2rjvq074rmw348cy', N'home-page', 1)
SET IDENTITY_INSERT [dbo].[marina_AutoroutePartIndex] OFF
SET IDENTITY_INSERT [dbo].[marina_ContentItemIndex] ON 

INSERT [dbo].[marina_ContentItemIndex] ([Id], [DocumentId], [ContentItemId], [ContentItemVersionId], [Latest], [Published], [ContentType], [ModifiedUtc], [PublishedUtc], [CreatedUtc], [Owner], [Author], [DisplayText]) VALUES (1, 23, N'4ajncmj2sm53wxjymgerskdfdp', N'43aap4xe6cph250099bvvyw1cr', 1, 1, N'HtmlWidget', CAST(N'2019-07-16T09:52:28.570' AS DateTime), CAST(N'2019-07-16T09:52:28.580' AS DateTime), CAST(N'2019-07-16T09:52:28.580' AS DateTime), N'Marina', N'Marina', N'Footer')
INSERT [dbo].[marina_ContentItemIndex] ([Id], [DocumentId], [ContentItemId], [ContentItemVersionId], [Latest], [Published], [ContentType], [ModifiedUtc], [PublishedUtc], [CreatedUtc], [Owner], [Author], [DisplayText]) VALUES (2, 25, N'478r6dxkbtgcd4pb10ps9wpndn', N'472z8w0nnrztss0xkn7fwaxqxm', 1, 1, N'Menu', CAST(N'2019-07-16T09:52:28.753' AS DateTime), CAST(N'2019-07-16T09:52:28.760' AS DateTime), CAST(N'2019-07-16T09:52:28.760' AS DateTime), N'Marina', N'Marina', N'Main Menu')
INSERT [dbo].[marina_ContentItemIndex] ([Id], [DocumentId], [ContentItemId], [ContentItemVersionId], [Latest], [Published], [ContentType], [ModifiedUtc], [PublishedUtc], [CreatedUtc], [Owner], [Author], [DisplayText]) VALUES (3, 26, N'4zngqttxyq2rjvq074rmw348cy', N'44m9mcr8v75s1tb0fg5rkqtqxg', 1, 1, N'LandingPage', CAST(N'2019-07-16T09:52:28.767' AS DateTime), CAST(N'2019-07-16T09:52:28.767' AS DateTime), CAST(N'2019-07-16T09:52:28.767' AS DateTime), N'Marina', N'Marina', N'marina')
SET IDENTITY_INSERT [dbo].[marina_ContentItemIndex] OFF
INSERT [dbo].[marina_Document] ([Id], [Type], [Content]) VALUES (1, N'OrchardCore.Data.Migration.Records.DataMigrationRecord, OrchardCore.Data', N'{"Id":1,"DataMigrations":[{"DataMigrationClass":"OrchardCore.ContentManagement.Records.Migrations","Version":3},{"DataMigrationClass":"OrchardCore.Contents.Migrations","Version":1},{"DataMigrationClass":"OrchardCore.Liquid.Migrations","Version":1},{"DataMigrationClass":"OrchardCore.Alias.Migrations","Version":1},{"DataMigrationClass":"OrchardCore.Autoroute.Migrations","Version":1},{"DataMigrationClass":"OrchardCore.Deployment.Migrations","Version":1},{"DataMigrationClass":"OrchardCore.Widgets.Migrations","Version":1},{"DataMigrationClass":"OrchardCore.Flows.Migrations","Version":2},{"DataMigrationClass":"OrchardCore.Html.Migrations","Version":4},{"DataMigrationClass":"OrchardCore.Layers.Migrations","Version":1},{"DataMigrationClass":"OrchardCore.Lists.Migrations","Version":1},{"DataMigrationClass":"OrchardCore.Markdown.Migrations","Version":1},{"DataMigrationClass":"OrchardCore.Title.Migrations","Version":2},{"DataMigrationClass":"OrchardCore.Menu.Migrations","Version":1},{"DataMigrationClass":"OrchardCore.Users.Migrations","Version":2}]}')
INSERT [dbo].[marina_Document] ([Id], [Type], [Content]) VALUES (2, N'OrchardCore.Environment.Shell.Descriptor.Models.ShellDescriptor, OrchardCore.Abstractions', N'{"Id":2,"SerialNumber":2,"Features":[{"Id":"DevLabAlsace","AlwaysEnabled":true},{"Id":"OrchardCore.Features","AlwaysEnabled":false},{"Id":"OrchardCore.Scripting","AlwaysEnabled":false},{"Id":"OrchardCore.Recipes","AlwaysEnabled":false},{"Id":"OrchardCore.Settings","AlwaysEnabled":false},{"Id":"OrchardCore.Admin","AlwaysEnabled":false},{"Id":"OrchardCore.Liquid","AlwaysEnabled":false},{"Id":"OrchardCore.Contents","AlwaysEnabled":false},{"Id":"OrchardCore.ContentTypes","AlwaysEnabled":false},{"Id":"OrchardCore.Alias","AlwaysEnabled":false},{"Id":"OrchardCore.Autoroute","AlwaysEnabled":false},{"Id":"OrchardCore.ContentFields","AlwaysEnabled":false},{"Id":"OrchardCore.ContentPreview","AlwaysEnabled":false},{"Id":"OrchardCore.Contents.FileContentDefinition","AlwaysEnabled":false},{"Id":"OrchardCore.CustomSettings","AlwaysEnabled":false},{"Id":"OrchardCore.Deployment","AlwaysEnabled":false},{"Id":"OrchardCore.Deployment.Remote","AlwaysEnabled":false},{"Id":"OrchardCore.Diagnostics","AlwaysEnabled":false},{"Id":"OrchardCore.DynamicCache","AlwaysEnabled":false},{"Id":"OrchardCore.Resources","AlwaysEnabled":false},{"Id":"OrchardCore.Widgets","AlwaysEnabled":false},{"Id":"OrchardCore.Feeds","AlwaysEnabled":false},{"Id":"OrchardCore.Flows","AlwaysEnabled":false},{"Id":"OrchardCore.HomeRoute","AlwaysEnabled":false},{"Id":"OrchardCore.Html","AlwaysEnabled":false},{"Id":"OrchardCore.Layers","AlwaysEnabled":false},{"Id":"OrchardCore.Lists","AlwaysEnabled":false},{"Id":"OrchardCore.Markdown","AlwaysEnabled":false},{"Id":"OrchardCore.Media","AlwaysEnabled":false},{"Id":"OrchardCore.Title","AlwaysEnabled":false},{"Id":"OrchardCore.Menu","AlwaysEnabled":false},{"Id":"OrchardCore.Navigation","AlwaysEnabled":false},{"Id":"OrchardCore.Queries","AlwaysEnabled":false},{"Id":"OrchardCore.Users","AlwaysEnabled":false},{"Id":"OrchardCore.Roles","AlwaysEnabled":false},{"Id":"OrchardCore.Templates","AlwaysEnabled":false},{"Id":"OrchardCore.Themes","AlwaysEnabled":false},{"Id":"SafeMode","AlwaysEnabled":false},{"Id":"TheAdmin","AlwaysEnabled":false},{"Id":"TheAgencyTheme","AlwaysEnabled":false}],"Parameters":[]}')
INSERT [dbo].[marina_Document] ([Id], [Type], [Content]) VALUES (3, N'OrchardCore.Environment.Shell.State.ShellState, OrchardCore.Abstractions', N'{"Features":[{"Id":"DevLabAlsace","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Features","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Scripting","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Recipes","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Settings","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Admin","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Liquid","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Contents","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.ContentTypes","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Alias","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Autoroute","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.ContentFields","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.ContentPreview","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Contents.FileContentDefinition","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.CustomSettings","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Deployment","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Deployment.Remote","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Diagnostics","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.DynamicCache","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Resources","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Widgets","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Feeds","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Flows","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.HomeRoute","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Html","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Layers","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Lists","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Markdown","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Media","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Title","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Menu","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Navigation","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Queries","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Users","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Roles","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Templates","InstallState":"Up","EnableState":"Up"},{"Id":"OrchardCore.Themes","InstallState":"Up","EnableState":"Up"},{"Id":"SafeMode","InstallState":"Up","EnableState":"Up"},{"Id":"TheAdmin","InstallState":"Up","EnableState":"Up"},{"Id":"TheAgencyTheme","InstallState":"Up","EnableState":"Up"}]}')
INSERT [dbo].[marina_Document] ([Id], [Type], [Content]) VALUES (21, N'OrchardCore.Roles.Models.RolesDocument, OrchardCore.Roles', N'{"Id":21,"Roles":[{"RoleName":"Moderator","NormalizedRoleName":"MODERATOR","RoleClaims":[{"ClaimType":"Permission","ClaimValue":"AccessAdminPanel"}]},{"RoleName":"Authenticated","NormalizedRoleName":"AUTHENTICATED","RoleClaims":[{"ClaimType":"Permission","ClaimValue":"ViewContent"}]},{"RoleName":"Anonymous","NormalizedRoleName":"ANONYMOUS","RoleClaims":[{"ClaimType":"Permission","ClaimValue":"ViewContent"}]},{"RoleName":"Author","NormalizedRoleName":"AUTHOR","RoleClaims":[{"ClaimType":"Permission","ClaimValue":"AccessAdminPanel"},{"ClaimType":"Permission","ClaimValue":"PublishOwnContent"},{"ClaimType":"Permission","ClaimValue":"EditOwnContent"},{"ClaimType":"Permission","ClaimValue":"DeleteOwnContent"},{"ClaimType":"Permission","ClaimValue":"PreviewOwnContent"},{"ClaimType":"Permission","ClaimValue":"CloneOwnContent"},{"ClaimType":"Permission","ClaimValue":"ManageOwnMedia"}]},{"RoleName":"Contributor","NormalizedRoleName":"CONTRIBUTOR","RoleClaims":[{"ClaimType":"Permission","ClaimValue":"AccessAdminPanel"},{"ClaimType":"Permission","ClaimValue":"EditOwnContent"},{"ClaimType":"Permission","ClaimValue":"PreviewOwnContent"},{"ClaimType":"Permission","ClaimValue":"CloneOwnContent"},{"ClaimType":"Permission","ClaimValue":"ManageOwnMedia"}]},{"RoleName":"Editor","NormalizedRoleName":"EDITOR","RoleClaims":[{"ClaimType":"Permission","ClaimValue":"AccessAdminPanel"},{"ClaimType":"Permission","ClaimValue":"PublishContent"},{"ClaimType":"Permission","ClaimValue":"EditContent"},{"ClaimType":"Permission","ClaimValue":"DeleteContent"},{"ClaimType":"Permission","ClaimValue":"PreviewContent"},{"ClaimType":"Permission","ClaimValue":"CloneContent"},{"ClaimType":"Permission","ClaimValue":"ManageMediaContent"},{"ClaimType":"Permission","ClaimValue":"ManageQueries"},{"ClaimType":"Permission","ClaimValue":"ManageTemplates"}]},{"RoleName":"Administrator","NormalizedRoleName":"ADMINISTRATOR","RoleClaims":[{"ClaimType":"Permission","ClaimValue":"ManageSettings"},{"ClaimType":"Permission","ClaimValue":"AccessAdminPanel"},{"ClaimType":"Permission","ClaimValue":"PublishContent"},{"ClaimType":"Permission","ClaimValue":"EditContent"},{"ClaimType":"Permission","ClaimValue":"DeleteContent"},{"ClaimType":"Permission","ClaimValue":"PreviewContent"},{"ClaimType":"Permission","ClaimValue":"CloneContent"},{"ClaimType":"Permission","ClaimValue":"ViewContentTypes"},{"ClaimType":"Permission","ClaimValue":"EditContentTypes"},{"ClaimType":"Permission","ClaimValue":"SetHomepage"},{"ClaimType":"Permission","ClaimValue":"ContentPreview"},{"ClaimType":"Permission","ClaimValue":"Import"},{"ClaimType":"Permission","ClaimValue":"Export"},{"ClaimType":"Permission","ClaimValue":"ManageLayers"},{"ClaimType":"Permission","ClaimValue":"ManageMediaContent"},{"ClaimType":"Permission","ClaimValue":"ManageAttachedMediaFieldsFolder"},{"ClaimType":"Permission","ClaimValue":"ManageMenu"},{"ClaimType":"Permission","ClaimValue":"ManageQueries"},{"ClaimType":"Permission","ClaimValue":"ManageUsers"},{"ClaimType":"Permission","ClaimValue":"ManageRoles"},{"ClaimType":"Permission","ClaimValue":"AssignRoles"},{"ClaimType":"Permission","ClaimValue":"SiteOwner"},{"ClaimType":"Permission","ClaimValue":"ManageTemplates"},{"ClaimType":"Permission","ClaimValue":"ApplyTheme"}]}],"Serial":55}')
INSERT [dbo].[marina_Document] ([Id], [Type], [Content]) VALUES (22, N'OrchardCore.Settings.SiteSettings, OrchardCore.Settings', N'{"Id":22,"BaseUrl":null,"Calendar":null,"MaxPagedCount":0,"MaxPageSize":100,"PageSize":10,"TimeZoneId":"Europe/Paris","ResourceDebugMode":0,"SiteName":"marina","SiteSalt":"43bd21757345400a97e657569f8515c0","SuperUser":"Marina","UseCdn":false,"CdnBaseUrl":null,"HomeRoute":{"action":"Display","controller":"Item","area":"OrchardCore.Contents","contentItemId":"4zngqttxyq2rjvq074rmw348cy"},"Properties":{"CurrentThemeName":"TheAgencyTheme","CurrentAdminThemeName":"TheAdmin","name":"settings","LayerSettings":{"Zones":["Footer"]}}}')
INSERT [dbo].[marina_Document] ([Id], [Type], [Content]) VALUES (23, N'OrchardCore.ContentManagement.ContentItem, OrchardCore.ContentManagement.Abstractions', N'{"ContentItemId":"4ajncmj2sm53wxjymgerskdfdp","ContentItemVersionId":"43aap4xe6cph250099bvvyw1cr","ContentType":"HtmlWidget","DisplayText":"Footer","Latest":true,"Published":true,"ModifiedUtc":"2019-07-16T09:52:28.5715601Z","PublishedUtc":"2019-07-16T09:52:28.5797243Z","CreatedUtc":"2019-07-16T09:52:28.5797243Z","Owner":"Marina","Author":"Marina","LayerMetadata":{"Layer":"Always","Zone":"Footer","RenderTitle":false,"Position":10},"HtmlWidget":{"Content":{"Html":"<!-- Footer -->\r\n<footer>\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-md-4\">\r\n                <span class=\"copyright\">Copyright &copy; Your Website 2018</span>\r\n            </div>\r\n            <div class=\"col-md-4\">\r\n                <ul class=\"list-inline social-buttons\">\r\n                    <li class=\"list-inline-item\">\r\n                        <a href=\"#\">\r\n                            <i class=\"fab fa-twitter\"></i>\r\n                        </a>\r\n                    </li>\r\n                    <li class=\"list-inline-item\">\r\n                        <a href=\"#\">\r\n                            <i class=\"fab fa-facebook\"></i>\r\n                        </a>\r\n                    </li>\r\n                    <li class=\"list-inline-item\">\r\n                        <a href=\"#\">\r\n                            <i class=\"fab fa-linkedin\"></i>\r\n                        </a>\r\n                    </li>\r\n                </ul>\r\n            </div>\r\n            <div class=\"col-md-4\">\r\n                <ul class=\"list-inline quicklinks\">\r\n                    <li class=\"list-inline-item\">\r\n                        <a href=\"#\">Privacy Policy</a>\r\n                    </li>\r\n                    <li class=\"list-inline-item\">\r\n                        <a href=\"#\">Terms of Use</a>\r\n                    </li>\r\n                </ul>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</footer>"}}}')
INSERT [dbo].[marina_Document] ([Id], [Type], [Content]) VALUES (24, N'OrchardCore.Layers.Models.LayersDocument, OrchardCore.Layers', N'{"Id":24,"Layers":[{"Name":"Always","Rule":"true","Description":"The widgets in this layer are displayed on any page of this site."},{"Name":"Homepage","Rule":"isHomepage()","Description":"The widgets in this layer are only displayed on the homepage."}]}')
INSERT [dbo].[marina_Document] ([Id], [Type], [Content]) VALUES (25, N'OrchardCore.ContentManagement.ContentItem, OrchardCore.ContentManagement.Abstractions', N'{"ContentItemId":"478r6dxkbtgcd4pb10ps9wpndn","ContentItemVersionId":"472z8w0nnrztss0xkn7fwaxqxm","ContentType":"Menu","DisplayText":"Main Menu","Latest":true,"Published":true,"ModifiedUtc":"2019-07-16T09:52:28.7533135Z","PublishedUtc":"2019-07-16T09:52:28.7589086Z","CreatedUtc":"2019-07-16T09:52:28.7589086Z","Owner":"Marina","Author":"Marina","MenuPart":{},"TitlePart":{"Title":"Main Menu"},"MenuItemsListPart":{"MenuItems":[{"ContentType":"LinkMenuItem","ContentItemId":"483zjtvkwppvnv4kdz1k03tjdz","LinkMenuItemPart":{"Name":"Services","Url":"~/#services"}},{"ContentType":"LinkMenuItem","ContentItemId":"4eh95fr1hnb7a323ftszk78jmy","LinkMenuItemPart":{"Name":"Portfolio","Url":"~/#portfolio"}},{"ContentType":"LinkMenuItem","ContentItemId":"4k23e6prrp60m6qt18ryj19xc2","LinkMenuItemPart":{"Name":"About","Url":"~/#about"}},{"ContentType":"LinkMenuItem","ContentItemId":"4rwr2z2rbxbe5zq1sbtycr34cw","LinkMenuItemPart":{"Name":"Team","Url":"~/#team"}},{"ContentType":"LinkMenuItem","ContentItemId":"4zsaabzjqy9w7xnwkhf1r3w8dt","LinkMenuItemPart":{"Name":"Contact","Url":"~/#contact"}}]},"AliasPart":{"Alias":"main-menu"}}')
INSERT [dbo].[marina_Document] ([Id], [Type], [Content]) VALUES (26, N'OrchardCore.ContentManagement.ContentItem, OrchardCore.ContentManagement.Abstractions', N'{"ContentItemId":"4zngqttxyq2rjvq074rmw348cy","ContentItemVersionId":"44m9mcr8v75s1tb0fg5rkqtqxg","ContentType":"LandingPage","DisplayText":"marina","Latest":true,"Published":true,"ModifiedUtc":"2019-07-16T09:52:28.7650673Z","PublishedUtc":"2019-07-16T09:52:28.7681747Z","CreatedUtc":"2019-07-16T09:52:28.7681747Z","Owner":"Marina","Author":"Marina","LandingPage":{},"AutoroutePart":{"Path":"home-page","SetHomepage":true},"TitlePart":{"Title":"marina"},"Services":{"ContentItems":[{"ContentItemId":"4970x80p7se2r7k0msegh4sqmc","ContentItemVersionId":"4twh4m5zkbvyazyvhzsqknnfm9","ContentType":"Service","DisplayText":"E-Commerce","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Service":{"IconClass":{"Text":"fa-shopping-cart"}},"HtmlBodyPart":{"Html":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit."},"TitlePart":{"Title":"E-Commerce"}},{"ContentItemId":"4snbhbgr0jbkar0yh2rr61c3d8","ContentItemVersionId":"4zj4nyf95xm0wx89md3yw0ve5w","ContentType":"Service","DisplayText":"Responsive Design","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Service":{"IconClass":{"Text":"fa-laptop"}},"HtmlBodyPart":{"Html":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit."},"TitlePart":{"Title":"Responsive Design"}},{"ContentItemId":"43ejzr257n1qevnnb124g2bpm2","ContentItemVersionId":"4ne2g5apfdnvbymhzfqheg894f","ContentType":"Service","DisplayText":"Web Security","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Service":{"IconClass":{"Text":"fa-lock"}},"HtmlBodyPart":{"Html":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit."},"TitlePart":{"Title":"Web Security"}}]},"Portfolio":{"ContentItems":[{"ContentItemId":"471e5xpz7jy06vy118ej42sjxv","ContentItemVersionId":"4vgdepx3q60cz77n8w2ar4b5c8","ContentType":"Project","DisplayText":"Threads","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Project":{"Image":{"Paths":["/portfolio/01-full.jpg"]},"Category":{"Text":"Illustrations"}},"HtmlBodyPart":{"Html":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!"},"TitlePart":{"Title":"Threads"}},{"ContentItemId":"4fad3f0rfdamh4vvacg9x1pm4b","ContentItemVersionId":"4wgd67nat80nb1gnhd09c2fkw5","ContentType":"Project","DisplayText":"Explore","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Project":{"Image":{"Paths":["/portfolio/02-full.jpg"]},"Category":{"Text":"Graphic Design"}},"HtmlBodyPart":{"Html":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!"},"TitlePart":{"Title":"Explore"}},{"ContentItemId":"4y4n5nctah5e4y9tm5z7cjc95m","ContentItemVersionId":"4pzcz3ng04nt0362fzwgdvn2c8","ContentType":"Project","DisplayText":"Finish","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Project":{"Image":{"Paths":["/portfolio/03-full.jpg"]},"Category":{"Text":"Identity"}},"HtmlBodyPart":{"Html":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!"},"TitlePart":{"Title":"Finish"}},{"ContentItemId":"4hp1cn6dcxee969j5kzxnqbqx2","ContentItemVersionId":"47t18szp54wby463tnn17gdtwq","ContentType":"Project","DisplayText":"Lines","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Project":{"Image":{"Paths":["/portfolio/04-full.jpg"]},"Category":{"Text":"Branding"}},"HtmlBodyPart":{"Html":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!"},"TitlePart":{"Title":"Lines"}},{"ContentItemId":"45bzpzpqc4n49w0kbwnam2a2n7","ContentItemVersionId":"472v07tmvnff3xk23wq15va5xh","ContentType":"Project","DisplayText":"Southwest","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Project":{"Image":{"Paths":["/portfolio/05-full.jpg"]},"Category":{"Text":"Web Design"}},"HtmlBodyPart":{"Html":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!"},"TitlePart":{"Title":"Southwest"}},{"ContentItemId":"464gtxpecbzr4w95rvw01r0841","ContentItemVersionId":"46q3vkx94d25hrzet8det2h6dd","ContentType":"Project","DisplayText":"Window","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Project":{"Image":{"Paths":["/portfolio/06-full.jpg"]},"Category":{"Text":"Photography"}},"HtmlBodyPart":{"Html":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est blanditiis dolorem culpa incidunt minus dignissimos deserunt repellat aperiam quasi sunt officia expedita beatae cupiditate, maiores repudiandae, nostrum, reiciendis facere nemo!"},"TitlePart":{"Title":"Window"}}]},"About":{"ContentItems":[{"ContentItemId":"42qt46rr5xhp4zp5ecsy8svxm1","ContentItemVersionId":"469scx2942gnf2zzass9t4j14p","ContentType":"Milestone","DisplayText":"Our Humble Beginnings","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Milestone":{"Date":{"Text":"2009-2011"},"Image":{"Paths":["/about/1.jpg"]}},"HtmlBodyPart":{"Html":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!"},"TitlePart":{"Title":"Our Humble Beginnings"}},{"ContentItemId":"4bs3qzpsndfs71pq2tq9btqynm","ContentItemVersionId":"4haytf4dak47e16s5c8hjqv7mb","ContentType":"Milestone","DisplayText":"An Agency is Born","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Milestone":{"Date":{"Text":"MARCH 2011"},"Image":{"Paths":["/about/2.jpg"]}},"HtmlBodyPart":{"Html":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!\r\n"},"TitlePart":{"Title":"An Agency is Born"}},{"ContentItemId":"4a4j8143dbqae2cv4vey99g05m","ContentItemVersionId":"44ergs1pxyzhx225t1c64j4h57","ContentType":"Milestone","DisplayText":"Transition to Full Service","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Milestone":{"Date":{"Text":"DECEMBER 2012"},"Image":{"Paths":["/about/3.jpg"]}},"HtmlBodyPart":{"Html":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!"},"TitlePart":{"Title":"Transition to Full Service"}},{"ContentItemId":"4c4303mv6m2caxxgt9hzrt4r5d","ContentItemVersionId":"4yv0grde434mbw5jkt91x68fw0","ContentType":"Milestone","DisplayText":"Phase Two Expansion","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Milestone":{"Date":{"Text":"JULY 2014"},"Image":{"Paths":["/about/4.jpg"]}},"HtmlBodyPart":{"Html":"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!\r\n"},"TitlePart":{"Title":"Phase Two Expansion"}}]},"Team":{"ContentItems":[{"ContentItemId":"4xew8nv4ngex77f6kb4f519cnk","ContentItemVersionId":"41t0vjby8cd8pt3g6eekrt6axh","ContentType":"TeamMember","DisplayText":"Kay Garland","Latest":false,"Published":false,"Owner":null,"Author":"Marina","TeamMember":{"Occupation":{"Text":"Lead Designer"},"Picture":{"Paths":["/team/1.jpg"]},"Twitter":{"Text":"@BillGates"},"Facebook":{"Text":"BillGates"},"LinkedIn":{"Text":"williamhgates"}},"TitlePart":{"Title":"Kay Garland"}},{"ContentItemId":"4tqwbnmk1ggtjs9g3zmra62gnh","ContentItemVersionId":"4ykvvaqz8mzf84rx8cm3jw28m2","ContentType":"TeamMember","DisplayText":"Larry Parker","Latest":false,"Published":false,"Owner":null,"Author":"Marina","TeamMember":{"Occupation":{"Text":"Lead Marketer"},"Picture":{"Paths":["/team/2.jpg"]},"Twitter":{"Text":"@BillGates"},"Facebook":{"Text":"BillGates"},"LinkedIn":{"Text":"williamhgates"}},"TitlePart":{"Title":"Larry Parker"}},{"ContentItemId":"48jr867epe02b261yeqyzkpddm","ContentItemVersionId":"40et8wnmek9t3tz6cg5jts2j5r","ContentType":"TeamMember","DisplayText":"Diana Pertersen","Latest":false,"Published":false,"Owner":null,"Author":"Marina","TeamMember":{"Occupation":{"Text":"Lead Developer"},"Picture":{"Paths":["/team/3.jpg"]},"Twitter":{"Text":"@BillGates"},"Facebook":{"Text":"BillGates"},"LinkedIn":{"Text":"williamhgates"}},"TitlePart":{"Title":"Diana Pertersen"}}]},"Clients":{"ContentItems":[{"ContentItemId":"4d8ab3rxe6jybtd5kcmez44ccv","ContentItemVersionId":"41xcwxwpxarfc4a55wwxzyjxdn","ContentType":"Client","DisplayText":"Envato","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Client":{"Logo":{"Paths":["/logos/envato.jpg"]},"Url":{"Text":"#"}},"TitlePart":{"Title":"Envato"}},{"ContentItemId":"4ewbhma7rd79bwm0djprwh5745","ContentItemVersionId":"4184qr3fwczp1zd29cq3vd6e53","ContentType":"Client","DisplayText":"Design Moto","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Client":{"Logo":{"Paths":["/logos/designmodo.jpg"]},"Url":{"Text":"#"}},"TitlePart":{"Title":"Design Moto"}},{"ContentItemId":"47btstjt3n61rt69kw6p82xax4","ContentItemVersionId":"4vrv1pmg4hwv9x0z012kce2655","ContentType":"Client","DisplayText":"ThemeForest","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Client":{"Logo":{"Paths":["/logos/themeforest.jpg"]},"Url":{"Text":"#"}},"TitlePart":{"Title":"ThemeForest"}},{"ContentItemId":"4xb41hf0p3m3zv2kwkn90wbwde","ContentItemVersionId":"4z9seqn0jrt78wtc6fvb5f8hwf","ContentType":"Client","DisplayText":"Creative","Latest":false,"Published":false,"Owner":null,"Author":"Marina","Client":{"Logo":{"Paths":["/logos/creative-market.jpg"]},"Url":{"Text":"#"}},"TitlePart":{"Title":"Creative"}}]}}')
INSERT [dbo].[marina_Document] ([Id], [Type], [Content]) VALUES (27, N'OrchardCore.Templates.Models.TemplatesDocument, OrchardCore.Templates', N'{"Id":27,"Templates":{"Content__LandingPage":{"Content":"{% zone \"Header\" %}\r\n<!-- Header -->\r\n<header class=\"masthead\">\r\n    <div class=\"container\">\r\n        <div class=\"intro-text\">\r\n            <div class=\"intro-lead-in\">Welcome To Our Studio!</div>\r\n            <div class=\"intro-heading text-uppercase\">It''s Nice To Meet You</div>\r\n            <a class=\"btn btn-primary btn-xl text-uppercase js-scroll-trigger\" href=\"#services\">Tell Me More</a>\r\n        </div>\r\n    </div>\r\n</header>\r\n{% endzone %}\r\n\r\n{% if Model.ContentItem.Content.Services.ContentItems.size > 0 %}\r\n<!-- Services -->\r\n<section id=\"services\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-lg-12 text-center\">\r\n                <h2 class=\"section-heading text-uppercase\">Services</h2>\r\n                <h3 class=\"section-subheading text-muted\">Lorem ipsum dolor sit amet consectetur.</h3>\r\n            </div>\r\n        </div>\r\n        <div class=\"row text-center\">\r\n            {% for service in Model.ContentItem.Content.Services.ContentItems %}\r\n            <div class=\"col-md-4\">\r\n                <span class=\"fa-stack fa-4x\">\r\n                    <i class=\"fas fa-circle fa-stack-2x text-primary\"></i>\r\n                    <i class=\"fas {{ service.Service.IconClass.Text }} fa-stack-1x fa-inverse\"></i>\r\n                </span>\r\n                <h4 class=\"service-heading\">{{ service.DisplayText }}</h4>\r\n                <p class=\"text-muted\">{{ service.HtmlBodyPart.Html | raw }}</p>\r\n            </div>\r\n            {% endfor %}\r\n        </div>\r\n    </div>\r\n</section>\r\n{% endif %}\r\n\r\n{% if Model.ContentItem.Content.Portfolio.ContentItems.size > 0 %}\r\n<!-- Portfolio Grid -->\r\n<section class=\"bg-light\" id=\"portfolio\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-lg-12 text-center\">\r\n                <h2 class=\"section-heading text-uppercase\">Portfolio</h2>\r\n                <h3 class=\"section-subheading text-muted\">Lorem ipsum dolor sit amet consectetur.</h3>\r\n            </div>\r\n        </div>\r\n        <div class=\"row\">\r\n            {% for project in Model.ContentItem.Content.Portfolio.ContentItems %}\r\n            <div class=\"col-md-4 col-sm-6 portfolio-item\">\r\n                <div class=\"portfolio-link\" data-toggle=\"modal\" href=\"#portfolioModal{{ forloop.index }}\">\r\n                    <div class=\"portfolio-hover\">\r\n                        <div class=\"portfolio-hover-content\">\r\n                            <i class=\"fas fa-plus fa-3x\"></i>\r\n                        </div>\r\n                    </div>\r\n                    <img class=\"img-fluid\" src=\"{{ project.Project.Image.Paths.first | asset_url | resize_url: width:480, height: 480, mode: ''stretch'' }}\" alt=\"{{ project.DisplayText }}\">\r\n                </div>\r\n                <div class=\"portfolio-caption\">\r\n                    <h4>{{ project.DisplayText }}</h4>\r\n                    <p class=\"text-muted\">{{ project.Project.Category.Text }}</p>\r\n                </div>\r\n            </div>\r\n            {% endfor %}\r\n        </div>\r\n    </div>\r\n</section>\r\n{% endif %}\r\n\r\n{% if Model.ContentItem.Content.About.ContentItems.size > 0 %}\r\n<!-- About -->\r\n<section id=\"about\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-lg-12 text-center\">\r\n                <h2 class=\"section-heading text-uppercase\">About</h2>\r\n                <h3 class=\"section-subheading text-muted\">Lorem ipsum dolor sit amet consectetur.</h3>\r\n            </div>\r\n        </div>\r\n        <div class=\"row\">\r\n            <div class=\"col-lg-12\">\r\n                <ul class=\"timeline\">\r\n                    {% for milestone in Model.ContentItem.Content.About.ContentItems %}\r\n                    <li class=\"{% cycle '''', ''timeline-inverted'' %}\">\r\n                        <div class=\"timeline-image\">\r\n                            <img class=\"rounded-circle img-fluid\" src=\"{{ milestone.Milestone.Image.Paths.first | asset_url | resize_url: width:160, height: 160, mode: ''stretch'' }}\" alt=\"\">\r\n                        </div>\r\n                        <div class=\"timeline-panel\">\r\n                            <div class=\"timeline-heading\">\r\n                                <h4>{{ milestone.Milestone.Date.Text }}</h4>\r\n                                <h4 class=\"subheading\">{{ milestone.DisplayText }}</h4>\r\n                            </div>\r\n                            <div class=\"timeline-body\">\r\n                                <p class=\"text-muted\">{{ milestone.HtmlBodyPart.Html }}</p>\r\n                            </div>\r\n                        </div>\r\n                    </li>\r\n                    {% endfor %}\r\n                    <li class=\"timeline-inverted\">\r\n                        <div class=\"timeline-image\">\r\n                            <h4>\r\n                                Be Part\r\n                                <br>Of Our\r\n                                <br>Story!\r\n                            </h4>\r\n                        </div>\r\n                    </li>\r\n                </ul>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</section>\r\n{% endif %}\r\n\r\n{% if Model.ContentItem.Content.Team.ContentItems.size > 0 %}\r\n<!-- Team -->\r\n<section class=\"bg-light\" id=\"team\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-lg-12 text-center\">\r\n                <h2 class=\"section-heading text-uppercase\">Our Amazing Team</h2>\r\n                <h3 class=\"section-subheading text-muted\">Lorem ipsum dolor sit amet consectetur.</h3>\r\n            </div>\r\n        </div>\r\n        <div class=\"row\">\r\n            {% for member in Model.ContentItem.Content.Team.ContentItems %}\r\n            <div class=\"col-sm-4\">\r\n                <div class=\"team-member\">\r\n                    <img class=\"mx-auto rounded-circle\" src=\"{{ member.TeamMember.Picture.Paths.first | asset_url | resize_url: width:240, height: 240, mode: ''stretch'' }}\" alt=\"\">\r\n                    <h4>{{ member.DisplayText }}</h4>\r\n                    <p class=\"text-muted\">{{ member.TeamMember.Occupation.Text }}</p>\r\n                    <ul class=\"list-inline social-buttons\">\r\n                        {% if member.TeamMember.Twitter.Text.size > 0 %}\r\n                        <li class=\"list-inline-item\">\r\n                            <a href=\"https://www.twitter.com/{{ member.TeamMember.Twitter.Text }}\">\r\n                                <i class=\"fab fa-twitter\"></i>\r\n                            </a>\r\n                        </li>\r\n                        {% endif %}\r\n                        {% if member.TeamMember.Facebook.Text.size > 0 %}\r\n                        <li class=\"list-inline-item\">\r\n                            <a href=\"https://www.facebook.com/{{ member.TeamMember.Facebook.Text }}\">\r\n                                <i class=\"fab fa-facebook\"></i>\r\n                            </a>\r\n                        </li>\r\n                        {% endif %}\r\n                        {% if member.TeamMember.LinkedIn.Text.size > 0 %}\r\n                        <li class=\"list-inline-item\">\r\n                            <a href=\"https://www.linkedin.com/in/{{ member.TeamMember.LinkedIn.Text }}\">\r\n                                <i class=\"fab fa-linkedin\"></i>\r\n                            </a>\r\n                        </li>\r\n                        {% endif %}\r\n                    </ul>\r\n                </div>\r\n            </div>\r\n            {% endfor %}\r\n        </div>\r\n        <div class=\"row\">\r\n            <div class=\"col-lg-8 mx-auto text-center\">\r\n                <p class=\"large text-muted\">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</section>\r\n{% endif %}\r\n\r\n{% if Model.ContentItem.Content.Clients.ContentItems.size > 0 %}\r\n<!-- Clients -->\r\n<section class=\"py-5\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            {% for client in Model.ContentItem.Content.Clients.ContentItems %}\r\n            <div class=\"col-md-3 col-sm-6\">\r\n                <a href=\"{{ client.Client.Url.Text }}\">\r\n                    <img class=\"img-fluid d-block mx-auto\" src=\"{{ client.Client.Logo.Paths.first | asset_url }}\" alt=\"\">\r\n                </a>\r\n            </div>\r\n            {% endfor %}\r\n        </div>\r\n    </div>\r\n</section>\r\n{% endif %}\r\n\r\n<!-- Contact -->\r\n<section id=\"contact\">\r\n    <div class=\"container\">\r\n        <div class=\"row\">\r\n            <div class=\"col-lg-12 text-center\">\r\n                <h2 class=\"section-heading text-uppercase\">Contact Us</h2>\r\n                <h3 class=\"section-subheading text-muted\">Lorem ipsum dolor sit amet consectetur.</h3>\r\n            </div>\r\n        </div>\r\n        <div class=\"row\">\r\n            <div class=\"col-lg-12\">\r\n                <form id=\"contactForm\" name=\"sentMessage\" novalidate>\r\n                    <div class=\"row\">\r\n                        <div class=\"col-md-6\">\r\n                            <div class=\"form-group\">\r\n                                <input class=\"form-control\" id=\"name\" type=\"text\" placeholder=\"Your Name *\" required data-validation-required-message=\"Please enter your name.\">\r\n                                <p class=\"help-block text-danger\"></p>\r\n                            </div>\r\n                            <div class=\"form-group\">\r\n                                <input class=\"form-control\" id=\"email\" type=\"email\" placeholder=\"Your Email *\" required data-validation-required-message=\"Please enter your email address.\">\r\n                                <p class=\"help-block text-danger\"></p>\r\n                            </div>\r\n                            <div class=\"form-group\">\r\n                                <input class=\"form-control\" id=\"phone\" type=\"tel\" placeholder=\"Your Phone *\" required data-validation-required-message=\"Please enter your phone number.\">\r\n                                <p class=\"help-block text-danger\"></p>\r\n                            </div>\r\n                        </div>\r\n                        <div class=\"col-md-6\">\r\n                            <div class=\"form-group\">\r\n                                <textarea class=\"form-control\" id=\"message\" placeholder=\"Your Message *\" required data-validation-required-message=\"Please enter a message.\"></textarea>\r\n                                <p class=\"help-block text-danger\"></p>\r\n                            </div>\r\n                        </div>\r\n                        <div class=\"clearfix\"></div>\r\n                        <div class=\"col-lg-12 text-center\">\r\n                            <div id=\"success\"></div>\r\n                            <button id=\"sendMessageButton\" class=\"btn btn-primary btn-xl text-uppercase\" type=\"submit\">Send Message</button>\r\n                        </div>\r\n                    </div>\r\n                </form>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</section>\r\n\r\n<!-- Modals -->\r\n{% for project in Model.ContentItem.Content.Portfolio.ContentItems %}\r\n<div class=\"portfolio-modal modal fade\" id=\"portfolioModal{{ forloop.index }}\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\">\r\n    <div class=\"modal-dialog\">\r\n        <div class=\"modal-content\">\r\n            <div class=\"close-modal\" data-dismiss=\"modal\">\r\n                <div class=\"lr\">\r\n                    <div class=\"rl\"></div>\r\n                </div>\r\n            </div>\r\n            <div class=\"container\">\r\n                <div class=\"row\">\r\n                    <div class=\"col-lg-8 mx-auto\">\r\n                        <div class=\"modal-body\">\r\n                            <!-- Project Details Go Here -->\r\n                            <h2 class=\"text-uppercase\">{{ project.DisplayText }}</h2>\r\n                            <p class=\"item-intro text-muted\">{{ project.Project.Category.Text }}</p>\r\n                            <img class=\"img-fluid d-block mx-auto\" src=\"{{ project.Project.Image.Paths.first | asset_url | resize_url: width:480, height: 480, mode: ''max'' }}\" alt=\"{{ project.DisplayText }}\">\r\n                            <p>{{ project.HtmlBodyPart.Html | raw }}</p>\r\n                            {% comment %}\r\n                            <ul class=\"list-inline\">\r\n                                <li>Date: January 2017</li>\r\n                                <li>Client: Threads</li>\r\n                                <li>Category: Illustration</li>\r\n                            </ul>\r\n                            {% endcomment %}\r\n                            <button class=\"btn btn-primary\" data-dismiss=\"modal\" type=\"button\">\r\n                                <i class=\"fa fa-times\"></i>\r\n                                Close Project\r\n                            </button>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n{% endfor %}","Description":"A template for the Landing Page content type"}}}')
INSERT [dbo].[marina_Document] ([Id], [Type], [Content]) VALUES (41, N'OrchardCore.Users.Models.User, OrchardCore.Users.Core', N'{"Id":41,"UserName":"Marina","NormalizedUserName":"MARINA","Email":"marina.philippe@outlook.com","NormalizedEmail":"MARINA.PHILIPPE@OUTLOOK.COM","PasswordHash":"AQAAAAEAACcQAAAAEDDIov/RSURdwJlQL7VQV/fZHpz4t2XjZSC6EwYNjtAzcQSvJfvUpUayRgb6J+ulLg==","SecurityStamp":"OPE3YQZFZN4CIXBEE6HE5NRWT7NPUZY7","EmailConfirmed":true,"ResetToken":null,"RoleNames":{"$type":"System.String[], System.Private.CoreLib","$values":["Administrator"]},"LoginInfos":[],"Properties":{}}')
INSERT [dbo].[marina_Identifiers] ([dimension], [nextval]) VALUES (N'', 61)
SET IDENTITY_INSERT [dbo].[marina_LayerMetadataIndex] ON 

INSERT [dbo].[marina_LayerMetadataIndex] ([Id], [DocumentId], [Zone]) VALUES (1, 23, N'Footer')
SET IDENTITY_INSERT [dbo].[marina_LayerMetadataIndex] OFF
SET IDENTITY_INSERT [dbo].[marina_UserByRoleNameIndex] ON 

INSERT [dbo].[marina_UserByRoleNameIndex] ([Id], [RoleName], [Count]) VALUES (1, N'ADMINISTRATOR', 1)
SET IDENTITY_INSERT [dbo].[marina_UserByRoleNameIndex] OFF
INSERT [dbo].[marina_UserByRoleNameIndex_Document] ([UserByRoleNameIndexId], [DocumentId]) VALUES (1, 41)
SET IDENTITY_INSERT [dbo].[marina_UserIndex] ON 

INSERT [dbo].[marina_UserIndex] ([Id], [DocumentId], [NormalizedUserName], [NormalizedEmail]) VALUES (1, 41, N'MARINA', N'MARINA.PHILIPPE@OUTLOOK.COM')
SET IDENTITY_INSERT [dbo].[marina_UserIndex] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Document_Type]    Script Date: 16/07/2019 16:07:16 ******/
CREATE NONCLUSTERED INDEX [IX_Document_Type] ON [dbo].[main_Document]
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Dimension]    Script Date: 16/07/2019 16:07:16 ******/
CREATE NONCLUSTERED INDEX [IX_Dimension] ON [dbo].[main_Identifiers]
(
	[dimension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_AliasPartIndex_Alias]    Script Date: 16/07/2019 16:07:16 ******/
CREATE NONCLUSTERED INDEX [IDX_AliasPartIndex_Alias] ON [dbo].[marina_AliasPartIndex]
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_AutoroutePartIndex_ContentItemId]    Script Date: 16/07/2019 16:07:16 ******/
CREATE NONCLUSTERED INDEX [IDX_AutoroutePartIndex_ContentItemId] ON [dbo].[marina_AutoroutePartIndex]
(
	[ContentItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_ContainedPartIndex_ListContentItemId]    Script Date: 16/07/2019 16:07:16 ******/
CREATE NONCLUSTERED INDEX [IDX_ContainedPartIndex_ListContentItemId] ON [dbo].[marina_ContainedPartIndex]
(
	[ListContentItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_ContentItemIndex_ContentItemId]    Script Date: 16/07/2019 16:07:16 ******/
CREATE NONCLUSTERED INDEX [IDX_ContentItemIndex_ContentItemId] ON [dbo].[marina_ContentItemIndex]
(
	[ContentItemId] ASC,
	[Latest] ASC,
	[Published] ASC,
	[CreatedUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_ContentItemIndex_ContentItemVersionId]    Script Date: 16/07/2019 16:07:16 ******/
CREATE NONCLUSTERED INDEX [IDX_ContentItemIndex_ContentItemVersionId] ON [dbo].[marina_ContentItemIndex]
(
	[ContentItemVersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_ContentItemIndex_DisplayText]    Script Date: 16/07/2019 16:07:16 ******/
CREATE NONCLUSTERED INDEX [IDX_ContentItemIndex_DisplayText] ON [dbo].[marina_ContentItemIndex]
(
	[DisplayText] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Document_Type]    Script Date: 16/07/2019 16:07:16 ******/
CREATE NONCLUSTERED INDEX [IX_Document_Type] ON [dbo].[marina_Document]
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Dimension]    Script Date: 16/07/2019 16:07:16 ******/
CREATE NONCLUSTERED INDEX [IX_Dimension] ON [dbo].[marina_Identifiers]
(
	[dimension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[main_UserByLoginInfoIndex]  WITH CHECK ADD  CONSTRAINT [main_FK_UserByLoginInfoIndex] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[main_Document] ([Id])
GO
ALTER TABLE [dbo].[main_UserByLoginInfoIndex] CHECK CONSTRAINT [main_FK_UserByLoginInfoIndex]
GO
ALTER TABLE [dbo].[main_UserByRoleNameIndex_Document]  WITH CHECK ADD  CONSTRAINT [main_FK_UserByRoleNameIndex_Document_DocumentId] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[main_Document] ([Id])
GO
ALTER TABLE [dbo].[main_UserByRoleNameIndex_Document] CHECK CONSTRAINT [main_FK_UserByRoleNameIndex_Document_DocumentId]
GO
ALTER TABLE [dbo].[main_UserByRoleNameIndex_Document]  WITH CHECK ADD  CONSTRAINT [main_FK_UserByRoleNameIndex_Document_Id] FOREIGN KEY([UserByRoleNameIndexId])
REFERENCES [dbo].[main_UserByRoleNameIndex] ([Id])
GO
ALTER TABLE [dbo].[main_UserByRoleNameIndex_Document] CHECK CONSTRAINT [main_FK_UserByRoleNameIndex_Document_Id]
GO
ALTER TABLE [dbo].[main_UserIndex]  WITH CHECK ADD  CONSTRAINT [main_FK_UserIndex] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[main_Document] ([Id])
GO
ALTER TABLE [dbo].[main_UserIndex] CHECK CONSTRAINT [main_FK_UserIndex]
GO
ALTER TABLE [dbo].[marina_AliasPartIndex]  WITH CHECK ADD  CONSTRAINT [marina_FK_AliasPartIndex] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[marina_Document] ([Id])
GO
ALTER TABLE [dbo].[marina_AliasPartIndex] CHECK CONSTRAINT [marina_FK_AliasPartIndex]
GO
ALTER TABLE [dbo].[marina_AutoroutePartIndex]  WITH CHECK ADD  CONSTRAINT [marina_FK_AutoroutePartIndex] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[marina_Document] ([Id])
GO
ALTER TABLE [dbo].[marina_AutoroutePartIndex] CHECK CONSTRAINT [marina_FK_AutoroutePartIndex]
GO
ALTER TABLE [dbo].[marina_ContainedPartIndex]  WITH CHECK ADD  CONSTRAINT [marina_FK_ContainedPartIndex] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[marina_Document] ([Id])
GO
ALTER TABLE [dbo].[marina_ContainedPartIndex] CHECK CONSTRAINT [marina_FK_ContainedPartIndex]
GO
ALTER TABLE [dbo].[marina_ContentItemIndex]  WITH CHECK ADD  CONSTRAINT [marina_FK_ContentItemIndex] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[marina_Document] ([Id])
GO
ALTER TABLE [dbo].[marina_ContentItemIndex] CHECK CONSTRAINT [marina_FK_ContentItemIndex]
GO
ALTER TABLE [dbo].[marina_DeploymentPlanIndex]  WITH CHECK ADD  CONSTRAINT [marina_FK_DeploymentPlanIndex] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[marina_Document] ([Id])
GO
ALTER TABLE [dbo].[marina_DeploymentPlanIndex] CHECK CONSTRAINT [marina_FK_DeploymentPlanIndex]
GO
ALTER TABLE [dbo].[marina_LayerMetadataIndex]  WITH CHECK ADD  CONSTRAINT [marina_FK_LayerMetadataIndex] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[marina_Document] ([Id])
GO
ALTER TABLE [dbo].[marina_LayerMetadataIndex] CHECK CONSTRAINT [marina_FK_LayerMetadataIndex]
GO
ALTER TABLE [dbo].[marina_UserByLoginInfoIndex]  WITH CHECK ADD  CONSTRAINT [marina_FK_UserByLoginInfoIndex] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[marina_Document] ([Id])
GO
ALTER TABLE [dbo].[marina_UserByLoginInfoIndex] CHECK CONSTRAINT [marina_FK_UserByLoginInfoIndex]
GO
ALTER TABLE [dbo].[marina_UserByRoleNameIndex_Document]  WITH CHECK ADD  CONSTRAINT [marina_FK_UserByRoleNameIndex_Document_DocumentId] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[marina_Document] ([Id])
GO
ALTER TABLE [dbo].[marina_UserByRoleNameIndex_Document] CHECK CONSTRAINT [marina_FK_UserByRoleNameIndex_Document_DocumentId]
GO
ALTER TABLE [dbo].[marina_UserByRoleNameIndex_Document]  WITH CHECK ADD  CONSTRAINT [marina_FK_UserByRoleNameIndex_Document_Id] FOREIGN KEY([UserByRoleNameIndexId])
REFERENCES [dbo].[marina_UserByRoleNameIndex] ([Id])
GO
ALTER TABLE [dbo].[marina_UserByRoleNameIndex_Document] CHECK CONSTRAINT [marina_FK_UserByRoleNameIndex_Document_Id]
GO
ALTER TABLE [dbo].[marina_UserIndex]  WITH CHECK ADD  CONSTRAINT [marina_FK_UserIndex] FOREIGN KEY([DocumentId])
REFERENCES [dbo].[marina_Document] ([Id])
GO
ALTER TABLE [dbo].[marina_UserIndex] CHECK CONSTRAINT [marina_FK_UserIndex]
GO
USE [master]
GO
ALTER DATABASE [Orchard] SET  READ_WRITE 
GO
