USE [master]
GO
/****** Object:  Database [DBproject]    Script Date: 1/22/2024 8:40:59 PM ******/
CREATE DATABASE [DBproject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER2019\MSSQL\DATA\test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLSERVER2019\MSSQL\DATA\test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBproject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBproject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBproject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBproject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBproject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBproject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBproject] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBproject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBproject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBproject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBproject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBproject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBproject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBproject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBproject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBproject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBproject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBproject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBproject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBproject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBproject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBproject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBproject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBproject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBproject] SET RECOVERY FULL 
GO
ALTER DATABASE [DBproject] SET  MULTI_USER 
GO
ALTER DATABASE [DBproject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBproject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBproject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBproject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBproject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBproject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBproject', N'ON'
GO
ALTER DATABASE [DBproject] SET QUERY_STORE = OFF
GO
USE [DBproject]
GO
/****** Object:  Table [dbo].[TblBranch]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblBranch](
	[BranchID] [int] NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PostCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblBranch] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblCashier]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCashier](
	[CashierID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblCashier] PRIMARY KEY CLUSTERED 
(
	[CashierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblContract]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblContract](
	[ProductID] [int] NOT NULL,
	[PartnerCompaniesID] [int] NOT NULL,
	[ContractType] [nvarchar](50) NOT NULL,
	[ContractDate] [date] NOT NULL,
 CONSTRAINT [PK_TblContract] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[PartnerCompaniesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblCustomer]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCustomer](
	[CustomerID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PostCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tblcustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblExportation]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblExportation](
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[FactorID] [int] NOT NULL,
	[CashierID] [int] NOT NULL,
	[ExportationDate] [date] NOT NULL,
	[ExportationTime] [time](7) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblExportation] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[ProductID] ASC,
	[FactorID] ASC,
	[CashierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblFactor]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblFactor](
	[FactorID] [int] NOT NULL,
	[FactorDate] [date] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[PaymentState] [nvarchar](50) NOT NULL,
	[CustomerPhoneNumber] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[CustomerAddress] [nvarchar](50) NOT NULL,
	[ProductNumber] [int] NOT NULL,
 CONSTRAINT [PK_TblFactor] PRIMARY KEY CLUSTERED 
(
	[FactorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblInclude]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblInclude](
	[ProductID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
	[InquisitorID] [int] NOT NULL,
	[WelfareServicesID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductNumber] [int] NOT NULL,
	[BranchAddress] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblInclude] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[BranchID] ASC,
	[InquisitorID] ASC,
	[WelfareServicesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblInquisitor]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblInquisitor](
	[InquisitorID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[collaborateType] [nvarchar](50) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblInquisitor] PRIMARY KEY CLUSTERED 
(
	[InquisitorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMaintenance]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMaintenance](
	[WareHouseID] [int] NOT NULL,
	[WareHouseKeeperID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Duration] [time](7) NOT NULL,
	[Number] [int] NOT NULL,
	[WareHouseLocation] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblMaintenance] PRIMARY KEY CLUSTERED 
(
	[WareHouseID] ASC,
	[WareHouseKeeperID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPartnerCompanies]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPartnerCompanies](
	[PartnerCompaniesID] [int] NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[ProductOffered] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblPartnerCompanies] PRIMARY KEY CLUSTERED 
(
	[PartnerCompaniesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblProduct]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProduct](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[Weight] [int] NOT NULL,
 CONSTRAINT [PK_TblProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRepair]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRepair](
	[ProductID] [int] NOT NULL,
	[RepairUnitID] [int] NOT NULL,
	[RepairmentType] [nvarchar](50) NOT NULL,
	[Cost] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[Duration] [time](7) NOT NULL,
 CONSTRAINT [PK_TblRepairment] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[RepairUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRepairUnit]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRepairUnit](
	[RepairUnitID] [int] NOT NULL,
	[RepairType] [nvarchar](50) NOT NULL,
	[Cost] [int] NOT NULL,
	[Description] [text] NOT NULL,
 CONSTRAINT [PK_TblRepairUnit] PRIMARY KEY CLUSTERED 
(
	[RepairUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblSale]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblSale](
	[ProductID] [int] NOT NULL,
	[InquisitorID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[InquisitiorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblSale] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[InquisitorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblTransport]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblTransport](
	[productID] [int] NOT NULL,
	[VehicleID] [int] NOT NULL,
	[Destination] [nvarchar](50) NOT NULL,
	[weight] [int] NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_TblTransport] PRIMARY KEY CLUSTERED 
(
	[productID] ASC,
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblVehicle]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblVehicle](
	[VehicleID] [int] NOT NULL,
	[VehicleType] [nvarchar](50) NOT NULL,
	[Destination] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblVehicle] PRIMARY KEY CLUSTERED 
(
	[VehicleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblWareHouse]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblWareHouse](
	[WareHouseID] [int] NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
 CONSTRAINT [PK_TblWareHouse] PRIMARY KEY CLUSTERED 
(
	[WareHouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblWareHouseKeeper]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblWareHouseKeeper](
	[WareHouseKeeperID] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
 CONSTRAINT [PK_TblWareHouseKeeper] PRIMARY KEY CLUSTERED 
(
	[WareHouseKeeperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblWelfareServices]    Script Date: 1/22/2024 8:41:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblWelfareServices](
	[WelfareServicesID] [int] NOT NULL,
	[ServiceType] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_TblWelfareServices] PRIMARY KEY CLUSTERED 
(
	[WelfareServicesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TblContract]  WITH CHECK ADD  CONSTRAINT [FK_TblContract_TblPartnerCompanies] FOREIGN KEY([PartnerCompaniesID])
REFERENCES [dbo].[TblPartnerCompanies] ([PartnerCompaniesID])
GO
ALTER TABLE [dbo].[TblContract] CHECK CONSTRAINT [FK_TblContract_TblPartnerCompanies]
GO
ALTER TABLE [dbo].[TblContract]  WITH CHECK ADD  CONSTRAINT [FK_TblContract_TblProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[TblProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TblContract] CHECK CONSTRAINT [FK_TblContract_TblProduct]
GO
ALTER TABLE [dbo].[TblExportation]  WITH CHECK ADD  CONSTRAINT [FK_TblExportation_TblCashier] FOREIGN KEY([CashierID])
REFERENCES [dbo].[TblCashier] ([CashierID])
GO
ALTER TABLE [dbo].[TblExportation] CHECK CONSTRAINT [FK_TblExportation_TblCashier]
GO
ALTER TABLE [dbo].[TblExportation]  WITH CHECK ADD  CONSTRAINT [FK_TblExportation_Tblcustomer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[TblCustomer] ([CustomerID])
GO
ALTER TABLE [dbo].[TblExportation] CHECK CONSTRAINT [FK_TblExportation_Tblcustomer]
GO
ALTER TABLE [dbo].[TblExportation]  WITH CHECK ADD  CONSTRAINT [FK_TblExportation_TblFactor] FOREIGN KEY([FactorID])
REFERENCES [dbo].[TblFactor] ([FactorID])
GO
ALTER TABLE [dbo].[TblExportation] CHECK CONSTRAINT [FK_TblExportation_TblFactor]
GO
ALTER TABLE [dbo].[TblExportation]  WITH CHECK ADD  CONSTRAINT [FK_TblExportation_TblProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[TblProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TblExportation] CHECK CONSTRAINT [FK_TblExportation_TblProduct]
GO
ALTER TABLE [dbo].[TblInclude]  WITH CHECK ADD  CONSTRAINT [FK_TblInclude_TblBranch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[TblBranch] ([BranchID])
GO
ALTER TABLE [dbo].[TblInclude] CHECK CONSTRAINT [FK_TblInclude_TblBranch]
GO
ALTER TABLE [dbo].[TblInclude]  WITH CHECK ADD  CONSTRAINT [FK_TblInclude_TblInquisitor] FOREIGN KEY([InquisitorID])
REFERENCES [dbo].[TblInquisitor] ([InquisitorID])
GO
ALTER TABLE [dbo].[TblInclude] CHECK CONSTRAINT [FK_TblInclude_TblInquisitor]
GO
ALTER TABLE [dbo].[TblInclude]  WITH CHECK ADD  CONSTRAINT [FK_TblInclude_TblProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[TblProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TblInclude] CHECK CONSTRAINT [FK_TblInclude_TblProduct]
GO
ALTER TABLE [dbo].[TblInclude]  WITH CHECK ADD  CONSTRAINT [FK_TblInclude_TblWelfareServices] FOREIGN KEY([WelfareServicesID])
REFERENCES [dbo].[TblWelfareServices] ([WelfareServicesID])
GO
ALTER TABLE [dbo].[TblInclude] CHECK CONSTRAINT [FK_TblInclude_TblWelfareServices]
GO
ALTER TABLE [dbo].[TblMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TblMaintenance_TblProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[TblProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TblMaintenance] CHECK CONSTRAINT [FK_TblMaintenance_TblProduct]
GO
ALTER TABLE [dbo].[TblMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TblMaintenance_TblWareHouse] FOREIGN KEY([WareHouseID])
REFERENCES [dbo].[TblWareHouse] ([WareHouseID])
GO
ALTER TABLE [dbo].[TblMaintenance] CHECK CONSTRAINT [FK_TblMaintenance_TblWareHouse]
GO
ALTER TABLE [dbo].[TblMaintenance]  WITH CHECK ADD  CONSTRAINT [FK_TblMaintenance_TblWareHouseKeeper] FOREIGN KEY([WareHouseKeeperID])
REFERENCES [dbo].[TblWareHouseKeeper] ([WareHouseKeeperID])
GO
ALTER TABLE [dbo].[TblMaintenance] CHECK CONSTRAINT [FK_TblMaintenance_TblWareHouseKeeper]
GO
ALTER TABLE [dbo].[TblRepair]  WITH CHECK ADD  CONSTRAINT [FK_TblRepair_TblProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[TblProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TblRepair] CHECK CONSTRAINT [FK_TblRepair_TblProduct]
GO
ALTER TABLE [dbo].[TblRepair]  WITH CHECK ADD  CONSTRAINT [FK_TblRepair_TblRepairUnit] FOREIGN KEY([RepairUnitID])
REFERENCES [dbo].[TblRepairUnit] ([RepairUnitID])
GO
ALTER TABLE [dbo].[TblRepair] CHECK CONSTRAINT [FK_TblRepair_TblRepairUnit]
GO
ALTER TABLE [dbo].[TblSale]  WITH CHECK ADD  CONSTRAINT [FK_TblSale_TblInquisitor] FOREIGN KEY([InquisitorID])
REFERENCES [dbo].[TblInquisitor] ([InquisitorID])
GO
ALTER TABLE [dbo].[TblSale] CHECK CONSTRAINT [FK_TblSale_TblInquisitor]
GO
ALTER TABLE [dbo].[TblSale]  WITH CHECK ADD  CONSTRAINT [FK_TblSale_TblProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[TblProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TblSale] CHECK CONSTRAINT [FK_TblSale_TblProduct]
GO
ALTER TABLE [dbo].[TblTransport]  WITH CHECK ADD  CONSTRAINT [FK_TblTransport_TblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[TblProduct] ([ProductID])
GO
ALTER TABLE [dbo].[TblTransport] CHECK CONSTRAINT [FK_TblTransport_TblProduct]
GO
ALTER TABLE [dbo].[TblTransport]  WITH CHECK ADD  CONSTRAINT [FK_TblTransport_TblVehicle] FOREIGN KEY([VehicleID])
REFERENCES [dbo].[TblVehicle] ([VehicleID])
GO
ALTER TABLE [dbo].[TblTransport] CHECK CONSTRAINT [FK_TblTransport_TblVehicle]
GO
USE [master]
GO
ALTER DATABASE [DBproject] SET  READ_WRITE 
GO
