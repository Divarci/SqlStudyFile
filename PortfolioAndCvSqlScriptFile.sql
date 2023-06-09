USE [master]
GO
/****** Object:  Database [PortfolioAndCv]    Script Date: 07/05/2023 16:36:09 ******/
CREATE DATABASE [PortfolioAndCv]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PortfolioAndCv_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLDB\MSSQL\DATA\PortfolioAndCv.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PortfolioAndCv_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLDB\MSSQL\DATA\PortfolioAndCv.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PortfolioAndCv] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PortfolioAndCv].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PortfolioAndCv] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET ARITHABORT OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PortfolioAndCv] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PortfolioAndCv] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PortfolioAndCv] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [PortfolioAndCv] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PortfolioAndCv] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [PortfolioAndCv] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET RECOVERY FULL 
GO
ALTER DATABASE [PortfolioAndCv] SET  MULTI_USER 
GO
ALTER DATABASE [PortfolioAndCv] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PortfolioAndCv] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PortfolioAndCv] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PortfolioAndCv] SET TARGET_RECOVERY_TIME = 120 SECONDS 
GO
ALTER DATABASE [PortfolioAndCv] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PortfolioAndCv] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PortfolioAndCv', N'ON'
GO
ALTER DATABASE [PortfolioAndCv] SET QUERY_STORE = ON
GO
ALTER DATABASE [PortfolioAndCv] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PortfolioAndCv]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
USE [PortfolioAndCv]
GO
/****** Object:  Table [dbo].[TBLABOUT]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLABOUT](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[NAMESURNAME] [varchar](100) NULL,
	[DESCRIPTION] [varchar](max) NULL,
	[TITLE] [varchar](100) NULL,
	[SUBTITLE] [varchar](100) NULL,
	[ADDRESS] [varchar](300) NULL,
	[MOBILE] [varchar](30) NULL,
	[RELOCATION] [bit] NULL,
	[AGE] [varchar](3) NULL,
	[DEGREE] [varchar](30) NULL,
	[EMAIL] [varchar](100) NULL,
	[SUBDESCRIPTION] [varchar](max) NULL,
	[PICURL] [varchar](max) NULL,
 CONSTRAINT [PK_TBLABOUT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLADMIN]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLADMIN](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[USERNAME] [varchar](12) NULL,
	[PASSWORD] [varchar](12) NULL,
 CONSTRAINT [PK_TBLADMIN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLCATEGORY]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLCATEGORY](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[CATEGORY] [varchar](50) NULL,
	[TITLE] [varchar](500) NULL,
 CONSTRAINT [PK_TBLCATEGORY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLCERTIFICATE]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLCERTIFICATE](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[TITLE] [varchar](50) NULL,
	[DATE] [varchar](30) NULL,
	[LOCATION] [varchar](30) NULL,
	[DESCRIPTION] [varchar](100) NULL,
 CONSTRAINT [PK_TBLCERTIFICATE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLCONTACT]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLCONTACT](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[DESCRIPTION] [varchar](500) NULL,
	[MAPCOOR] [varchar](max) NULL,
	[ABOUTID] [tinyint] NULL,
 CONSTRAINT [PK_TBLCONTACT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLEDUCATION]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLEDUCATION](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[TITLE] [varchar](100) NULL,
	[DATE] [varchar](30) NULL,
	[SCHOOL] [varchar](100) NULL,
	[DESCRIPTION] [varchar](100) NULL,
 CONSTRAINT [PK_TBLEDUCATION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLEXPERIENCE]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLEXPERIENCE](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[TITLE] [varchar](50) NULL,
	[DATE] [varchar](30) NULL,
	[LOCATION] [varchar](30) NULL,
	[DESCRIPTION1] [varchar](200) NULL,
	[DESCRIPTION2] [varchar](200) NULL,
	[DESCRIPTION3] [varchar](200) NULL,
	[DESCRIPTION4] [varchar](200) NULL,
 CONSTRAINT [PK_TBLEXPERIENCE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLFACT]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLFACT](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[TITLE] [varchar](50) NULL,
	[VALUE] [int] NULL,
 CONSTRAINT [PK_TBLFACT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLFACTDESCRIPTION]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLFACTDESCRIPTION](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[DESCRIPTION] [varchar](max) NULL,
 CONSTRAINT [PK_TBLFACTDESCRIPTION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLMESSAGE]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLMESSAGE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NULL,
	[EMAIL] [varchar](50) NULL,
	[SUBJECT] [varchar](200) NULL,
	[MESSAGE] [varchar](max) NULL,
 CONSTRAINT [PK_TBLMESSAGE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLPORTFOLIO]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLPORTFOLIO](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[DESCRIPTION] [varchar](max) NULL,
 CONSTRAINT [PK_TBLPORTFOLIO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLRESUME]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLRESUME](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[DESCRIPTION] [varchar](max) NULL,
 CONSTRAINT [PK_TBLRESUME] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLSKILL]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLSKILL](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[TITLE] [varchar](50) NULL,
	[VALUE] [tinyint] NULL,
	[LEFTORRIGHT] [bit] NULL,
 CONSTRAINT [PK_TBLSKILL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLSOCIALMEDIA]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLSOCIALMEDIA](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[TITLE] [varchar](100) NULL,
	[URL] [varchar](500) NULL,
	[ACLASS] [varchar](50) NULL,
	[ICLASS] [varchar](50) NULL,
 CONSTRAINT [PK_TBLSOCIALMEDIA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLSTUDY]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLSTUDY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [varchar](50) NULL,
	[DESCRIPTION] [varchar](max) NULL,
	[PICTURL] [varchar](max) NULL,
	[CATEGORY] [tinyint] NULL,
 CONSTRAINT [PK_TBLSTUDY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBLSTUDYPIC]    Script Date: 07/05/2023 16:36:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBLSTUDYPIC](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[PICURL] [varchar](max) NULL,
	[TITLE] [varchar](100) NULL,
	[STUDYID] [int] NULL,
 CONSTRAINT [PK_TBLSTUDYPIC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBLCONTACT]  WITH CHECK ADD  CONSTRAINT [FK_TBLCONTACT_TBLABOUT] FOREIGN KEY([ABOUTID])
REFERENCES [dbo].[TBLABOUT] ([ID])
GO
ALTER TABLE [dbo].[TBLCONTACT] CHECK CONSTRAINT [FK_TBLCONTACT_TBLABOUT]
GO
ALTER TABLE [dbo].[TBLSTUDY]  WITH CHECK ADD  CONSTRAINT [FK_TBLSTUDY_TBLCATEGORY] FOREIGN KEY([CATEGORY])
REFERENCES [dbo].[TBLCATEGORY] ([ID])
GO
ALTER TABLE [dbo].[TBLSTUDY] CHECK CONSTRAINT [FK_TBLSTUDY_TBLCATEGORY]
GO
ALTER TABLE [dbo].[TBLSTUDYPIC]  WITH CHECK ADD  CONSTRAINT [FK_TBLSTUDYPIC_TBLSTUDY] FOREIGN KEY([STUDYID])
REFERENCES [dbo].[TBLSTUDY] ([ID])
GO
ALTER TABLE [dbo].[TBLSTUDYPIC] CHECK CONSTRAINT [FK_TBLSTUDYPIC_TBLSTUDY]
GO
USE [master]
GO
ALTER DATABASE [PortfolioAndCv] SET  READ_WRITE 
GO
