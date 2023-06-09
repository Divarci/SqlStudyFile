USE [master]
GO
/****** Object:  Database [AccountChase]    Script Date: 07/05/2023 16:34:16 ******/
CREATE DATABASE [AccountChase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AccountChase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLDB\MSSQL\DATA\AccountChase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AccountChase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLDB\MSSQL\DATA\AccountChase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AccountChase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AccountChase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AccountChase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AccountChase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AccountChase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AccountChase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AccountChase] SET ARITHABORT OFF 
GO
ALTER DATABASE [AccountChase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AccountChase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AccountChase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AccountChase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AccountChase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AccountChase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AccountChase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AccountChase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AccountChase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AccountChase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AccountChase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AccountChase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AccountChase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AccountChase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AccountChase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AccountChase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AccountChase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AccountChase] SET RECOVERY FULL 
GO
ALTER DATABASE [AccountChase] SET  MULTI_USER 
GO
ALTER DATABASE [AccountChase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AccountChase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AccountChase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AccountChase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AccountChase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AccountChase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AccountChase', N'ON'
GO
ALTER DATABASE [AccountChase] SET QUERY_STORE = ON
GO
ALTER DATABASE [AccountChase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AccountChase]
GO
/****** Object:  Table [dbo].[Tbl_Account]    Script Date: 07/05/2023 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [varchar](15) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Tbl_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Database]    Script Date: 07/05/2023 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Database](
	[DataId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[AccountId] [int] NULL,
	[Date] [char](10) NULL,
	[Company] [varchar](25) NULL,
	[Description] [varchar](125) NULL,
	[Exp/Inc] [bit] NULL,
	[Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Tbl_Database] PRIMARY KEY CLUSTERED 
(
	[DataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Messages]    Script Date: 07/05/2023 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Messages](
	[msId] [int] NULL,
	[msFrom] [varchar](25) NULL,
	[Subject] [varchar](80) NULL,
	[Description] [varchar](500) NULL,
	[Date] [varchar](10) NULL,
	[Hour] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Users]    Script Date: 07/05/2023 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](15) NULL,
	[Password] [char](15) NULL,
	[Name] [varchar](15) NULL,
	[Surname] [varchar](15) NULL,
 CONSTRAINT [PK_Tbl_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_Database]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Database_Tbl_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Tbl_Account] ([AccountId])
GO
ALTER TABLE [dbo].[Tbl_Database] CHECK CONSTRAINT [FK_Tbl_Database_Tbl_Account]
GO
ALTER TABLE [dbo].[Tbl_Database]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Database_Tbl_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Tbl_Users] ([UserId])
GO
ALTER TABLE [dbo].[Tbl_Database] CHECK CONSTRAINT [FK_Tbl_Database_Tbl_Users]
GO
/****** Object:  StoredProcedure [dbo].[NewSelectCommand]    Script Date: 07/05/2023 16:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewSelectCommand]
AS
	SET NOCOUNT ON;
SELECT Tbl_Users.Username, Tbl_Account.AccountId, Tbl_Database.Date, Tbl_Database.Company, Tbl_Database.Description, Tbl_Database.Amount
FROM     Tbl_Account INNER JOIN
                  Tbl_Database ON Tbl_Account.AccountId = Tbl_Database.AccountId INNER JOIN
                  Tbl_Users ON Tbl_Account.UserId = Tbl_Users.UserId AND Tbl_Database.UserId = Tbl_Users.UserId
GO
USE [master]
GO
ALTER DATABASE [AccountChase] SET  READ_WRITE 
GO
