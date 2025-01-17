USE [master]
GO
/****** Object:  Database [SearchBase]    Script Date: 16/05/2020 13:13:42 ******/
CREATE DATABASE [SearchBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SearchBase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SearchBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SearchBase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SearchBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SearchBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SearchBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SearchBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SearchBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SearchBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SearchBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SearchBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [SearchBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SearchBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SearchBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SearchBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SearchBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SearchBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SearchBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SearchBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SearchBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SearchBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SearchBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SearchBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SearchBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SearchBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SearchBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SearchBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SearchBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SearchBase] SET RECOVERY FULL 
GO
ALTER DATABASE [SearchBase] SET  MULTI_USER 
GO
ALTER DATABASE [SearchBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SearchBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SearchBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SearchBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SearchBase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SearchBase', N'ON'
GO
ALTER DATABASE [SearchBase] SET QUERY_STORE = OFF
GO
USE [SearchBase]
GO
/****** Object:  Table [dbo].[Historique]    Script Date: 16/05/2020 13:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historique](
	[IdHist] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[IdSearch] [int] NOT NULL,
 CONSTRAINT [PK_Historique] PRIMARY KEY CLUSTERED 
(
	[IdHist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lien]    Script Date: 16/05/2020 13:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lien](
	[IdLien] [int] IDENTITY(1,1) NOT NULL,
	[URL] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PK_Lien] PRIMARY KEY CLUSTERED 
(
	[IdLien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mot]    Script Date: 16/05/2020 13:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mot](
	[IdMot] [int] IDENTITY(1,1) NOT NULL,
	[TextMot] [nchar](20) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[IdMot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recherche]    Script Date: 16/05/2020 13:13:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recherche](
	[IdSearch] [int] IDENTITY(1,1) NOT NULL,
	[IdMot] [int] NOT NULL,
	[IdLien] [int] NOT NULL,
 CONSTRAINT [PK_Recherche] PRIMARY KEY CLUSTERED 
(
	[IdSearch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lien] ON 

INSERT [dbo].[Lien] ([IdLien], [URL], [Description]) VALUES (4, N'https://openclassrooms.com/fr/', N'OpenClassrooms est un site web de formation en ligne qui propose à ses membres des cours certifiants et des parcours débouchant sur des métiers en croissance.')
INSERT [dbo].[Lien] ([IdLien], [URL], [Description]) VALUES (10, N'https://www.google.com/', N'Google est une entreprise américaine de services technologiques fondée en 1998 dans la Silicon Valley, en Californie, par Larry Page et Sergey Brin, créateurs du moteur de recherche Google.')
INSERT [dbo].[Lien] ([IdLien], [URL], [Description]) VALUES (11, N'http://www.fstt.ac.ma/Portail/index.php', N' la FST de Tanger est un des huit établissements de l’Université Abdelmalek Essaâdi')
INSERT [dbo].[Lien] ([IdLien], [URL], [Description]) VALUES (12, N'https://www.microsoft.com/fr-ma', N'Microsoft Corporation est une multinationale informatique et micro-informatique américaine, fondée en 1975 par Bill Gates et Paul Allen')
INSERT [dbo].[Lien] ([IdLien], [URL], [Description]) VALUES (13, N'https://dotnet.microsoft.com/apps/aspnet', N'ASP.NET est un framework permettant de générer à la demande des pages web, lancé par Microsoft en juillet 2000, et utilisé pour mettre en œuvre des applications web')
INSERT [dbo].[Lien] ([IdLien], [URL], [Description]) VALUES (14, N'https://fr.linkedin.com/', N'LinkedIn est un réseau social professionnel en ligne créé en 2002 à Mountain View. ')
INSERT [dbo].[Lien] ([IdLien], [URL], [Description]) VALUES (15, N'https://www.postgresql.org/', N'PostgreSQL est un système de gestion de base de données relationnelle et objet')
INSERT [dbo].[Lien] ([IdLien], [URL], [Description]) VALUES (16, N'https://www.microsoft.com/fr-fr/sql-server', N'Microsoft SQL Server est un système de gestion de base de données en langage SQL incorporant entre autres un SGBDR développé et commercialisé par la société Microsoft')
SET IDENTITY_INSERT [dbo].[Lien] OFF
GO
ALTER TABLE [dbo].[Historique]  WITH CHECK ADD  CONSTRAINT [FK_Historique_Recherche] FOREIGN KEY([IdSearch])
REFERENCES [dbo].[Recherche] ([IdSearch])
GO
ALTER TABLE [dbo].[Historique] CHECK CONSTRAINT [FK_Historique_Recherche]
GO
ALTER TABLE [dbo].[Recherche]  WITH CHECK ADD  CONSTRAINT [FK_Recherche_Lien] FOREIGN KEY([IdLien])
REFERENCES [dbo].[Lien] ([IdLien])
GO
ALTER TABLE [dbo].[Recherche] CHECK CONSTRAINT [FK_Recherche_Lien]
GO
ALTER TABLE [dbo].[Recherche]  WITH CHECK ADD  CONSTRAINT [FK_Recherche_Mot] FOREIGN KEY([IdMot])
REFERENCES [dbo].[Mot] ([IdMot])
GO
ALTER TABLE [dbo].[Recherche] CHECK CONSTRAINT [FK_Recherche_Mot]
GO
USE [master]
GO
ALTER DATABASE [SearchBase] SET  READ_WRITE 
GO
