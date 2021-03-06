USE [master]
GO
/****** Object:  Database [DB_A6CAAC_thuan99]    Script Date: 12/26/2020 4:28:11 PM ******/
CREATE DATABASE [DB_A6CAAC_thuan99]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_A6CAAC_thuan99_Data', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_A6CAAC_thuan99_DATA.mdf' , SIZE = 8192KB , MAXSIZE = 1024000KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'DB_A6CAAC_thuan99_Log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_A6CAAC_thuan99_Log.LDF' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_A6CAAC_thuan99].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET  MULTI_USER 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET QUERY_STORE = OFF
GO
USE [DB_A6CAAC_thuan99]
GO
/****** Object:  Table [dbo].[account]    Script Date: 12/26/2020 4:28:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](10) NULL,
	[fullname] [nvarchar](50) NULL,
	[birthday] [date] NULL,
	[email] [nvarchar](50) NULL,
	[id_permission] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 12/26/2020 4:28:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customerName] [nvarchar](20) NULL,
	[phone] [nvarchar](20) NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_detail]    Script Date: 12/26/2020 4:28:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[id_product] [int] NULL,
	[id_cart] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 12/26/2020 4:28:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission]    Script Date: 12/26/2020 4:28:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 12/26/2020 4:28:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[price] [float] NULL,
	[path] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[id_category] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[account] ([username], [password], [fullname], [birthday], [email], [id_permission]) VALUES (N'admin', N'123', N'Qu?n tr? viên', CAST(N'2000-01-01' AS Date), N'leewonkya111@gmail.com', 1)
INSERT [dbo].[account] ([username], [password], [fullname], [birthday], [email], [id_permission]) VALUES (N'nhanvien1', N'123', N'Trúc lan', CAST(N'2000-01-01' AS Date), N'leewonkya111@gmail.com', 2)
INSERT [dbo].[account] ([username], [password], [fullname], [birthday], [email], [id_permission]) VALUES (N'nhanvien2', N'123', N'Phu?c Thu?n', CAST(N'2000-01-01' AS Date), N'leewonkya111@gmail.com', 2)
GO
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([id], [customerName], [phone], [email], [address], [status]) VALUES (4, N'Trúc Lan', N'0362123123', N'leewonkya111@gmail.com', N'can tho street', 1)
INSERT [dbo].[cart] ([id], [customerName], [phone], [email], [address], [status]) VALUES (5, N'Trúc Lan', N'0362123123', N'leewonkya111@gmail.com', N'can tho street', 1)
INSERT [dbo].[cart] ([id], [customerName], [phone], [email], [address], [status]) VALUES (6, N'Hihi', N'123312', N'leewonkya111@gmail.com', N'hihihihi', 0)
INSERT [dbo].[cart] ([id], [customerName], [phone], [email], [address], [status]) VALUES (7, N'hihi', N'123321123', N'leewonkya111@gmail.com', N'test cái nữa', 0)
INSERT [dbo].[cart] ([id], [customerName], [phone], [email], [address], [status]) VALUES (8, N'Hihi', N'123123', N'leewonkya111@gmail.com', N'123123', 0)
INSERT [dbo].[cart] ([id], [customerName], [phone], [email], [address], [status]) VALUES (9, N'tet', N'123213', N'leewonkya111@gmail.com', N'213123', 1)
INSERT [dbo].[cart] ([id], [customerName], [phone], [email], [address], [status]) VALUES (10, N'Key', N'+13402346523', N'leewonkya111@gmail.com', N'can tho street', 0)
INSERT [dbo].[cart] ([id], [customerName], [phone], [email], [address], [status]) VALUES (11, N'Key', N'+13402346523', N'bupmap@mamailer.org', N'can tho street', 0)
INSERT [dbo].[cart] ([id], [customerName], [phone], [email], [address], [status]) VALUES (12, N'Key', N'+13402346523', N'pisego8219@bcpfm.com', N'can tho street', 1)
INSERT [dbo].[cart] ([id], [customerName], [phone], [email], [address], [status]) VALUES (13, N'Thuận', N'0924399736', N'dophuocthuan2799@gmail.com', N'Trường Đại học Đồng Tháp', 0)
INSERT [dbo].[cart] ([id], [customerName], [phone], [email], [address], [status]) VALUES (14, N'lan', N'0924399736', N'dfgvgsgadbda@gmail.com', N'cao lanh', 1)
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
SET IDENTITY_INSERT [dbo].[cart_detail] ON 

INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (1, 1, 11, NULL)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (2, 1, 12, NULL)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (3, 1, 11, 4)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (4, 1, 12, 5)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (5, 1, 11, 5)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (6, 1, 11, 6)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (7, 5, 9, 7)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (8, 3, 10, 7)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (9, 2, 11, 8)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (10, 2, 10, 9)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (11, 5, 4, 9)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (12, 1, 15, 10)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (13, 5, 11, 11)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (14, 5, 9, 12)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (15, 2, 19, 13)
INSERT [dbo].[cart_detail] ([id], [quantity], [id_product], [id_cart]) VALUES (16, 2, 5, 14)
SET IDENTITY_INSERT [dbo].[cart_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (1, N'Chanell')
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'Gucci')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'Hermes')
INSERT [dbo].[category] ([id], [name]) VALUES (4, N'Louis Vuitton')
INSERT [dbo].[category] ([id], [name]) VALUES (5, N'Fendi')
INSERT [dbo].[category] ([id], [name]) VALUES (6, N'Burberry')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[permission] ON 

INSERT [dbo].[permission] ([id], [name]) VALUES (1, N'admin')
INSERT [dbo].[permission] ([id], [name]) VALUES (2, N'nhân viên')
SET IDENTITY_INSERT [dbo].[permission] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (1, N'Chanel dây rút', 129550000, N'chanel-day-rut.jpg', N'<p>Da cừu &amp; mạ kim loại</p>
<p>Vàng Beige</p>
<p>Kích thước: 19 x 17 x 17 cm(inches)</p>
<p> </p>', 1, 11)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (2, N'Chanel Vanity', 138190000, N'Chanel Vanity.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Lambskin, Crystal, Calfskin &amp; Gold-Tone Metal </span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Tím</span></p>
<div id="variant-materials-available-label" role="heading" aria-level="2" data-name="Các kích thước" data-variant-type="các kích thước" data-test="lblMaterial_Eyeware">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="5.9 × 5.9 × 4.7 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="15 × 15 × 12 cm" data-in-metric="cm" data-in-switch="inches">15 × 15 × 12 cm</span> ( inches)</div>', 1, 10)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (3, N'Chanel Pinkie', 95000000, N'Chanel-hong.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Grained Lambskin, Smooth Lambskin &amp; Gold-Tone Metal</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Hồng</span></p>
<div id="variant-materials-available-label" role="heading" aria-level="2" data-name="Các kích thước" data-variant-type="các kích thước" data-test="lblMaterial_Eyeware">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="8.2 × 7 × 4.7 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="21 × 18 × 12 cm" data-in-metric="cm" data-in-switch="inches">21 × 18 × 12 cm</span> (inches)</div>', 1, 10)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (4, N'Chanel nắp gập', 90000000, N'Chanel-nap-gap.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Da bê hiệu ứng hạt &amp; Kim loại phủ sơn </span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Trắng &amp; Đen</span></p>
<div class="product-details__option product-details__option--dimensions">
<div id="variant-materials-available-label" role="heading" aria-level="2" data-name="Các kích thước" data-variant-type="các kích thước" data-test="lblMaterial_Eyeware">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="4.9 × 7.8 × 2.3 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="12.5 × 20 × 6 cm" data-in-metric="cm" data-in-switch="inches">12.5 × 20 × 6 cm</span> (inches)</div>
</div>
<p class="product-details__more-variants"> </p>', 1, 5)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (5, N'Gucci Hobo đỏ', 97000000, N'Gucci-hobo-do.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Vải Canvas từ cotton, Da bê &amp; Kim loại mạ vàng </span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Màu san hô</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">K</span>ích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="17.6 × 13.3 × 7.8 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="45 × 34 × 20 cm" data-in-metric="cm" data-in-switch="inches">45 × 34 × 20 cm</span> (inches)</p>
<p> </p>', 2, 8)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (6, N'Gucci Classic', 17400000, N'gucci-classic.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Da cừu &amp; Kim loại mạ vàng</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Xanh da trời</span></p>
<div id="variant-materials-available-label" role="heading" aria-level="2" data-name="Các kích thước" data-variant-type="các kích thước" data-test="lblMaterial_Eyeware">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="6 × 9.9 × 2.5 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="15.5 × 25.5 × 6.5 cm" data-in-metric="cm" data-in-switch="inches">15.5 × 25.5 × 6.5 cm(inches)</span></div>', 2, 10)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (7, N'Gucci Sequin', 18000000, N'Gucci-Sequin.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Sequin, Ngọc trai thủy tinh, Da cừu &amp; Kim loại mạ vàng</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Purple &amp; Gold</span></p>
<div id="variant-materials-available-label" role="heading" aria-level="2" data-name="Các kích thước" data-variant-type="các kích thước" data-test="lblMaterial_Eyeware">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="6 × 9.9 × 2.5 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="15.5 × 25.5 × 6.5 cm" data-in-metric="cm" data-in-switch="inches">15.5 × 25.5 × 6.5 cm</span> (inches)</div>', 2, 10)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (8, N'Gucci Hobo Tweed', 97000000, N'Gucci-hobo-tweed.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Vải Tweed, Da bê &amp; Kim loại mạ vàng</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Vàng</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="17.6 × 13.3 × 7.8 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="45 × 34 × 20 cm" data-in-metric="cm" data-in-switch="inches">45 × 34 × 20 cm</span> (inches)</span></p>', 2, 10)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (9, N'Hermes Calfskin', 88000000, N'Hermes-Calfskin.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Calfskin, Crochet, Gold-Tone, Silver-Tone &amp; Ruthenium-Finish Metal</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Trắng &amp; Đen</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="6.2 × 10.1 × 3.5 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="16 × 26 × 9 cm" data-in-metric="cm" data-in-switch="inches">16 × 26 × 9 cm(inches)</span></span></p>', 3, 0)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (10, N'Hermes Hobo Hoa', 14000000, N'hermes-hobo-hoa.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Vải Canvas từ cotton, Da bê &amp; Kim loại mạ vàng</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Trắng, Đen &amp; Hồng</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: 40 × 32 × 19 cm(inches)</span></p>', 3, 5)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (11, N'Hermes Canvas Navy', 18500000, N'hermes-canvas-xanh.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Vải Canvas từ cotton, Da bê, Kim loại mạ vàng, bạc &amp; ruthenium</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Xanh navy</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="6.2 × 10.1 × 3.5 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="16 × 26 × 9 cm" data-in-metric="cm" data-in-switch="inches">16 × 26 × 9 cm</span> (inches)</span></p>', 3, 0)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (12, N'Hermes Classic ', 20000000, N'classic-xanhladen.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Sequin &amp; Kim loại mạ vàng</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Xanh lá &amp; Đen</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="6 × 9.9 × 2.5 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="15.5 × 25.5 × 6.5 cm" data-in-metric="cm" data-in-switch="inches">15.5 × 25.5 × 6.5 cm</span> (inches)</span></p>', 3, 5)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (15, N'LV Shopping black', 12000000, N'shopping-den.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Da bê hiệu ứng hạt &amp; Kim loại phủ sơn</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Đen</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="9.9 × 14.4 × 4.5 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="25.5 × 37 × 11.5 cm" data-in-metric="cm" data-in-switch="inches">25.5 × 37 × 11.5 cm(inches)</span></span></p>', 4, 0)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (16, N'LV San hô', 80000000, N'lv-sh.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Sợi tổng hợp &amp; Kim loại mạ bạc</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Màu san hô</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="8.6 × 12.9 × 4.3 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="22 × 33 × 11 cm" data-in-metric="cm" data-in-switch="inches">22 × 33 × 11 cm</span> (inches)</span></p>', 4, 10)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (17, N'LV Xanh lá', 50000000, N'LV-xanhla.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Sợi tổng hợp &amp; Kim loại mạ bạc</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Xanh lá</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="7.2 × 9 × 4.1 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="18.5 × 23 × 10.5 cm" data-in-metric="cm" data-in-switch="inches">18.5 × 23 × 10.5 cm</span> (inches)</span></p>', 4, 10)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (18, N'LV Dabe', 40000000, N'lv-dabe.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Da bê hiệu ứng hạt &amp; Kim loại phủ sơn</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Màu san hô</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="6.4 × 9.4 × 2.7 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="16.5 × 24 × 7 cm" data-in-metric="cm" data-in-switch="inches">16.5 × 24 × 7 cm</span> (inches)</span></p>', 4, 20)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (19, N'Fendi Ruthenium', 30000000, N'Fendi-xanhla.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Da cừu, Kim loại mạ vàng, bạc &amp; ruthenium</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Xanh lá</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="7.8 × 11.7 × 3.9 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="20 × 30 × 10 cm" data-in-metric="cm" data-in-switch="inches">20 × 30 × 10 cm</span> (inches)</span></p>', 5, 13)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (20, N'Fendi Shopping', 90000000, N'Fendi-shopping.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Sợi tổng hợp &amp; Kim loại mạ bạc</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Màu san hô</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="11.9 × 16.4 × 4.7 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="30.5 × 42 × 12 cm" data-in-metric="cm" data-in-switch="inches">30.5 × 42 × 12 cm</span> (inches)</span></p>', 5, 16)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (21, N'Fendi Shopping Blue', 40000000, N'Fendi-xanhduong.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Grained Lambskin, Smooth Lambskin &amp; Gold-Tone Metal</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Xanh dương</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="8.2 × 9 × 5.5 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="21 × 23 × 14 cm" data-in-metric="cm" data-in-switch="inches">21 × 23 × 14 cm</span> (inches)</span></p>', 5, 10)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (22, N'Fendi Ruthenium', 90000000, N'Fendi-ruthenium.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Vải Tweed, Kim loại mạ vàng, bạc &amp; ruthenium</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Đen</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="7.8 × 11.7 × 3.9 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="20 × 30 × 10 cm" data-in-metric="cm" data-in-switch="inches">20 × 30 × 10 cm</span> (inches)</span></p>', 5, 6)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (23, N'Burberry Bowling', 40000000, N'B-bowling.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Da bê và Kim loại mạ vàng</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Hồng</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="14.8 × 16.8 × 7 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="38 × 43 × 18 cm" data-in-metric="cm" data-in-switch="inches">38 × 43 × 18 cm</span> (inches)</span></p>', 6, 25)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (24, N'Burberry Violet', 97000000, N'B-purple.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Da cừu &amp; Kim loại mạ vàng</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Tím</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="4.3 × 7.4 × 2.5 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="11 × 19 × 6.5 cm" data-in-metric="cm" data-in-switch="inches">11 × 19 × 6.5 cm</span> (inches)</span></p>', 6, 18)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (25, N'Burberry Blue', 40000000, N'Fendi-XD.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Da cừu &amp; Kim loại mạ vàng</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Xanh dương</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="5.1 × 7.8 × 2.7 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="13 × 20 × 7 cm" data-in-metric="cm" data-in-switch="inches">13 × 20 × 7 cm</span> (inches)</span></p>', 6, 9)
INSERT [dbo].[product] ([id], [name], [price], [path], [description], [id_category], [quantity]) VALUES (26, N'Burberry White', 45000000, N'B-White.jpg', N'<p><span class="product-details__description" data-test="lblProductSubTitle">Da bê và Kim loại mạ vàng</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Trắng</span></p>
<p><span class="product-details__description product-details__color" data-test="lblProductSubTitle">Kích thước: <span class="js-dimension" data-test="lblDimension" data-cm-aria="chuyển số đo sang centimet" data-cm-value="11.7 × 11.3 × 2.9 in" data-cm-metric="in" data-cm-switch="cm" data-in-aria="chuyển số đo sang inch" data-in-value="30 × 29 × 7.5 cm" data-in-metric="cm" data-in-switch="inches">30 × 29 × 7.5 cm</span> (inches)</span></p>', 6, 32)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD FOREIGN KEY([id_permission])
REFERENCES [dbo].[permission] ([id])
GO
ALTER TABLE [dbo].[cart_detail]  WITH CHECK ADD FOREIGN KEY([id_cart])
REFERENCES [dbo].[cart] ([id])
GO
ALTER TABLE [dbo].[cart_detail]  WITH CHECK ADD FOREIGN KEY([id_product])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([id_category])
REFERENCES [dbo].[category] ([id])
GO
USE [master]
GO
ALTER DATABASE [DB_A6CAAC_thuan99] SET  READ_WRITE 
GO
