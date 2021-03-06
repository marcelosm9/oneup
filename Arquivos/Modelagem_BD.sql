USE [master]
GO
/****** Object:  Database [oneup]    Script Date: 29-Jul-18 3:24:01 PM ******/
CREATE DATABASE [oneup]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'oneup', FILENAME = N'C:\Users\marce\oneup.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'oneup_log', FILENAME = N'C:\Users\marce\oneup_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [oneup] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [oneup].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [oneup] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [oneup] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [oneup] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [oneup] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [oneup] SET ARITHABORT OFF 
GO
ALTER DATABASE [oneup] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [oneup] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [oneup] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [oneup] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [oneup] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [oneup] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [oneup] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [oneup] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [oneup] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [oneup] SET  ENABLE_BROKER 
GO
ALTER DATABASE [oneup] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [oneup] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [oneup] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [oneup] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [oneup] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [oneup] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [oneup] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [oneup] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [oneup] SET  MULTI_USER 
GO
ALTER DATABASE [oneup] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [oneup] SET DB_CHAINING OFF 
GO
ALTER DATABASE [oneup] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [oneup] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [oneup] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [oneup] SET QUERY_STORE = OFF
GO
USE [oneup]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [oneup]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 29-Jul-18 3:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adocao]    Script Date: 29-Jul-18 3:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adocao](
	[AdocaoID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NOT NULL,
	[AnimalID] [int] NOT NULL,
	[DataAdocao] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Adocao] PRIMARY KEY CLUSTERED 
(
	[AdocaoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 29-Jul-18 3:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[AnimalID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](max) NULL,
	[Observacao] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Animal] PRIMARY KEY CLUSTERED 
(
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 29-Jul-18 3:24:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](max) NULL,
	[CPF] [nvarchar](max) NULL,
	[DataNascimento] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Cliente] PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_AnimalID]    Script Date: 29-Jul-18 3:24:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_AnimalID] ON [dbo].[Adocao]
(
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ClienteID]    Script Date: 29-Jul-18 3:24:01 PM ******/
CREATE NONCLUSTERED INDEX [IX_ClienteID] ON [dbo].[Adocao]
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adocao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Adocao_dbo.Animal_AnimalID] FOREIGN KEY([AnimalID])
REFERENCES [dbo].[Animal] ([AnimalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Adocao] CHECK CONSTRAINT [FK_dbo.Adocao_dbo.Animal_AnimalID]
GO
ALTER TABLE [dbo].[Adocao]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Adocao_dbo.Cliente_ClienteID] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Cliente] ([ClienteID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Adocao] CHECK CONSTRAINT [FK_dbo.Adocao_dbo.Cliente_ClienteID]
GO
USE [master]
GO
ALTER DATABASE [oneup] SET  READ_WRITE 
GO
