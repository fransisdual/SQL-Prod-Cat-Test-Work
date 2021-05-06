USE [master]
GO
CREATE DATABASE [ProductsBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductsBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProductsBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductsBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ProductsBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProductsBD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductsBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductsBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductsBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductsBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductsBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductsBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductsBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductsBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductsBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductsBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductsBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductsBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductsBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductsBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductsBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductsBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductsBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductsBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductsBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductsBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductsBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductsBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductsBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductsBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductsBD] SET  MULTI_USER 
GO
ALTER DATABASE [ProductsBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductsBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductsBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductsBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductsBD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProductsBD', N'ON'
GO
ALTER DATABASE [ProductsBD] SET QUERY_STORE = OFF
GO
USE [ProductsBD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matching_products](
	[category_id] [int] NULL,
	[product_id] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProdCatView]
AS
SELECT        ISNULL(dbo.categories.name + ' - ', '') + ISNULL(dbo.products.name, '') AS Result
FROM            dbo.matching_products LEFT OUTER JOIN
                         dbo.categories ON dbo.matching_products.category_id = dbo.categories.id LEFT OUTER JOIN
                         dbo.products ON dbo.matching_products.product_id = dbo.products.id
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'Автомобили')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (2, N'Еда')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (3, N'Электроника')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (4, N'Алкоголь')
GO
INSERT [dbo].[matching_products] ([category_id], [product_id]) VALUES (1, 1)
GO
INSERT [dbo].[matching_products] ([category_id], [product_id]) VALUES (2, 1)
GO
INSERT [dbo].[matching_products] ([category_id], [product_id]) VALUES (1, 2)
GO
INSERT [dbo].[matching_products] ([category_id], [product_id]) VALUES (3, 3)
GO
INSERT [dbo].[matching_products] ([category_id], [product_id]) VALUES (2, 4)
GO
INSERT [dbo].[matching_products] ([category_id], [product_id]) VALUES (4, 5)
GO
INSERT [dbo].[matching_products] ([category_id], [product_id]) VALUES (NULL, 6)
GO
INSERT [dbo].[products] ([id], [name]) VALUES (1, N'Шоколадный автомобиль')
GO
INSERT [dbo].[products] ([id], [name]) VALUES (2, N'Tesla model X')
GO
INSERT [dbo].[products] ([id], [name]) VALUES (3, N'Iphone 11 Pro')
GO
INSERT [dbo].[products] ([id], [name]) VALUES (4, N'Молоко')
GO
INSERT [dbo].[products] ([id], [name]) VALUES (5, N'Мартини')
GO
INSERT [dbo].[products] ([id], [name]) VALUES (6, N'Земельный участок')
GO
USE [master]
GO
ALTER DATABASE [ProductsBD] SET  READ_WRITE 
GO
