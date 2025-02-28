USE [geny]
GO
/****** Object:  Table [dbo].[BiaoZhenBiaoData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BiaoZhenBiaoData](
	[ModelTypeId] [int] NULL,
	[TypeId] [int] NULL,
	[ListT] [int] NULL,
	[WhatTable] [int] NULL,
	[WhereGrid] [int] NULL,
	[ListSecondT] [int] NULL,
	[Fun] [int] NULL,
	[Connection] [int] NULL,
	[Data] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BiaoZhenBiaoData2]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BiaoZhenBiaoData2](
	[MeterHungId] [int] NULL,
	[ModelTypeId] [int] NULL,
	[TypeId] [int] NULL,
	[ListT] [int] NULL,
	[Connection] [int] NULL,
	[Data] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DataList]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataList](
	[DataName] [nvarchar](20) NULL,
	[Content] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbDtmpData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbDtmpData](
	[IndexID] [int] NULL,
	[Hidetest] [nvarchar](6) NULL,
	[Starttest] [nvarchar](6) NULL,
	[WalkTest] [nvarchar](6) NULL,
	[HideTest1] [nvarchar](6) NULL,
	[HideTest2] [nvarchar](6) NULL,
	[HideTest3] [nvarchar](6) NULL,
	[HideTest4] [nvarchar](6) NULL,
	[StartTest1] [nvarchar](8) NULL,
	[StartTest2] [nvarchar](8) NULL,
	[StartTest3] [nvarchar](8) NULL,
	[StartTest4] [nvarchar](8) NULL,
	[WalkTest1] [nvarchar](6) NULL,
	[WalkTest2] [nvarchar](6) NULL,
	[WalkTest3] [nvarchar](6) NULL,
	[WalkTest4] [nvarchar](6) NULL,
	[StartTime1] [nvarchar](10) NULL,
	[StartTime2] [nvarchar](10) NULL,
	[StartTime3] [nvarchar](10) NULL,
	[StartTime4] [nvarchar](10) NULL,
	[StartCurrent1] [nvarchar](8) NULL,
	[StartCurrent2] [nvarchar](8) NULL,
	[StartCurrent3] [nvarchar](8) NULL,
	[StartCurrent4] [nvarchar](8) NULL,
	[StartTimeT1] [nvarchar](10) NULL,
	[StartTimeT2] [nvarchar](10) NULL,
	[StartTimeT3] [nvarchar](10) NULL,
	[StartTimeT4] [nvarchar](10) NULL,
	[HideTime1] [nvarchar](10) NULL,
	[HideTime2] [nvarchar](10) NULL,
	[HideTime3] [nvarchar](10) NULL,
	[HideTime4] [nvarchar](10) NULL,
	[HideVoltage1] [nvarchar](30) NULL,
	[HideVoltage2] [nvarchar](30) NULL,
	[HideVoltage3] [nvarchar](30) NULL,
	[HideVoltage4] [nvarchar](30) NULL,
	[HideTimeT1] [nvarchar](8) NULL,
	[HideTimeT2] [nvarchar](8) NULL,
	[HideTimeT3] [nvarchar](8) NULL,
	[HideTimeT4] [nvarchar](8) NULL,
	[WalkValue1] [nvarchar](8) NULL,
	[WalkValue2] [nvarchar](8) NULL,
	[WalkValue3] [nvarchar](8) NULL,
	[WalkValue4] [nvarchar](8) NULL,
	[WalkValueT1] [nvarchar](8) NULL,
	[WalkValueT2] [nvarchar](8) NULL,
	[WalkValueT3] [nvarchar](8) NULL,
	[WalkValueT4] [nvarchar](8) NULL,
	[WalkError1] [nvarchar](8) NULL,
	[WalkError2] [nvarchar](8) NULL,
	[WalkError3] [nvarchar](8) NULL,
	[WalkError4] [nvarchar](8) NULL,
	[PulseWidth] [nvarchar](8) NULL,
	[PulseWidth1] [nvarchar](8) NULL,
	[PulseWidth2] [nvarchar](8) NULL,
	[PulseWidth3] [nvarchar](8) NULL,
	[PulseWidth4] [nvarchar](8) NULL,
	[PulseWidthV1] [nvarchar](12) NULL,
	[PulseWidthV2] [nvarchar](12) NULL,
	[PulseWidthV3] [nvarchar](12) NULL,
	[PulseWidthV4] [nvarchar](12) NULL,
	[PulseHeight] [nvarchar](8) NULL,
	[PulseHeight1] [nvarchar](8) NULL,
	[PulseHeight2] [nvarchar](8) NULL,
	[PulseHeight3] [nvarchar](8) NULL,
	[PulseHeight4] [nvarchar](8) NULL,
	[PulseHeightV1] [nvarchar](12) NULL,
	[PulseHeightV2] [nvarchar](12) NULL,
	[PulseHeightV3] [nvarchar](12) NULL,
	[PulseHeightV4] [nvarchar](12) NULL,
	[WalkValueS1] [nvarchar](20) NULL,
	[WalkValueS2] [nvarchar](20) NULL,
	[WalkValueS3] [nvarchar](20) NULL,
	[WalkValueS4] [nvarchar](20) NULL,
	[WalkValueE1] [nvarchar](20) NULL,
	[WalkValueE2] [nvarchar](20) NULL,
	[WalkValueE3] [nvarchar](20) NULL,
	[WalkValueE4] [nvarchar](20) NULL,
	[WalkError_Pulse1] [nvarchar](12) NULL,
	[WalkError_Pulse2] [nvarchar](12) NULL,
	[WalkError_Pulse3] [nvarchar](12) NULL,
	[WalkError_Pulse4] [nvarchar](12) NULL,
	[WalkLimit] [nvarchar](12) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbMTBiaoZhenBiaoData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbMTBiaoZhenBiaoData](
	[MeterHungID] [int] NULL,
	[ModelTypeId] [int] NULL,
	[TypeId] [int] NULL,
	[ListT] [int] NULL,
	[WhatTable] [int] NULL,
	[WhereGrid] [int] NULL,
	[ListSecondT] [int] NULL,
	[Fun] [int] NULL,
	[Connection] [int] NULL,
	[Data] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbMTtblMeterModel]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbMTtblMeterModel](
	[ModelTypeID] [int] NOT NULL,
	[MeterName] [nvarchar](50) NULL,
	[MeterType] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[SwitchOnMode] [tinyint] NULL,
	[Detent] [tinyint] NULL,
	[ReferenceMeterType] [tinyint] NULL,
	[Class] [nvarchar](8) NULL,
	[Class1] [nvarchar](8) NULL,
	[Connection] [tinyint] NULL,
	[Voltage] [float] NULL,
	[Current] [float] NULL,
	[CurrentMax] [float] NULL,
	[Frequency] [float] NULL,
	[Constant] [float] NULL,
	[ConstantUnit] [nvarchar](10) NULL,
	[ConstantReactive] [float] NULL,
	[ConstantUnitReactive] [nvarchar](10) NULL,
	[Manufactory] [nvarchar](50) NULL,
	[ProduceStandard] [ntext] NULL,
	[TimeFrequency] [int] NULL,
	[ProtocolID] [smallint] NULL,
	[Baudrate] [int] NULL,
	[DataBit] [tinyint] NULL,
	[StopBit] [tinyint] NULL,
	[Parity] [nvarchar](1) NULL,
	[DecimalDigits] [smallint] NULL,
	[WGZX] [int] NULL,
	[WGFX] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ModelTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbMTtblPrjHarmonic]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbMTtblPrjHarmonic](
	[MeasureDegreeID] [int] NOT NULL,
	[TestItemID] [int] NOT NULL,
	[Frequency] [tinyint] NULL,
	[Voltage] [float] NULL,
	[VoltageAngle] [float] NULL,
	[Current] [float] NULL,
	[CurrentAngle] [float] NULL,
 CONSTRAINT [PK_dbMTtblPrjHarmonic] PRIMARY KEY CLUSTERED 
(
	[MeasureDegreeID] ASC,
	[TestItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbMTtblPrjMeasureDegree]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbMTtblPrjMeasureDegree](
	[MeasureDegreeID] [int] NOT NULL,
	[MeasureName] [nvarchar](50) NULL,
	[ListNo] [smallint] NULL,
	[Voltage] [float] NULL,
	[Current] [float] NULL,
	[CurrentMax] [float] NULL,
	[ConnectMode] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[MeasureDegreeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_MeasureDegreeID] UNIQUE NONCLUSTERED 
(
	[MeasureDegreeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbMTtblPrjTestPoint]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbMTtblPrjTestPoint](
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[TestPointName] [nvarchar](50) NULL,
	[TestPointId] [int] NULL,
	[ListNo] [smallint] NULL,
	[Phase] [tinyint] NULL,
	[VoltagePercent] [float] NULL,
	[CurrentPercent] [float] NULL,
	[PowerFoctor] [float] NULL,
	[Cycle] [int] NULL,
	[SampleCount] [int] NULL,
	[TestTime] [int] NULL,
	[Time] [int] NULL,
	[TopErr] [float] NULL,
	[BotErr] [float] NULL,
	[IsTest] [bit] NULL,
	[StandardErr] [float] NULL,
	[IsStandardTest] [bit] NULL,
	[IsTestPoint] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbMTtblProject]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbMTtblProject](
	[ProjectID] [int] NOT NULL,
	[ProjectName] [nvarchar](50) NULL,
	[ConnectMode] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbTDtblHarmonic]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbTDtblHarmonic](
	[MeterID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[Frequency] [tinyint] NULL,
	[Voltage] [float] NULL,
	[VoltageAngle] [float] NULL,
	[Current] [float] NULL,
	[CurrentAngle] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbTDtblMeter]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbTDtblMeter](
	[MeterID] [int] NOT NULL,
	[BatchNumber] [int] NULL,
	[Nest] [smallint] NULL,
	[EquitmentNumber] [nvarchar](20) NULL,
	[MeterNo] [nvarchar](20) NULL,
	[AssetNo] [nvarchar](20) NULL,
	[BarCode] [nvarchar](30) NULL,
	[MeterAddress] [nvarchar](20) NULL,
	[TestDate] [datetime] NULL,
	[Temp] [float] NULL,
	[Humidity] [float] NULL,
	[Tester] [nvarchar](20) NULL,
	[Retester] [nvarchar](20) NULL,
	[Manage] [nvarchar](20) NULL,
	[TestUnit] [nvarchar](50) NULL,
	[Conclusion] [bit] NOT NULL,
	[MeterType] [nvarchar](50) NULL,
	[MeterName] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[SwitchOnMode] [tinyint] NULL,
	[Detent] [tinyint] NULL,
	[ReferenceMeterType] [tinyint] NULL,
	[Class] [float] NULL,
	[Class1] [float] NULL,
	[Connection] [tinyint] NULL,
	[Voltage] [float] NULL,
	[Current] [float] NULL,
	[CurrentMax] [float] NULL,
	[Frequency] [float] NULL,
	[Constant] [float] NULL,
	[ConstantUnit] [nvarchar](10) NULL,
	[ConstantReactive] [float] NULL,
	[ConstantUnitReactive] [nvarchar](10) NULL,
	[Manufactory] [nvarchar](50) NULL,
	[ProduceStandard] [ntext] NULL,
	[EffectiveDate] [datetime] NULL,
	[MeterSortNumber] [int] NULL,
	[Net] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbTDtblTestResult00]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbTDtblTestResult00](
	[MeterID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[TestPointName] [nvarchar](50) NULL,
	[ListNo] [smallint] NULL,
	[Phase] [tinyint] NULL,
	[VoltagePercent] [float] NULL,
	[CurrentPercent] [float] NULL,
	[PowerFoctor] [float] NULL,
	[Cycle] [int] NULL,
	[SampleCount] [int] NULL,
	[TestTime] [int] NULL,
	[Time] [int] NULL,
	[TopErr] [float] NULL,
	[BotErr] [float] NULL,
	[StandardErr] [float] NULL,
	[IsStandardTest] [bit] NOT NULL,
	[ErrData] [ntext] NULL,
	[AveData] [nvarchar](10) NULL,
	[Error] [nvarchar](10) NULL,
	[Conclusion] [bit] NOT NULL,
	[StandardError] [nvarchar](8) NULL,
	[StandardConclusion] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbTDtblTestResult01]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbTDtblTestResult01](
	[MeterID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[ListNo] [smallint] NULL,
	[Voltagepercent] [float] NULL,
	[Currentpercent] [float] NULL,
	[StartAllTime] [nvarchar](50) NULL,
	[StartRuntime] [nvarchar](50) NULL,
	[Conclusion] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbTDtblTestResult02]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbTDtblTestResult02](
	[MeterID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[ListNo] [smallint] NULL,
	[Voltagepercent] [float] NULL,
	[Currentpercent] [float] NULL,
	[HideAllTime] [nvarchar](50) NULL,
	[HideRuntime] [nvarchar](50) NULL,
	[Conclusion] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbTDtblTestResult03]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbTDtblTestResult03](
	[MeterID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[ListNo] [smallint] NULL,
	[CTtime] [nvarchar](20) NULL,
	[VoltagePercent] [int] NULL,
	[CurrentPercent] [float] NULL,
	[Constant] [float] NULL,
	[StartDeg] [nvarchar](20) NULL,
	[EndDeg] [nvarchar](20) NULL,
	[ZZDeg] [nvarchar](20) NULL,
	[LLDeg] [nvarchar](20) NULL,
	[CTerr] [nvarchar](20) NULL,
	[Conclusion] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbTDtblTestResult05]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbTDtblTestResult05](
	[MeterID] [int] NOT NULL,
	[MeasureDegreeID] [int] NOT NULL,
	[TestItemID] [int] NOT NULL,
	[ListNo] [smallint] NULL,
	[TotalPower] [nvarchar](20) NULL,
	[JianFengPower] [nvarchar](20) NULL,
	[FengPower] [nvarchar](20) NULL,
	[PingPower] [nvarchar](20) NULL,
	[GuPower] [nvarchar](20) NULL,
	[Conclusion] [bit] NULL,
 CONSTRAINT [PK_tblTestResult05] PRIMARY KEY CLUSTERED 
(
	[MeterID] ASC,
	[MeasureDegreeID] ASC,
	[TestItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbTDtblTestResult06]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbTDtblTestResult06](
	[MeterID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[ListNo] [smallint] NULL,
	[TimeFrequency] [int] NULL,
	[SampleTime] [int] NULL,
	[SampleCount] [int] NULL,
	[ErrData] [ntext] NULL,
	[RJSerr] [nvarchar](50) NULL,
	[Conclusion] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbTDtblTestResult07]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbTDtblTestResult07](
	[MeterID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[ListNo] [smallint] NULL,
	[JianFengConclusion] [bit] NULL,
	[FengConclusion] [bit] NULL,
	[PingConclusion] [bit] NULL,
	[GuConclusion] [bit] NULL,
	[Conclusion] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbTDtblTestResult08]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbTDtblTestResult08](
	[MeterID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[ListNo] [smallint] NULL,
	[TestPointName] [nvarchar](50) NULL,
	[Phase] [tinyint] NULL,
	[VoltagePercent] [float] NULL,
	[CurrentPercent] [float] NULL,
	[PowerFoctor] [float] NULL,
	[XLTime] [float] NULL,
	[XLMax] [nvarchar](50) NULL,
	[XLErr] [nvarchar](50) NULL,
	[STXLMax] [nvarchar](20) NULL,
	[Conclusion] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbTDtblTestResult10]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbTDtblTestResult10](
	[MeterID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[TestPointId] [int] NULL,
	[ListNo] [smallint] NULL,
	[ErrData] [nvarchar](10) NULL,
	[Conclusion] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dbTDtblTestResult16]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbTDtblTestResult16](
	[MeterID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[ListNo] [smallint] NULL,
	[PZPower] [nvarchar](20) NULL,
	[PZJFPower] [nvarchar](20) NULL,
	[PZFPower] [nvarchar](20) NULL,
	[PZPPower] [nvarchar](20) NULL,
	[PZGPower] [nvarchar](20) NULL,
	[QZPower] [nvarchar](20) NULL,
	[QZJFPower] [nvarchar](20) NULL,
	[QZFPower] [nvarchar](20) NULL,
	[QZPPower] [nvarchar](20) NULL,
	[QZGPower] [nvarchar](20) NULL,
	[PFPower] [nvarchar](20) NULL,
	[PFJFPower] [nvarchar](20) NULL,
	[PFFPower] [nvarchar](20) NULL,
	[PFPPower] [nvarchar](20) NULL,
	[PFGPower] [nvarchar](20) NULL,
	[QFPower] [nvarchar](20) NULL,
	[QFJFPower] [nvarchar](20) NULL,
	[QFFPower] [nvarchar](20) NULL,
	[QFPPower] [nvarchar](20) NULL,
	[QFGPower] [nvarchar](20) NULL,
	[Q1Power] [nvarchar](20) NULL,
	[Q1JFPower] [nvarchar](20) NULL,
	[Q1FPower] [nvarchar](20) NULL,
	[Q1PPower] [nvarchar](20) NULL,
	[Q1GPower] [nvarchar](20) NULL,
	[Q2Power] [nvarchar](20) NULL,
	[Q2JFPower] [nvarchar](20) NULL,
	[Q2FPower] [nvarchar](20) NULL,
	[Q2PPower] [nvarchar](20) NULL,
	[Q2GPower] [nvarchar](20) NULL,
	[Q3Power] [nvarchar](20) NULL,
	[Q3JFPower] [nvarchar](20) NULL,
	[Q3FPower] [nvarchar](20) NULL,
	[Q3PPower] [nvarchar](20) NULL,
	[Q3GPower] [nvarchar](20) NULL,
	[Q4Power] [nvarchar](20) NULL,
	[Q4JFPower] [nvarchar](20) NULL,
	[Q4FPower] [nvarchar](20) NULL,
	[Q4PPower] [nvarchar](20) NULL,
	[Q4GPower] [nvarchar](20) NULL,
	[Conclusion] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ErrData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrData](
	[MeterID] [float] NULL,
	[RangeCode] [smallint] NULL,
	[SortNo] [smallint] NULL,
	[LoadName] [nvarchar](25) NULL,
	[Data1] [nvarchar](8) NULL,
	[Data2] [nvarchar](8) NULL,
	[Data3] [nvarchar](8) NULL,
	[Data4] [nvarchar](8) NULL,
	[Data5] [nvarchar](8) NULL,
	[AveData] [nvarchar](8) NULL,
	[CIData] [nvarchar](8) NULL,
	[SmaxData] [nvarchar](8) NULL,
	[Data6] [nvarchar](8) NULL,
	[Data7] [nvarchar](8) NULL,
	[Data8] [nvarchar](8) NULL,
	[Data9] [nvarchar](8) NULL,
	[Data10] [nvarchar](8) NULL,
	[Data11] [nvarchar](8) NULL,
	[Data12] [nvarchar](8) NULL,
	[qualified] [nvarchar](8) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inputtemp]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inputtemp](
	[Meterid] [int] NULL,
	[Modeltypeid] [int] NULL,
	[Serialno] [nvarchar](50) NULL,
	[Meterno] [nvarchar](50) NULL,
	[barcode] [nvarchar](50) NULL,
	[MeterAddress] [int] NULL,
	[Model] [nvarchar](50) NULL,
	[MadePlace] [nvarchar](50) NULL,
	[TestUnit] [nvarchar](50) NULL,
	[TestDate] [nvarchar](50) NULL,
	[StartDeg] [nvarchar](50) NULL,
	[Enddeg] [nvarchar](50) NULL,
	[Constant] [float] NULL,
	[Class] [float] NULL,
	[Class1] [float] NULL,
	[Voltage] [float] NULL,
	[Current] [float] NULL,
	[CurrentMax] [float] NULL,
	[TestCircs] [nvarchar](20) NULL,
	[Type] [nvarchar](50) NULL,
	[ConstantReactive] [float] NULL,
	[Connection] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MeterInfo]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeterInfo](
	[cType] [nvarchar](50) NULL,
	[iAddressType] [smallint] NULL,
	[cAddressValue] [nvarchar](30) NULL,
	[cPassword] [nvarchar](20) NULL,
	[cCommSetting] [nvarchar](20) NULL,
	[iDemandCycle] [smallint] NULL,
	[iDemandStep] [int] NULL,
	[fDayFrequency] [float] NULL,
	[iDayDivideFre] [int] NULL,
	[cPeriodType] [nvarchar](12) NULL,
	[cPeriodSharp] [nvarchar](8) NULL,
	[cPeriodPeak] [nvarchar](8) NULL,
	[cPeriodPlane] [nvarchar](8) NULL,
	[cPeriodVale] [nvarchar](8) NULL,
	[iPulseMode] [smallint] NULL,
	[iReactiveMode] [smallint] NULL,
	[iPowerPoint] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NumberCode]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumberCode](
	[IndexID] [smallint] NOT NULL,
	[serialno] [nvarchar](50) NULL,
	[meterno] [nvarchar](50) NULL,
	[ScanCode] [nvarchar](30) NULL,
	[Constant] [nvarchar](32) NULL,
	[TesterCode] [nvarchar](5) NULL,
	[TestCircs] [nvarchar](6) NULL,
	[ADDRESS] [nvarchar](16) NULL,
	[MODEL] [nvarchar](20) NULL,
	[MadePlace] [nvarchar](30) NULL,
	[SerialDate] [nvarchar](10) NULL,
	[TestUnit] [nvarchar](30) NULL,
	[Class] [nvarchar](50) NULL,
	[Voltage] [nvarchar](20) NULL,
	[Current] [nvarchar](20) NULL,
	[Precision] [nvarchar](20) NULL,
	[Frequency] [int] NULL,
	[StartDeg] [nvarchar](16) NULL,
	[cConnectMode] [nvarchar](30) NULL,
	[cLeiXing] [nvarchar](30) NULL,
	[cInMode] [nvarchar](16) NULL,
	[cTestMode] [nvarchar](4) NULL,
	[bStopBack] [bit] NOT NULL,
	[cCommProtocol] [nvarchar](50) NULL,
	[cPassword] [nvarchar](20) NULL,
	[cCommSetting] [nvarchar](20) NULL,
	[iDemandCycle] [smallint] NULL,
	[iDemandStep] [int] NULL,
	[fDayFrequency] [float] NULL,
	[iDayDivideFre] [int] NULL,
	[cPeriodSharp] [nvarchar](8) NULL,
	[cPeriodPeak] [nvarchar](8) NULL,
	[cPeriodPlane] [nvarchar](8) NULL,
	[cPeriodVale] [nvarchar](8) NULL,
	[bAvailable] [bit] NOT NULL,
	[iReactiveMode] [smallint] NULL,
	[iPulseMode] [smallint] NULL,
	[PrecisionQ] [nvarchar](20) NULL,
	[iPowerPoint] [int] NULL,
	[EConstant] [nvarchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParamList]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParamList](
	[Id] [int] NOT NULL,
	[FuZaiDianLiu] [float] NULL,
	[FuZaiLilu] [float] NULL,
	[CheckTypeId] [smallint] NULL,
	[CheckTypeDes] [nvarchar](50) NULL,
	[CheckAffectId] [smallint] NULL,
	[CheckAffectDes] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResultData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultData](
	[MeterID] [float] NULL,
	[MeterPlace] [smallint] NOT NULL,
	[serialno] [nvarchar](50) NULL,
	[meterno] [nvarchar](50) NULL,
	[ScanCode] [nvarchar](20) NULL,
	[Model] [nvarchar](20) NULL,
	[Type] [nvarchar](20) NULL,
	[Voltage] [nvarchar](10) NULL,
	[Current] [nvarchar](10) NULL,
	[Constant] [nvarchar](32) NULL,
	[Precision] [nvarchar](10) NULL,
	[WireModel] [nvarchar](20) NULL,
	[Frequency] [nvarchar](8) NULL,
	[SerialDate] [nvarchar](10) NULL,
	[MadePlace] [nvarchar](30) NULL,
	[TEMP] [nvarchar](5) NULL,
	[HUMIDITY] [nvarchar](5) NULL,
	[TESTER] [nvarchar](30) NULL,
	[RETESTER] [nvarchar](30) NULL,
	[MANAGE] [nvarchar](30) NULL,
	[TESTDATE] [nvarchar](10) NULL,
	[STARTEST] [nvarchar](8) NULL,
	[HIDDENTEST] [nvarchar](8) NULL,
	[StopTest] [nvarchar](8) NULL,
	[StartCurrent] [nvarchar](10) NULL,
	[Resistance] [nvarchar](10) NULL,
	[PIEZO] [nvarchar](10) NULL,
	[TESTYER] [nvarchar](4) NULL,
	[TESTMON] [nvarchar](2) NULL,
	[TESTDAY] [nvarchar](2) NULL,
	[MINCURR] [nvarchar](5) NULL,
	[WALKTEST] [nvarchar](10) NULL,
	[STARTDEG] [nvarchar](10) NULL,
	[ENDDEG] [nvarchar](10) NULL,
	[CUNDUTOTAL] [nvarchar](10) NULL,
	[CUNDUPEAK] [nvarchar](10) NULL,
	[CUNDUVALEY] [nvarchar](10) NULL,
	[PNO] [nvarchar](12) NULL,
	[TNO] [nvarchar](12) NULL,
	[TestUnit] [nvarchar](30) NULL,
	[Smax] [nvarchar](10) NULL,
	[ForConclusion] [nvarchar](6) NULL,
	[AftConclusion] [nvarchar](6) NULL,
	[Conclusion24h] [nvarchar](6) NULL,
	[Conclusion] [nvarchar](8) NULL,
	[Net] [nvarchar](50) NULL,
	[StartTime] [nvarchar](10) NULL,
	[HideTime] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RuleAffectData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleAffectData](
	[cWayName] [nvarchar](50) NULL,
	[iAffectNo] [smallint] NULL,
	[cAffectName] [nvarchar](50) NULL,
	[cRange] [nvarchar](50) NULL,
	[fVoltage] [float] NULL,
	[fCurrent] [float] NULL,
	[fFrequency] [float] NULL,
	[fAngleA] [float] NULL,
	[fAngleB] [float] NULL,
	[fAngleC] [float] NULL,
	[cABCVoltage] [nvarchar](3) NULL,
	[cABCCurrent] [nvarchar](3) NULL,
	[cLimit] [nvarchar](10) NULL,
	[cBCLimit] [nvarchar](10) NULL,
	[cLoadName] [nvarchar](40) NULL,
	[bFlagTest] [bit] NULL,
	[iCompare] [int] NULL,
	[cXieBo] [nvarchar](50) NULL,
	[fLeanAngle] [float] NULL,
	[bReverse] [bit] NULL,
	[iCircles] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RuleErrorData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleErrorData](
	[cType] [nvarchar](20) NULL,
	[iNo] [int] NULL,
	[cPointName] [nvarchar](40) NULL,
	[cLimit] [nvarchar](15) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RuleWayData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleWayData](
	[cWayName] [nvarchar](50) NULL,
	[cBaseRange] [nvarchar](50) NULL,
	[cTestMode] [nvarchar](10) NULL,
	[cInMode] [nvarchar](20) NULL,
	[cMeterType] [nvarchar](20) NULL,
	[cPrecision] [nvarchar](15) NULL,
	[cWayAdjust] [nvarchar](25) NULL,
	[cWayTest] [nvarchar](25) NULL,
	[cWayMultiFunction] [nvarchar](20) NULL,
	[cWaySpeacialTest] [nvarchar](12) NULL,
	[fWarmCurrent] [float] NULL,
	[fWarmTime] [float] NULL,
	[cStartRange] [nvarchar](10) NULL,
	[cStartCurrent] [nvarchar](10) NULL,
	[cStartCurrentP] [nvarchar](10) NULL,
	[cStartCurrentQ] [nvarchar](10) NULL,
	[iStartPulse] [int] NULL,
	[cStartTime] [nvarchar](8) NULL,
	[cStartTimeP] [nvarchar](8) NULL,
	[cStartTimeQ] [nvarchar](8) NULL,
	[cHideRange] [nvarchar](10) NULL,
	[cHideVoltage] [nvarchar](8) NULL,
	[iHideCurrent] [smallint] NULL,
	[iHideTimeMode] [int] NULL,
	[iHidePulse] [int] NULL,
	[cHideTime] [nvarchar](8) NULL,
	[cHideTimeP] [nvarchar](8) NULL,
	[cHideTimeQ] [nvarchar](8) NULL,
	[fErrorUpLimit] [float] NULL,
	[fErrorDownLimit] [float] NULL,
	[iErrorSmax] [smallint] NULL,
	[cErrorSmaxRange] [nvarchar](10) NULL,
	[iErrorIbCircle] [smallint] NULL,
	[iWalkMode] [int] NULL,
	[iWalkPara] [int] NULL,
	[iWalkAutoRead] [int] NULL,
	[cWalkRange] [nvarchar](10) NULL,
	[cPeriodType] [nvarchar](10) NULL,
	[iPeriodWalk] [int] NULL,
	[iDemandTestTime] [int] NULL,
	[iDemandTestCycle] [smallint] NULL,
	[iDayCircle] [smallint] NULL,
	[iDayTimes] [smallint] NULL,
	[fPeriodWalkE] [float] NULL,
	[iDemandTestEvent] [smallint] NULL,
	[fStdVoltage] [float] NULL,
	[fStdCurrent] [float] NULL,
	[fStdConstant] [float] NULL,
	[fStdFrequency] [float] NULL,
	[cType] [nvarchar](30) NULL,
	[cProtocal] [nvarchar](30) NULL,
	[cStopBack] [nvarchar](8) NULL,
	[cPrecisionQ] [nvarchar](15) NULL,
	[cFactory] [nvarchar](50) NULL,
	[cVoltageLimit] [nvarchar](10) NULL,
	[cCurrentLimit] [nvarchar](10) NULL,
	[iPulseMode] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ScanCode]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScanCode](
	[cType] [nvarchar](20) NULL,
	[cName] [nvarchar](50) NULL,
	[cCode] [nvarchar](8) NULL,
	[cNote] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpecialErrorData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecialErrorData](
	[MeterID] [float] NULL,
	[IndexID] [smallint] NULL,
	[iRangeNo] [int] NULL,
	[cRange] [nvarchar](50) NULL,
	[cError] [nvarchar](100) NULL,
	[cAveData] [nvarchar](10) NULL,
	[cCIData] [nvarchar](10) NULL,
	[cSmax] [nvarchar](10) NULL,
	[bOverLimit] [bit] NOT NULL,
	[cAffectV] [nvarchar](10) NULL,
	[cStdCIData] [nvarchar](10) NULL,
	[cStdAveData] [nvarchar](10) NULL,
	[cConnect] [nvarchar](50) NULL,
	[fVoltage] [float] NULL,
	[fCurrent] [float] NULL,
	[fFrequency] [float] NULL,
	[fAngleA] [float] NULL,
	[fAngleB] [float] NULL,
	[fAngleC] [float] NULL,
	[cABCVoltage] [nvarchar](3) NULL,
	[cABCCurrent] [nvarchar](3) NULL,
	[cLimit] [nvarchar](10) NULL,
	[cBCLimit] [nvarchar](10) NULL,
	[cLoadName] [nvarchar](40) NULL,
	[bFlagTest] [bit] NOT NULL,
	[iCompare] [int] NULL,
	[cXieBo] [nvarchar](50) NULL,
	[fLeanAngle] [float] NULL,
	[bReverse] [bit] NOT NULL,
	[iCircles] [int] NULL,
	[iTestTimes] [tinyint] NULL,
	[ACur] [nvarchar](20) NULL,
	[BCur] [nvarchar](20) NULL,
	[CCur] [nvarchar](20) NULL,
	[AAgl] [nvarchar](20) NULL,
	[BAgl] [nvarchar](20) NULL,
	[CAgl] [nvarchar](20) NULL,
	[repe_error] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAutoRunList]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAutoRunList](
	[ListNo] [smallint] NULL,
	[CheckType] [smallint] NULL,
	[CheckAffect] [smallint] NULL,
	[TestItemName] [nvarchar](50) NULL,
	[IsEnable] [bit] NOT NULL,
	[OverLoad] [int] NULL,
	[Dest] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblBatch]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBatch](
	[BatchNumber] [int] NOT NULL,
	[BatchTodayNumber] [int] NULL,
	[BatchName] [nvarchar](50) NULL,
	[TestDate] [datetime] NULL,
	[TestTime] [nvarchar](50) NULL,
	[Temp] [float] NULL,
	[Humidity] [float] NULL,
	[Tester] [nvarchar](20) NULL,
	[Retester] [nvarchar](20) NULL,
	[Manage] [nvarchar](20) NULL,
	[Voltage] [float] NULL,
	[Current] [float] NULL,
	[CurrentMax] [float] NULL,
	[Frequency] [float] NULL,
	[BanchNO] [nvarchar](10) NULL,
	[ReferenceMeter] [nvarchar](20) NULL,
	[PassNumber] [int] NULL,
	[FailNumber] [int] NULL,
	[FailMaterNO] [nvarchar](max) NULL,
	[TotalNumber] [smallint] NULL,
 CONSTRAINT [PK__tblBatch__F869ED6C38F2FAD6] PRIMARY KEY CLUSTERED 
(
	[BatchNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCheckHarmonic]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCheckHarmonic](
	[CheckID] [int] IDENTITY(1,1) NOT NULL,
	[CheckHarmonicName] [nvarchar](50) NULL,
	[CheckTime] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCheckWay]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCheckWay](
	[CheckID] [int] NOT NULL,
	[CheckWayName] [nvarchar](50) NULL,
	[CheckType] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHarmonic]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHarmonic](
	[CheckID] [int] NULL,
	[Frequency] [tinyint] NULL,
	[Voltage] [float] NULL,
	[VoltageAngle] [float] NULL,
	[Current] [float] NULL,
	[CurrentAngle] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMeasureDegree]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMeasureDegree](
	[MeterID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[MeasureName] [nvarchar](50) NULL,
	[ListNo] [smallint] NULL,
	[Voltage] [float] NULL,
	[Current] [float] NULL,
	[CurrentMax] [float] NULL,
	[ConnectMode] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMeter]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMeter](
	[MeterHungID] [int] NULL,
	[Nest] [int] NULL,
	[EquitmentNumber] [nvarchar](50) NULL,
	[BatchNumber] [int] NULL,
	[ModelTypeID] [int] NULL,
	[MeterNo] [nvarchar](50) NULL,
	[AssetNo] [nvarchar](50) NULL,
	[BarCode] [nvarchar](50) NULL,
	[MeterAddress] [nvarchar](50) NULL,
	[ProtocolID] [int] NULL,
	[CommPort] [int] NULL,
	[TimeFrequency] [int] NULL,
	[Password] [int] NULL,
	[Baudrate] [int] NULL,
	[DataBit] [int] NULL,
	[StopBit] [int] NULL,
	[Parity] [nvarchar](50) NULL,
	[TestDate] [datetime] NULL,
	[Temp] [int] NULL,
	[Humidity] [int] NULL,
	[Tester] [nvarchar](50) NULL,
	[Retester] [nvarchar](50) NULL,
	[Manage] [nvarchar](50) NULL,
	[TestUnit] [nvarchar](50) NULL,
	[IsTest] [bit] NULL,
	[Conclusion] [bit] NULL,
	[MeterType] [nvarchar](50) NULL,
	[MeterName] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[SwitchOnMode] [int] NULL,
	[Detent] [int] NULL,
	[ReferenceMeterType] [int] NULL,
	[Class] [int] NULL,
	[Class1] [int] NULL,
	[Connection] [int] NULL,
	[Voltage] [int] NULL,
	[Current] [int] NULL,
	[CurrentMax] [int] NULL,
	[Frequency] [int] NULL,
	[Constant] [int] NULL,
	[ConstantUnit] [nvarchar](50) NULL,
	[ConstantReactive] [int] NULL,
	[ConstantUnitReactive] [nvarchar](50) NULL,
	[Manufactory] [nvarchar](50) NULL,
	[ProduceStandard] [ntext] NULL,
	[DecimalDigits] [int] NULL,
	[WGZX] [int] NULL,
	[WGFX] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMeterModel]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMeterModel](
	[ModelTypeID] [int] NOT NULL,
	[MeterName] [nvarchar](50) NULL,
	[MeterType] [nvarchar](50) NULL,
	[Type] [int] NULL,
	[SwitchOnMode] [tinyint] NULL,
	[Detent] [tinyint] NULL,
	[ReferenceMeterType] [tinyint] NULL,
	[Class] [nvarchar](8) NULL,
	[Class1] [nvarchar](8) NULL,
	[Connection] [tinyint] NULL,
	[Voltage] [float] NULL,
	[Current] [float] NULL,
	[CurrentMax] [float] NULL,
	[Frequency] [float] NULL,
	[Constant] [float] NULL,
	[ConstantUnit] [nvarchar](10) NULL,
	[ConstantReactive] [float] NULL,
	[ConstantUnitReactive] [nvarchar](10) NULL,
	[Manufactory] [nvarchar](50) NULL,
	[ProduceStandard] [ntext] NULL,
	[TimeFrequency] [float] NULL,
	[ProtocolID] [smallint] NULL,
	[Baudrate] [int] NULL,
	[DataBit] [tinyint] NULL,
	[StopBit] [tinyint] NULL,
	[Parity] [nvarchar](1) NULL,
	[DecimalDigits] [smallint] NULL,
	[WGZX] [int] NULL,
	[WGFX] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPrjHarmonic]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPrjHarmonic](
	[ProjectID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[Frequency] [tinyint] NULL,
	[Voltage] [float] NULL,
	[VoltageAngle] [float] NULL,
	[Current] [float] NULL,
	[CurrentAngle] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPrjMeasureDegree]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPrjMeasureDegree](
	[ProjectID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[MeasureName] [nvarchar](50) NULL,
	[ListNo] [smallint] NULL,
	[Voltage] [float] NULL,
	[Current] [float] NULL,
	[ConnectMode] [tinyint] NULL,
	[IsTest] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPrjTestItem]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPrjTestItem](
	[ProjectID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[ListNo] [smallint] NULL,
	[TestItemName] [nvarchar](50) NULL,
	[CheckType] [smallint] NULL,
	[CheckAffect] [smallint] NULL,
	[CheckValue] [float] NULL,
	[CheckValue1] [float] NULL,
	[CheckValue2] [float] NULL,
	[CheckValue3] [float] NULL,
	[CheckValue4] [float] NULL,
	[IsTest] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPrjTestPoint]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPrjTestPoint](
	[ProjectID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[ListNo] [smallint] NULL,
	[TestPointName] [nvarchar](50) NULL,
	[TestPointId] [int] NULL,
	[Phase] [tinyint] NULL,
	[VoltagePercent] [float] NULL,
	[CurrentPercent] [float] NULL,
	[PowerFoctor] [float] NULL,
	[Cycle] [int] NULL,
	[SampleCount] [int] NULL,
	[TestTime] [int] NULL,
	[Time] [int] NULL,
	[TopErr] [float] NULL,
	[BotErr] [float] NULL,
	[IsTest] [bit] NOT NULL,
	[StandardErr] [float] NULL,
	[IsStandardTest] [bit] NOT NULL,
	[IsTestPoint] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPrjTestPointMeter]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPrjTestPointMeter](
	[MeterHungID] [int] NOT NULL,
	[MeasureDegreeID] [int] NOT NULL,
	[TestItemID] [int] NOT NULL,
	[ListNo] [smallint] NULL,
	[Cycle] [int] NULL,
	[TestTime] [int] NULL,
	[Time] [int] NULL,
	[TopErr] [float] NULL,
	[BotErr] [float] NULL,
	[StandardErr] [float] NULL,
 CONSTRAINT [PK_tblPrjTestPointMeter] PRIMARY KEY CLUSTERED 
(
	[MeterHungID] ASC,
	[MeasureDegreeID] ASC,
	[TestItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProject]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProject](
	[ProjectID] [int] NULL,
	[ProjectName] [nvarchar](50) NULL,
	[ConnectMode] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRtInfo]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRtInfo](
	[pid] [smallint] NULL,
	[range] [smallint] NULL,
	[pt] [smallint] NULL,
	[iteration] [smallint] NULL,
	[begintime] [datetime] NULL,
	[endtime] [datetime] NULL,
	[temp] [float] NULL,
	[humi] [float] NULL,
	[WhtLimit] [float] NULL,
	[varhtLimit] [float] NULL,
	[setvolt] [float] NULL,
	[setamp] [float] NULL,
	[setangle] [float] NULL,
	[setfreq] [float] NULL,
	[elms] [smallint] NULL,
	[rdimpwh] [float] NULL,
	[rdimpvah] [float] NULL,
	[param1] [nvarchar](255) NULL,
	[param2] [nvarchar](255) NULL,
	[param3] [nvarchar](255) NULL,
	[param4] [nvarchar](255) NULL,
	[param5] [nvarchar](255) NULL,
	[param6] [nvarchar](255) NULL,
	[param7] [nvarchar](255) NULL,
	[param8] [nvarchar](255) NULL,
	[param9] [nvarchar](255) NULL,
	[param10] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTestItem]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestItem](
	[MeterID] [int] NULL,
	[MeasureDegreeID] [int] NULL,
	[TestItemID] [int] NULL,
	[ListNo] [smallint] NULL,
	[TestItemName] [nvarchar](50) NULL,
	[CheckType] [smallint] NULL,
	[CheckAffect] [smallint] NULL,
	[CheckValue] [float] NULL,
	[CheckValue1] [float] NULL,
	[CheckValue2] [float] NULL,
	[CheckValue3] [float] NULL,
	[CheckValue4] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTestPoint]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestPoint](
	[CheckID] [int] NULL,
	[TestPointName] [nvarchar](50) NULL,
	[TestPointId] [int] NULL,
	[ListNo] [smallint] NULL,
	[Phase] [tinyint] NULL,
	[VoltagePercent] [float] NULL,
	[CurrentPercent] [float] NULL,
	[PowerFoctor] [float] NULL,
	[Cycle] [int] NULL,
	[SampleCount] [int] NULL,
	[TestTime] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTestResult00]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestResult00](
	[MeterHungID] [int] NOT NULL,
	[MeasureDegreeID] [int] NOT NULL,
	[TestItemID] [int] NOT NULL,
	[TestPointId] [int] NOT NULL,
	[TestPointName] [nvarchar](50) NULL,
	[ListNo] [smallint] NULL,
	[Phase] [tinyint] NULL,
	[VoltagePercent] [float] NULL,
	[CurrentPercent] [float] NULL,
	[PowerFoctor] [float] NULL,
	[Cycle] [int] NULL,
	[SampleCount] [int] NULL,
	[TestTime] [int] NULL,
	[Time] [int] NULL,
	[TopErr] [float] NULL,
	[BotErr] [float] NULL,
	[StandardErr] [float] NULL,
	[IsStandardTest] [bit] NULL,
	[ErrData] [ntext] NULL,
	[AveData] [nvarchar](10) NULL,
	[Error] [nvarchar](10) NULL,
	[Conclusion] [bit] NULL,
	[StandardError] [nvarchar](8) NULL,
	[StandardConclusion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MeterHungID] ASC,
	[MeasureDegreeID] ASC,
	[TestItemID] ASC,
	[TestPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTestResult01]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestResult01](
	[MeterHungID] [int] NOT NULL,
	[MeasureDegreeID] [int] NOT NULL,
	[TestItemID] [int] NOT NULL,
	[TestPointId] [int] NOT NULL,
	[ListNo] [smallint] NULL,
	[VoltagePercent] [float] NULL,
	[CurrentPercent] [float] NULL,
	[StartAllTime] [nvarchar](50) NULL,
	[StartRuntime] [nvarchar](50) NULL,
	[Conclusion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MeterHungID] ASC,
	[MeasureDegreeID] ASC,
	[TestItemID] ASC,
	[TestPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTestResult02]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestResult02](
	[MeterHungID] [int] NOT NULL,
	[MeasureDegreeID] [int] NOT NULL,
	[TestItemID] [int] NOT NULL,
	[TestPointId] [int] NOT NULL,
	[ListNo] [smallint] NULL,
	[VoltagePercent] [float] NULL,
	[CurrentPercent] [float] NULL,
	[HideAllTime] [nvarchar](50) NULL,
	[HideRuntime] [nvarchar](50) NULL,
	[Conclusion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MeterHungID] ASC,
	[MeasureDegreeID] ASC,
	[TestItemID] ASC,
	[TestPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTestResult03]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestResult03](
	[MeterHungID] [int] NOT NULL,
	[MeasureDegreeID] [int] NOT NULL,
	[TestItemID] [int] NOT NULL,
	[ListNo] [smallint] NULL,
	[CTtime] [nvarchar](20) NULL,
	[VoltagePercent] [int] NULL,
	[CurrentPercent] [float] NULL,
	[Constant] [float] NULL,
	[StartDeg] [nvarchar](20) NULL,
	[EndDeg] [nvarchar](20) NULL,
	[ZZDeg] [nvarchar](20) NULL,
	[LLDeg] [nvarchar](20) NULL,
	[ZZPlus] [nvarchar](20) NULL,
	[CTerr] [nvarchar](20) NULL,
	[Conclusion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MeterHungID] ASC,
	[MeasureDegreeID] ASC,
	[TestItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTestResult05]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestResult05](
	[MeterHungID] [int] NOT NULL,
	[MeasureDegreeID] [int] NOT NULL,
	[TestItemID] [int] NOT NULL,
	[ListNo] [smallint] NULL,
	[TotalPower] [nvarchar](20) NULL,
	[JianFengPower] [nvarchar](20) NULL,
	[FengPower] [nvarchar](20) NULL,
	[PingPower] [nvarchar](20) NULL,
	[GuPower] [nvarchar](20) NULL,
	[Conclusion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MeterHungID] ASC,
	[MeasureDegreeID] ASC,
	[TestItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTestResult06]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestResult06](
	[MeterHungID] [int] NOT NULL,
	[MeasureDegreeID] [int] NOT NULL,
	[TestItemID] [int] NOT NULL,
	[ListNo] [smallint] NULL,
	[TimeFrequency] [float] NULL,
	[SampleTime] [int] NULL,
	[SampleCount] [int] NULL,
	[ErrData] [ntext] NULL,
	[RJSerr] [nvarchar](20) NULL,
	[Conclusion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MeterHungID] ASC,
	[MeasureDegreeID] ASC,
	[TestItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTestResult07]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestResult07](
	[MeterHungID] [int] NOT NULL,
	[MeasureDegreeID] [int] NOT NULL,
	[TestItemID] [int] NOT NULL,
	[ListNo] [smallint] NULL,
	[JianFengConclusion] [bit] NULL,
	[FengConclusion] [bit] NULL,
	[PingConclusion] [bit] NULL,
	[GuConclusion] [bit] NULL,
	[Conclusion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MeterHungID] ASC,
	[MeasureDegreeID] ASC,
	[TestItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTestResult08]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestResult08](
	[MeterHungID] [int] NOT NULL,
	[MeasureDegreeID] [int] NOT NULL,
	[TestItemID] [int] NOT NULL,
	[TestPointId] [int] NULL,
	[ListNo] [smallint] NULL,
	[TestPointName] [nvarchar](50) NULL,
	[Phase] [tinyint] NULL,
	[VoltagePercent] [float] NULL,
	[CurrentPercent] [float] NULL,
	[PowerFoctor] [float] NULL,
	[XLtime] [float] NULL,
	[XLmax] [nvarchar](20) NULL,
	[XLerr] [nvarchar](20) NULL,
	[STXLMax] [nvarchar](20) NULL,
	[Conclusion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MeterHungID] ASC,
	[MeasureDegreeID] ASC,
	[TestItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTestResult10]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestResult10](
	[MeterHungID] [int] NOT NULL,
	[MeasureDegreeID] [int] NOT NULL,
	[TestItemID] [int] NOT NULL,
	[TestPointId] [int] NOT NULL,
	[ListNo] [smallint] NULL,
	[ErrData] [nvarchar](10) NULL,
	[Conclusion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MeterHungID] ASC,
	[MeasureDegreeID] ASC,
	[TestItemID] ASC,
	[TestPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTestResult16]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTestResult16](
	[MeterHungID] [int] NOT NULL,
	[MeasureDegreeID] [int] NOT NULL,
	[TestItemID] [int] NOT NULL,
	[TestPointId] [int] NULL,
	[ListNo] [smallint] NULL,
	[PZPower] [nvarchar](20) NULL,
	[PZJFPower] [nvarchar](20) NULL,
	[PZFPower] [nvarchar](20) NULL,
	[PZPPower] [nvarchar](20) NULL,
	[PZGPower] [nvarchar](20) NULL,
	[QZPower] [nvarchar](20) NULL,
	[QZJFPower] [nvarchar](20) NULL,
	[QZFPower] [nvarchar](20) NULL,
	[QZPPower] [nvarchar](20) NULL,
	[QZGPower] [nvarchar](20) NULL,
	[PFPower] [nvarchar](20) NULL,
	[PFJFPower] [nvarchar](20) NULL,
	[PFFPower] [nvarchar](20) NULL,
	[PFPPower] [nvarchar](20) NULL,
	[PFGPower] [nvarchar](20) NULL,
	[QFPower] [nvarchar](20) NULL,
	[QFJFPower] [nvarchar](20) NULL,
	[QFFPower] [nvarchar](20) NULL,
	[QFPPower] [nvarchar](20) NULL,
	[QFGPower] [nvarchar](20) NULL,
	[Q1Power] [nvarchar](20) NULL,
	[Q1JFPower] [nvarchar](20) NULL,
	[Q1FPower] [nvarchar](20) NULL,
	[Q1PPower] [nvarchar](20) NULL,
	[Q1GPower] [nvarchar](20) NULL,
	[Q2Power] [nvarchar](20) NULL,
	[Q2JFPower] [nvarchar](20) NULL,
	[Q2FPower] [nvarchar](20) NULL,
	[Q2PPower] [nvarchar](20) NULL,
	[Q2GPower] [nvarchar](20) NULL,
	[Q3Power] [nvarchar](20) NULL,
	[Q3JFPower] [nvarchar](20) NULL,
	[Q3FPower] [nvarchar](20) NULL,
	[Q3PPower] [nvarchar](20) NULL,
	[Q3GPower] [nvarchar](20) NULL,
	[Q4Power] [nvarchar](20) NULL,
	[Q4JFPower] [nvarchar](20) NULL,
	[Q4FPower] [nvarchar](20) NULL,
	[Q4PPower] [nvarchar](20) NULL,
	[Q4GPower] [nvarchar](20) NULL,
	[Conclusion] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MeterHungID] ASC,
	[MeasureDegreeID] ASC,
	[TestItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tempdata]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tempdata](
	[Serialno] [nvarchar](50) NULL,
	[Meterno] [nvarchar](50) NULL,
	[Assetno] [nvarchar](50) NULL,
	[barcode] [nvarchar](50) NULL,
	[MeterAddress] [int] NULL,
	[Model] [nvarchar](50) NULL,
	[MadePlace] [nvarchar](50) NULL,
	[TestUnit] [nvarchar](50) NULL,
	[TestDate] [nvarchar](50) NULL,
	[StartDeg] [nvarchar](50) NULL,
	[Enddeg] [nvarchar](50) NULL,
	[Constant] [float] NULL,
	[Class] [float] NULL,
	[Class1] [float] NULL,
	[Voltage] [float] NULL,
	[Current] [float] NULL,
	[CurrentMax] [float] NULL,
	[TestCircs] [nvarchar](20) NULL,
	[Type] [nvarchar](50) NULL,
	[ConstantReactive] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestAffectData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestAffectData](
	[cWayName] [nvarchar](50) NULL,
	[iAffectNo] [smallint] NULL,
	[cAffectName] [nvarchar](50) NULL,
	[cRange] [nvarchar](50) NULL,
	[fVoltage] [float] NULL,
	[fCurrent] [float] NULL,
	[fFrequency] [float] NULL,
	[fAngleA] [float] NULL,
	[fAngleB] [float] NULL,
	[fAngleC] [float] NULL,
	[cABCVoltage] [nvarchar](3) NULL,
	[cABCCurrent] [nvarchar](3) NULL,
	[cLimit] [nvarchar](10) NULL,
	[cBCLimit] [nvarchar](10) NULL,
	[cLoadName] [nvarchar](40) NULL,
	[bFlagTest] [bit] NULL,
	[iCompare] [int] NULL,
	[cXieBo] [nvarchar](50) NULL,
	[fLeanAngle] [float] NULL,
	[bReverse] [bit] NULL,
	[iCircles] [int] NULL,
	[iTestTimes] [tinyint] NULL,
	[ACur] [nvarchar](20) NULL,
	[BCur] [nvarchar](20) NULL,
	[CCur] [nvarchar](20) NULL,
	[AAgl] [nvarchar](20) NULL,
	[BAgl] [nvarchar](20) NULL,
	[CAgl] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestAffectDataStd]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestAffectDataStd](
	[cWayName] [nvarchar](50) NULL,
	[iAffectNo] [smallint] NULL,
	[cAffectName] [nvarchar](50) NULL,
	[cRange] [nvarchar](50) NULL,
	[fVoltage] [float] NULL,
	[fCurrent] [float] NULL,
	[fFrequency] [float] NULL,
	[fAngleA] [float] NULL,
	[fAngleB] [float] NULL,
	[fAngleC] [float] NULL,
	[cABCVoltage] [nvarchar](3) NULL,
	[cABCCurrent] [nvarchar](3) NULL,
	[cLimit] [nvarchar](10) NULL,
	[cBCLimit] [nvarchar](10) NULL,
	[cLoadName] [nvarchar](40) NULL,
	[bFlagTest] [bit] NULL,
	[iCompare] [int] NULL,
	[cXieBo] [nvarchar](50) NULL,
	[fLeanAngle] [float] NULL,
	[bReverse] [bit] NULL,
	[iTestCirCles] [int] NULL,
	[cConstant] [nvarchar](50) NULL,
	[fShowMsg] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestErrorData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestErrorData](
	[cWayName] [nvarchar](50) NULL,
	[iRangeNo] [int] NULL,
	[cRange] [nvarchar](50) NULL,
	[cPrecision] [nvarchar](15) NULL,
	[iPointNo] [int] NULL,
	[cPointName] [nvarchar](30) NULL,
	[iTestTimes] [tinyint] NULL,
	[cUserUpLimit] [nvarchar](10) NULL,
	[cUserDownLimit] [nvarchar](10) NULL,
	[SmaxLimit] [nvarchar](8) NULL,
	[iCircles] [int] NULL,
	[ItnTopErr] [float] NULL,
	[ItnLowerErr] [float] NULL,
	[MtCo] [float] NULL,
	[elem] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestErrorDataStd]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestErrorDataStd](
	[cWayName] [nvarchar](50) NULL,
	[iRangeNo] [int] NULL,
	[cRange] [nvarchar](50) NULL,
	[cPrecision] [nvarchar](15) NULL,
	[iPointNo] [int] NULL,
	[cPointName] [nvarchar](30) NULL,
	[iTestTimes] [tinyint] NULL,
	[cUserUpLimit] [nvarchar](10) NULL,
	[cUserDownLimit] [nvarchar](10) NULL,
	[SmaxLimit] [nvarchar](8) NULL,
	[cVoltage] [nvarchar](12) NULL,
	[cCurrent] [nvarchar](12) NULL,
	[cConstant] [nvarchar](50) NULL,
	[fShowMsg] [bit] NULL,
	[iTestCircles] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestRange]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestRange](
	[MeterID] [float] NULL,
	[RangeCode] [int] NULL,
	[Voltage] [nvarchar](10) NULL,
	[Current] [nvarchar](10) NULL,
	[ConnectMode] [nvarchar](24) NULL,
	[dialtest] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestWayData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestWayData](
	[cWayName] [nvarchar](50) NULL,
	[cBaseRange] [nvarchar](50) NULL,
	[cTestMode] [nvarchar](10) NULL,
	[cInMode] [nvarchar](20) NULL,
	[cMeterType] [nvarchar](20) NULL,
	[cPrecision] [nvarchar](15) NULL,
	[cWayAdjust] [nvarchar](25) NULL,
	[cWayTest] [nvarchar](25) NULL,
	[cWayMultiFunction] [nvarchar](20) NULL,
	[cWaySpeacialTest] [nvarchar](12) NULL,
	[fWarmCurrent] [float] NULL,
	[fWarmTime] [float] NULL,
	[cStartRange] [nvarchar](10) NULL,
	[cStartCurrent] [nvarchar](10) NULL,
	[cStartCurrentP] [nvarchar](10) NULL,
	[cStartCurrentQ] [nvarchar](10) NULL,
	[iStartPulse] [int] NULL,
	[cStartTime] [nvarchar](8) NULL,
	[cStartTimeP] [nvarchar](8) NULL,
	[cStartTimeQ] [nvarchar](8) NULL,
	[cHideRange] [nvarchar](10) NULL,
	[cHideVoltage] [nvarchar](8) NULL,
	[iHideCurrent] [smallint] NULL,
	[iHideTimeMode] [int] NULL,
	[iHidePulse] [int] NULL,
	[cHideTime] [nvarchar](8) NULL,
	[cHideTimeP] [nvarchar](8) NULL,
	[cHideTimeQ] [nvarchar](8) NULL,
	[fErrorUpLimit] [float] NULL,
	[fErrorDownLimit] [float] NULL,
	[iErrorSmax] [smallint] NULL,
	[cErrorSmaxRange] [nvarchar](10) NULL,
	[iErrorIbCircle] [smallint] NULL,
	[iWalkMode] [int] NULL,
	[iWalkPara] [float] NULL,
	[iWalkAutoRead] [int] NULL,
	[cWalkRange] [nvarchar](10) NULL,
	[cPeriodType] [nvarchar](10) NULL,
	[iPeriodWalk] [int] NULL,
	[iDemandTestTime] [int] NULL,
	[iDemandTestCycle] [smallint] NULL,
	[iDayCircle] [smallint] NULL,
	[iDayTimes] [smallint] NULL,
	[fPeriodWalkE] [float] NULL,
	[iDemandTestEvent] [smallint] NULL,
	[fStdVoltage] [nvarchar](20) NULL,
	[fStdCurrent] [nvarchar](20) NULL,
	[fStdConstant] [float] NULL,
	[fStdFrequency] [float] NULL,
	[cType] [nvarchar](30) NULL,
	[cProtocal] [nvarchar](30) NULL,
	[cStopBack] [nvarchar](8) NULL,
	[cPrecisionQ] [nvarchar](15) NULL,
	[cFactory] [nvarchar](50) NULL,
	[cVoltageLimit] [nvarchar](10) NULL,
	[cCurrentLimit] [nvarchar](10) NULL,
	[iPulseMode] [smallint] NULL,
	[cWalkLimit] [nvarchar](50) NULL,
	[cWalkLimit2] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestWayDataStd]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestWayDataStd](
	[cWayName] [nvarchar](50) NULL,
	[cBaseRange] [nvarchar](50) NULL,
	[cTestMode] [nvarchar](10) NULL,
	[cInMode] [nvarchar](20) NULL,
	[cMeterType] [nvarchar](20) NULL,
	[cPrecision] [nvarchar](15) NULL,
	[cWayAdjust] [nvarchar](25) NULL,
	[cWayTest] [nvarchar](25) NULL,
	[cWayMultiFunction] [nvarchar](20) NULL,
	[cWaySpeacialTest] [nvarchar](12) NULL,
	[fWarmCurrent] [float] NULL,
	[fWarmTime] [float] NULL,
	[cStartRange] [nvarchar](10) NULL,
	[cStartCurrent] [nvarchar](10) NULL,
	[cStartCurrentP] [nvarchar](10) NULL,
	[cStartCurrentQ] [nvarchar](10) NULL,
	[iStartPulse] [int] NULL,
	[cStartTime] [nvarchar](8) NULL,
	[cStartTimeP] [nvarchar](8) NULL,
	[cStartTimeQ] [nvarchar](8) NULL,
	[cHideRange] [nvarchar](10) NULL,
	[cHideVoltage] [nvarchar](8) NULL,
	[iHideCurrent] [smallint] NULL,
	[iHideTimeMode] [int] NULL,
	[iHidePulse] [int] NULL,
	[cHideTime] [nvarchar](8) NULL,
	[cHideTimeP] [nvarchar](8) NULL,
	[cHideTimeQ] [nvarchar](8) NULL,
	[fErrorUpLimit] [float] NULL,
	[fErrorDownLimit] [float] NULL,
	[iErrorSmax] [smallint] NULL,
	[cErrorSmaxRange] [nvarchar](10) NULL,
	[iErrorIbCircle] [smallint] NULL,
	[iWalkMode] [int] NULL,
	[iWalkPara] [float] NULL,
	[iWalkAutoRead] [int] NULL,
	[cWalkRange] [nvarchar](10) NULL,
	[cPeriodType] [nvarchar](10) NULL,
	[iPeriodWalk] [int] NULL,
	[iDemandTestTime] [int] NULL,
	[iDemandTestCycle] [smallint] NULL,
	[iDayCircle] [smallint] NULL,
	[iDayTimes] [smallint] NULL,
	[fPeriodWalkE] [float] NULL,
	[iDemandTestEvent] [smallint] NULL,
	[fStdVoltage] [float] NULL,
	[fStdCurrent] [float] NULL,
	[fStdConstant] [float] NULL,
	[fStdFrequency] [float] NULL,
	[cType] [nvarchar](30) NULL,
	[cProtocal] [nvarchar](30) NULL,
	[cStopBack] [nvarchar](8) NULL,
	[cPrecisionQ] [nvarchar](15) NULL,
	[cFactory] [nvarchar](50) NULL,
	[cVoltageLimit] [nvarchar](10) NULL,
	[cCurrentLimit] [nvarchar](10) NULL,
	[iPulseMode] [smallint] NULL,
	[cWalkLimit] [nvarchar](50) NULL,
	[cWalkLimit2] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TmpCommResult]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TmpCommResult](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IndexID] [int] NULL,
	[Conclusion] [nvarchar](6) NULL,
	[CommDate] [nvarchar](16) NULL,
	[CommTime] [nvarchar](16) NULL,
	[CommPeriodTime1] [nvarchar](16) NULL,
	[CommPeriodTime2] [nvarchar](16) NULL,
	[CommPeriodTime3] [nvarchar](16) NULL,
	[CommPeriodTime4] [nvarchar](16) NULL,
	[CommDemandZyAll] [nvarchar](16) NULL,
	[CommDemandZyI] [nvarchar](16) NULL,
	[CommDemandZyII] [nvarchar](16) NULL,
	[CommDemandZyIII] [nvarchar](16) NULL,
	[CommDemandZyIV] [nvarchar](16) NULL,
	[CommDemandFyAll] [nvarchar](16) NULL,
	[CommDemandFyI] [nvarchar](16) NULL,
	[CommDemandFyII] [nvarchar](16) NULL,
	[CommDemandFyIII] [nvarchar](16) NULL,
	[CommDemandFyIV] [nvarchar](16) NULL,
	[CommDemandZwAll] [nvarchar](16) NULL,
	[CommDemandZwI] [nvarchar](16) NULL,
	[CommDemandZwII] [nvarchar](16) NULL,
	[CommDemandZwIII] [nvarchar](16) NULL,
	[CommDemandZwIV] [nvarchar](16) NULL,
	[CommDemandFwAll] [nvarchar](16) NULL,
	[CommDemandFwI] [nvarchar](16) NULL,
	[CommDemandFwII] [nvarchar](16) NULL,
	[CommDemandFwIII] [nvarchar](16) NULL,
	[CommDemandFwIV] [nvarchar](16) NULL,
	[A_NowV] [nvarchar](12) NULL,
	[A_NowC] [nvarchar](12) NULL,
	[A_NowP] [nvarchar](12) NULL,
	[A_NowQ] [nvarchar](12) NULL,
	[B_NowV] [nvarchar](12) NULL,
	[B_NowC] [nvarchar](12) NULL,
	[B_NowP] [nvarchar](12) NULL,
	[B_NowQ] [nvarchar](12) NULL,
	[C_NowV] [nvarchar](12) NULL,
	[C_NowC] [nvarchar](12) NULL,
	[C_NowP] [nvarchar](12) NULL,
	[C_NowQ] [nvarchar](12) NULL,
	[State_Meter] [nvarchar](12) NULL,
	[State_Net] [nvarchar](12) NULL,
	[State_Week] [nvarchar](12) NULL,
	[OffVol_A_Start] [nvarchar](16) NULL,
	[OffVol_A_End] [nvarchar](16) NULL,
	[OffVol_A_Times] [nvarchar](12) NULL,
	[OffVol_B_Start] [nvarchar](16) NULL,
	[OffVol_B_End] [nvarchar](16) NULL,
	[OffVol_B_Times] [nvarchar](12) NULL,
	[OffVol_C_Start] [nvarchar](16) NULL,
	[OffVol_C_End] [nvarchar](16) NULL,
	[OffVol_C_Times] [nvarchar](12) NULL,
	[CommDemandCycle] [nvarchar](16) NULL,
	[CommDemandSlider] [nvarchar](16) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TmpError]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TmpError](
	[IndexID] [smallint] NULL,
	[iRangeNo] [int] NULL,
	[cRange] [nvarchar](50) NULL,
	[iPointNo] [int] NULL,
	[cPointName] [nvarchar](50) NULL,
	[cError] [nvarchar](255) NULL,
	[cAveData] [nvarchar](10) NULL,
	[cCIData] [nvarchar](10) NULL,
	[cSmax] [nvarchar](10) NULL,
	[bOverLimit] [bit] NOT NULL,
	[hipluses] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TmpMultiResult]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TmpMultiResult](
	[MeterID] [int] NOT NULL,
	[commtest] [nvarchar](6) NULL,
	[statetest] [nvarchar](6) NULL,
	[memotest] [nvarchar](6) NULL,
	[GPStest] [nvarchar](6) NULL,
	[GPSerror] [nvarchar](20) NULL,
	[DAYtest] [nvarchar](6) NULL,
	[DAYerror] [nvarchar](10) NULL,
	[TIMEsect] [nvarchar](6) NULL,
	[TIMEerror] [nvarchar](6) NULL,
	[combinErrT] [nvarchar](6) NULL,
	[ShowValueErrT] [nvarchar](6) NULL,
	[FeeErrT] [nvarchar](6) NULL,
	[VOLtageDrop] [nvarchar](6) NULL,
	[JStandardTQ] [datetime] NULL,
	[JFactTQ] [datetime] NULL,
	[JError] [nvarchar](20) NULL,
	[JTstart] [nvarchar](20) NULL,
	[JTend] [nvarchar](20) NULL,
	[JTvalue] [nvarchar](20) NULL,
	[Jstart] [nvarchar](20) NULL,
	[Jend] [nvarchar](20) NULL,
	[Jvalue] [nvarchar](20) NULL,
	[JcombinErr] [nvarchar](20) NULL,
	[FStandardTQ] [datetime] NULL,
	[FFactTQ] [datetime] NULL,
	[FError] [nvarchar](20) NULL,
	[FTstart] [nvarchar](20) NULL,
	[FTend] [nvarchar](20) NULL,
	[FTvalue] [nvarchar](20) NULL,
	[Fstart] [nvarchar](20) NULL,
	[Fend] [nvarchar](20) NULL,
	[Fvalue] [nvarchar](20) NULL,
	[FcombinErr] [nvarchar](20) NULL,
	[PStandardTQ] [datetime] NULL,
	[PFactTQ] [datetime] NULL,
	[PError] [nvarchar](20) NULL,
	[PTstart] [nvarchar](20) NULL,
	[PTend] [nvarchar](20) NULL,
	[PTvalue] [nvarchar](20) NULL,
	[Pstart] [nvarchar](20) NULL,
	[Pend] [nvarchar](20) NULL,
	[Pvalue] [nvarchar](20) NULL,
	[PcombinErr] [nvarchar](20) NULL,
	[GStandardTQ] [datetime] NULL,
	[GFactTQ] [datetime] NULL,
	[GError] [nvarchar](20) NULL,
	[GTstart] [nvarchar](20) NULL,
	[GTend] [nvarchar](20) NULL,
	[GTvalue] [nvarchar](20) NULL,
	[Gstart] [nvarchar](20) NULL,
	[Gand] [nvarchar](20) NULL,
	[Gvalue] [nvarchar](20) NULL,
	[GcombinErr] [nvarchar](20) NULL,
	[ShowStd] [nvarchar](20) NULL,
	[SHowMeter] [nvarchar](20) NULL,
	[SHowValueErr] [nvarchar](20) NULL,
	[MaxR01ibT] [nvarchar](6) NULL,
	[MaxR1ibT] [nvarchar](6) NULL,
	[MaxRImaxT] [nvarchar](6) NULL,
	[RequireT] [nvarchar](6) NULL,
	[MaxR01ibSV] [nvarchar](20) NULL,
	[MaxR01ibFV] [nvarchar](20) NULL,
	[MaxR01ibE] [nvarchar](20) NULL,
	[MaxR1ibSV] [nvarchar](20) NULL,
	[MaxR1ibFV] [nvarchar](20) NULL,
	[MaxR1ibE] [nvarchar](20) NULL,
	[MaxRImaxSV] [nvarchar](20) NULL,
	[MaxRImaxFV] [nvarchar](20) NULL,
	[MaxRImaxE] [nvarchar](20) NULL,
	[Requirep] [int] NULL,
	[Requireperr] [nvarchar](20) NULL,
	[JYZD] [nvarchar](20) NULL,
	[JYFD] [nvarchar](20) NULL,
	[JWZD] [nvarchar](20) NULL,
	[JWFD] [nvarchar](20) NULL,
	[JW1D] [nvarchar](20) NULL,
	[JW2D] [nvarchar](20) NULL,
	[JW3D] [nvarchar](20) NULL,
	[JW4D] [nvarchar](20) NULL,
	[FYZD] [nvarchar](20) NULL,
	[FYFD] [nvarchar](20) NULL,
	[FWZD] [nvarchar](20) NULL,
	[FWFD] [nvarchar](20) NULL,
	[FW1D] [nvarchar](20) NULL,
	[FW2D] [nvarchar](20) NULL,
	[FW3D] [nvarchar](20) NULL,
	[FW4D] [nvarchar](20) NULL,
	[PYZD] [nvarchar](20) NULL,
	[PYFD] [nvarchar](20) NULL,
	[PWZD] [nvarchar](20) NULL,
	[PWFD] [nvarchar](20) NULL,
	[PW1D] [nvarchar](20) NULL,
	[PW2D] [nvarchar](20) NULL,
	[PW3D] [nvarchar](20) NULL,
	[PW4D] [nvarchar](20) NULL,
	[GYZD] [nvarchar](20) NULL,
	[GYFD] [nvarchar](20) NULL,
	[GWZD] [nvarchar](20) NULL,
	[GWFD] [nvarchar](20) NULL,
	[GW1D] [nvarchar](20) NULL,
	[GW2D] [nvarchar](20) NULL,
	[GW3D] [nvarchar](20) NULL,
	[GW4D] [nvarchar](20) NULL,
	[ZYZD] [nvarchar](20) NULL,
	[ZYFD] [nvarchar](20) NULL,
	[ZWZD] [nvarchar](20) NULL,
	[ZWFD] [nvarchar](20) NULL,
	[ZW1D] [nvarchar](20) NULL,
	[ZW2D] [nvarchar](20) NULL,
	[ZW3D] [nvarchar](20) NULL,
	[ZW4D] [nvarchar](20) NULL,
	[GPSSetTime] [nvarchar](20) NULL,
	[GPSGetTime] [nvarchar](20) NULL,
	[EndEj] [nvarchar](20) NULL,
	[EndEf] [nvarchar](20) NULL,
	[EndEp] [nvarchar](20) NULL,
	[EndEg] [nvarchar](20) NULL,
	[EndE0] [nvarchar](20) NULL,
	[CombinErr] [nvarchar](20) NULL,
	[VolDropLimit] [nvarchar](20) NULL,
	[VolDropPulse] [nvarchar](20) NULL,
	[MemoRule] [nvarchar](20) NULL,
	[EventRecord] [nvarchar](6) NULL,
	[EventClearTimes1] [nvarchar](10) NULL,
	[EventMeterTime] [nvarchar](20) NULL,
	[EventClearTimes2] [nvarchar](10) NULL,
	[EventClearTime2] [nvarchar](20) NULL,
	[JYZD_S] [nvarchar](20) NULL,
	[JYFD_S] [nvarchar](20) NULL,
	[JWZD_S] [nvarchar](20) NULL,
	[JWFD_S] [nvarchar](20) NULL,
	[FYZD_S] [nvarchar](20) NULL,
	[FYFD_S] [nvarchar](20) NULL,
	[FWZD_S] [nvarchar](20) NULL,
	[FWFD_S] [nvarchar](20) NULL,
	[PYZD_S] [nvarchar](20) NULL,
	[PYFD_S] [nvarchar](20) NULL,
	[PWZD_S] [nvarchar](20) NULL,
	[PWFD_S] [nvarchar](20) NULL,
	[GYZD_S] [nvarchar](20) NULL,
	[GYFD_S] [nvarchar](20) NULL,
	[GWZD_S] [nvarchar](20) NULL,
	[GWFD_S] [nvarchar](20) NULL,
	[ZYZD_S] [nvarchar](20) NULL,
	[ZYFD_S] [nvarchar](20) NULL,
	[ZWZD_S] [nvarchar](20) NULL,
	[ZWFD_S] [nvarchar](20) NULL,
	[BeginTime] [nvarchar](20) NULL,
	[EndTime] [nvarchar](20) NULL,
	[MaxR005ibSV] [nvarchar](12) NULL,
	[MaxR005ibFV] [nvarchar](12) NULL,
	[MaxR005ibE] [nvarchar](12) NULL,
	[MaxR005ibT] [nvarchar](12) NULL,
	[RequireperrAve] [nvarchar](12) NULL,
	[DayErr1] [nvarchar](12) NULL,
	[DayErr2] [nvarchar](12) NULL,
	[DayErr3] [nvarchar](12) NULL,
	[DayErr4] [nvarchar](12) NULL,
	[DayErr5] [nvarchar](12) NULL,
	[DayErr6] [nvarchar](12) NULL,
	[DayErr7] [nvarchar](12) NULL,
	[DayErr8] [nvarchar](12) NULL,
	[DayErr9] [nvarchar](12) NULL,
	[DayErr10] [nvarchar](12) NULL,
	[DayErrAve] [nvarchar](12) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpresult]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpresult](
	[MeterID] [float] NULL,
	[Hidetest] [nvarchar](255) NULL,
	[Starttest] [nvarchar](255) NULL,
	[WalkTest] [nvarchar](255) NULL,
	[HideTest1] [nvarchar](255) NULL,
	[HideTest2] [nvarchar](255) NULL,
	[HideTest3] [nvarchar](255) NULL,
	[HideTest4] [nvarchar](255) NULL,
	[StartTest1] [nvarchar](255) NULL,
	[StartTest2] [nvarchar](255) NULL,
	[StartTest3] [nvarchar](255) NULL,
	[StartTest4] [nvarchar](255) NULL,
	[WalkTest1] [nvarchar](255) NULL,
	[WalkTest2] [nvarchar](255) NULL,
	[WalkTest3] [nvarchar](255) NULL,
	[WalkTest4] [nvarchar](255) NULL,
	[StartTime1] [nvarchar](255) NULL,
	[StartTime2] [nvarchar](255) NULL,
	[StartTime3] [nvarchar](255) NULL,
	[StartTime4] [nvarchar](255) NULL,
	[StartCurrent1] [nvarchar](255) NULL,
	[StartCurrent2] [nvarchar](255) NULL,
	[StartCurrent3] [nvarchar](255) NULL,
	[StartCurrent4] [nvarchar](255) NULL,
	[StartTimeT1] [nvarchar](255) NULL,
	[StartTimeT2] [nvarchar](255) NULL,
	[StartTimeT3] [nvarchar](255) NULL,
	[StartTimeT4] [nvarchar](255) NULL,
	[HideTime1] [nvarchar](255) NULL,
	[HideTime2] [nvarchar](255) NULL,
	[HideTime3] [nvarchar](255) NULL,
	[HideTime4] [nvarchar](255) NULL,
	[HideVoltage1] [nvarchar](255) NULL,
	[HideVoltage2] [nvarchar](255) NULL,
	[HideVoltage3] [nvarchar](255) NULL,
	[HideVoltage4] [nvarchar](255) NULL,
	[HideTimeT1] [nvarchar](255) NULL,
	[HideTimeT2] [nvarchar](255) NULL,
	[HideTimeT3] [nvarchar](255) NULL,
	[HideTimeT4] [nvarchar](255) NULL,
	[WalkValue1] [nvarchar](255) NULL,
	[WalkValue2] [nvarchar](255) NULL,
	[WalkValue3] [nvarchar](255) NULL,
	[WalkValue4] [nvarchar](255) NULL,
	[WalkValueT1] [nvarchar](255) NULL,
	[WalkValueT2] [nvarchar](255) NULL,
	[WalkValueT3] [nvarchar](255) NULL,
	[WalkValueT4] [nvarchar](255) NULL,
	[WalkError1] [nvarchar](255) NULL,
	[WalkError2] [nvarchar](255) NULL,
	[WalkError3] [nvarchar](255) NULL,
	[WalkError4] [nvarchar](255) NULL,
	[PulseWidth] [nvarchar](255) NULL,
	[PulseWidth1] [nvarchar](255) NULL,
	[PulseWidth2] [nvarchar](255) NULL,
	[PulseWidth3] [nvarchar](255) NULL,
	[PulseWidth4] [nvarchar](255) NULL,
	[PulseWidthV1] [nvarchar](255) NULL,
	[PulseWidthV2] [nvarchar](255) NULL,
	[PulseWidthV3] [nvarchar](255) NULL,
	[PulseWidthV4] [nvarchar](255) NULL,
	[PulseHeight] [nvarchar](255) NULL,
	[PulseHeight1] [nvarchar](255) NULL,
	[PulseHeight2] [nvarchar](255) NULL,
	[PulseHeight3] [nvarchar](255) NULL,
	[PulseHeight4] [nvarchar](255) NULL,
	[PulseHeightV1] [nvarchar](255) NULL,
	[PulseHeightV2] [nvarchar](255) NULL,
	[PulseHeightV3] [nvarchar](255) NULL,
	[PulseHeightV4] [nvarchar](255) NULL,
	[WalkValueS1] [nvarchar](255) NULL,
	[WalkValueS2] [nvarchar](255) NULL,
	[WalkValueS3] [nvarchar](255) NULL,
	[WalkValueS4] [nvarchar](255) NULL,
	[WalkValueE1] [nvarchar](255) NULL,
	[WalkValueE2] [nvarchar](255) NULL,
	[WalkValueE3] [nvarchar](255) NULL,
	[WalkValueE4] [nvarchar](255) NULL,
	[WalkError_Pulse1] [nvarchar](255) NULL,
	[WalkError_Pulse2] [nvarchar](255) NULL,
	[WalkError_Pulse3] [nvarchar](255) NULL,
	[WalkError_Pulse4] [nvarchar](255) NULL,
	[WalkLimit] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TmpSpecialError]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TmpSpecialError](
	[IndexID] [smallint] NULL,
	[iRangeNo] [int] NULL,
	[cRange] [nvarchar](50) NULL,
	[cError] [nvarchar](100) NULL,
	[cAveData] [nvarchar](10) NULL,
	[cCIData] [nvarchar](10) NULL,
	[cSmax] [nvarchar](10) NULL,
	[bOverLimit] [bit] NULL,
	[cAffectV] [nvarchar](10) NULL,
	[cStdCIData] [nvarchar](10) NULL,
	[cStdAveData] [nvarchar](10) NULL,
	[cConnect] [nvarchar](50) NULL,
	[fVoltage] [float] NULL,
	[fCurrent] [float] NULL,
	[fFrequency] [float] NULL,
	[fAngleA] [float] NULL,
	[fAngleB] [float] NULL,
	[fAngleC] [float] NULL,
	[cABCVoltage] [nvarchar](3) NULL,
	[cABCCurrent] [nvarchar](3) NULL,
	[cLimit] [nvarchar](10) NULL,
	[cBCLimit] [nvarchar](10) NULL,
	[cLoadName] [nvarchar](40) NULL,
	[bFlagTest] [bit] NULL,
	[iCompare] [int] NULL,
	[cXieBo] [nvarchar](50) NULL,
	[fLeanAngle] [float] NULL,
	[bReverse] [bit] NULL,
	[iCircles] [int] NULL,
	[iTestTimes] [tinyint] NULL,
	[ACur] [nvarchar](20) NULL,
	[BCur] [nvarchar](20) NULL,
	[CCur] [nvarchar](20) NULL,
	[AAgl] [nvarchar](20) NULL,
	[BAgl] [nvarchar](20) NULL,
	[CAgl] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Txmcode]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Txmcode](
	[Id] [int] NULL,
	[TxmOption] [nvarchar](20) NULL,
	[StarCode] [smallint] NULL,
	[EndCode] [smallint] NULL,
	[TxmCode] [nvarchar](20) NULL,
	[TxmCodeText] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Txmway]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Txmway](
	[Txmid] [int] NULL,
	[TxmOK] [int] NULL,
	[Txmname] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UseData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseData](
	[cType] [nvarchar](50) NULL,
	[cValue] [nvarchar](80) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserData](
	[ID] [int] NOT NULL,
	[USER] [nvarchar](20) NULL,
	[PASSWORD] [nvarchar](20) NULL,
	[Propertiy] [nvarchar](50) NULL,
	[WRITE] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[XieBoData]    Script Date: 2025/1/20 15:34:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XieBoData](
	[cName] [nvarchar](50) NULL,
	[cType] [nvarchar](2) NULL,
	[Times] [float] NULL,
	[Share] [float] NULL,
	[Angle] [int] NULL,
	[IsIn] [bit] NULL,
	[Mode] [smallint] NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[dbTDtblTestResult03]  WITH CHECK ADD CHECK  (([Conclusion]=(1) OR [Conclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult03]  WITH CHECK ADD CHECK  (([Conclusion]=(1) OR [Conclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult05]  WITH CHECK ADD CHECK  (([Conclusion]=(1) OR [Conclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult05]  WITH CHECK ADD CHECK  (([Conclusion]=(1) OR [Conclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult06]  WITH CHECK ADD CHECK  (([Conclusion]=(1) OR [Conclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult06]  WITH CHECK ADD CHECK  (([Conclusion]=(1) OR [Conclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult07]  WITH CHECK ADD CHECK  (([Conclusion]=(1) OR [Conclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult07]  WITH CHECK ADD CHECK  (([Conclusion]=(1) OR [Conclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult07]  WITH CHECK ADD CHECK  (([FengConclusion]=(1) OR [FengConclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult07]  WITH CHECK ADD CHECK  (([FengConclusion]=(1) OR [FengConclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult07]  WITH CHECK ADD CHECK  (([GuConclusion]=(1) OR [GuConclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult07]  WITH CHECK ADD CHECK  (([GuConclusion]=(1) OR [GuConclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult07]  WITH CHECK ADD CHECK  (([JianFengConclusion]=(1) OR [JianFengConclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult07]  WITH CHECK ADD CHECK  (([JianFengConclusion]=(1) OR [JianFengConclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult07]  WITH CHECK ADD CHECK  (([PingConclusion]=(1) OR [PingConclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult07]  WITH CHECK ADD CHECK  (([PingConclusion]=(1) OR [PingConclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult08]  WITH CHECK ADD CHECK  (([Conclusion]=(1) OR [Conclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult08]  WITH CHECK ADD CHECK  (([Conclusion]=(1) OR [Conclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult10]  WITH CHECK ADD CHECK  (([Conclusion]=(1) OR [Conclusion]=(0)))
GO
ALTER TABLE [dbo].[dbTDtblTestResult10]  WITH CHECK ADD CHECK  (([Conclusion]=(1) OR [Conclusion]=(0)))
GO
