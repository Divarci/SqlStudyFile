USE [master]
GO
/****** Object:  Database [StudentRegister]    Script Date: 07/05/2023 16:37:00 ******/
CREATE DATABASE [StudentRegister]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentRegister', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLDB\MSSQL\DATA\StudentRegister.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentRegister_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLDB\MSSQL\DATA\StudentRegister_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StudentRegister] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentRegister].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentRegister] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentRegister] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentRegister] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentRegister] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentRegister] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentRegister] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentRegister] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentRegister] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentRegister] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentRegister] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentRegister] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentRegister] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentRegister] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentRegister] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentRegister] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentRegister] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentRegister] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentRegister] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentRegister] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentRegister] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentRegister] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentRegister] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentRegister] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentRegister] SET  MULTI_USER 
GO
ALTER DATABASE [StudentRegister] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentRegister] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentRegister] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentRegister] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentRegister] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentRegister] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentRegister', N'ON'
GO
ALTER DATABASE [StudentRegister] SET QUERY_STORE = ON
GO
ALTER DATABASE [StudentRegister] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StudentRegister]
GO
/****** Object:  Table [dbo].[Tbl_Exams]    Script Date: 07/05/2023 16:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Exams](
	[resid] [int] IDENTITY(1,1) NOT NULL,
	[resstid] [int] NULL,
	[restcid] [int] NULL,
	[resexone] [int] NULL,
	[resextwo] [int] NULL,
	[resexthree] [int] NULL,
	[resexavg] [int] NULL,
	[resstatus] [varchar](6) NULL,
 CONSTRAINT [PK_Tbl_Exams] PRIMARY KEY CLUSTERED 
(
	[resid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Messages]    Script Date: 07/05/2023 16:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Messages](
	[msgid] [int] IDENTITY(1,1) NOT NULL,
	[msgfromid] [int] NULL,
	[msgfromfullname] [varchar](30) NULL,
	[msgtoid] [int] NULL,
	[msgtofullname] [varchar](30) NULL,
	[subject] [varchar](50) NULL,
	[description] [varchar](500) NULL,
 CONSTRAINT [PK_Tbl_Messages] PRIMARY KEY CLUSTERED 
(
	[msgid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_RegisterRequest]    Script Date: 07/05/2023 16:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_RegisterRequest](
	[reqid] [int] IDENTITY(1,1) NOT NULL,
	[reqfrom] [varchar](11) NULL,
	[requsername] [varchar](12) NULL,
	[reqpass] [varchar](24) NULL,
	[reqname] [varchar](20) NULL,
	[reqsurname] [varchar](20) NULL,
	[reqclassbrans] [varchar](20) NULL,
	[reqemail] [varchar](40) NULL,
	[reqmobile] [varchar](16) NULL,
 CONSTRAINT [PK_Tbl_RegisterRequest] PRIMARY KEY CLUSTERED 
(
	[reqid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Secretaries]    Script Date: 07/05/2023 16:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Secretaries](
	[admid] [int] IDENTITY(1,1) NOT NULL,
	[admusername] [varchar](12) NULL,
	[admpass] [varchar](12) NULL,
	[admname] [varchar](20) NULL,
	[admsurname] [varchar](20) NULL,
	[admemail] [varchar](20) NULL,
	[admmobileno] [varchar](16) NULL,
 CONSTRAINT [PK_Tbl_Secretaries] PRIMARY KEY CLUSTERED 
(
	[admid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Students]    Script Date: 07/05/2023 16:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Students](
	[stid] [int] IDENTITY(1,1) NOT NULL,
	[stusername] [varchar](12) NULL,
	[stpass] [varchar](24) NULL,
	[stname] [varchar](20) NULL,
	[stsurname] [varchar](20) NULL,
	[stclass] [varchar](5) NULL,
	[stemail] [varchar](40) NULL,
	[stmobileno] [varchar](16) NULL,
	[stortc] [varchar](11) NULL,
 CONSTRAINT [PK_Tbl_Students] PRIMARY KEY CLUSTERED 
(
	[stid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Teachers]    Script Date: 07/05/2023 16:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Teachers](
	[ntcid] [int] IDENTITY(1,1) NOT NULL,
	[tcusername] [varchar](12) NULL,
	[tcpass] [varchar](24) NULL,
	[tcname] [varchar](20) NULL,
	[tcsurname] [varchar](20) NULL,
	[tcbrans] [varchar](12) NULL,
	[tcemail] [varchar](40) NULL,
	[tcmobileno] [varchar](16) NULL,
	[tcorst] [varchar](11) NULL,
 CONSTRAINT [PK_Tcl_Teachers] PRIMARY KEY CLUSTERED 
(
	[ntcid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tbl_Exams]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Exams_Tbl_Students] FOREIGN KEY([resstid])
REFERENCES [dbo].[Tbl_Students] ([stid])
GO
ALTER TABLE [dbo].[Tbl_Exams] CHECK CONSTRAINT [FK_Tbl_Exams_Tbl_Students]
GO
ALTER TABLE [dbo].[Tbl_Exams]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Exams_Tcl_Teachers] FOREIGN KEY([restcid])
REFERENCES [dbo].[Tbl_Teachers] ([ntcid])
GO
ALTER TABLE [dbo].[Tbl_Exams] CHECK CONSTRAINT [FK_Tbl_Exams_Tcl_Teachers]
GO
/****** Object:  StoredProcedure [dbo].[ListRequest]    Script Date: 07/05/2023 16:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[ListRequest]
as
select reqid, requsername as 'USERNAME', reqpass as 'PASSWORD',reqname as 'NAME', reqsurname as 'SURNAME', reqfrom as'FROM', reqclassbrans as 'CLASSBRANS', reqemail as 'EMAIL', reqmobile as 'MOBILE'  from Tbl_RegisterRequest

GO
/****** Object:  StoredProcedure [dbo].[ListStatusStudent]    Script Date: 07/05/2023 16:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ListStatusStudent]
as
select (tcname+' '+tcsurname) as 'TEACHER', tcbrans as 'LESSONS', resexone as'EXAM 1', resextwo as'EXAM 2', resexthree as'EXAM 3', resexavg as'AVERAGE', resstatus as'STATUS' from Tbl_Exams 
inner join Tbl_Teachers
on Tbl_Exams.restcid=Tbl_Teachers.ntcid
inner join Tbl_Students
on Tbl_Exams.resstid=Tbl_Students.stid
GO
/****** Object:  StoredProcedure [dbo].[ListStudents]    Script Date: 07/05/2023 16:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ListStudents]
as
Select stid, stusername as 'USERNAME', stpass as 'PASSWORD',stname as 'NAME', stsurname 'SURNAME',stortc as 'ST/TC' ,stclass 'CLASS', stemail as'EMAIL', stmobileno as 'MOBILE' from Tbl_Students

GO
/****** Object:  StoredProcedure [dbo].[ListTeacherPanel]    Script Date: 07/05/2023 16:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[ListTeacherPanel]
as
select resid,(stname+' '+stsurname) as 'STUDENT NAME', (tcname+' '+tcsurname) as 'TEACHER NAME',tcbrans as 'LESSON', resexone as 'EXAM 1', resextwo as 'EXAM 2', resexthree as 'EXAM 3', resexavg as 'EXAM AVERAGE',resstatus as'STATUS' , restcid from Tbl_Exams 
inner join Tbl_Students
on Tbl_Exams.resstid = Tbl_Students.stid
inner join Tbl_Teachers
on Tbl_Exams.restcid = Tbl_Teachers.ntcid

GO
/****** Object:  StoredProcedure [dbo].[ListTeachers]    Script Date: 07/05/2023 16:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ListTeachers]
as
Select ntcid, tcusername as 'USERNAME', tcpass as 'PASSWORD',tcname as 'NAME', tcsurname 'SURNAME',tcorst as 'TC/ST' ,tcbrans 'BRANS', tcemail as'EMAIL', tcmobileno as 'MOBILE' from Tbl_Teachers

GO
USE [master]
GO
ALTER DATABASE [StudentRegister] SET  READ_WRITE 
GO
