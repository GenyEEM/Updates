unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzLabel, Mask, RzEdit, RzSpnEdt, RzTabs,
  ExtCtrls, RzPanel, RzDlgBtn, RzRadGrp, RzRadChk, RzCmboBx, RzStatus, Grids,
  RzGrids, uClampTest, uMyComm, CboPortList, uClampTestData, StringGridYC,
  UTestBench, RefMeter, RdUtils, ActnList, ImgList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, RzBtnEdt, uConvertHarnpuDB,
  RzPrgres, RzShellDialogs, DBGrids, RzDBGrid, unit_CommG, XLSReadWriteII4,
  Cell4, XLSUtils4, Tabs, ComCtrls, RzLstBox, uCommRelayRoutine, OleServer,
  GenyCommunication_TLB, uMeterCalRoutine, umeterCalcomm, uMeterCalData,
  uCmd158Readings,uComm158Readings, uRoutine158Readings, uTypeHarmonic,
  RzTreeVw, RzGroupBar, RzSplit, GenyYCSS_TLB, UTypes, uPreciOutput, uMultiTestSys,
  uCmdPowerConsumption, uRoPowerConsum, Unit_ICTdata, uPhaseAngle;

resourcestring
  StrPortIsOpened = 'port is opened!';
  StrWorkingState7 = 'it''s ICT testing of Device ID: %d';

  SNameOfPanel = 'rzpnlIct';
  SNameOfButtRead = 'btnRead';
  SNameOfButtReset = 'btnReset';
  SNameOfShape = 'shp';
  SNameOfLable = 'ictlbl';

  sPhaseAngleSymbol= 'φ';
  sDailTestImpAccum = ' Ref. impulses reading: ';
  sDailTestPowerAccum = ' Power accumulation: ';
  sMaxDemandMeanPower = ' Mean Power: ' ;

  sCommAgentFileName = 'Communication.exe';  // for Model G test bench
  sOutPut_U = 'voltage';
  sOutput_I = 'current';
  sOutput_Fre = 'freqence';
  sOutput_PhUI = 'Phase U-I';
  sOutput_PhUU = 'phase U-U';
  //Error Calc Func
  sNormalError ='Normal error test';
  sClockError = 'Clock error test';
  sDemandCycle = 'Demand cycle test';
  sStartingTest = 'Starting test';
  sCreepTest = 'Creep test';
  sDailTest = 'Dail test';
  sColorMark = 'Black mark procedure';
  sGetError = 'To get error data';
  sDoubleLoop = 'Current loop switching' ;

type


  TKindofRoutine4IS = (kofCreepTestIS, kofStartTestIS);
  TCreepTestRec = record
    T1, T2: TDateTime ;
    PulseNum : LongWord ;
  end;
  PCreepTestRec = ^TCreepTestRec;

  TKindOfCommPort = (kofTestBoardComm, kofICTComm);
  TMyColumn = 1..255;
  TMyGridColSet = set of TMyColumn;
  TStatus_RS485 = (RS485_open, RS485_close);
  TGenyChannel = 1..20;
  TKindOfTestBench = (kofTypeD, kofYC99T5C, kofYC99T3C, kofYC92B);

  TForm1 = class(TForm)
    RzDialogButtons1: TRzDialogButtons;
    actlst1: TActionList;
    actTestOpenBox: TAction;
    RzMemo1: TRzMemo;
    actCloseWin: TAction;
    actOutput_Voltage: TAction;
    actSendCommand: TAction;
    actReset_Voltage: TAction;
    actOutput_Current: TAction;
    actReset_Current: TAction;
    actNeturelControl: TAction;
    actNeturelReset: TAction;
    actTestCtrConnMode: TAction;
    actRoutine1: TAction;
    actReadMeasuredData: TAction;
    RzStatusBar1: TRzStatusBar;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    RzVersionInfo1: TRzVersionInfo;
    actOutput1P3W: TAction;
    actResetOutput: TAction;
    actReOutput: TAction;
    actRaiseV: TAction;
    actAdjustV: TAction;
    actSetErr: TAction;
    actReadErr: TAction;
    actOutput_Cos: TAction;
    actOutput_Cos_1: TAction;
    actSetErrorTest: TAction;
    actSetCreepingTest: TAction;
    actSetStartingTest: TAction;
    actReadCreepingData: TAction;
    actReadStartingTestData: TAction;
    actClampTestOn: TAction;
    actClampTestOff: TAction;
    rzstsbr1: TRzStatusBar;
    rztlbr1: TRzToolbar;
    btnConfig: TRzToolButton;
    actOpenConfigration: TAction;
    actShakeHand: TAction;
    actSetChkpToClamp: TAction;
    actGetResult: TAction;
    actAutoCalc: TAction;
    tmr1: TTimer;
    actOutput_UPhase: TAction;
    actDebugRead158Params: TAction;
    actDEbugWriteFinetune: TAction;
    actDebugCalcFinetune: TAction;
    actDebugReadRef: TAction;
    actDebugWriteToINI: TAction;
    actDebugReadFinetune: TAction;
    actDebugAutoAdjust: TAction;
    actDebugSaveFinetuneTo158: TAction;
    actRS485CloseALLPorts: TAction;
    actRs485OpenAPort: TAction;
    actRs485CloseAPort: TAction;
    actReadStartingPulseTime: TAction;
    actFreqSet: TAction;
    actStartDialTest: TAction;
    actGetVerInfo: TAction;
    actRadRDInstMetricTable: TAction;
    actRadRDSetPulseRate: TAction;
    actRRGetPulseRate: TAction;
    actUnlockES30B: TAction;
    YCMeter1: TYCMeter;
    actTestCmd_F001: TAction;
    actTestCMD_F002: TAction;
    actTestCMD_F010: TAction;
    actTestCMD_F011: TAction;
    actTestCMD_F012: TAction;
    actTestCMD_F013: TAction;
    actTestCMD_F014: TAction;
    actTestCMD_F015: TAction;
    actTestCMD_F016: TAction;
    Action7: TAction;
    RzPageControl1: TRzPageControl;
    RzTabSheet2: TRzTabSheet;
    RzLabel1: TRzLabel;
    RzLabel17: TRzLabel;
    RzSpinEdit1: TRzSpinEdit;
    RzPanel1: TRzPanel;
    RzLabel2: TRzLabel;
    RzBitBtn1: TRzBitBtn;
    RzSpinEdit2: TRzSpinEdit;
    RzSpinEdit7: TRzSpinEdit;
    TabSheet1: TRzTabSheet;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel16: TRzLabel;
    rzlbl5: TRzLabel;
    rzlbl7: TRzLabel;
    bvl1: TBevel;
    RzLabel42: TRzLabel;
    RzCheckGroup1: TRzCheckGroup;
    RzNumericEdit1: TRzNumericEdit;
    RzNumericEdit2: TRzNumericEdit;
    RzComboBox1: TRzComboBox;
    RzButton7: TRzButton;
    RzRadioGroup1: TRzRadioGroup;
    RzCheckBox1: TRzCheckBox;
    RzButton8: TRzButton;
    rzedtUPhase1: TRzNumericEdit;
    rzedtUPhase2: TRzNumericEdit;
    btnOutput_UPhase: TRzButton;
    rzchckbx1: TRzCheckBox;
    RzNumericEdit7: TRzNumericEdit;
    RzButton22: TRzButton;
    RzButton10: TRzButton;
    RzRadioGroup5: TRzRadioGroup;
    TabSheet6: TRzTabSheet;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    RzLabel36: TRzLabel;
    RzBitBtn2: TRzBitBtn;
    rzGrd158Param: TRzStringGrid;
    btBtnWriteFinetune: TRzBitBtn;
    rzGrdWriteKb: TRzStringGrid;
    rzrdgrpFinetune: TRzRadioGroup;
    RzRadioGroup2: TRzRadioGroup;
    RzBitBtn3: TRzBitBtn;
    StringGridYC1: TStringGridYC;
    RzBitBtn4: TRzBitBtn;
    RzCheckBox3: TRzCheckBox;
    RzBitBtn5: TRzBitBtn;
    RzBitBtn6: TRzBitBtn;
    RzBitBtn7: TRzBitBtn;
    edtWaitTime: TRzNumericEdit;
    rztbshtOnClick: TRzTabSheet;
    rzlbl17: TRzLabel;
    rzlbl16: TRzLabel;
    rzpnl1: TRzPanel;
    rzlbl4: TRzLabel;
    rzlbl_U3: TRzLabel;
    rzlbl6: TRzLabel;
    rzlbl_I3: TRzLabel;
    rzedt_U3: TRzNumericEdit;
    rzedt_I3: TRzNumericEdit;
    rzpnl2: TRzPanel;
    rzlbl8: TRzLabel;
    rzlbl_U1: TRzLabel;
    rzlbl10: TRzLabel;
    rzlbl_I1: TRzLabel;
    rzedt_U1: TRzNumericEdit;
    rzedt_I1: TRzNumericEdit;
    rzpnl3: TRzPanel;
    rzlbl12: TRzLabel;
    rzlbl_U2: TRzLabel;
    rzlbl14: TRzLabel;
    rzlbl_I2: TRzLabel;
    rzedt_U2: TRzNumericEdit;
    rzedt_I2: TRzNumericEdit;
    btnOneClickOn: TRzButton;
    rzedt9: TRzNumericEdit;
    rzrdgrp1: TRzRadioGroup;
    btnSaveAdjustment: TRzButton;
    TabSheet4: TRzTabSheet;
    RzLabel26: TRzLabel;
    RzLabel27: TRzLabel;
    RzLabel28: TRzLabel;
    RzLabel29: TRzLabel;
    RzLabel30: TRzLabel;
    rzedtHeadPos: TRzNumericEdit;
    rzedtCircleNbr: TRzNumericEdit;
    rzedtCx: TRzNumericEdit;
    rzedtCo: TRzNumericEdit;
    RzButton11: TRzButton;
    RzButton14: TRzButton;
    rzedtAccessNbr: TRzNumericEdit;
    RzPanel5: TRzPanel;
    RzLabel38: TRzLabel;
    RzLabel39: TRzLabel;
    RzLabel40: TRzLabel;
    RzLabel41: TRzLabel;
    edtDuration: TRzNumericEdit;
    edtSamples: TRzNumericEdit;
    btnSetCreeping: TRzButton;
    btnSetStarting: TRzButton;
    TabSheet3: TRzTabSheet;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel24: TRzLabel;
    RzLabel22: TRzLabel;
    RzLabel25: TRzLabel;
    rzedtU0: TRzNumericEdit;
    rzedtU1: TRzNumericEdit;
    RzButton12: TRzButton;
    RzButton13: TRzButton;
    RzCheckGroup2: TRzCheckGroup;
    rzspndtU: TRzSpinEdit;
    rzspndtAmp: TRzSpinEdit;
    TabSheet5: TRzTabSheet;
    rzlbl2: TRzLabel;
    rzlbl1: TRzLabel;
    rzlbl3: TRzLabel;
    rzchckgrp1: TRzCheckGroup;
    rzstrngrd1: TRzStringGrid;
    btnClampTestOn: TRzButton;
    btnClampTestOff: TRzButton;
    rzcmbx1: TRzComboBox;
    rzrdgrp2: TRzRadioGroup;
    rzcmbx2: TRzComboBox;
    btnClampCheckResult: TRzButton;
    cbprtlst1: TCboPortList;
    btnShakeHand: TRzButton;
    btnSetCT: TRzButton;
    btnAutoCalc: TRzButton;
    TabSheet7: TRzTabSheet;
    RzButton18: TRzButton;
    RzButton19: TRzButton;
    RzButton20: TRzButton;
    RzComboBox2: TRzComboBox;
    rztbshtRRKit: TRzTabSheet;
    RzPanel6: TRzPanel;
    rzlblRRkit1: TRzLabel;
    edtRRPulseSetting: TRzNumericEdit;
    RzButton25: TRzButton;
    RzRadioGroup4: TRzRadioGroup;
    RzButton26: TRzButton;
    RzButton23: TRzButton;
    RzRadioGroup3: TRzRadioGroup;
    RzCheckGroup3: TRzCheckGroup;
    actRadSetPulseOutput: TAction;
    RzButton5: TRzButton;
    cbbFunc1: TRzComboBox;
    cbbPhase1: TRzComboBox;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    cbbFunc2: TRzComboBox;
    cbbPhase2: TRzComboBox;
    cbbFunc3: TRzComboBox;
    cbbPhase3: TRzComboBox;
    rzshtModelG: TRzTabSheet;
    RzButton6: TRzButton;
    RzLabel14: TRzLabel;
    RzComboBox3: TRzComboBox;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    IdTCPClient1: TIdTCPClient;
    ImageList1: TImageList;
    actOpenAgent4SourceG: TAction;
    actConnectAgent: TAction;
    actPowerUp4SourceG: TAction;
    actPowerDown4SourceG: TAction;
    RzButton27: TRzButton;
    rzshtMDB: TRzTabSheet;
    rzbtnSourceDBPath: TRzButtonEdit;
    rzlblSourceDBPath: TRzLabel;
    rzlbl9: TRzLabel;
    rzbtn1: TRzButtonEdit;
    actDBConvert: TAction;
    rzbtnConvert: TRzButton;
    rzbtnConnSrcDB: TRzButton;
    rzbtnCnnTagDB: TRzButton;
    actConnSrcDB: TAction;
    actConnTagDB: TAction;
    rzlbl11: TRzLabel;
    rzprgrsbr1: TRzProgressBar;
    rzDlg1: TRzSelectFolderDialog;
    rzdbgrd1: TRzDBGrid;
    RzDateTimeEdit1: TRzDateTimeEdit;
    rzbtnQuery: TRzButton;
    actQueryTestDate: TAction;
    XLS: TXLSReadWriteII4;
    rzshtExcel: TRzTabSheet;
    dlgOpen: TOpenDialog;
    TabSet: TTabSet;
    lbl1: TLabel;
    edtFilename: TEdit;
    btnDlgOpenFile: TButton;
    btnReadXlsFile: TButton;
    lblCell: TLabel;
    edtCell: TEdit;
    Grid: TDrawGrid;
    btnUpdateExcel2MDB: TButton;
    actDlgOpenFile: TAction;
    actReadXlsFile: TAction;
    actUpdate2mdb: TAction;
    actCloseXlsFile: TAction;
    pb1: TProgressBar;
    rzshtExcelPrintOut: TRzTabSheet;
    btnExcelWrite: TButton;
    edt2: TEdit;
    btnReadMdbByBatchNumber: TButton;
    rzlbl18: TRzLabel;
    actReadFromMdbByBatchNumber: TAction;
    actExcelWrite: TAction;
    rzlbl13: TRzLabel;
    actBatchPrintOut: TAction;
    btnBatchPrintOut: TButton;
    rzlbl19: TRzLabel;
    edt1: TEdit;
    rzlbl20: TRzLabel;
    edt3: TEdit;
    rzgrdErrDsp_G: TRzStringGrid;
    RzLabel45: TRzLabel;
    actSetupErrorG: TAction;
    actGetErrorG: TAction;
    rzshtPulsingTest: TRzTabSheet;
    lstTst1: TRzListBox;
    actLoadTstFile: TAction;
    rzbtn3: TRzButtonEdit;
    rzbtnLoadTstFile: TRzButton;
    rzbtnStartTest: TRzButton;
    actStartPulsingTest: TAction;
    rzStrgrdPulsingTestPara: TRzStringGrid;
    rzshtRelayTest: TRzTabSheet;
    rzStrgrdComport: TRzStringGrid;
    rzbtnCreateDUTs: TRzButton;
    rzpnlMeterComm: TRzPanel;
    rzbtnSendCmd: TRzButton;
    actRunRelayTest: TAction;
    actMeterSendCommand: TAction;
    rbRelayConn: TRzRadioButton;
    rbRelayDisconn: TRzRadioButton;
    actRelayTestGateConn: TAction;
    actRelayTestGateDisconn: TAction;
    actRelayTestGateReadings: TAction;
    rzshtCalibration: TRzTabSheet;
    rzStrgrdCalParams: TRzStringGrid;
    rzlbl15: TRzLabel;
    actStartCal1: TAction;
    rzStrgrdCalibPortSettings: TRzStringGrid;
    rzpgcntrl1: TRzPageControl;
    rztbshtCalibrations: TRzTabSheet;
    rztbshtPhaseShift: TRzTabSheet;
    rzStrgrdCalVolt: TRzStringGrid;
    rzbtnCalVolt: TRzButton;
    rzshtReadings: TRzTabSheet;
    rzStrgrdMeterReadings: TRzStringGrid;
    actMeterCalLogon: TAction;
    RzButton29: TRzButton;
    rzbtnCalPhaseShift: TRzButton;
    RzRadioGroup6: TRzRadioGroup;
    actCalRead: TAction;
    RzButton30: TRzButton;
    rzbtnSourceOutput4Cal1: TRzButton;
    actStartCal2: TAction;
    actSourceOutput4Cal1: TAction;
    actSourceOutput4Cal2: TAction;
    actReadError4Cal2: TAction;
    rzbtnReadError: TRzButton;
    rzbtnSourceOutput4Cal2: TRzButton;
    actReadStdReadings: TAction;
    rzbtnStartCal1: TRzButton;
    rzStrgrdCalPhaseErr: TRzStringGrid;
    RzButton31: TRzButton;
    actMeterReadings: TAction;
    RzButton32: TRzButton;
    actMeterLogoff: TAction;
    actMeterCalAuto: TAction;
    RzButton33: TRzButton;
    RzClockStatus1: TRzClockStatus;
    actStopTest: TAction;
    rzshtErrorVerify: TRzTabSheet;
    rzStrgrdErrorTest: TRzStringGrid;
    rztbshtDataProc: TRzTabSheet;
    actAccuracyTest: TAction;
    RzNumericEdit8: TRzNumericEdit;
    RzLabel50: TRzLabel;
    RzButton34: TRzButton;
    RzStatusPane1: TRzStatusPane;
    RzProgressStatus1: TRzProgressStatus;
    rzstspnVerifyTime: TRzStatusPane;
    rzstspnCalTime: TRzStatusPane;
    rzstspnYield: TRzStatusPane;
    actStartFull: TAction;
    edtBarcode: TEdit;
    rzlbl21: TRzLabel;
    drwgrdResult: TDrawGrid;
    actSave2Excel: TAction;
    rzbtnSave2Excel: TRzButton;
    tsExcelSheet: TTabSet;
    rzbtnFullyStart: TRzButton;
    rzlbl22: TRzLabel;
    RzNmEdtWaitforPower2Stab: TRzNumericEdit;
    rzlbl23: TRzLabel;
    RzNmEdtMeterCalInterval: TRzNumericEdit;
    rzsht158Readings: TRzTabSheet;
    act158Readings: TAction;
    rzcmbxAddr: TRzComboBox;
    rzcmbxLevel: TRzComboBox;
    redtData: TRzRichEdit;
    rzbtnRead: TRzButton;
    rzbtnParseText: TRzButton;
    rzchkbReadingSample: TRzCheckBox;
    act158ReadingTest: TAction;
    act158ReadingsAll: TAction;
    rzbtn158ReadingsAll: TRzButton;
    rzchkbLog2xls: TRzCheckBox;
    rzbtnSave2xls: TRzButton;
    act158Save2xls: TAction;
    rzdtCommaOfSequ: TRzEdit;
    rzbtnGetSequOfPos: TRzButton;
    actGetSequOfPos: TAction;
    actSetErr2: TAction;
    rzlblErrSetting: TRzLabel;
    act158CheckTu: TAction;
    rzpnlCheckTu: TRzPanel;
    RzNmEdtCoeff: TRzNumericEdit;
    rzlblCoeff: TRzLabel;
    rzbtnCheckTu: TRzButton;
    act158RuntimeCheck: TAction;
    rzStrgrdLoadCap: TRzStringGrid;
    rzbtnRuntimeCheck: TRzButton;
    actTimingErrorTest: TAction;
    RzPanel8: TRzPanel;
    rzbtnClockPulsingTest: TRzButton;
    RzNmEdtClockFre: TRzNumericEdit;
    rzlbl24: TRzLabel;
    rzlbl25: TRzLabel;
    rzlbl26: TRzLabel;
    RzNmEdt1: TRzNumericEdit;
    rzbtnRelayTestGateOn: TRzButton;
    rzbtnRelayTestGateOff: TRzButton;
    rzbtnRelayTestGateReadings: TRzButton;
    RzNmEdtWorkCurr: TRzNumericEdit;
    rzlbl27: TRzLabel;
    actRelayTestPowerUp: TAction;
    actRelayTestPowerDown: TAction;
    rzbtnPowerUp: TRzButton;
    rzbtnPowerDown: TRzButton;
    rzcmbxFunc: TRzComboBox;
    rzlblFunc: TRzLabel;
    rzlbl28: TRzLabel;
    rzcmbxErrCalc: TRzComboBox;
    rzlblErrCalc: TRzLabel;
    rzStrgrdErrCalcReadings: TRzStringGrid;
    rzbtnErrCalcSend: TRzButton;
    rzbtnErrCalcRead: TRzButton;
    rzlbl29: TRzLabel;
    rzcmbx3: TRzComboBox;
    rzchkb1: TRzCheckBox;
    rzshtPowerConsum: TRzTabSheet;
    actPowerConsumptionTest: TAction;
    actPowerReadings: TAction;
    rzrdgrpCal: TRzRadioGroup;
    rzlbl32: TRzLabel;
    rzlbl33: TRzLabel;
    rzlbl34: TRzLabel;
    rzlbl35: TRzLabel;
    RzNmEdt2: TRzNumericEdit;
    RzNmEdt3: TRzNumericEdit;
    rzbtnCalibration: TRzButton;
    actPowerCalib: TAction;
    rzbtnSourceOutput: TRzButton;
    actSourceOutput: TAction;
    actSetDailTest: TAction;
    rzpnlDailTest: TRzPanel;
    rzbtnSetDailTest: TRzButton;
    rzlblAccumValue: TRzLabel;
    rzlblCurrPower: TRzLabel;
    rzshtAccuracyTest: TRzTabSheet;
    actResetWave: TAction;
    actWaveOutput: TAction;
    rzpgcntrlHarmonic: TRzPageControl;
    rzshtSingleHarmonic: TRzTabSheet;
    rzshtMultipleHarmonic: TRzTabSheet;
    rzpnlHarmonic: TRzPanel;
    rzlbl37: TRzLabel;
    rzlbl39: TRzLabel;
    rzlbl40: TRzLabel;
    rzbtnResetWave: TRzButton;
    rzspndtTimes: TRzSpinEdit;
    rzspndtAmplitude: TRzSpinEdit;
    RzNmEdtHarmonice: TRzNumericEdit;
    rzbtnHarmonicOutput: TRzButton;
    rzrdgrp4: TRzRadioGroup;
    rzlbl38: TRzLabel;
    rzcmbxHarmoicMode: TRzComboBox;
    rzStrgrdMultiHarmonic: TRzStringGrid;
    rzbtnMultipleVoltage: TRzButton;
    actVoltageMultiple: TAction;
    actCurrentMultiple: TAction;
    rzbtnCurrentMultiple: TRzButton;
    rzcmbxScheme4Multiple: TRzComboBox;
    rzbtnSaveScheme: TRzButton;
    actSaveMultipleScheme: TAction;
    rzsht1p3w: TRzTabSheet;
    rzpnl5: TRzPanel;
    rzlbl36: TRzLabel;
    rzbtn2: TRzButton;
    rzchckgrpLoad: TRzCheckGroup;
    rzpnlSourceParam: TRzPanel;
    rzStrgrdSourceParam: TRzStringGrid;
    rzpnlHarmonicOutput: TRzPanel;
    rzspltr1: TRzSplitter;
    rzgrpbr1: TRzGroupBar;
    rzgrp1: TRzGroup;
    rzgrp2: TRzGroup;
    rzgrp3: TRzGroup;
    rztrvw1: TRzTreeView;
    actTestSeqXlsOpen: TAction;
    ImgLTestSequ: TImageList;
    rzlbl41: TRzLabel;
    rzlbl42: TRzLabel;
    RzNmEdtDtTime: TRzNumericEdit;
    rzpnlTestParam: TRzPanel;
    rzpnlDisplay: TRzPanel;
    rzpnlButton: TRzPanel;
    actTestSequAddNew: TAction;
    actTestSequDele: TAction;
    actTestSequModify: TAction;
    actTestSequBegin: TAction;
    rzbtnTestSequBegin: TRzButton;
    rzlblMeanPower: TRzLabel;
    rzpnlPrecOut: TRzPanel;
    rzspndtAccuray: TRzSpinEdit;
    rzlblAccuacy: TRzLabel;
    rzStrgrdPrecOutput: TRzStringGrid;
    rzbtnPrecOutput: TRzButton;
    rzbtnPrecCurr: TRzButton;
    actOutputPrecVolt: TAction;
    actOutputPrecCurr: TAction;
    rzpnl6: TRzPanel;
    rzbtnSetErr2: TRzButton;
    rzlbl43: TRzLabel;
    RzNmEdt4: TRzNumericEdit;
    rzlbl44: TRzLabel;
    RzNmEdt5: TRzNumericEdit;
    rzlbl45: TRzLabel;
    RzNmEdt6: TRzNumericEdit;
    rzlbl46: TRzLabel;
    rzlbl47: TRzLabel;
    rzlbl48: TRzLabel;
    rzbtnactCnPrefixWizard: TRzButton;
    rzspndt1: TRzSpinEdit;
    rzspndt2: TRzSpinEdit;
    RzNmEdt7: TRzNumericEdit;
    rzbtnactCnPrefixWizard1: TRzButton;
    rzrdgrp5: TRzRadioGroup;
    rzlbl49: TRzLabel;
    rzcmbx4: TRzComboBox;
    actOutputHarmonicTypeG: TAction;
    actClearHarmonicTypeG: TAction;
    actOutputMultiHarmonicTypeG: TAction;
    rzbtnMultiHarmonic: TRzButton;
    rzStrgrdErrsDailTest: TRzStringGrid;
    rzchkbPlusingError: TRzCheckBox;
    rzchkbAll: TRzCheckBox;
    actErrCalcSeleAll: TAction;
    rzlbl50: TRzLabel;
    RzNmEdtStabilize: TRzNumericEdit;
    rzchkbPercentOutput: TRzCheckBox;
    rzlbl51: TRzLabel;
    RzNmEdt8: TRzNumericEdit;
    rzbtnactCnPrefixWizard2: TRzButton;
    actOutput_cos1p3W: TAction;
    rzStrgrdMultiPort: TRzStringGrid;
    rzlbl52: TRzLabel;
    rzchkbMultiSubSys: TRzCheckBox;
    rzrdgrp6: TRzRadioGroup;
    rzrdgrpSwitching: TRzRadioGroup;
    rzbtnSwitchLoop: TRzButton;
    actSwitchCurrLoop: TAction;
    rzrdgrpPowerTest: TRzRadioGroup;
    rzlbl30: TRzLabel;
    rzlbl31: TRzLabel;
    RzNmEdtPowerTestTime: TRzNumericEdit;
    rzbtnPowerTest: TRzButton;
    rzcmbxPos: TRzComboBox;
    rzshtICTs: TRzTabSheet;
    actResetICT: TAction;
    ScrollBox1: TScrollBox;
    rzpnlIct1: TRzPanel;
    shp1: TShape;
    ictlbl1: TRzLabel;
    shp2: TShape;
    ictlbl2: TRzLabel;
    shp3: TShape;
    ictlbl3: TRzLabel;
    btnRead1: TRzButton;
    btnReset1: TRzButton;
    actReadState: TAction;
    actResetAllICTs: TAction;
    rzglyphstsCommSta1: TRzGlyphStatus;
    rzglyphstsCommSta2: TRzGlyphStatus;
    rzstspnMsg: TRzStatusPane;
    rzprgrsts1: TRzProgressStatus;
    rzstspn1: TRzStatusPane;
    rzstspn2: TRzStatusPane;
    rzStrgrdPConsum: TRzStringGrid;
    rzlbl53: TRzLabel;
    RzNmEdtDosage: TRzNumericEdit;
    rzlbl54: TRzLabel;
    cbprtlst2: TCboPortList;
    rzrdgrpReading: TRzRadioGroup;
    rzbtnReadings: TRzButton;
    rzpnl4: TRzPanel;
    rzlblICTport: TRzLabel;
    RzLabel15: TRzLabel;
    cbprtlstICTs: TCboPortList;
    rzbtnResetAll: TRzButton;
    rzdtICTPortSetting: TRzEdit;
    rzpnl7: TRzPanel;
    rzStrgrdCreepTest: TRzStringGrid;
    rzlbl56: TRzLabel;
    rzchkbIStd: TRzCheckBox;
    rzpnlSendCommd: TRzPanel;
    rzcmbxCommand: TRzComboBox;
    rzdtCommand: TRzEdit;
    rzbtnSend: TRzButton;
    rzlbl55: TRzLabel;
    cbprtlstSendCommand: TCboPortList;
    actPortSendCommand: TAction;
    rzlbl57: TRzLabel;
    rzlbl58: TRzLabel;
    rzshtGateTest: TRzTabSheet;
    rzpnlMonitor: TRzPanel;
    rzStrgrdPulseCount: TRzStringGrid;
    rzlbl59: TRzLabel;
    rzlbl60: TRzLabel;
    RzNmEdtGateTime: TRzNumericEdit;
    rzbtnStartGate: TRzButton;
    actGatingTest: TAction;
    actTriggerGate: TAction;
    actStartCounting: TAction;
    actResetCounting: TAction;
    rzrdgrpKindOfRSM: TRzRadioGroup;
    rzlbl61: TRzLabel;
    rzdtPortSetting: TRzEdit;
    rzchkbRelay: TRzCheckBox;
    rzpnlFinetune: TRzPanel;
    lblFinetune: TRzLabel;
    lbl2: TRzLabel;
    rzrdgrpKind: TRzRadioGroup;
    btnGoFinetune: TRzButton;
    btnWriteFinetune: TRzButton;
    edtFinetuneValue: TRzNumericEdit;
    edtReading: TRzNumericEdit;
    rzrdgrpPhase: TRzRadioGroup;
    actGoFinetune: TAction;
    actWriteFinetune: TAction;
    rzgrdRdInstn: TRzStringGrid;
    rzrdgrp3: TRzRadioGroup;
    lbl3: TRzLabel;
    btnReadMatrix: TRzButton;
    rzchckbxReadThread: TRzCheckBox;
    edtSpinIntvReadings: TRzSpinEdit;
    actReadMatrix: TAction;
    actReadThread: TAction;
    lblMonitorCheck: TRzLabel;
    rzpnlOutput: TRzPanel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel31: TRzLabel;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    RzButton3: TRzButton;
    RzButton4: TRzButton;
    rzedtPhaAngle: TRzNumericEdit;
    RzButton15: TRzButton;
    RzButton16: TRzButton;
    RzSpinEdit3: TRzNumericEdit;
    RzSpinEdit4: TRzNumericEdit;
    cbbPowerFactor: TRzComboBox;
    lblPowerFactor: TRzLabel;
    edtPhaseB: TRzNumericEdit;
    edtPhaseC: TRzNumericEdit;
    lblDegree: TRzLabel;
    procedure actAccuracyTestExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actCloseWinExecute(Sender: TObject);
    procedure actOutput_CurrentExecute(Sender: TObject);
    procedure actOutput_VoltageExecute(Sender: TObject);
    procedure actReadMeasuredDataExecute(Sender: TObject);
    procedure actReset_CurrentExecute(Sender: TObject);
    procedure actReset_VoltageExecute(Sender: TObject);
    procedure actRoutine1Execute(Sender: TObject);
    procedure actStoptestExecute(Sender: TObject);
    procedure actTestCtrConnModeExecute(Sender: TObject);
    procedure actTestOpenBoxExecute(Sender: TObject);
    procedure actOutput1P3WExecute(Sender: TObject);
    procedure actOutput_CosExecute(Sender: TObject);
    procedure actOutput_Cos_1Execute(Sender: TObject);
    procedure actResetOutputExecute(Sender: TObject);
    procedure actReOutputExecute(Sender: TObject);
    procedure actRaiseVExecute(Sender: TObject);
    procedure actRaiseVUpdate(Sender: TObject);
    procedure actSetErrExecute(Sender: TObject);
    procedure actReadErrExecute(Sender: TObject);
    procedure actReadStartingTestDataExecute(Sender: TObject);
    procedure rzstrngrd1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure actClampTestOnExecute(Sender: TObject);
    procedure actClampTestOnUpdate(Sender: TObject);
    procedure actOpenConfigrationExecute(Sender: TObject);
    procedure actClampTestOffExecute(Sender: TObject);
    procedure actShakeHandExecute(Sender: TObject);
    procedure actSetChkpToClampExecute(Sender: TObject);
    procedure actGetResultExecute(Sender: TObject);
    procedure actAutoCalcExecute(Sender: TObject);
    procedure actDebugAutoAdjustExecute(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure actDebugRead158ParamsExecute(Sender: TObject);
    procedure actDebugReadFinetuneExecute(Sender: TObject);
    procedure actDebugReadRefExecute(Sender: TObject);
    procedure actDebugSaveFinetuneTo158Execute(Sender: TObject);
    procedure actDEbugWriteFinetuneExecute(Sender: TObject);
    procedure actDebugWriteToINIExecute(Sender: TObject);
    procedure actFreqSetExecute(Sender: TObject);
    procedure actGetVerInfoExecute(Sender: TObject);
    procedure actOutput_UPhaseExecute(Sender: TObject);
    procedure actRadRDSetPulseRateExecute(Sender: TObject);
    procedure actRadSetPulseOutputExecute(Sender: TObject);
    procedure actReadStartingPulseTimeExecute(Sender: TObject);
    procedure actRRGetPulseRateExecute(Sender: TObject);
    procedure actRS485CloseALLPortsExecute(Sender: TObject);
    procedure actRs485CloseAPortExecute(Sender: TObject);
    procedure actRs485OpenAPortExecute(Sender: TObject);
    procedure actSetCreepingTestExecute(Sender: TObject);
    procedure actConnSrcDBExecute(Sender: TObject);
    procedure rzbtnSourceDBPathButtonClick(Sender: TObject);
    procedure actConnTagDBExecute(Sender: TObject);
    procedure actQueryTestDateExecute(Sender: TObject);
    procedure actQueryTestDateUpdate(Sender: TObject);
    procedure actDBConvertExecute(Sender: TObject);
    procedure actDBConvertUpdate(Sender: TObject);
    procedure actOpenAgent4SourceGExecute(Sender: TObject);
    procedure actConnectAgentExecute(Sender: TObject);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure GridGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure GridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure actDlgOpenFileExecute(Sender: TObject);
    procedure actReadXlsFileExecute(Sender: TObject);
    procedure actUpdate2mdbExecute(Sender: TObject);
    procedure actUpdate2mdbUpdate(Sender: TObject);
    procedure actReadFromMdbByBatchNumberExecute(Sender: TObject);
    procedure actReadFromMdbByBatchNumberUpdate(Sender: TObject);
    procedure actExcelWriteExecute(Sender: TObject);
    procedure actPowerDown4SourceGExecute(Sender: TObject);
    procedure actPowerUp4SourceGExecute(Sender: TObject);
    procedure actLoadTstFileExecute(Sender: TObject);
    procedure rzStrgrdComportDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure rzStrgrdComportMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure actInitRelayControlsExecute(Sender: TObject);
    procedure actReadRelaysExecute(Sender: TObject);
    procedure actRunRelayTestExecute(Sender: TObject);
    procedure actMeterSendCommandExecute(Sender: TObject);
    procedure actRelayTestGateConnExecute(Sender: TObject);
    procedure actRelayTestGateDisconnExecute(Sender: TObject);
    procedure actRelayTestGateReadingsExecute(Sender: TObject);
    procedure rzStrgrdCalParamsDrawCell(Sender: TObject; ACol, ARow: Integer; Rect:
      TRect; State: TGridDrawState);
    procedure actSourceOutput4Cal1Execute(Sender: TObject);
    procedure actSourceOutput4Cal2Execute(Sender: TObject);
    procedure actReadError4Cal2Execute(Sender: TObject);
    procedure actMeterCalLogonExecute(Sender: TObject);
    procedure actCalReadExecute(Sender: TObject);
    procedure actMeterCalAutoExecute(Sender: TObject);
    procedure actMeterCalAutoUpdate(Sender: TObject);
    procedure actMeterLogoffExecute(Sender: TObject);
    procedure actMeterReadingsExecute(Sender: TObject);
    procedure actReadStdReadingsExecute(Sender: TObject);
    procedure actStartCal1Execute(Sender: TObject);
    procedure actStartCal2Execute(Sender: TObject);
    procedure actStartFullExecute(Sender: TObject);
    procedure edtBarcodeKeyPress(Sender: TObject; var Key: Char);
    procedure actSave2ExcelExecute(Sender: TObject);
    procedure drwgrdResultKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rzcmbxLevelClick(Sender: TObject);
    procedure act158ReadingTestExecute(Sender: TObject);
    procedure act158ReadingsExecute(Sender: TObject);
    procedure act158ReadingsAllExecute(Sender: TObject);
    procedure act158Save2xlsExecute(Sender: TObject);
    procedure actGetSequOfPosExecute(Sender: TObject);
    procedure actSetErr2Execute(Sender: TObject);
    procedure act158CheckTuExecute(Sender: TObject);
    procedure act158RuntimeCheckExecute(Sender: TObject);
    procedure actTimingErrorTestExecute(Sender: TObject);
    procedure actRelayTestPowerUpExecute(Sender: TObject);
    procedure actRelayTestPowerDownExecute(Sender: TObject);
    procedure rzcmbxFuncClick(Sender: TObject);
    procedure actRelayTestGateReadingsUpdate(Sender: TObject);
    procedure actGetErrorGExecute(Sender: TObject);
    procedure actSetupErrorGExecute(Sender: TObject);
    procedure actSourceOutputExecute(Sender: TObject);
    procedure actSetDailTestExecute(Sender: TObject);
    procedure actSetStartingTestExecute(Sender: TObject);
    procedure actResetWaveExecute(Sender: TObject);
    procedure actWaveOutputExecute(Sender: TObject);
    procedure actVoltageMultipleExecute(Sender: TObject);
    procedure actCurrentMultipleExecute(Sender: TObject);
    procedure RzNmEdt4Change(Sender: TObject);
    procedure actClearHarmonicTypeGExecute(Sender: TObject);
    procedure actOutputHarmonicTypeGExecute(Sender: TObject);
    procedure actOutputMultiHarmonicTypeGExecute(Sender: TObject);
    procedure actErrCalcSeleAllExecute(Sender: TObject);
    procedure actOutputPrecVoltExecute(Sender: TObject);
    procedure actOutputPrecCurrExecute(Sender: TObject);
    procedure actOutput_cos1p3WExecute(Sender: TObject);
    procedure actSwitchCurrLoopExecute(Sender: TObject);
    procedure ScrollBox1Resize(Sender: TObject);
    procedure RzNmEdtDosageChange(Sender: TObject);
    procedure actPowerConsumptionTestExecute(Sender: TObject);
    procedure actPowerReadingsExecute(Sender: TObject);
    procedure actReadStateExecute(Sender: TObject);
    procedure actResetICTExecute(Sender: TObject);
    procedure actResetAllICTsExecute(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure rzcmbxCommandClick(Sender: TObject);
    procedure actSendCommandExecute(Sender: TObject);
    procedure actGoFinetuneExecute(Sender: TObject);
    procedure actWriteFinetuneExecute(Sender: TObject);
    procedure rzrdgrpPhaseClick(Sender: TObject);
    procedure actReadMatrixExecute(Sender: TObject);
    procedure actReadMatrixUpdate(Sender: TObject);
    procedure actReadThreadExecute(Sender: TObject);
    procedure cbbPowerFactorChange(Sender: TObject);
    procedure cbbPowerFactorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    //------------------Excel to MDB-------------------
    EditCol, EditRow: integer;
    EditText: string;
    function ColToText(Col: integer): string;
    procedure SetCellValue(Col, Row: integer);
    //------------------end of block-------------------

    procedure openbox(const Channel: TGenyChannel); overload;
    procedure openbox(port : Integer ; const Channel: TGenyChannel); overload;
    procedure Output_Voltage(id: integer; Value: double); overload;
    procedure Output_Voltage(const Voltage, Amplitude: double; Value: double); overload;
    procedure Output_Current(id: integer; Value: double); overload;
    procedure Output_Current(ComPort, id: integer; Value: double); overload;
    procedure Output(ComPort, id: integer; sLoadPoint: string); overload;
    procedure Output(ComPort, id: integer); overload;
    procedure Output(ComPort, id: integer; AVolt, ACurr, AUI, AFreq: double); overload;
    procedure Output(ComPort, id: integer; AVolt, ACurr, AUI, AFreq: double; var AResult: boolean); overload;
    function CtrlConnectMode(addr: integer; strMode: string; IsCapacitveLoad: boolean): boolean; overload;
    function CtrlConnectMode(index, addr: integer; strMode: string; IsCapacitveLoad: boolean): boolean; overload;
    function SyncRefMeter(port: integer; strMode: string; Level: double): boolean;
    procedure ReadMeasuredData(portId: integer);
    function GetCommPort: integer;
    procedure RepeatOutputTest(Times: word);
    procedure ErrTest(portId: integer; CircleNu, AccessNbr, Mode: integer; StdImpluse: double); overload;
    procedure ErrTestHighFreqInput(portId: integer; CircleNu, AccessNbr, Mode: integer; StdImpluse: double);
    procedure ErrTest(portId: integer; CircleNu, AccessNbr, Mode: integer; StdImpluse: double; var AResult: boolean); overload;
    procedure ErrTest(portId: integer; MeterPos, CircleNu, AccessNbr, Mode: integer; StdImpluse: double); overload;
    procedure ErrTest(portId: integer; CircleNu, AccessNbr: integer; AClockFre: double); overload; // clock pulsing test
    procedure ErrRead(portId, HeadPos: integer); overload;
    procedure ErrRead(portId: integer; HeadPos: integer; AGrid: TStringGrid); overload;
    procedure ErrRead(portId: integer; HeadPos: integer; AGrid: TStringGrid; ARow: integer); overload;
    procedure Output_PhaseAngle(id: integer; Value: double; const RetryCount: integer = 3);
    procedure Routine_Cos(Value: double); overload;
    procedure Routine_Cos(Value, Offset: double); overload;
    function GetStdNbr: double; overload;
    function GetStdNbr(ATestPulse: Integer): double; overload;
    procedure CreepingTest(portId, Samples, AccessNbr, Mode: integer; Duration: double);
    procedure ReadCreepingTestData(portId, MTU: integer);
    procedure ReadStartingTestData(portid, MTU: Integer);
    procedure InitDrawingCampTestGrd;
    function GetClampCTOfCalc: TKindOfCalc;
    function GetClampCT_VoltageCode: TKindOfVoltage;
    function GetClampCT_CheckPoint: TKindOfCheckPoint;
    procedure PowerSource_ClampCT(aU, aI, aAngle: Double);
    procedure ClampCT_ShakeHand(CT_Addr: integer);
    procedure ClampTestOnShakeHand(Sender: TObject; Addr: Integer);
    procedure ClampCT_SetCalc(CT_Addr: integer);
    procedure ClampTestOnCalcTesting(Sender: TObject; Addr: Integer);
    function GetCTAddr(index: integer): integer;
    procedure ClampCT_Check(CT_Addr: integer);
    procedure ClampTestOnCheck(Sender: TObject; Addr: Integer);
    procedure AutoCalc(index: TKindOfCheckPoint);
    procedure RaisePowerSource_AutoCalc_CT(const HasNotify: boolean = True);
    procedure ChangeUAngle(d1, d2: double);
    procedure InitPCBA158ParamGrid;
    procedure InitWriteKbGrid;
    procedure WriteFinetuneParam(const index: Integer);
    procedure ReadReferenceMeasurement;
    procedure Read158Params;
    procedure HandleOnSuccessfulWriteFinetuneParam(Sender: TObject);
    procedure HandleOnFailWriteFinetuneParam(Sender: TObject);
    procedure HandleOnParamStrs(Sender: Tobject; AParamStr: TStrings);
    procedure WriteFinetuneToIni;
    procedure ReadFinetuneFromIni;
    function GetFinetuneItemName: string;
    procedure SaveFinetuneTo158(const Index: Integer);
    procedure AdjustmentOnStopWaitTimeEvent(Sender: TObject;
      var Value: Boolean);
    procedure AdjustmentOnTimeOut(Sender: TObject);
    procedure HandleRs485Port(ComPort, APos: Integer; const Value: TStatus_RS485);
    procedure StartingTest(portId, Samples, AccessNbr, Mode: integer;
      Duration: double);
    procedure FillInPositionNbr(const AValue: Word);
    procedure Output_Freq(id: integer; Value: double);
    function getRDType: TRdMeterKind;
    procedure RRKitOnModelName(Sender: TObject; strInfo: string);
    procedure RRKitOnSerialNumber(Sender: TObject; strInfo: string);
    procedure RRKitOnVersionInfo(Sender: TObject; strInfo: string);
    procedure RRKitOnMeterName(Sender: TObject; strInfo: string);
    procedure RRKitOnErrorMsg(Sender: TObject; strInfo: string);
    procedure RRKitOnCommMsg(Sender: TObject; strInfo: string);
    procedure FormOnHarnpuDBStatus(Sender: TObject; StrANy: string);
    procedure FormOnTransferProgress(Sender: TObject; Value: Word);
    procedure LoadFromINIfile;
    procedure ExcelOutputOnNotifyStatus(Sender: TObject; StrANy: string);
    procedure ExcelOutputOnErrData(Sender: TObject; MeterNo: string; LoadName, AverageErr: TStrings; Index: integer);
    procedure SetupDispParamSourceG(ARzGrid: TRzStringGrid);
    procedure TaitiParamOutput(const AParamStr: string); overload;
    procedure TaitiParamOutput(const AParamStr, APosListStr: string); overload;
    procedure TaitiParamOutput(const AParamStr: string; AKindOf: TKingOfErrCalcFunc); overload;
    procedure SourceOutputOnResultNotifyEvent(Sender: TObject;
      const Ret: Boolean);
    function getIPClient: TMyComm;
    procedure TcpClientOnRead(Sender: TObject; ATimeOut: Integer;
      var AMsg: string);
    procedure SetupDispErrorG(Index: integer; ARzGrid: TRzStringGrid);
    procedure LoadCheckBoxBitMap;
    procedure LoadComportSetting;
    procedure SaveComportSetting;
    function fgetMyCommObjList(blnInitComm: Boolean): TMyCommObjList; overload;
    function fgetMyCommObjList(blnInitComm: Boolean; AGrid: TStringGrid): TMyCommObjList; overload;
    procedure RelayTestOnFinalComm(Sender: TObject);
    function GetMyCommRef(AComport: Integer;
      blnPortOpen: boolean; const ACommSetting: string = '9600,n,8,1'): TMyComm;
    procedure RelayTestOnCommEvent(Sender: TObject; APortNbr: Word; AResult: boolean);
    procedure RelayTestOnWatingEvent(Sender: TObject);
    procedure RunLoadSwitchErrorG(strIP, LanPort, APosLst: string; bSwitchON: boolean); overload;
    procedure RunLoadSwitchErrorG(strIP, LanPort, APosLst: string); overload;
    procedure RunLoadSwitchErrorG(strIP, LanPort, APosLst: string; AKindOf: TKingOfErrCalcFunc); overload;
    procedure RunLoadSwitchErrorG(strIP, LanPort, APosLst: string; FuncNo: Integer; AKindOf: TKingOfErrCalcFunc); overload;
    procedure Conn2Agent(strIP: string; intPort: integer);
    procedure LoadSwitchOutputOnResultNotifyEvent(Sender: TObject;
      const Ret: Boolean);
    procedure LoadMeterCalComportSetting(AMeterCount: Word);
    procedure SetupMeterCal;
    procedure MeterCalTestOnFinalComm(Sender: TObject);
    procedure MeterCalOnLogonAction(Sender: TObject; APort: integer; ABackStr: String);
    procedure ClearStrgrdCells(AGrid: TStringGrid); overload;
    procedure ClearStrgrdCells(AGrid: TStringGrid; ACol: Integer); overload;
    procedure ClearStrgrdCells(AGrid: TStringGrid; AColSet: TMyGridColSet); overload;
    procedure MeterCalOnReadCalibrationsAction(Sender: TObject;
      APort: integer; ABackStr: String);
    procedure StartMeterCalibrations(index: TKindOfMeterCal);
    procedure SetupMeterCalValues(AKind: TKindOfMeterCal; AOffset: Integer); overload;
    procedure SetupMeterCalValues(AOffset: Integer); overload; //for phase calibration
    function MeterCommPortChecked(AGrid: TStringGrid; ACol,
      AOffset: Integer): boolean;
    procedure MeterCalOnNotifyEventRequestGain(Sender: TObject;
      APort: integer; AKind: TKindOfMeterCal; AWritings: TMeterCalWritings);
    procedure MeterCalOnReadingsAction(Sender: TObject; APort: integer;
      ABackStr: String);
    procedure MeterCalCountDown(ASecond: longword);
    function MeterCalCheckCommStatus(ASubstr: string): boolean;
    procedure AccuracyTest4EMS12JT(AOffset: integer; AVolt, ACurr, AUI, AFreq: double;
      const AErrLmt: double = 0.05);
    procedure UpdateMeterCalData;
    procedure DispReadings(ATestCmd: TCmdOperaParam);overload;
    procedure DispReadings(ATestCmd: TCmdLevel_0); overload;
    procedure DispReadings(ATestCmd: TCmdLevel_1); overload;
    procedure DispReadings(ATestCmd: TCmdLevel_2); overload;
    procedure DispReadings(ATestCmd: TCmdLevel_3); overload;
    procedure DispReadings(ATestCmd: TCmdLevel_4); overload;
    procedure DispReadings(ATestCmd: TCmdLevel_5); overload;
    procedure DispReadings(ATestCmd: TCmdLevel_6); overload;
    procedure DispReadings(ATestCmd: TCmdLevel_7); overload;
    function GetByteList: TList;
    procedure Handle158ReadingText(Sender: TObject; AStr: string);
    procedure Save2ExcelFile;
    procedure Handle158ReadingExport2Excel(Sender: TObject;
      ACmd: TCmdOperaParam);
    procedure ExportReadings(AKind: TKindofAddr; ATestCmd: TCmdOperaParam);overload;
    procedure ExportReadings(AKind: TKindofAddr; ATestCmd: TCmdLevel_0); overload;
    procedure ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_1); overload;
    procedure ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_2); overload;
    procedure ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_3); overload;
    procedure ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_4); overload;
    procedure ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_5); overload;
    procedure ExportReadings(AKind: TKindofAddr; ATestCmd: TCmdLevel_6); overload;
    procedure ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_7); overload;
    procedure Handle158ReadingCheckTu(Sender: TObject;
      ACmd: TCmdOperaParam);
    procedure Handle158ReadingCheckRuntimeParameters(Sender: TObject;
      ACmd: TCmdOperaParam);
    procedure SetupGridCheckRuntime;
    function LoadTestBenchLib : Boolean;
    procedure SetupDispGridErrCalcModelG;
    procedure SetupErrCalcDeviceModelG(AComboBox : TObject);
    procedure ErrCalcOnResultNotifyEvent(Sender: TObject;
      const Ret: Boolean);
    procedure ErrCalcGetErrorOnResultNotifyEvent(Sender: TObject;
      const Ret: Boolean);
    procedure SetupDailTest(portId, ImpValue, AccessNbr, Mode: integer);
    procedure DailTestOnStopWaitTimeEvent(Sender: TObject;
      var Value: Boolean);
    function ReadDailTest(portId: Integer; var Value: string): Boolean ;  overload;
    function ReadDailTest(portId, APos: Integer): Boolean ;  overload ;  //for new version firmware of error calculator 21-06-25
    function ReadDailTest(portId, APos: Integer; var Value: string): Boolean ;  overload ; // for old version
    procedure DailTestOnTimeOut(Sender: TObject);
    procedure ResetWave(id: integer); overload;
    procedure ResetWave(StrIP, StrPort, strType : WideString; AKind: TKindOfMultiple); overload;
    procedure VoltageWaveOut(id: integer; AAmp, AAngel: double; ATimes : Integer ;  AType : TKindOfHarmonic);
    procedure MultipleWaveOut(id: integer; AKind: TKindOfMultiple); overload; //multiple harmonic
    procedure MultipleWaveOut(StrIP, StrPort, strType, StrMode: WideString; AKind: TKindOfMultiple; ATimes, AAngel, AAmp : TStrings); overload;  // for type-g bench
    procedure MultipleWaveOut(StrIP, StrPort, strType, StrMode: WideString; AKind: TKindOfMultiple;  ATimes, AAngel, AAmp, ACheck,
      BTimes, BAngel, BAmp, BCheck,
      CTimes, CAngel, CAmp, CCheck : TStrings) ; overload;
    procedure CurrentWaveOut(id: integer; AAmp, AAngel: double;
      ATimes: Integer; AType: TKindOfHarmonic);
    procedure SetupDisplayMultiHarmonic;
    procedure SetupDisplayMultiPort;
    procedure SetupDisplayPrecOutput;
    procedure OnNotifyMultiHarmonic(Sender: TObject;
      AKind: TKindOfMultiple; ssATimes, ssAAmp, ssAAngel, ACheck,
      ssBTimes, ssBAmp,  ssBAngel, BCheck,
      ssCTimes, ssCAmp, ssCAngel, CCheck: TStrings);
    procedure SetupDisplayErrDialTest;
    procedure DailTestReadingRoutine;
    procedure StopErrorCalculator(portId: Integer);
    function GetPhaseSet: TPhaseSet;
    procedure PreciseOutputRoutine;
    procedure Form1OnHandleReadingNotify(Sender: TObject;
      AKind: TKindOfPreciOutput; var Readings1, Readings2,
      Readings3: Double);
    procedure Form1OnHandle158ReadingNotify(Sender: TObject;
      AKind: TKindOfPreciOutput; var Readings1, Readings2,
      Readings3: Double);
    procedure Form1OnVoltgeNotify(Sender: TObject; APhase: TPhaseName;
      Value: Double);
    procedure Output_Current_Percentage(id: integer; Value: double); overload;
    procedure Output_Current_Percentage(id: integer; Level, Value: double); overload;
    procedure Output_Voltage_Percentage(id: integer; Value: double); overload;
    procedure Output_Voltage_Percentage(id: integer; Level, Value: double); overload;
    procedure PreciseOutputCurrentRoutine;
    procedure Form1OnCurrentNotify(Sender: TObject; APhase: TPhaseName;
      Value: Double);
    procedure HandleReadingsRoutine(AKind:TKindOfPreciOutput;APhaseSet: TPhaseSet);
    procedure Form1OnStopTestNotify(Sender: TObject;
      var bStopTest: Boolean);
    function getMultipleSerialPortNo(Index : Integer; var PortNo: Integer): Boolean;
    function MultiplePortEnable: boolean;
    procedure MultiplePortRoutine(AKind: TKindOfMultiActions);
    procedure HandleMultiPortNotifyAction(Sender: TObject; APort: Integer;
      AKind: TKindOfMultiActions; AMsg: string; var AStopTest: Boolean);
    procedure HandleOnMultiPortNotifyAction(Sender: TObject);
    procedure PreciseOutputCurrenOn158Reading(Sender: TObject;
      ACmd: TCmdOperaParam);
    function GetCLevel: string;
    function GetHarmonicMode: TKindOfHarmonic;
    procedure WaitForWorkThreadFinish;
    procedure SavePSUSetting;
    procedure AddPanel(ARef: TRzPanel; index: Integer; const ACount: Integer);
    procedure AddComponent(ARef: TRzPanel; index: Integer);
    procedure ResizePanel(index: Integer);
    procedure SaveErrCalcSetting;
    procedure LoadErrCalSetting;
    procedure SetupDisplayVATest;
    procedure VaTestOnNotifyPowerTest(Sender: TObject; AMsg: string);
    procedure VaTestNotifyReadings(Sender: TObject; ACmd: TCmdPowerTest);
    procedure setICTcaption;
    procedure SetPortUsedState(const AKind: TKindOfCommPort;
      const Value: Boolean);
    procedure TestICT(id: TDeviceID);
    procedure DispWorkingStatus(const value: string);
    procedure TestICTOnBeforeTest(Sender: TObject; ADeviceID: TDeviceID;
      var Terminated: Boolean);
    procedure TestICTOnRead(Sender: TObject; ADeviceID: TDeviceID; T1, T2,
      T3: TKindOfICTState);
    procedure TestICTOnResult(Sender: TObject; const Ret: Boolean);
    procedure InitProgress(const total: Integer);
    procedure ResetICT(id: TDeviceID; const Broadcase: Boolean);
    procedure ResetICTOnResult(Sender: TObject; const Ret: Boolean);
    procedure SetupDisplayCreepTest(APosNbr: Integer);
    procedure DailTestRoutineForIS(AKind: TKindofRoutine4IS; ATestLong: LongWord);
    procedure DailTestOnStopWaitTimeEvent4IS(Sender: TObject;
      var Value: Boolean);
    procedure DailTestOnTimeOut4IS(Sender: TObject);
    function getCoeff: integer;
    procedure ReadDailTestReadings4IS(portId, APos: Integer);
    procedure DailTestOnTimeOut4IS_StartingTest(Sender: TObject);
    procedure RelayCommRoutine(CmdStr: string);
    procedure WriteFinetuneValueToFile(strValue: string);
    //-------------for rd readings-----------------------------
    procedure ReadMatrix_Instant(AKind: TRdMeterKind);
    function GetRdMeterRef(AKind: TRdMeterKind): TRdMeter;
    procedure FormOnRRkitErrorMsg(Sender: TObject; strInfo: string);
    procedure FormOnRRKitOnCommMsg(Sender: TObject; strInfo: string);
    procedure SetupDisplayRadian();
    procedure Form1OnReadings(Sender: TObject; AKind: TKindofPhaseDefine; AReadings: TStrings);
//    procedure GetPhaseAngle(AKindConnMode : TModeOfConn ; AKindPF: TKindOfPowerFactor; var strValue1, strValue2, strValue3 : string); overload ;
//    procedure GetPhaseAngle(AKindConnMode : TModeOfConn ; AKindPF: TKindOfPowerFactor; AKindOfPhase: TPhaseName ; var strValue: string); overload;
    //procedure GetPhaseAngle(AKindConnMode: TModeOfConn; APowFactor: String; var strValue : string); overload;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

var
  Form1: TForm1;
  FCheck, FNoCheck: TBitmap; //for rzStrGridCOmport

const
  BoolStrs: array[Boolean] of string = ('fail', 'true');
  ClampCT_Comm_Setting: string = '9600,n,8,1';
  geny_comm_setting: string = '19200, n, 8, 2';
  reply_geny: string = '>>';
  MaxDUTCount = 48;

var
  WorkThreadCount : Word = 0;
  Auto_Calc_CT_On: boolean = false;
  CT_Checks: array[1..6] of boolean;
  MeterCalAutoOnTesting: boolean = false;
  SImpulseReading : string = '';

function fGetAppPath(): string;
function GetSerialNbr(ADeviceID: TDeviceID; const i: Integer): integer;

implementation

uses
  ActiveX, ctrcomm_tlb, uMyUtils, uSerialPortComm, uKeyboard, Unit_Config, unit_INI,
  DateUtils, uAngle_U, uAdjustmentRoutine, uFinetune158PCBA, uAdjustParamComm,
  udelay, Unit_ipclient, uReadWriteXls, uHarnpuCommon, //uPulsingTest,
  ustrUtil, uDelayRoutine, strUtils, Unit_sourcG, SheetData4, UptcV,
  uErrCalUtils, uAPI_TestBench, uTestPulseNumber,
  uFrmMultiHarmonic, uICTKeyboard, uCommRelay4Current, uTestBoard, uImpDLL;

{$R *.dfm}

const
  csDefaultErrorValue = '-20000.000000';  // for model G of error calculator
  csDefaultErrorValue1 = '-200.000000';  // for model G of error calculator

  csSectionDBPath = 'DBPath';
  csKeyHarnpu = 'Harnpu';
  csKeyGENY = 'Geny';
  csSectionExcelPrintOut = 'Excel';
  csKeyExcelLocation = 'FilePath';
  csKeyReadByBatchNumber = 'BatchNo';
  KindofAddrs : array[0..2] of TKindofAddr = (kofAddr220 , kofAddr221 , kofAddr222 );
  ProtectValues : array[Boolean] of string = ('Normal', 'Protected');
  MuteStrs : array[Boolean] of string = ('Close', 'Open');
  BuzzerStrs: array[Boolean] of string = ('Close', 'Open');
  MatchingValues: array[Boolean] of string = ('30V', '60V');
  StrHarmonicKindNames : array[TKindOfMultiple] of string = ('Voltage', 'Current');

var
  CreepTestRECs: Array[1..6] of TCreepTestRec;
  TotalOfICTTestItem: Integer;
  CountOfICTItem: Integer;
  StopTest_ICT: Boolean = False;
  MyKindOfTestBench : TKindOfTestBench = kofTypeD;
  MySI: Double;
  DailTest_T : TDateTime ;
  MyKindOfErrCalcFunc : TKingOfErrCalcFunc = kofNormalError;
  MyKindofOverloadAlarm : TKindofOverloadAlarm = kofInitAlarm  ;
  CurrentlyKindofAddr: TKindofAddr;
  MeterCalData : TMeterCalData;
  geny_api: YCIVCtrClass;
  //------------YCSS ActiveX---------------
//  ycss_dump: YCSS;
  yctcp: WinSockOperation;
  myclsEum: clsEnum;
  myclsSerial: ClsSerial;
  myclsSource: GenyCommunication_TLB.clsSource;
//  myXiebo: XieBoItem;
  myclsErr: clsError;

  stoptest: boolean = false;
  IsWorking: boolean = false; // power source
  IsWorkingOnErrCalc: boolean = false; // On Error Calc device communication
  IsWorking_ClampCT: boolean = False; //Clamp CT testing;

  // for readings
  OnReadings: Boolean = False;

  _RecData: TYCRefInstant;    // referance

  PResOutput_Array: array[TKindOfParamSet] of Pointer = (@sOutput_Fre, @sOutPut_U, @sOutput_I, @sOutput_PhUI, @sOutput_PhUU);
  PResErrCalcFunc_Array: array[TKingOfErrCalcFunc] of Pointer = (@sNormalError,@sClockError,@sDemandCycle,
    @sStartingTest,@sCreepTest,@sDailTest,@sColorMark, @sGetError, @sDoubleLoop);

  //Rdian meter
  ArrayDispStrs: array[TKindofDisplyInstant] of PResStringRec = (@SVolts, @SAmps, @SWatts, @SVA, @SVAR, @SFrequency, @SDeg_phase,
    @SPower_Facter, @SAnalog_Sense, @SDelta_Phase, @SVolts_Delt, @SWatts_Delt, @SVA_Delta, @SVAR_Delta, @SVAR_Wye_XConn, @SVAR_Delt_XCONN);


function fgetChk(strValue: string): Integer;
begin
  if Pos('4w', LowerCase(strValue)) > 0 then
    Result := 0
  else if Pos('4r', LowerCase(strValue)) > 0 then
    Result := 1
  else if Pos('3w', LowerCase(strValue)) > 0 then
    Result := 3
  else if Pos('3r', LowerCase(strValue)) > 0 then
    Result := 4
  else if Pos('dr', LowerCase(strValue)) > 0 then
    Result := 8
  else
    Result := 7;
end;

function fGetAppPath(): string;
begin
  Result := IncludeTrailingPathDelimiter(Copy(ParamStr(0), 1, LastDelimiter('\', ParamStr(0))));
end;

{ TForm1 }
procedure TForm1.SavePSUSetting;
begin
  //rate of voltage
  WriteToINI('psu', 'rate_u', RzNumericEdit1.Text);

  //rate of current
  WriteToINI('psu', 'rate_i', RzNumericEdit2.Text);

end;

procedure TForm1.SaveErrCalcSetting;
begin
  //for readings
  WriteToINI('errcal', 'reading', rzdtCommaOfSequ.Text);
  WriteToINI('errcal', 'cx', rzedtCx.Text);
  WriteToINI('errcal', 'co', rzedtCo.Text);
  WriteToINI('errcal', 'sample', rzedtCircleNbr.Text);
  WriteToINI('errcal', 'headpos', rzedtHeadPos.Text);
  WriteToINI('errcal', 'channel', rzedtAccessNbr.Text);
  WriteToINI('errcal', 'headpos', rzedtHeadPos.Text);

end;

procedure TForm1.SaveComportSetting;
var
  i: integer;
begin
  WriteToINI('multiple', 'check', rzchkbMultiSubSys.Checked);
  with rzStrgrdMultiPort do
    for i:= FixedRows to RowCount -1  do
     // if not SameText(Cells[1, i], '') then
      begin
        WriteToINI(format('SubSYS #%d', [i]), 'desc', Cells[1, i]);
        WriteToINI(format('SubSYS #%d', [i]), 'check', Cells[2, i]);
        WriteToINI(format('SubSYS #%d', [i]), 'source', Cells[3, i]);
        WriteToINI(format('SubSYS #%d', [i]), 'rsm', Cells[4, i]);
      end;

  with rzStrgrdComport do
    for i := 1 to MaxDUTCount do
      //if StrToIntDef(Cells[1, i], -1) > 0 then
      begin
        WriteToINI(format('DUT #%d', [i]), 'Port', Cells[1, i]);
        WriteToINI(format('DUT #%d', [i]), 'Check', Cells[2, i]);
      end;

  with rzStrgrdCalibPortSettings do
    for i := 1 to RowCount - 1 do
      //if StrToIntDef(Cells[1, i], -1) > 0 then
      begin
        WriteComPortSetting(i, 'MeterCal', 'Port', Cells[1, i]);
        WriteComPortSetting(i, 'MeterCal', 'Check', Cells[2, i]);
      end;
end;

procedure TForm1.SetupGridCheckRuntime();
begin
   with rzStrgrdLoadCap do
   begin
     RowCount := 4;
     ColCount := 3;
     ColWidths[0] := ColWidths[0] * 2;
     rows[0].DelimitedText := ',';
     Rows[0].CommaText := 'Load_capacity_of, voltage, current';
     cols[0].CommaText := 'Load_capacity_of, A, B, C';
   end;
end;

procedure TForm1.SetupMeterCal();
//var
//  ss: TStrings;
  procedure doSetupAccuracyTest();
  begin
     with rzStrgrdErrorTest do
     begin
         rows[0].CommaText := 'No.,1,2,3,4,5,6';
         cols[0].CommaText := 'No.,pt1, pt2, pt3, pt4, pt5';
     end;
  end;
  procedure doSetupMeterCalParam();
  begin
    with rzStrgrdCalParams do
    begin
      Rows[0].CommaText := 'Power_Source, Volt(V), Curr(A), Angel_UI, Freq(Hz)';
      Rows[1].CommaText := 'Check_point_1, 230, 10, 0.0, 50';
      Rows[2].CommaText := 'Check_point_2, 230, 10, 60.0, 50';
      //---------------verify accuracy points-----------------------
      Rows[3].CommaText := 'Verify_point_1, 230, 0.25, 0, 50';
      Rows[4].CommaText := 'Verify_point_2, 230, 5, 0, 50';
      Rows[5].CommaText := 'Verify_point_3, 230, 5, 60, 50';
      Rows[6].CommaText := 'Verify_point_4, 230, 100, 0, 50';
      Rows[7].CommaText := 'Verify_point_5, 230, 100, 60, 50';
    end;

  end;
  procedure doSetupReadings();
  begin
    with rzStrgrdMeterReadings do
    begin
      Rows[0].CommaText := 'Readings, Vrms, Irms, Power, Freq, Temp';
      Cols[0].CommaText := 'Readings, 1,2,3,4,5,6';
    end;
  end;
  procedure doSetupCalibrations();
  begin
    with rzStrgrdCalVolt do
    begin
      Rows[0].CommaText := 'Calibrations, Vmet, V_def, V_new, I_met, I_def, I_new, Pmet, P_def, P_new';
      Cols[0].CommaText := 'Calibrations, 1,2,3,4,5,6';
    end;
  end;
  procedure doSetupPhaseShift();
  begin
    with rzStrgrdCalPhaseErr do
    begin
      Rows[0].CommaText := 'PhaseShift, Error%, VI_met, VI_def, VI_new';
      Cols[0].CommaText := 'PhaseShift, 1,2,3,4,5,6';
    end;
  end;
  procedure doSetupExcel();
  var
    i: integer;
  begin
    with XLS,tsExcelSheet, drwgrdResult do
    begin
      Filename := fGetAppPath() + SExcelFileName;
      if FileExists(Filename) then
        Read
      else
        raise Exception.Create(Format('%s not exist!', [Filename] ));
      Tabs.Clear;
      for i := 0 to Sheets.Count - 1 do
        Tabs.Add(Sheets[i].Name);
      TabIndex := 0;
      Invalidate;
      Row := 3; //default to first position for barcode input
      end;
  end;
begin
   // cal parameters
  doSetupMeterCalParam;
  //logon or readings
  doSetupReadings;
  //calibrations
  doSetupCalibrations();
  //Phase Shift
  doSetupPhaseShift();
  //accuracy test
  doSetupAccuracyTest();
  doSetupExcel();
end;

procedure TForm1.LoadMeterCalComportSetting(AMeterCount: Word);
var
  ss: TStrings;
  i: integer;
begin
  ss := TStringList.Create;
  try
    ss.CommaText := 'no, port, check, status';

    with rzStrgrdCalibPortSettings do
    begin
      ColCount := 4;
      ColWidths[1] := Round(ColWidths[1] * 1.618);
      ColWidths[2] := ColWidths[1];
      ColWidths[3] := ColWidths[1] * 2;
      RowCount := AMeterCount + FixedRows;
      Rows[0] := ss;
      ss.Clear;
      for i := 1 to AMeterCount do
      begin
        ss.Add(IntToStr(i));
        ss.Add(GetComPortSetting(i, 'MeterCal', 'Port', ''));
        ss.Add(GetComPortSetting(i, 'MeterCal', 'Check', 'no'));
        Rows[i] := ss;
        ss.Clear;
      end;
    end;
  finally
    ss.Free;
  end;
end;

procedure TForm1.LoadErrCalSetting;
var
    s: string;
begin
    ReadFromINI('errcal', 'reading','1,7', s);
    with  rzdtCommaOfSequ do
       Text := s;

  ReadFromINI('errcal', 'cx', '1000', s);
  rzedtCx.Text := s;

  ReadFromINI('errcal', 'co', '1.0e7', s);
  rzedtCo.Text := s;

  ReadFromINI('errcal', 'sample', '1', s );
  rzedtCircleNbr.Text := s;

  ReadFromINI('errcal', 'headpos','1', s );
  rzedtHeadPos.Text := s;

  ReadFromINI('errcal', 'channel', '1', s);
  rzedtAccessNbr.Text  := s;

  ReadFromINI('errcal', 'headpos', '1', s );
  rzedtHeadPos.Text  := s;

end;

procedure TForm1.LoadComportSetting;
var
  ss: TStrings;
  i: integer;
  function getComPortSetting(index: Integer): string;
  begin
    ReadFromINI(format('DUT #%d', [index]), 'Port', '', Result);
  end;
  function getComPortCheck(index: Integer): string;
  begin
    ReadFromINI(format('DUT #%d', [index]), 'Check', 'no', Result);
  end;
begin
  ss := TStringList.Create;
  try
    ss.CommaText := 'no, port, check, relay, gate';

    with rzStrgrdComport do
    begin
      ColCount := 5;
      ColWidths[1] := Round(ColWidths[1] * 1.618);
      RowCount := MaxDUTCount + FixedRows;
      Rows[0] := ss;
      ss.Clear;
      for i := 1 to MaxDUTCount do
      begin
        //ss.Add(Format('# %d', [i]));
        ss.Add(IntToStr(i));
        ss.Add(getComPortSetting(i));
        ss.Add(getComPortCheck(i));
        Rows[i] := ss;
        ss.Clear;
      end;
    end;
  finally
    ss.Free;
  end;
end;

procedure TForm1.LoadCheckBoxBitMap;
var
  i: Smallint;
  bmp: TBitmap;
begin
  FCheck := TBitmap.Create;
  FNoCheck := TBitmap.Create;
  bmp := TBitmap.Create;
  try
    bmp.Handle := LoadBitmap(0, Pchar(OBM_CHECKBOXES));
    with FNoCheck do
    begin
      width := bmp.Width div 4;
      height := bmp.Height div 3;
      Canvas.CopyRect(canvas.cliprect, bmp.Canvas, canvas.ClipRect);
    end;
    with FCheck do
    begin
      width := bmp.Width div 4;
      height := bmp.Height div 3;
      canvas.CopyRect(canvas.ClipRect, bmp.Canvas, rect(width, 0, 2 * width, height));
    end;
  finally
    DeleteObject(bmp.Handle);
    bmp.Free;
  end;
end;

procedure TForm1.TcpClientOnRead(Sender: TObject; ATimeOut: Integer;
  var AMsg: string);
  procedure ReadClientStack();
  var
    buf: TBytes;
    procedure byte2str(index: Integer);
    begin
      if index > High(buf) then Exit;
      AMsg := AMsg + Chr(buf[index]);
      byte2str(index + 1);
    end;
  begin
    with TIdTCPClient(Sender) do
    begin
      ReadFromStack(True, ATimeOut * 1000, false);
      if InputBuffer.Size > 0 then
      begin
        SetLength(buf, InputBuffer.Size);
        ReadBuffer(buf[0], InputBuffer.Size);
        byte2str(0);
      end;
    end;
  end;
begin
  //asm int 3 end;
  //AMsg := TIdTCPClient(Sender).ReadLn('', ATimeOut * 1000);
  ReadClientStack;
  if AMsg <> '' then
    RzMemo1.Lines.add(Format('Model G socket: %s', [AMsg]));
end;

function TForm1.getIPClient: TMyComm;
begin
  Result := TMyTcpClient.Create;
  with TMyTcpClient(Result) do
  begin
    MyTcpClient := IdTCPClient1;
    OnReadMsg := TcpClientOnRead;
  end;
end;

procedure TForm1.SourceOutputOnResultNotifyEvent(Sender: TObject;
  const Ret: Boolean);
begin
  RzMemo1.Lines.Add(Format('Model G source output : %s', [BoolStrs[Ret]]));
end;

procedure TForm1.ErrCalcGetErrorOnResultNotifyEvent(Sender: TObject; const Ret: Boolean);
  function GetErrCommText(S, SubStr1, SubStr2 : string) : string;
  var
    N : Integer;
  begin
    N:= Pos(SubStr1, S) + 4;
    Result := Copy(S, N, Pos( SubStr2, S) - N - 2);
  end;
  procedure DispCommText(ARow: Integer; ACommText: string);
  var
    i: integer;
    S: string;
  begin
      with rzStrgrdErrCalcReadings do
        for i := 0 to 14 do
        begin
          S:= GetItem(ACommText, ',', i);
          if not ( SameText(S,csDefaultErrorValue) or SameText(S,csDefaultErrorValue1)) then
            Cells[FixedCols + i, ARow] := S;
        end
  end;
begin
    with TLoadSwitch(Sender), rzStrgrdErrCalcReadings do
    begin
       DispCommText(FixedRows,  GetErrCommText(ReturnMsg , 'E1', 'E2'));
       DispCommText(FixedRows+1,  GetErrCommText(ReturnMsg , 'E3', 'E4'));
       DispCommText(FixedRows+2,  GetErrCommText(ReturnMsg , 'E5', 'E6'));
       DispCommText(FixedRows+3,  GetErrCommText(ReturnMsg , 'E7', 'E8'));
    end;
end;

procedure TForm1.ErrCalcOnResultNotifyEvent(Sender: TObject; const Ret: Boolean);
const
  SResult: array[Boolean] of string =  ('Set Fail!', 'Set OK!');
begin
  with TLoadSwitch(Sender), RzMemo1 do
  begin
     lines.add(format('%s %s, %s', [TimeToStr(Now()), LoadResString(PResErrCalcFunc_Array[MyKindOfErrCalcFunc]), SResult[Ret]]));
     if not Ret then
      Lines.Add('Return: ' + ReturnMsg );
  end ;

end;

procedure TForm1.LoadSwitchOutputOnResultNotifyEvent(Sender: TObject;
  const Ret: Boolean);
  procedure DisplayLoadSwitch(APosLst, SReadings: string); overload;
  var
    n, n1: integer;
    s1: string;
    function getValue(SubStr: string): string;
    var
      n2: integer;
      splite: string;
    begin
      if n < 3 then
        splite := ':'
      else
        splite := '?';

      n2 := Pos(substr, UpperCase(SReadings));
      if n2 > 0 then
      begin
        n2 := n2 + length(substr);
        Result := copy(SReadings, n2, posex(Splite, SReadings, n2) - n2);
      end;
    end;
  begin
    n := 0;
    s1 := GetItem(APosLst, ',', n);
    with rzStrgrdComport do
      while not sametext('', s1) do
      begin
        n1 := Cols[0].IndexOf(s1);
        if n1 > 0 then
          Cells[ColCount - 1, n1] := getValue(format('LOADSWITCH%d=', [n + 1]));
        inc(n);
        s1 := GetItem(APosLst, ',', n);
      end;
  end;
  procedure DisplayLoadSwitch(APosLst: string); overload;
  var
    n, n1: integer;
    s1: string;
  begin
    n := 0;
    s1 := GetItem(APosLst, ',', n);
    with rzStrgrdComport do
      while not sametext('', s1) do
      begin
        n1 := Cols[0].IndexOf(s1);
        if n1 > 0 then
          Cells[ColCount - 1, n1] := 'ok';
        inc(n);
        s1 := GetItem(APosLst, ',', n);
      end;
  end;
begin
  with TLoadSwitch(Sender) do
  begin
    if Ret then
      DisplayLoadSwitch(PosCommaStr)
    else
      DisplayLoadSwitch(PosCommaStr, ReturnMsg);
  end;
end;

procedure TForm1.TaitiParamOutput(const AParamStr : string; AKindOf: TKingOfErrCalcFunc);
var
  TaitiComm: TTaitiComm_Agent;
  ipc: TMyComm;
begin
  ipc := getIPClient;
  try
    TaitiComm := TTaitiComm_Agent.Create(nil);
    with TaitiComm do
    begin
      Comm := ipc;
      if AKindOf = kofGetError then
         NotifyResult := ErrCalcGetErrorOnResultNotifyEvent
      else
        NotifyResult := ErrCalcOnResultNotifyEvent;
      //NotifyResult := LoadSwitchOutputOnResultNotifyEvent;
    end;

    try
      with TaitiComm do
      begin
        LoadSwitchOutput(AParamStr, '');
      end;
    finally
      TaitiComm.Free;
    end;
  finally
    FreeAndNil(ipc);
  end;
end;

procedure TForm1.TaitiParamOutput(const AParamStr, APosListStr: string);
var
  TaitiComm: TTaitiComm_Agent;
  ipc: TMyComm;
begin
  ipc := getIPClient;
  try
    TaitiComm := TTaitiComm_Agent.Create(nil);
    with TaitiComm do
    begin
      Comm := ipc;
      NotifyResult := LoadSwitchOutputOnResultNotifyEvent;
    end;

    try
      with TaitiComm do
      begin
        LoadSwitchOutput(AParamStr, APosListStr);
      end;
    finally
      TaitiComm.Free;
    end;
  finally
    FreeAndNil(ipc);
  end;
end;

procedure TForm1.TaitiParamOutput(const AParamStr: string);
var
  TaitiComm: TTaitiComm_Agent;
  ipc: TMyComm;
begin
  ipc := getIPClient;
  try
    TaitiComm := TTaitiComm_Agent.Create(nil);
    with TaitiComm do
    begin
      Comm := ipc;
      NotifyResult := SourceOutputOnResultNotifyEvent;
      //OperateNotify:= ;
    end;

    try
      with TaitiComm do
      begin
        PowerUp(AParamStr);
      end;
    finally
      TaitiComm.Free;
    end;
  finally
    FreeAndNil(ipc);
  end;
end;

procedure TForm1.InitWriteKbGrid();
  procedure AddFixRowTitle();
  var
    ss: TStrings;
  begin
    ss := TStringList.Create;

    try
      ss.Add('finetune');
      ss.Add('U,L');
      ss.Add('U,C');
      ss.Add('PhPos,L');
      ss.Add('PhPos,C');
      ss.Add('I');
      ss.Add('Fre');
      rzGrdWriteKb.Rows[0] := ss;
    finally
      ss.Free;
    end;

  end;
  procedure AddFixColumnTitle();
  var
    ss: TStrings;
  begin
    ss := TStringList.Create;
    try

      ss.Add('finetune');
      ss.Add('Phase A');
      ss.Add('Phase B');
      ss.Add('Phase C');

      rzGrdWriteKb.Cols[0] := ss;
    finally
      ss.Free;
    end;
  end;
begin
  with rzGrdWriteKb do
  begin
    RowCount := 4;
    ColCount := 7;
    AddFixRowTitle;
    AddFixColumnTitle;
  end;
end;

procedure TForm1.InitPCBA158ParamGrid();
  procedure AddFixRowTitle();
  var
    ss: TStrings;
  begin
    ss := TStringList.Create;
    try
      ss.Add('Params');
      ss.Add('I Base');              //电流幅值微调底数
      ss.Add('I Slop');             //电流幅值微调斜率
      ss.Add('UL Base');           //电压感性微调底数
      ss.Add('UL Slop');           //电压感性微调斜率
      ss.Add('PhP Base');         //相位感性微调底数
      ss.Add('Fre Base');        //频率微调底数
      ss.Add('Max U');          //最大电压
      ss.Add('Max I');        //最大电流
      ss.Add('Fre Offset');   //频率修正值
      ss.Add('UC Base');      //电压容性微调底数
      ss.Add('UC Slop');     //电压容性微调斜率
      ss.Add('PhPC Base');  //相位容性微调底数
      ss.Add('RESET DEVI'); //复位信号偏离度微调
      rzGrd158Param.Rows[0] := ss;
    finally
      ss.Free;
    end;
  end;
  procedure AddFixColumnTitle();
  var
    ss: TStrings;
  begin
    ss := TStringList.Create;
    try

      ss.Add('Params');
      ss.Add('Phase A');
      ss.Add('Phase B');
      ss.Add('Phase C');

      rzGrd158Param.Cols[0] := ss;
    finally
      ss.Free;
    end;
  end;
begin
  with rzGrd158Param do
  begin
    RowCount := 4;
    ColCount := 14;
    AddFixRowTitle;
    AddFixColumnTitle;
  end;

end;

procedure TForm1.FillInPositionNbr(const AValue: Word);
var
  i: integer;
  _items, _values: TStrings;
begin
  _items := TStringList.Create;
  _values := TStringList.Create;
  try
    with RzComboBox2 do
    begin
      for i := 1 to AValue do begin
        _items.Add('F' + IntToStr(i));
        _values.Add(IntToStr(i));
      end;
      Items := _items;
      Values := _values;
    end;
  finally
    _items.free;
    _values.free;
  end;
end;

procedure TForm1.LoadFromINIfile();
var
  s: string;
begin
  // GENY DB path
  ReadFromINI(csSectionDBPath, csKeyHarnpu, '', s);
  rzbtnSourceDBPath.Text := s;

  // Harnpu DB path
  ReadFromINI(csSectionDBPath, csKeyGENY, '', s);
  rzbtn1.text := s;

  // EEM excel location
//  ReadFromINI(csSectionExcelPrintOut , csKeyExcelLocation  ,'', s);
//  edt1.text  := s;

  // EEM batch no.
  ReadFromINI(csSectionExcelPrintOut, csKeyReadByBatchNumber, '', s);
  edt2.text := s;

   //rate of voltage
  ReadFromINI('psu', 'rate_u', '220', s);
  RzNumericEdit1.Text := s ;

  //rate of current
  ReadFromINI('psu', 'rate_i', '5', s);
   RzNumericEdit2.Text := s;
end;

constructor TForm1.Create(AOwner: TComponent);
begin
  inherited;

  LoadErrCalSetting;

  //--------for comport setting of relay test-----
  LoadCheckBoxBitMap();
  LoadComportSetting();
  LoadMeterCalComportSetting(6); // Meter Cal
  //---------the end of block---------------------

  geny_api := CoYCIVCtrClass.Create;

  yctcp := GenyCommunication_TLB.CoWinSockOperation.Create;
//  ycss_dump := GenyCommunication_TLB.CoYCSS.Create;
  myclsEum := GenyCommunication_TLB.CoclsEnum.Create;
  myclsSerial := GenyCommunication_TLB.CoClsSerial.Create;
  myclsSource := GenyCommunication_TLB.CoclsSource.Create;
//  myXiebo := GenyCommunication_TLB.CoXieBoItem.Create;
  myclsErr := GenyCommunication_TLB.CoclsError.Create;

  //set up meter cal
  //SetupMeterCal();

  InitDrawingCampTestGrd;
  RzSpinEdit1.Value := GetTestBenchCommPort;
  RzSpinEdit7.Value := GetRSMCommPort;
  InitPCBA158ParamGrid;
  InitWriteKbGrid;
  ReadFinetuneFromIni;
  FillChar(_RecData, SizeOf(_RecData), 0);
  FillInPositionNbr(24);
  LoadFromINIfile;
  SetupDispParamSourceG(rzStrgrdSourceParam);
  SetupDispErrorG(0, rzgrdErrDsp_G);
  SetupDispGridErrCalcModelG();
  SetupErrCalcDeviceModelG(rzcmbxErrCalc);
  SetupErrCalcDeviceModelG(rzcmbx3);
  //multiple harmonic
  SetupDisplayMultiHarmonic();
  SetupDisplayMultiPort();

  SetupDisplayPrecOutput();
  SetupDisplayErrDialTest();
  SetupDisplayVATest();
  SetupDisplayCreepTest(6);

  //Setup ICTs
  AddPanel(rzpnlIct1, 2, 24);
  setICTcaption();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//  with RzComboBox7 do
//  begin
//    ReadMeterIP(Items,  4);
//    ItemIndex := 0;
//  end;

  RzNumericEdit8.Value := 0.5;

  //set up meter cal
  SetupMeterCal();

  //Setup Grid display for Runtime check
  SetupGridCheckRuntime();

  rzpnlCheckTu.ShowHint := True;

  with Self do
    Caption := Caption + ' under ' + GetOSver();

  //radian meter display setup\
  SetupDisplayRadian();

end;

procedure TForm1.InitDrawingCampTestGrd();
var
  ss: TStrings;

  procedure InitFixCol();
  var
    i: integer;
  begin
    ss := TStringList.Create;
    try
      ss.Add('No.');
      for i := 1 to rzchckgrp1.Items.Count do
        ss.Add(IntToStr(i));
      rzstrngrd1.cols[0] := ss;
    finally
      ss.Free;
    end;

  end;

  procedure InitFixRow();
  begin
    ss := TStringList.Create;
    try
      with ss do
      begin
        ss.Add('No.');
        ss.Add('Addr.');
        ss.Add('status');
        ss.Add('Result');
      end;
      rzstrngrd1.Rows[0] := ss;
    finally
      ss.Free;
    end;
  end;

var
  i: Integer;
begin
  with rzstrngrd1 do
  begin
    RowCount := rzchckgrp1.Items.Count + 1;
    ColCount := 4;
    ColWidths[0] := DefaultColWidth div 2;
    ColWidths[2] := DefaultColWidth * 2;
    ColWidths[3] := DefaultColWidth * 9;
    for i := 1 to RowCount - 1 do
    begin
      Cells[1, i] := IntToStr(i - 1);
    end;
  end;
  InitFixRow;
  InitFixCol;
end;

destructor TForm1.Destroy;
begin
  FreeAndNil(MeterCalData);
  WriteFinetuneToIni;
  SaveComportSetting; // save DUTs settings of COmm port.
  SavePSUSetting ; //save PSU settngs
  SaveErrCalcSetting; 
  inherited;
end;

procedure TForm1.AccuracyTest4EMS12JT(AOffset: integer; AVolt, ACurr, AUI, AFreq: double; const AErrLmt: double);
var
  _T: LongWord;
  _wait: Double;
  function SourceOutputCheck(): boolean;
  begin
    with rzStrgrdCalParams do
      Output(RzSpinEdit1.IntValue, 220, AVolt,
        ACurr,
        AUI,
        AFreq, Result);
    if Result then
    begin
      SyncRefMeter(RzSpinEdit1.IntValue, 'D', ACurr);
      MeterCalCountDown(5)
    end
    else
      result := SourceOutputCheck();
  end;
  function ErrorReadingsCheck(const TestTickCount: LongWord): boolean;
  var
    i: integer;
    tmpData: double;
  begin
    Result :=false;
    with rzStrgrdErrorTest do
    begin
      ErrRead(RzSpinEdit1.IntValue, 1, rzStrgrdErrorTest, FixedRows + AOffset);
      for i := FixedCols to ColCount - 1 do
        if MeterCommPortChecked(rzStrgrdCalibPortSettings, 2, i - FixedRows) then
        begin
          tmpData := abs(StrToFloatDef(Cells[i, FixedRows + AOffset ], 99.99));
          Result := (AErrLmt > abs(tmpData));
          if not result then
            break;
        end;
    end;
    if not (Result or stoptest or (GetTickCount - _T > TestTickCount)) then
    begin
      MeterCalCountDown(2);
      result := ErrorReadingsCheck(TestTickCount);
    end;
  end;
  function GetStdNbr(Cx : double) : double;
  begin
     if ACurr < 1.2 then
       Result := 1.0e9 / cx
     else if ACurr < 12 then
        result := 1.0e8 / cx
     else
        result := 1.0e7 / cx;
     result:= result * rzedtCircleNbr.IntValue;
  end;
begin
  if SourceOutputCheck then;
  begin
    //setup error calc. device
    ErrTest(RzSpinEdit1.IntValue, rzedtCircleNbr.IntValue, rzedtAccessNbr.IntValue, 1, GetStdNbr(rzedtCx.Value));
    //wait for one pulse cycle
    _wait := OnePulseTime(AVolt, ACurr, 1000.0, AUI);
    if _wait < 5 then
      MeterCalCountDown(5)
    else
      MeterCalCountDown(round(_wait));

    //check results of accuracy test
    _T := GetTickCount();
    ErrorReadingsCheck(rzedtCircleNbr.IntValue * Round(1.2 * OnePulseTime(AVolt, ACurr, 1000.0, AUI)) * 1000);

  end;

end;

procedure TForm1.actAccuracyTestExecute(Sender: TObject);
var
  i: integer;
  t: TDateTime;
  procedure UpdateTestTime();
  var
    t0: TDateTime;
  begin
    t0 :=  Now() - t;
    with rzstspnVerifyTime do
      Caption := 'Verification duration:' + FormatDateTime('hh:mm:ss', t0);
    if Assigned(MeterCalData) then
      MeterCalData.TestTime := t0;
  end;
begin
    //notice for accuracy test...
  if MessageDlg('go for accuracy testing?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;
  t:= now();
  try
    ClearStrgrdCells(rzStrgrdErrorTest);
    with rzStrgrdCalParams do
      for i := FixedRows + 2 to RowCount - 1 do
        if not stoptest then
          AccuracyTest4EMS12JT(rzStrgrdErrorTest.FixedRows + (i - FixedRows - 3),
            StrToFloat(Cells[fixedcols, i]),
            StrToFloat(Cells[fixedcols + 1, i]),
            StrToFloat(Cells[fixedcols + 2, i]),
            StrToFloat(Cells[fixedcols + 3, i]), RzNumericEdit8.Value);
    ShowMessage('accuracy test finished!');
  finally
    stoptest := false;
    UpdateTestTime();
  end;

end;

procedure TForm1.actCloseWinExecute(Sender: TObject);
begin
  if MessageDlg('cl0se it?', mtWarning, [mbYes, mbNo], 0) = mrYes then
    close;
end;

procedure TForm1.actOutput1P3WExecute(Sender: TObject);
const
  coDelayTime = 200;
  procedure SetVoltagePhase();
  begin
    if MessageDlg('Will change the UAB angles to 180 degree?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      ChangeUAngle(180.0, 120.0)
    else
      Abort;
  end;
  procedure OutputUAB(value: double);
  begin
    // openbox(2);
    if MessageDlg(format('warning: Source will output Ua=Ub=%8.3f V', [value]), mtWarning, [mbNo, mbYes], 0) = mrNo then
       Abort;
    Output_Voltage(220, value);
    sleep(100);
    Output_Voltage(221, value);
  end;
  procedure SingleRoutine();
  begin
    //output voltage Ua=Ub=120
     OutputUAB(RzNumericEdit1.Value /2);

    //output voltage phase AB = 180
     SetVoltagePhase();

     //output current
     with rzchckgrpLoad do
     begin
        //phase B
        if Checks[1].Checked then
        begin
          Sleep(coDelayTime);
          Output_Current(221, RzNumericEdit2.Value * RzSpinEdit4.Value / 100.0);
        end;
        //phase A
        if Checks[0].Checked then
        begin
          Sleep(coDelayTime);
          Output_Current(220, RzNumericEdit2.Value * RzSpinEdit4.Value / 100.0);
        end;
      end;
      Sleep(coDelayTime);
      Output_PhaseAngle(220, rzedtPhaAngle.Value);
      //shift phase B +180
      Sleep(coDelayTime);
      Output_PhaseAngle(221, rzedtPhaAngle.Value + 180);
  end;
begin
  stoptest := false;
  IsWorking := True;
  try
    if MessageDlg('Confirm to ouput for 1P3W mode?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      if MultiplePortEnable then
      begin
        MultiplePortRoutine(kofActOutput1P3W) ;
        ShowMessage('Power sources are being output for 1p3w mode, please check later');
        WaitForWorkThreadFinish();
      end
      else
        SingleRoutine();
  finally
    IsWorking := false;
  end ;
end;

procedure TForm1.actOutput_CosExecute(Sender: TObject);
var
  d: double;
  lngT: LongWord;
begin
  stoptest := false;
  IsWorking := True;
  try
    d := rzedtPhaAngle.Value;
    if MessageDlg(format('warning: phase angle is given by %8.3f ', [d]), mtWarning, [mbNo, mbYes], 0) = mrNo then
      exit;
    if MultiplePortEnable then
      begin
        MultiplePortRoutine(kofOutput_Cos) ;
        ShowMessage('Power sources are under output phase, please check later');
        WaitForWorkThreadFinish();
      end
    else
      begin
        lngT := GetTickCount;
        if RzCheckGroup1.ItemChecked[0] then
        begin
          Output_PhaseAngle(220, StrToFloat(rzedtPhaAngle.Text));
        end;
        if RzCheckGroup1.ItemChecked[1] then
        begin
          sleep(100);
          Output_PhaseAngle(221, StrToFloatDef(edtPhaseB.Text,0.0));
        end;
        if RzCheckGroup1.ItemChecked[2] then
        begin
          sleep(100);
          Output_PhaseAngle(222, StrToFloat(edtPhaseC.Text));
        end;
        RzMemo1.Lines.Add(format('used time was about %8.3f seconds', [(GetTickCount - lngT) / 1000]));
      end;
  finally
     IsWorking := false;
  end;
end;

procedure TForm1.Routine_Cos(Value, offset: double);
begin
  if (offset < 0) or stoptest then
    exit;
  Routine_Cos(Value);
  value := value + offset;
  if value > 360.0 then
  begin
    Value := 360.0;
    offset := -1.0;
  end;
  MessageBoxTimeOut(Handle, PChar('wait proc.'), PChar('time out of 60 sec.'), TimeOutOKFlag, 0, 60000);
  Routine_Cos(Value, offset);
end;

procedure TForm1.Routine_Cos(Value: double);
var
  i: integer;
  lngT: LongWord;
begin
  stoptest := false;
  lngT := GetTickCount;
  for i := 0 to 2 do
    if RzCheckGroup1.ItemChecked[i] then
    begin
      sleep(100);
      Output_PhaseAngle(220 + i, Value);
    end;
  RzMemo1.Lines.Add(format('used time was about %8.3f seconds', [(GetTickCount - lngT) / 1000]));
end;

procedure TForm1.actOutput_Cos_1Execute(Sender: TObject);
var
  d: double;
begin
  stoptest := false;
  IsWorking := True;
  try
    d := rzedtPhaAngle.Value;
    if MessageDlg(format('warning: r u confirm start the routine by phase angle is given by %8.3f ', [d]), mtWarning, [mbNo, mbYes], 0) = mrNo then
      exit;
    Routine_Cos(d, 10.0);
  finally
      IsWorking := False;
  end;
end;

procedure TForm1.actOutput_CurrentExecute(Sender: TObject);
var
  i: integer;
  d: double;
begin
  stoptest := false;
  IsWorking := True;
  try
    d:= RzNumericEdit2.Value * RzSpinEdit4.Value / 100.0;
    if MessageDlg(format('warning: the current output is %8.3fA', [d]), mtWarning, [mbNo, mbYes], 0) = mrNo then
      Abort;

    if MultiplePortEnable then
    begin
      MultiplePortRoutine(kofactOutput_Current) ;
      ShowMessage('Power sources are under ouput current, please check later');
      WaitForWorkThreadFinish();
    end
    else
      for i := 0 to 2 do
        if RzCheckGroup1.ItemChecked[i] then
        begin
          if rzchkbPercentOutput.Checked then
            Output_Current_Percentage(220 + i, RzSpinEdit4.Value)
          else
            Output_Current(220 + i, d);
          sleep(100)
        end;
  finally
    IsWorking := false;
  end ;
end;

procedure TForm1.actOutput_VoltageExecute(Sender: TObject);
var
  i: integer;
  d: double;
begin
  // openbox(2);
  stoptest := false;
  IsWorking := True;
  try
    d := RzNumericEdit1.Value * RzSpinEdit3.Value / 100.0;
    if MessageDlg(format('warning: the voltage output is %8.3fV ', [d]), mtWarning, [mbNo, mbYes], 0) = mrNo then
      Abort; //exit;

    if MultiplePortEnable then
    begin
      MultiplePortRoutine(kofOutput_Voltage) ;
      ShowMessage('Power sources are under ouput voltage, please check later');
      WaitForWorkThreadFinish();
    end
    else
      for i := 0 to 2 do
        if RzCheckGroup1.ItemChecked[i] then
        begin
          sleep(100);
          if rzchkbPercentOutput.Checked then
            Output_Voltage_Percentage(220 + i, RzSpinEdit3.Value)
          else
            Output_Voltage(220 + i, d);
        end;
  finally
     IsWorking := false;
  end;
end;

procedure TForm1.actRaiseVExecute(Sender: TObject);
begin
  IsWorking := True;
  try
    if MessageDlg(format('r u sure to output voltage: %8.2f V', [strtofloat(rzedtU0.Text)]), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Output_Voltage(rzedtU0.Value, rzspndtAmp.Value / 100, rzedtU0.Value * rzspndtU.Value / 100);
  finally
    IsWorking := false;
  end;
end;

procedure TForm1.actRaiseVUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not IsWorking;
end;

procedure TForm1.actReadErrExecute(Sender: TObject);
begin
  IsWorking := True;
  stoptest := False;
  try
    if MultiplePortEnable then
      begin
        MultiplePortRoutine(kofErrCalcReading) ;
        ShowMessage('Test benches are under readings of pulsing test, please wait all finished');
        WaitForWorkThreadFinish();
      end
    else
      ErrRead(RzSpinEdit1.IntValue, rzedtHeadPos.IntValue);
  finally
    isworking := false;
  end;
end;

procedure TForm1.actReadMeasuredDataExecute(Sender: TObject);
begin
  stoptest := false;
  IsWorking := True;
  try
      if MultiplePortEnable then
      begin
        MultiplePortRoutine(kofActReadingOfRSM) ;
        ShowMessage('Reference standard meters are reading simultaneously, please wait all finished');
        WaitForWorkThreadFinish();
      end
      else
      begin
        if RzSpinEdit1.IntValue = RzSpinEdit7.IntValue then
          openbox(7);
        ReadMeasuredData(RzSpinEdit7.IntValue);
      end;
  finally
      IsWorking := false;
  end;
end;

procedure TForm1.RepeatOutputTest(Times: word);
begin

end;

procedure TForm1.actReOutputExecute(Sender: TObject);
begin
  RepeatOutputTest(10);
end;

function TForm1.GetCommPort(): integer;
begin
  Result := RzSpinEdit1.IntValue;
//  if RzCheckBox2.Checked then
//    Result := RzSpinEdit7.IntValue;
end;

procedure TForm1.actResetOutputExecute(Sender: TObject);
var
  i: integer;
begin
  stoptest := False;
  IsWorking := True;
  try
    if MultiplePortEnable then
    begin
      MultiplePortRoutine(kofClearPower) ;
      ShowMessage('Power sources are under reset, please check later');
      WaitForWorkThreadFinish();
    end
    else
      for i := 0 to 2 do
        if RzCheckGroup1.ItemChecked[i] then
        begin
          Output(GetCommPort, 220 + i);
          sleep(500);
        end;
  finally
    IsWorking := false;
  end;
end;

procedure TForm1.actReset_CurrentExecute(Sender: TObject);
var
  i: integer;
begin
  stoptest := false;
  IsWorking := True;
  try
    if MultiplePortEnable then
      begin
        MultiplePortRoutine(kofactReset_Current) ;
        ShowMessage('Power sources are under reset current, please check later');
        WaitForWorkThreadFinish();
      end
    else
      for i := 0 to 2 do
        if RzCheckGroup1.ItemChecked[i] then
        begin
          sleep(50);
          Output_Current(220 + i, 0.0);
        end;
  finally
    IsWorking := false;
  end;
end;

procedure TForm1.actReset_VoltageExecute(Sender: TObject);
var
  i: integer;
begin
  stoptest := false;
  IsWorking := True;
  try
    // openbox(2);
    if MultiplePortEnable then
    begin
      MultiplePortRoutine(kofactReset_Voltage) ;
      ShowMessage('Power sources are under reset voltage, please check later');
      WaitForWorkThreadFinish();
    end
    else
      for i := 0 to 2 do
        if RzCheckGroup1.ItemChecked[i] then
        begin
          sleep(100);
          Output_Voltage(220 + i, 0.0);
        end;
  finally
    IsWorking:= false;
  end;
end;

function TForm1.SyncRefMeter(port: integer; strMode: string; Level: double): boolean;
var
  PortID: Smallint;
  CMC: WideString;
  IsYouGong: WordBool;
  StandardCS: double;
  CLever: WideString;
  procedure ChangeClever();
  begin
    if level <= 0.8 then
      CLever := '0.8'
    else
      CLever := '160'
  end;
begin
 PortID := port;
 CMC := strMode;
 IsYouGong :=  not (Pos('R', strMode) > 0);

  with RzRadioGroup5 do
    if Buttons[0].Checked or Buttons[2].Checked then
      CLever := FloatToStr(Level)           // for -K3D / K6D
    else if Buttons[1].Checked then
      CLever := FloatToStr(Level / 2)  //K3F
    else if Buttons[3].Checked then
      ChangeClever;      // K8F

  if RzSpinEdit1.IntValue = RzSpinEdit7.IntValue then
    openbox(7);

  Result := geny_api.K6D_SetLevel(PortID, CMC ,IsYouGong, CLever, StandardCS) ;

  if not Result then
    RzMemo1.Lines.add('error at the sync of reference meter');
end;

procedure TForm1.actRoutine1Execute(Sender: TObject);
begin
  stoptest := false;
  IsWorking := True;
  try
    with RzComboBox1 do
    begin
      if MultiplePortEnable then
      begin
        MultiplePortRoutine(kofOutputConnectMode) ;
        ShowMessage('Power sources are being output Connection Mode, please wait all finished');
        WaitForWorkThreadFinish();
        if RzCheckBox1.Checked then
        begin
           MultiplePortRoutine(kofActSetupModeRSM) ;
           ShowMessage('Reference meters are being Setup Mode, please wait all finished');
           WaitForWorkThreadFinish();
        end;
      end
      else
        if CtrlConnectMode(0, 220, Values[ItemIndex], RzRadioGroup1.Buttons[0].Checked) then
        begin
          ShowMessage('Wiring connection in power source has been succesfully modified');
          if RzCheckBox1.Checked then
            SyncRefMeter(RzSpinEdit7.IntValue, Values[ItemIndex], RzNumericEdit2.Value);
        end;
    end;
  finally
      IsWorking := false;
  end;
end;

function TForm1.CtrlConnectMode(addr: integer; strMode: string; IsCapacitveLoad: boolean): boolean;
const
  PhaseStr: string = '正相序';
var
  s: string;
begin
  // in API, the last parameter is fLoadL, is meant inductive load (感性) , Ture : Inductive, false: Capacitive of load
  s := geny_api.ConnectModeCtrl(RzSpinEdit1.IntValue, geny_comm_setting, addr, PhaseStr, strMode, not IsCapacitveLoad);
  Result := SameText(reply_geny, s);
  RzMemo1.Lines.add(format('addr: %d return err: %s', [addr, s]));
  sleep(300);
end;

function TForm1.CtrlConnectMode(index, addr: integer; strMode: string; IsCapacitveLoad: boolean): boolean;
begin
  Result := True;
  with RzCheckGroup1 do
  begin
    if Checks[0].Checked then
      Result := CtrlConnectMode(addr, strMode, IsCapacitveLoad);

    if Result and Checks[1].Checked then
    begin
      Result := CtrlConnectMode(addr + 1, strMode, IsCapacitveLoad);
    end;

    if Result and Checks[2].Checked then
    begin
      result := CtrlConnectMode(addr + 2, strMode, IsCapacitveLoad);
    end;
  end;
  if not Result then
    ShowMessage('Connect mode control is failure');
end;

procedure TForm1.ErrRead(portId: integer; HeadPos: integer; AGrid: TStringGrid; ARow: integer);
var
  ArrayData: array[1..6] of WideString;
  s: WideString;
  i: integer;
  function GetErrorValue(Source: string): string;
  begin
    //'getitem  Mid$(GetItem(CData(k), ",", 1),  3)
    Source := GetItem(Source, ',', 1);
    Result := Copy(Source, 3, 255);
  end;
begin
  s := geny_api.ErrCounterReadDataAll(portId, geny_comm_setting, HeadPos, ArrayData[1], ArrayData[2], ArrayData[3], ArrayData[4], ArrayData[5], ArrayData[6], 4, 1);
  if SameText(reply_geny, s) then
    with AGrid do
    begin
      for i := 1 to 6 do
        Cells[FixedCols - 1 + i, ARow] := GetErrorValue(ArrayData[i]);
    end
  else
    RzMemo1.Lines.add('Errors failed to read with returns:' + s);
end;

procedure TForm1.ErrRead(portId: integer; HeadPos: integer; AGrid: TStringGrid);
var
  ArrayData: array[1..6] of WideString;
  s: WideString;
  i: integer;
  function GetErrorValue(Source: string): string;
  begin
    //'getitem  Mid$(GetItem(CData(k), ",", 1),  3)
    Source := GetItem(Source, ',', 1);
    Result := Copy(Source, 3, 255);
  end;
begin
  s := geny_api.ErrCounterReadDataAll(portId, geny_comm_setting, HeadPos, ArrayData[1], ArrayData[2], ArrayData[3], ArrayData[4], ArrayData[5], ArrayData[6], 4, 1);
  if SameText(reply_geny, s) then
    with AGrid do
    begin
      for i := 1 to 6 do
        Cells[FixedCols, FixedRows - 1 + i] := GetErrorValue(ArrayData[i]);
    end
  else
    RzMemo1.Lines.add('Errors failed to read with returns:' + s);
end;

procedure TForm1.ErrRead(portId: integer; HeadPos: integer);
var
  ArrayData: array[1..6] of WideString;
  s: WideString;
  i: integer;
begin
  s := geny_api.ErrCounterReadDataAll(portId, geny_comm_setting, HeadPos, ArrayData[1], ArrayData[2], ArrayData[3], ArrayData[4], ArrayData[5], ArrayData[6], 4, 1);
  if SameText(reply_geny, s) then
    for i := 1 to 6 do
      RzMemo1.Lines.add(format('out%d: %s', [i, ArrayData[i]]))
  else
    RzMemo1.Lines.add('fail to read for:' + s);
end;

procedure TForm1.ReadCreepingTestData(portId: integer; MTU: integer);
begin

end;

procedure TForm1.ReadStartingTestData(portid: integer; MTU: Integer);
var
  s, _tmp: WideString;
begin
  s := geny_api.ErrCounterQQReadData(portid, geny_comm_setting, MTU, _tmp);
  if SameText(reply_geny, s) then
    RzMemo1.Lines.add(_tmp)
  else
    RzMemo1.Lines.add(Format('fail to read for pos%d: %s', [MTU, s]));
end;

procedure TForm1.ErrTest(portId: integer; CircleNu, AccessNbr, Mode: integer; StdImpluse: double; var AResult: boolean);
var
  s: WideString;
begin
  s := geny_api.ErrCounterTest(portId, geny_comm_setting, 199, CircleNu, StdImpluse, AccessNbr, Mode, 2.0, -2.0);
  AResult := SameText(reply_geny, s);
  if AResult then
    RzMemo1.Lines.add(format('ok->%s', [s]))
  else
    RzMemo1.Lines.add(format('fail->%s', [s]));
end;

procedure TForm1.ErrTestHighFreqInput(portId: integer; CircleNu, AccessNbr, Mode: integer; StdImpluse: double);
var
  s: WideString;
begin
  s := geny_api.ErrCounterTestHighFre(portId, geny_comm_setting, 199, CircleNu, StdImpluse, AccessNbr, Mode, 2.0, -2.0);
  if SameText(reply_geny, s) then
    RzMemo1.Lines.add(format('calculated standard impulses is %g, pulsing test ready->%s', [StdImpluse,s]))
  else
    RzMemo1.Lines.add(format('calculated standard impulses is %g, pulsing test fail->%s', [StdImpluse, s]));
end;

Function TForm1.LoadTestBenchLib() : Boolean ;
begin
  if MyTestBenchDllHandle > 32 then FreeLibrary(MyTestBenchDllHandle)  ;
  MyTestBenchDllHandle := LoadLibrary(PChar( Extractfilepath(ParamStr(0))+ sTestBenchDLLFileName ) );
  Result := (MyTestBenchDllHandle > 32) ;
  if not result then
    ShowMessage(sTestBenchLibLoadFail) ;
end;

procedure TForm1.ErrTest(portId: integer; CircleNu, AccessNbr: integer; AClockFre: double);
const
  FuncName = 'SetDayErrorTestEx';
var
  FuncPtr: TFarProc ;
  MyErrCal: TErrCalSetClockPulsingTest;
begin
  if not LoadTestBenchLib then Exit;
  FuncPtr:= GetProcAddress(MyTestBenchDllHandle ,  PChar(FuncName)) ;
  if FuncPtr <> nil then
   begin
        MyErrCal := FuncPtr;
        try
          if MyErrCal(portId , 199, CircleNu ,AccessNbr , AClockFre ) = 0 then
            ShowMessage('Clock pulsing test was set ok')
          else
            ShowMessage('Clock pulsing test was set fail');
        finally
          FuncPtr:= nil;
        end
   end
   else
      ShowMessage(Format('Couldn''t load %s from %s', [FuncName , sTestBenchDLLFileName]));

end;

procedure TForm1.ErrTest(portId: integer; CircleNu, AccessNbr, Mode: integer; StdImpluse: double);
var
  s: WideString;
begin
  s := geny_api.ErrCounterTest(portId, geny_comm_setting, 199, CircleNu, StdImpluse, AccessNbr, Mode, 2.0, -2.0);
  if SameText(reply_geny, s) then
    RzMemo1.Lines.add(format('pulsing test ready->%s', [s]))
  else
    RzMemo1.Lines.add(format('pulsing test fail->%s', [s]));
end;

procedure TForm1.CreepingTest(portId: integer; Samples, AccessNbr, Mode: integer; Duration: double);
var
  s: WideString;
begin
  s := geny_api.ErrCounterQianDong(portId, geny_comm_setting, 199, Duration, Samples, AccessNbr, Mode);
  if SameText(reply_geny, s) then
    RzMemo1.Lines.add(format('Creeping Test 199 ok->%s', [s]))
  else
    RzMemo1.Lines.add(format('Creeping Test 199 fail->%s', [s]));
end;

procedure TForm1.StartingTest(portId: integer; Samples, AccessNbr, Mode: integer; Duration: double);
var
  s: WideString;
begin
  s := geny_api.ErrCounterQiDong(portId, geny_comm_setting, 199, Duration, Samples, AccessNbr, Mode);
  if SameText(reply_geny, s) then
    RzMemo1.Lines.add(format('Creeping Test 199 ok->%s', [s]))
  else
    RzMemo1.Lines.add(format('Creeping Test 199 fail->%s', [s]));
end;

procedure TForm1.ErrTest(portId: integer; MeterPos, CircleNu, AccessNbr, Mode: integer; StdImpluse: double);
var
  s: WideString;
  procedure DoErrTest();
  begin
    if stoptest then
      exit;
    s := geny_api.ErrCounterTest(portId, geny_comm_setting, MeterPos, CircleNu, StdImpluse, AccessNbr, Mode, 2.0, -2.0);
    if not SameText(reply_geny, s) then
    begin
      sleep(200);
      DoErrTest;
    end;
  end;

begin

  DoErrTest;
  if SameText(reply_geny, s) then
    RzMemo1.Lines.add(format('Meter Position %d returns: %s at %s, ', [MeterPos, s, TimeToStr(Now())]))
  else
    RzMemo1.Lines.add(format('fail->%s', [s]));
  sleep(200);
end;

function TForm1.GetStdNbr(): double;
begin
  Result := rzedtCo.Value * rzedtCircleNbr.Value / rzedtCx.Value;
end;

function TForm1.GetStdNbr(ATestPulse: Integer): double;
begin
  Result := rzedtCo.Value * ATestPulse / rzedtCx.Value;
end;

procedure TForm1.actSetErrExecute(Sender: TObject);
begin
  stoptest := false;
  IsWorking := True;
  try
    if MultiplePortEnable then
      begin
        MultiplePortRoutine(kofErrCalcPulsingTest) ;
        ShowMessage('Test benches are under plusing test, please wait all finished');
        WaitForWorkThreadFinish();
      end
    else
      ErrTest(RzSpinEdit1.IntValue, rzedtCircleNbr.IntValue, rzedtAccessNbr.IntValue, 1, GetStdNbr());
  finally
    IsWorking := false;
  end;
end;

procedure TForm1.actStoptestExecute(Sender: TObject);
begin
  if MessageDlg('stop test?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    stoptest := True;
end;

procedure TForm1.actTestCtrConnModeExecute(Sender: TObject);
var
  s: string;
begin
  s := geny_comm_setting;
  s := geny_api.ConnectModeCtrl(1, s, 220, '正相序', '4W', false);
  RzMemo1.Lines.add(s);
end;

procedure TForm1.actTestOpenBoxExecute(Sender: TObject);
type
  TChannels = set of TGenyChannel;

  procedure doTest();
  const
    Values: TChannels = [1, 2, 7];
  var
    i: TGenyChannel;
  begin
    for i := 1 to 7 do
      if i in Values then
      begin
        if stoptest then
          break;
        openbox(i);
        Application.ProcessMessages;
      end;
  end;

var
  i: integer;
begin
  stoptest := false;
  IsWorking := True;
  try
    if MultiplePortEnable then
    begin
        MultiplePortRoutine(kofCommTest);
        WaitForWorkThreadFinish();
    end
    else
      for i := 1 to RzSpinEdit2.IntValue do
        if stoptest then
          break
        else
          doTest;
  finally
    IsWorking := False;
  end;
  ShowMessage('repeatablity test is done!');
end;

procedure TForm1.openbox(const Channel: TGenyChannel);
var
  s: WideString;
begin
  geny_api := CoYCIVCtrClass.Create;
  s := geny_comm_setting;
  s := geny_api.openbox(RzSpinEdit1.IntValue, Channel, s);
  Sleep(500);
  RzMemo1.Lines.add(format('%s:  %s', [TimeToStr(now()), s]));
end;

procedure TForm1.openbox(port : Integer ; const Channel: TGenyChannel);
var
  s: WideString;
begin
  geny_api := CoYCIVCtrClass.Create;
  s := geny_comm_setting;

  s := geny_api.openbox(port, Channel, s);
  Sleep(500);
  RzMemo1.Lines.add(format('%s: COM port(%d) return: %s', [TimeToStr(now()), port, s]));

end;

procedure TForm1.Output_Voltage(const Voltage, Amplitude: double; Value: double);

  function CheckValue(): boolean;
  begin
    Result := (Value >= Voltage);
  end;

var
  i: integer;
begin
  if stoptest or CheckValue then
    exit;
  Value := Value + Voltage * Amplitude;
  if CheckValue then
    Value := Voltage;

  for i := 0 to 2 do
    if RzCheckGroup2.ItemChecked[i] then
    begin
      sleep(100);
      Output_Voltage(220 + i, Value);
    end;
  sleep(1000);
  if not CheckValue() then
    Output_Voltage(Voltage, Amplitude, Value);
end;

procedure TForm1.Output_PhaseAngle(id: integer; Value: double; const RetryCount: integer);
var
  s: WideString;
begin
  if stoptest or (RetryCount > 3) then
    exit;
  if Value > 360.0 then
     value := Value -360.0;
  s := geny_comm_setting;
  s := geny_api.CosOut(RzSpinEdit1.IntValue, s, id, Value);
  RzMemo1.Lines.add(format('%s:  Phase angle(%d)=%8.3f Degree , %s', [TimeToStr(now()), id, Value, s]));
  if not SameText(reply_geny, s) then
  begin
    sleep(500);
    Application.ProcessMessages;
    Output_PhaseAngle(id, Value, RetryCount + 1);
  end;
    //s := geny_api.CosOut(RzSpinEdit1.IntValue, s, id, Value);
end;

procedure TForm1.Output_Freq(id: integer; Value: double);
var
  s: WideString;
  i: Integer;
begin
  if stoptest then
    exit;
  s := geny_api.FrequencyOut(RzSpinEdit1.IntValue, geny_comm_setting, id, Value);
  if not SameText(reply_geny, s) then
    s := geny_api.FrequencyOut(RzSpinEdit1.IntValue, geny_comm_setting, id, Value);

  RzMemo1.Lines.add(format('%s:  Freqency of (%d)=%8.3f Hz , %s', [TimeToStr(now()), id, Value, s]));
end;

procedure tform1.VoltageWaveOut(id: integer; AAmp, AAngel : double; ATimes : Integer ;  AType : TKindOfHarmonic);
var
  s: WideString;
  i: Integer;
begin
  if stoptest then
    exit;
  //s := geny_comm_setting;
  s := geny_api.VoltageXieBo(RzSpinEdit1.IntValue, geny_comm_setting, id, AAmp, ATimes, AAngel,HarmonicesInts[AType]);
  if not SameText(reply_geny, s) then
    s := geny_api.VoltageXieBo(RzSpinEdit1.IntValue, geny_comm_setting, id, AAmp, ATimes, AAngel,HarmonicesInts[AType]);

  RzMemo1.Lines.add(format('%s: Harmonice (%s) Voltage Wave(%d) outputs with times %d, amplitude %5.2f%%, phase angle %5.1f, %s',
    [TimeToStr(now()), LoadResString(HarmonicesPResStrs[atype])  ,id, ATimes , AAmp,  AAngel  ,  s]));
end;

procedure tform1.CurrentWaveOut(id: integer; AAmp, AAngel : double; ATimes : Integer ;  AType : TKindOfHarmonic);
var
  s: WideString;
  i: Integer;
begin
  if stoptest then
    exit;
  //s := geny_comm_setting;
  s := geny_api.CurrentXieBo(RzSpinEdit1.IntValue, geny_comm_setting, id, AAmp, ATimes, AAngel,HarmonicesInts[AType]);
  if not SameText(reply_geny, s) then
    s := geny_api.CurrentXieBo(RzSpinEdit1.IntValue, geny_comm_setting, id, AAmp, ATimes, AAngel,HarmonicesInts[ AType]);

  RzMemo1.Lines.add(format('%s: Harmonice (%s) Current Wave(%d) outputs with times %d, amplitude %5.2f%%, phase angle %5.1f, %s',
    [TimeToStr(now()), LoadResString(HarmonicesPResStrs[atype])  ,id, ATimes , AAmp,  AAngel  ,  s]));
end;

procedure TForm1.ResetWave(id: integer);
var
  s: WideString;
  i: Integer;
begin
  if stoptest then
    exit;
  //s := geny_comm_setting;
  s := geny_api.WaveReset(RzSpinEdit1.IntValue, geny_comm_setting, id);
  if not SameText(reply_geny, s) then
    s := geny_api.WaveReset(RzSpinEdit1.IntValue, geny_comm_setting, id);

  RzMemo1.Lines.add(format('%s: Harmonice Wave(%d) is clear, %s', [TimeToStr(now()), id, s]));
end;

procedure TForm1.Output_Voltage(id: integer; Value: double);
var
  s: WideString;
  i: Integer;
begin
  if stoptest then
    exit;
  //s := geny_comm_setting;
  repeat
    s := geny_api.VoltageOut(RzSpinEdit1.IntValue, geny_comm_setting, id, Value, True);
    RzMemo1.Lines.add(format('%s:  U(%d)=%8.3f V , %s', [TimeToStr(now()), id, Value, s]));
  until SameText(reply_geny, s) or stoptest
   // s := geny_api.VoltageOut(RzSpinEdit1.IntValue, geny_comm_setting, id, Value, True);
end;

procedure TForm1.Output(ComPort, id: integer);
var
  s: string;
begin
  s := geny_api.SignalSourceCtrl(ComPort, geny_comm_setting, id, 0.0, 0.0, 0.0, 50, True);
  if not SameText(reply_geny, s) then
  begin
    sleep(500);
    s := geny_api.SignalSourceCtrl(ComPort, geny_comm_setting, id, 0.0, 0.0, 0.0, 50, True);
  end;

  s := geny_api.CurrentOut(ComPort, geny_comm_setting, id, 0.0, true  );

  if SameText(reply_geny, s) then
    RzMemo1.Lines.add(format('the power source is reset at %s', [TimeToStr(now())]))
  else
    RzMemo1.Lines.add(format('error on communication at %s', [s]));
end;

procedure TForm1.Output(ComPort, id: integer; AVolt, ACurr, AUI, AFreq: double; var AResult: boolean);
var
  s: string;
begin
  s := geny_api.SignalSourceCtrl(ComPort, geny_comm_setting, id, ACurr, AVolt, AUI, AFreq, True);
  AResult := SameText(reply_geny, s);
  if AResult then
    RzMemo1.Lines.add(format('%s power source output at U:%8.3fV, I:%8.4fA, UI:%6.2fDegree, Freq:%8.4fHz', [TimeToStr(Now()),AVolt ,ACurr ,AUI, AFreq]))
  else
    RzMemo1.Lines.add(format('%s power source failed to output', [TimeToStr(Now())]));
end;

procedure TForm1.Output(ComPort, id: integer; AVolt, ACurr, AUI, AFreq: double);
var
  s: string;
begin
  s := geny_api.SignalSourceCtrl(ComPort, geny_comm_setting, id, ACurr, AVolt, AUI, AFreq, True);
  if SameText(reply_geny, s) then
    //RzMemo1.Lines.add(format('%s power source output completely', [TimeToStr(Now())]))
    RzMemo1.Lines.add(format('%s power source output at U: %g V, I: %g A, UI: %g Degree, Freq: %g Hz', [TimeToStr(Now()),AVolt ,ACurr ,AUI, AFreq]))
  else
    //RzMemo1.Lines.add(format('%s power source failed to output', [TimeToStr(Now())]));
    RzMemo1.Lines.add(format('%s power source failed to output', [TimeToStr(Now())]));
end;

procedure TForm1.Output(ComPort, id: integer; sLoadPoint: string);
var
  s: string;

  function GetCurrData(): double;
  begin
    Result := RzNumericEdit2.Value;
  end;

  function GetVoltData(): double;
  begin
    Result := RzNumericEdit1.Value;
  end;

begin
  s := geny_api.SignalSourceCtrl(ComPort, geny_comm_setting, id, GetCurrData, GetVoltData,  0.0, RzNumericEdit7.Value, True);
  if SameText(reply_geny, s) then
    RzMemo1.Lines.add(format('Output of %s is done at %s', [sLoadPoint, TimeToStr(now())]))
  else
    RzMemo1.Lines.add(format('Output of %s is not work at %s', [sLoadPoint, TimeToStr(now())]));

end;

procedure TForm1.Output_Current(ComPort, id: integer; Value: double);
var
  s: WideString;
begin
  if stoptest then
    exit;
  s := geny_comm_setting;
  s := geny_api.CurrentOut(ComPort, s, id, Value, True);
  if SameText(reply_geny, s) then
    RzMemo1.Lines.add(format('%s:  I=%8.3f A , %s', [TimeToStr(now()), Value, s]))
  else
    Output_Current(ComPort, id, Value);

end;

procedure TForm1.Output_Current_Percentage(id: integer; Level, Value: double);
var
  s: WideString;
begin
  if stoptest then
    exit;
  s := geny_api.CurrentLeverPerOut(RzSpinEdit1.IntValue, geny_comm_setting, id, Level, Value);
  if not SameText(reply_geny, s) then
    s := geny_api.CurrentLeverPerOut(RzSpinEdit1.IntValue, geny_comm_setting, id, Level, Value);
  RzMemo1.Lines.add(format('%s: I=%8.4f I=%8.2f %%, %s', [TimeToStr(now()), Level, Value, s]));
end;

procedure TForm1.Output_Current_Percentage(id: integer; Value: double);
var
  s: WideString;
begin
  if stoptest then
    exit;
  s := geny_api.CurrentPercentOut(RzSpinEdit1.IntValue, geny_comm_setting, id, Value);
  if not SameText(reply_geny, s) then
    s := geny_api.CurrentPercentOut(RzSpinEdit1.IntValue, geny_comm_setting, id, Value);
  RzMemo1.Lines.add(format('%s: I=%8.2f %%, %s', [TimeToStr(now()), Value, s]));
end;

procedure TForm1.Output_Voltage_Percentage(id: integer; Level, Value: double);
var
  s: WideString;
begin
  if stoptest then
    exit;
  s := geny_api.VoltageLeverPerOut(RzSpinEdit1.IntValue, geny_comm_setting, id, Level, Value);
  if not SameText(reply_geny, s) then
    s := geny_api.VoltageLeverPerOut(RzSpinEdit1.IntValue, geny_comm_setting, id, Level, Value);
  RzMemo1.Lines.add(format('%s: U=%8.3f U=%8.2f %%, %s', [TimeToStr(now()), Level, Value, s]));
end;

procedure TForm1.Output_Voltage_Percentage(id: integer; Value: double);
var
  s: WideString;
begin
  if stoptest then
    exit;
  s := geny_api.VoltagePercentOut(RzSpinEdit1.IntValue, geny_comm_setting, id, Value);
  if not SameText(reply_geny, s) then
    s := geny_api.VoltagePercentOut(RzSpinEdit1.IntValue, geny_comm_setting, id, Value);
  RzMemo1.Lines.add(format('%s: U=%8.2f %%, %s', [TimeToStr(now()), Value, s]));
end;


procedure TForm1.Output_Current(id: integer; Value: double);
var
  s: WideString;
begin
  if stoptest then
    exit;
  repeat
    s := geny_api.CurrentOut(RzSpinEdit1.IntValue, geny_comm_setting, id, Value, True);
    RzMemo1.Lines.add(format('%s:  I=%8.3f A , %s', [TimeToStr(now()), Value, s]));
  until (SameText(reply_geny, s)) or stoptest ;
end;

procedure TForm1.ReadMeasuredData(portId: integer);
var
  _s: string;
  _v, _c: OleVariant;
  _settingStr: WideString;
begin
  geny_api := CoYCIVCtrClass.Create;
  _settingStr := geny_comm_setting;
  _s := geny_api.K6D_ReadWrite(portId, 0, 'D', '', '', _v, _c, _settingStr);
  RzMemo1.Lines.add(format('measured@%s:', [TimeToStr(now)]) + #13#10 + _s);
end;

procedure TForm1.actReadStartingTestDataExecute(Sender: TObject);
begin
  ReadStartingTestData(RzSpinEdit1.IntValue, rzedtHeadPos.IntValue);
end;

procedure TForm1.rzstrngrd1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  le: integer;
begin
  with TRzStringGrid(Sender).Canvas do
  begin
    SetTextAlign(Handle, TA_CENTER);
    le := (Rect.Left + Rect.Right) div 2;
    TextRect(Rect, le, Rect.Top + 2, TRzStringGrid(Sender).Cells[ACol, ARow]);
  end;
end;

function TForm1.GetClampCTOfCalc(): TKindOfCalc;
const
  _Values: array[0..5] of TKindOfCalc = (kofCal_d1, kofCal_d5, kofCal_c1, kofCal_c5, kofCal_c20, kofCal_c80);
begin
  Result := kofCal_d1;
  with rzcmbx2 do
    if ItemIndex > -1 then Result := _Values[ItemIndex];
end;

function TForm1.GetClampCT_VoltageCode(): TKindOfVoltage;
const
  _Values: array[0..3] of TKindOfVoltage = (chkp100, chkp220, chkp380, chkp57);
begin
  Result := chkp100;
  with rzcmbx1 do
    if ItemIndex > -1 then Result := _Values[ItemIndex];
end;

function TForm1.GetClampCT_CheckPoint(): TKindOfCheckPoint;
begin
  with rzrdgrp2 do
    if Buttons[0].Checked then
      Result := staFull
    else if Buttons[1].Checked then
      Result := staLine
    else if Buttons[2].Checked then
      Result := staCapacity
    else if Buttons[3].Checked then
      Result := staAngular
    else
      Result := staFull;
end;


procedure TForm1.PowerSource_ClampCT(aU, aI, aAngle: Double);
  procedure doSyncReference();
  begin
    SyncRefMeter(RzSpinEdit1.IntValue, '4W', aI);
  end;
  procedure doVoltage();
  var
    i: integer;
  begin
    for i := 0 to 2 do
      if RzCheckGroup1.ItemChecked[i] then
      begin
        sleep(100);
        Output_Voltage(220 + i, aU);
      end;
  end;
  procedure doCurrent(); //only apply to current at Phase A;
  var
    i: integer;
  begin
    for i := 0 to 2 do
      if RzCheckGroup1.ItemChecked[i] then
      begin
        sleep(100);
        Output_Current(220 + i, aI);
      end;

  end;

  procedure doAngle();
  var
    i: integer;
  begin
    Output_PhaseAngle(220, aAngle);
  end;

begin
  if IsWorking then Exit;
  IsWorking := True;
  try
    doSyncReference;
    doVoltage; //voltage
    doAngle; // angle
    doCurrent; //current
  finally
    IsWorking := False;
  end;
end;

procedure TForm1.RaisePowerSource_AutoCalc_CT(const HasNotify: boolean);
var
  i: integer;
  _U, _I, _Angle: Double;
begin
  //raise the power source as test conditions: U/I/PF
  with rzcmbx1 do
    _U := StrToFloat(Values[ItemIndex]);

  with rzcmbx2 do
    _I := StrToFloat(Values[itemIndex]);
  if rzrdgrp2.Buttons[1].Checked or rzrdgrp2.Buttons[3].Checked then
    _i := _i * 0.1;

  with rzrdgrp2 do
{$IFDEF __DEBUG}
    _Angle := 60.0;
{$ELSE}
  if Buttons[0].Checked or Buttons[1].Checked then
    _Angle := 0.0
  else if Buttons[2].Checked or Buttons[3].Checked then
    _Angle := 60.0;

{$ENDIF}
  if HasNotify then
  begin
    if MessageDlg(Format('To raise the power source at U=%8.4f V,' +
      'I= %8.4f, Phase Angle= %8.4f', [_U, _I, _Angle]), mtConfirmation, [mbYes, mbNo], 0) = mrNo then
      Abort;
  end;
  PowerSource_ClampCT(_U, _I, _Angle);

end;

procedure TForm1.actClampTestOnExecute(Sender: TObject);


//  procedure doCalc(index: Integer);
//  begin
//    if index > rzchckgrp1.Items.Count - 1 then exit;
//    with rzchckgrp1, rzstrngrd1 do
//      if Checks[index].Checked then
//        Calc_ClampCT(StrToInt(Cells[1, index + fixedRows]));
//    Inc(index);
//  end;
begin
  RaisePowerSource_AutoCalc_CT;
  MessageBoxTimeOut(Handle, PChar('power stability'), PChar('time out of 10 sec.'), TimeOutOKFlag, 0, 10000);
  if stoptest then Exit;
  //doCalc(0);
end;

procedure TForm1.actClampTestOnUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not IsWorking_ClampCT;
end;

procedure TForm1.actOpenConfigrationExecute(Sender: TObject);
var
  frm: TFrmTestBenchConfig;
begin
  frm := TFrmTestBenchConfig.Create(nil);
  try
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

procedure TForm1.actClampTestOffExecute(Sender: TObject);
begin
  // shut down the source
  if MessageDlg('turn off the power', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    actResetOutputExecute(nil);
end;

procedure TForm1.ClampTestOnCheck(Sender: TObject; Addr: Integer);
var
  index: Integer;
begin
  with rzstrngrd1 do
  begin
    index := Cols[1].IndexOf(IntToStr(Addr));
    if index > -1 then
    begin
      Cells[3, index] := 'calculation completed! ';
      CT_Checks[index] := true;
    end;
  end;
end;

procedure TForm1.ClampTestOnCalcTesting(Sender: TObject; Addr: Integer);
var
  index: Integer;
begin
  with rzstrngrd1 do
  begin
    index := Cols[1].IndexOf(IntToStr(Addr));
    if index > -1 then
      Cells[3, index] := 'on testing of ' + TClampTest(Sender).Name;
  end;
end;

procedure TForm1.ClampTestOnShakeHand(Sender: TObject; Addr: Integer);
var
  index: Integer;
begin
  with rzstrngrd1 do
  begin
    index := Cols[1].IndexOf(IntToStr(Addr));
    if index > -1 then
      Cells[2, index] := 'connected to CT';
  end;
end;

procedure TForm1.ClampCT_ShakeHand(CT_Addr: integer);
var
  _MyComm: TMyComm;
  _ClampTest: TClampTest;
begin
  _MyComm := TMySPComm.Create(cbprtlst1.CommPort, ClampCT_Comm_Setting);
  try
    _ClampTest := TClampTest.Create(nil);
    try
      with _ClampTest do
      begin
        Comm := _MyComm;
        ShakeHand := ClampTestOnShakeHand;
      end;

      _ClampTest.ClampCT_ShakeHand(CT_Addr, GetClampCTOfCalc);

    finally
      _ClampTest.Free;
    end;
  finally
    _MyComm.free;
  end;
end;

function TForm1.GetCTAddr(index: integer): integer;
begin
  with rzstrngrd1 do
    Result := StrToInt(Cells[1, FixedRows + index]);
end;

procedure TForm1.actShakeHandExecute(Sender: TObject);
var
  i: integer;
begin
  // shake hand ...
  for i := 0 to rzchckgrp1.ControlCount - 1 do
    if rzchckgrp1.Checks[i].Checked then
      ClampCT_ShakeHand(GetCTAddr(i));
end;

procedure TForm1.ClampCT_SetCalc(CT_Addr: integer);
var
  _MyComm: TMyComm;
  _ClampTest: TClampTest;

begin
  _MyComm := TMySPComm.Create(cbprtlst1.CommPort, ClampCT_Comm_Setting);
  try
    _ClampTest := TClampTest.Create(nil);
    try
      with _ClampTest do
      begin
        Comm := _MyComm;
        OnCalc := ClampTestOnCalcTesting;
      end;

      _ClampTest.ClampCT_Calc(CT_Addr, GetClampCT_VoltageCode, GetClampCT_CheckPoint);

    finally
      _ClampTest.Free;
    end;
  finally
    _MyComm.free;
  end;
end;

procedure TForm1.ClampCT_Check(CT_Addr: integer);
var
  _MyComm: TMyComm;
  _ClampTest: TClampTest;
begin
  _MyComm := TMySPComm.Create(cbprtlst1.CommPort, ClampCT_Comm_Setting);
  try
    _ClampTest := TClampTest.Create(nil);
    try
      with _ClampTest do
      begin
        Comm := _MyComm;
        OnCheck := ClampTestOnCheck;
      end;

      _ClampTest.ClampCT_Check(CT_Addr);

    finally
      _ClampTest.Free;
    end;
  finally
    _MyComm.free;
  end;
end;


procedure TForm1.actSetChkpToClampExecute(Sender: TObject);
var
  i: integer;
begin
  // set chkp...
  for i := 0 to rzchckgrp1.ControlCount - 1 do
    if rzchckgrp1.Checks[i].Checked then
      ClampCT_SetCalc(GetCTAddr(i));
end;

procedure TForm1.actGetResultExecute(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to rzchckgrp1.ControlCount - 1 do
    if rzchckgrp1.Checks[i].Checked then
      ClampCT_Check(GetCTAddr(i));
end;

procedure TForm1.actAutoCalcExecute(Sender: TObject);
begin
  if MessageDlg('Press click yes to start auto calc. routine', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    actShakeHandExecute(nil);
    try
      AutoCalc(staFull);
    finally
      stoptest := false;
    end;
  end;

end;

function TForm1.GetFinetuneItemName(): string;
begin
  with rzrdgrpFinetune do
    if Buttons[0].Checked then
    begin
      Result := Items[0];
    end
    else if Buttons[1].Checked then
    begin
      Result := Items[1];
    end
    else if Buttons[2].Checked then
    begin
      Result := Items[2];
    end
    else if Buttons[3].Checked then
    begin
      Result := Items[3];
    end
    else if Buttons[4].Checked then
    begin
      Result := Items[4];
    end
    else if Buttons[5].Checked then
    begin
      Result := Items[5];
    end
    else
      Result := '';
end;

procedure TForm1.AdjustmentOnStopWaitTimeEvent(Sender: TObject; var Value: Boolean);
begin
  ReadReferenceMeasurement;
  Value := stoptest;
end;

procedure TForm1.DailTestOnStopWaitTimeEvent(Sender: TObject; var Value: Boolean);
//var
//  s: string;
begin
  //read Impluses accumulation data;
  if ReadDailTest(RzSpinEdit1.IntValue, SImpulseReading) then
  begin
    rzlblAccumValue.Caption := sDailTestImpAccum + ' : ' + SImpulseReading;
    rzlblCurrPower.Caption := Format('%s : %8.5f KWH', [sDailTestPowerAccum, StrToFloat(SImpulseReading) / rzedtCo.Value ]) ;
    rzlblMeanPower.Caption := Format('%s : %8.5f KW', [sMaxDemandMeanPower, (StrToFloat(SImpulseReading) / rzedtCo.Value) / ((Now() - DailTest_T) * 24) ])   ;
  end;
  Value := stoptest or (StrToFloat(SImpulseReading) / rzedtCo.Value >= RzNmEdtDosage.Value);
  //rzlblMeanPower.Caption := Format('%s : %8.5f KW', [sMaxDemandMeanPower, (Now() - DailTest_T) * 24 ])   ;
  with RzStatusPane1 do
  Caption := 'wait elapsed time: ' + FormatDateTime('hh:mm:ss', (Now() - DailTest_T ));
end;

procedure TForm1.AdjustmentOnTimeOut(Sender: TObject);
begin
  RzMemo1.Lines.Add(Format('end of wait@ %s', [TimeToStr(Now)]));
end;


procedure TForm1.DailTestReadingRoutine();
var
  i : integer;
  s: string;
  value: double;
  function getPluseReading(StrCommaText: string) : boolean;
  var
    i: Integer;
    s: string;
  begin
       Result := False;
        i:= 0;
        s:= trim(GetItem(StrCommaText, ',', i));
        while not SameText('',  s) do
        begin
          Result :=  ReadDailTest(RzSpinEdit1.IntValue, StrToInt(s)) ;
          if not Result then
            Break;
          Inc(i);
          s:= trim(GetItem(StrCommaText, ',', i));

        end;
  end;
begin
    value := StrToFloat(SImpulseReading) * rzedtCx.Value / rzedtCo.Value  ;  //theroy pulses number to be calculated
    //get reading of pulses
    if getPluseReading(rzdtCommaOfSequ.Text)then   //for new version
    begin
     with rzStrgrdErrsDailTest do
      for i := FixedRows to RowCount - 1 do
        if SameText(Cells[2, i], 'yes') then //and ReadDailTest(RzSpinEdit1.IntValue, StrToInt(Cells[1,i])  , s) then
          Cells[4, i] := Format('%8.4f %', [  100.0 * (StrToFloatdef(Cells[3, i], 0.0) - value) / value  ]);
    end
    else    //for compatiable of old version firmware
    begin
     with rzStrgrdErrsDailTest do
      for i := FixedRows to RowCount - 1 do
        if SameText(Cells[2, i], 'yes') and ReadDailTest(RzSpinEdit1.IntValue, StrToInt(Cells[1,i])  , s) then
        begin
          Cells[3, i] := s ;
          Cells[4, i] := Format('%8.4f %', [  100.0 * (StrToFloatDef(s,0.0) - value) / value  ]);
        end;
    end;
end;

procedure TForm1.DailTestOnTimeOut(Sender: TObject);
begin
  RzMemo1.Lines.Add(Format('Dail test reading stop at %s', [TimeToStr(Now)]));

  //disconn the relay
    if rzchkbRelay.Checked then
      RelayCommRoutine(rzcmbxCommand.Values[0]);

  // show pulsing error if checked
  if rzchkbPlusingError.Checked then
  begin
     StopErrorCalculator(RzSpinEdit1.IntValue);
     DailTestReadingRoutine();
  end;
end;

procedure TForm1.actDebugAutoAdjustExecute(Sender: TObject);
var
  AWaitObj: TWaitTime;
  procedure WriteFinetune(const index: Integer);
  var
    _row, _col: integer;
  begin
    if (index > 2) or stoptest then Exit;

    with RzCheckGroup1 do
      if Checks[index].Checked then
      begin
        //ShowMessage(format('start to write into phase %s', [Checks[index].Caption]));
        RzMemo1.Lines.Add(format('start to write into phase %s', [Checks[index].Caption]));
        WriteFinetuneParam(index);
      end;
    ReadReferenceMeasurement;
    RzMemo1.Lines.Add(Format('begin of wait@ %s', [TimeToStr(Now)]));
    AWaitObj.WaitSeconds(edtWaitTime.IntValue); // wait for 10 seconds,
    WriteFinetune(index + 1);
  end;
begin
  IsWorking:= True;
  try
    // auto adjustment
    AWaitObj := TWaitTime.Create;
    with AWaitObj do
    begin
      OnStopWaitTime := AdjustmentOnStopWaitTimeEvent;
      OnTimeOutEvent := AdjustmentOnTimeOut;
    end;

    try
      ReadReferenceMeasurement;
      if MessageDlg(format('go adjustment for finetune %s', [GetFinetuneItemName()]), mtInformation, [mbYes, mbNo], 0) = mrYes then
      begin
      // 1st write last finetune to 158
        repeat
          WriteFinetune(0);
          ReadReferenceMeasurement;
        until stoptest;
      end;
      ShowMessage('auto adjustment finished!');
    finally
      AWaitObj.Free;
      stoptest := False;
    end;
  finally
    IsWorking:= False;
  end;
end;

procedure TForm1.AutoCalc(index: TKindOfCheckPoint);
const
  StrChkPoints: array[TKindOfCheckPoint] of string = ('full range', 'lineal', 'capacitive', 'angle line');
  procedure StartAutoCalc();
  begin
    RaisePowerSource_AutoCalc_CT(False);
    actSetChkpToClampExecute(nil);
    tmr1.Enabled := true;
  end;
  function CheckResult(): boolean;
  var
    i: integer;
  begin
    Result := True;
    for i := 0 to rzchckgrp1.ControlCount - 1 do
      if rzchckgrp1.Checks[i].Checked then
        Result := Result and CT_Checks[i];
  end;
begin
  if Auto_Calc_CT_On or stoptest then exit;
  if index > staAngular then
  begin
    ShowMessage('Auto calculating is over');
    exit;
  end;

  case index of
    staFull: rzrdgrp2.Buttons[0].Checked := True;
    staLine: rzrdgrp2.Buttons[1].Checked := True;
    staCapacity: rzrdgrp2.Buttons[2].Checked := True;
    staAngular: rzrdgrp2.Buttons[3].Checked := True;
  else;
  end;

  ShowMessage(StrChkPoints[index]);
  Auto_Calc_CT_On := True;

  try
    //start to auto_calc...
    FillChar(CT_Checks, 6, 0);
    StartAutoCalc;
    repeat
      Application.ProcessMessages;
    until CheckResult or stoptest;

    //shut down the source
    actResetOutputExecute(nil);
  finally
    Auto_Calc_CT_On := false;
    tmr1.Enabled := false;
  end;
  inc(index);
  AutoCalc(index);
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
   //ShowMessage('timer event...')
  //actGetResultExecute(nil);
end;

procedure TForm1.HandleOnSuccessfulWriteFinetuneParam(Sender: TObject);
begin
  with RzMemo1 do
    Lines.Add('Write successfully');
end;

procedure TForm1.HandleOnFailWriteFinetuneParam(Sender: TObject);
begin
  with RzMemo1 do
    Lines.Add('it''s fail to write');
end;

procedure TForm1.SaveFinetuneTo158(const Index: Integer);
var
  ComObj: TMyComm;
  FinetuneObj: TFinetune;
  function GetPhase(): TKindOfPhaseOfFinetune;
  begin
    case Index of
      0: Result := ftPhaseA;
      1: Result := ftPhaseB;
      2: Result := ftPhaseC;
    end;
  end;
begin
  ComObj := TMySPComm.Create(GetTestBenchCommPort(), '19200,n,8,2');
  try
    FinetuneObj := TFinetune.Create(nil);

    with FinetuneObj do
    begin
      Comm := ComObj;
      Phase := GetPhase();

      OnSuccess := HandleOnSuccessfulWriteFinetuneParam;
      OnFaiL := HandleOnFailWriteFinetuneParam;
    end;

    try
      //asm Int 3 end;
      FinetuneObj.WriteParam(kofSaveParam, 1.0);
    finally
      FinetuneObj.Free;
    end;

  finally
    ComObj.Free;
  end;
end;

procedure TForm1.WriteFinetuneParam(const Index: Integer);
var
  ComObj: TMyComm;
  FinetuneObj: TFinetune;
  function GetVoltageActual(Value: TKindOfPhaseOfFinetune): Double;
  begin
    Result := 0.0;
    case Value of
      ftPhaseA: Result := _RecData.Ua;
      ftPhaseB: Result := _RecData.Ub;
      ftPhaseC: Result := _RecData.Uc;
    end;
  end;
  function GetCurrentActual(Value: TKindOfPhaseOfFinetune): Double;
  begin
    Result := 0.0;
    case Value of
      ftPhaseA: Result := _RecData.Ia;
      ftPhaseB: Result := _RecData.Ib;
      ftPhaseC: Result := _RecData.Ic;
    end;
  end;
  procedure doWriteParams;
  var
    Kind: TKindOfPhaseOfFinetune;
    Ftune: TKindOfAdjustParam;
    Value: Single;
    _row, _col: Integer;
    ER: Double;  // relative error
  begin
    if index = 0 then
    begin
      Kind := ftPhaseA;
      _row := rzGrdWriteKb.FixedRows;
    end
    else if index = 1 then
    begin
      Kind := ftPhaseB;
      _row := rzGrdWriteKb.FixedRows + 1;
    end
    else if index = 2 then
    begin
      Kind := ftPhaseC;
      _row := rzGrdWriteKb.FixedRows + 2;
    end;

    with rzrdgrpFinetune do
      if Buttons[0].Checked then
      begin
        Ftune := kofWri_U_L;
        _col := rzGrdWriteKb.FixedCols;
        ER := GetRelativeError(GetVoltageActual(Kind), RzNumericEdit1.Value);
      end
      else if Buttons[1].Checked then
      begin
        Ftune := kofWri_U_C;
        _col := rzGrdWriteKb.FixedCols + 1;
        ER := GetRelativeError(GetVoltageActual(Kind), RzNumericEdit1.Value);
      end
      else if Buttons[2].Checked then
      begin
        Ftune := kofWri_PhP_L;
        _col := rzGrdWriteKb.FixedCols + 2;
      end
      else if Buttons[3].Checked then
      begin
        Ftune := kofWri_PhP_C;
        _col := rzGrdWriteKb.FixedCols + 3;
      end
      else if Buttons[4].Checked then
      begin
        Ftune := kofWri_Current;
        _col := rzGrdWriteKb.FixedCols + 4;
        // get current relative error
        ER := GetRelativeError(GetCurrentActual(Kind), RzNumericEdit2.Value);
      end
      else if Buttons[5].Checked then
      begin
        Ftune := kofWri_Freq;
        _col := rzGrdWriteKb.FixedCols + 5;
      end;
    //if ER * 100 < 0.05 then exit
    //if 0.05 > Abs(ER * 100.0) then Exit;

    Value := StrToFloat(rzGrdWriteKb.Cells[_col, _row]); // old value, to calc a new value to instead it.

    Value := GetKb(0.0, value, ER);

    Assert((0.95 < Value) and (1.05 > Value), 'out of range, value must be [0.95, 1.05]');

    with FinetuneObj do
    begin
      Phase := Kind;
      WriteParam(Ftune, Value);
    end;

    rzGrdWriteKb.Cells[_col, _row] := Format('%8.4f', [Value]);
  end;

begin
  ComObj := TMySPComm.Create(GetTestBenchCommPort(), '19200,n,8,2');
  try
    FinetuneObj := TFinetune.Create(nil);

    with FinetuneObj do
    begin
      Comm := ComObj;
      OnSuccess := HandleOnSuccessfulWriteFinetuneParam;
      OnFaiL := HandleOnFailWriteFinetuneParam;
    end;

    try
      //asm Int 3 end;
      doWriteParams;

    finally
      FinetuneObj.Free;
    end;

  finally
    ComObj.Free;
  end;

end;

procedure TForm1.HandleOnParamStrs(Sender: Tobject; AParamStr: TStrings);
const
  ArrayPhase: array[TKindOfPhaseOfFinetune] of string = ('A', 'B', 'C');
begin
  //asm int 3 end;
  AParamStr.Insert(0, Format('Phase %s', [ArrayPhase[TFinetune(Sender).Phase]]));
  with TFinetune(Sender), rzGrd158Param do
    case Phase of
      ftPhaseA: Rows[FixedRows] := AParamStr;
      ftPhaseB: Rows[FixedRows + 1] := AParamStr;
      ftPhaseC: Rows[FixedRows + 2] := AParamStr;
    end;

end;

procedure TForm1.Read158Params();
var
  ComObj: TMyComm;
  FinetuneObj: TFinetune;
begin

  ComObj := TMySPComm.Create(GetTestBenchCommPort(), '19200,n,8,2');
  try
    FinetuneObj := TFinetune.Create(nil);
    with FinetuneObj do
    begin
      Comm := ComObj;
      OnParamStrs := HandleOnParamStrs;
    end;

    try

      with FinetuneObj, RzRadioGroup2 do
      begin
        if Buttons[0].Checked then
          Phase := ftPhaseA
        else if Buttons[1].Checked then
          Phase := ftPhaseB
        else if Buttons[2].Checked then
          Phase := ftPhaseC;

        ReadParams();
      end;
    finally
      FinetuneObj.Free;
    end;

  finally

    ComObj.Free;

  end;

end;

procedure TForm1.actDebugRead158ParamsExecute(Sender: TObject);
begin
  IsWorking:= True;

  try
    // read 158 parameters
    //asm int 3 end;
    Read158Params;
  finally
     IsWorking:= False;
  end;
end;

procedure TForm1.actDebugReadFinetuneExecute(Sender: TObject);
begin
  if MessageDlg('load finetune values?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    ReadFinetuneFromIni;
    ShowMessage('Load!');
  end;
end;

procedure TForm1.ReadReferenceMeasurement();
  procedure DoGenyReadings();
  begin
    with YCMeter1 do
    begin
      if RzCheckBox3.Checked then
      begin
        Location := MLExtra;
        CommPort := GetTestBenchCommPort;
      end
      else
      begin
        Location := MLIntra;
        CommPort := GetRSMCommPort;
      end;

      PortOpen := True;

      try
        ReadInstantData;
        _RecData := getInstant;
        if IsMilliampere then
        begin
          _RecData.Ia := _RecData.Ia / 1000;
          _RecData.Ib := _RecData.Ib / 1000;
          _RecData.Ic := _RecData.Ic / 1000;
        end;
        StringGridYC1.showdata(@_RecData.Ua)
      finally
        PortOpen := False;
      end;
    end;
  end;
begin
  // read ref. measurement
  with rzrdgrp6 do
  if Buttons[0].Checked then
    DoGenyReadings()
  else
    actReadMatrixExecute(Self) ;
    
end;

procedure TForm1.actDebugReadRefExecute(Sender: TObject);
begin
  OnReadings := True;
  try
    ReadReferenceMeasurement;
  finally
    onReadings := False;
  end;

end;

procedure TForm1.actDebugSaveFinetuneTo158Execute(Sender: TObject);
var
  i: integer;
begin
  // save the fine tunes into 158 feedback boards, including three 158s
  if MessageDlg('save finetunes into feedback board (158)?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    for i := 0 to 2 do
      SaveFinetuneTo158(i);
  end;
end;

procedure TForm1.actDEbugWriteFinetuneExecute(Sender: TObject);
var
  index: integer;
begin
  IsWorking:= True;
  try
    // finetune value write to 158Board
    ReadReferenceMeasurement;
    if MessageDlg(format('go adjustment for finetune %s', [GetFinetuneItemName()]), mtInformation, [mbYes, mbNo], 0) = mrYes then
    begin
      with RzRadioGroup2 do
        if Buttons[0].Checked then
        begin
          index := 0;
        end
        else if Buttons[1].Checked then
        begin
          index := 1;
        end
        else if Buttons[2].Checked then
        begin
          index := 2;
        end;
      WriteFinetuneParam(index);
      ShowMessage('done!');
      ReadReferenceMeasurement;
    end;
  finally
     IsWorking:= False;
  end;
end;

procedure TForm1.actDebugWriteToINIExecute(Sender: TObject);
begin
  if MessageDlg('save finetune values?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    WriteFinetuneToIni;
    ShowMessage('Saved!');
  end;
end;

procedure TForm1.actFreqSetExecute(Sender: TObject);
  procedure doFreq();
  var
    i: integer;
    d: double;
  begin
    stoptest := false;
    d := RzNumericEdit7.Value;
    Output_Freq(220, d);
  end;
begin
  stoptest := false;
  IsWorking := True;
  try
  if MessageDlg('beware: clear source before freqency setting of power soruce', mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    if MultiplePortEnable then
    begin
      MultiplePortRoutine(kofFreqSet) ;
      ShowMessage('Power sources are under frequency set, please check later');
      WaitForWorkThreadFinish();
    end
    else
    begin
      // clear power source
      actResetOutputExecute(nil);
      doFreq();
    end;

  end;
  finally
    IsWorking := false;
  end;

end;

function TForm1.getRDType(): TRdMeterKind;
begin
  with RzRadioGroup3 do
    if Buttons[0].Checked then
      result := kofRd20
    else if Buttons[1].Checked then
      Result := kofRd33
    else
      Result := kofRd33;
end;

procedure TForm1.RRKitOnModelName(Sender: TObject; strInfo: string);
begin
  with RzMemo1 do
    Lines.Add(Format('The Radian model: %s', [strInfo]));
end;

procedure TForm1.RRKitOnSerialNumber(Sender: TObject; strInfo: string);
begin
  with RzMemo1 do
    Lines.Add(Format('The Radian serial number: %s', [strInfo]));
end;

procedure TForm1.RRKitOnVersionInfo(Sender: TObject; strInfo: string);
begin
  with RzMemo1 do
    Lines.Add(Format('The Radian version number: %s', [strInfo]));
end;

procedure TForm1.RRKitOnMeterName(Sender: TObject; strInfo: string);
begin
  with RzMemo1 do
    Lines.Add(Format('The Radian version number: %s', [strInfo]));
end;

procedure TForm1.RRKitOnErrorMsg(Sender: TObject; strInfo: string);
begin
  with RzMemo1 do
    Lines.Add(Format('Error report: %s', [strInfo]));
end;

procedure TForm1.actGetVerInfoExecute(Sender: TObject);
var
  RR: TRdMeter;
begin
  RR := TRdMeter.Create(kofRd33, GetRSMCommPort());
  try
    with RR do
    begin
      OnModelName := RRKitOnModelName;
      OnSerialNbr := RRKitOnSerialNumber;
      OnVersionInfo := RRKitOnVersionInfo;
      OnMeterName := RRKitOnMeterName;
      OnErrorMsg := RRKitOnErrorMsg;
      ReadBaseInfo;
    end;
  finally
    RR.Free;
  end;
end;

procedure TForm1.ChangeUAngle(d1, d2: double);
var
  _MyComm: TMyComm;
  _UAngle: TUAngle;
begin
  _MyComm := TMySPComm.Create(GetTestBenchCommPort(), '19200,n,8,2');
  try
    _UAngle := TUAngle.Create(nil);
    try
      with _UAngle do
      begin
        Comm := _MyComm;
      end;

      // phase B
      if _UAngle.Change(221, d1) then
        RzMemo1.Lines.Add(timeToStr(Now) + format(' Uab angle changed to : %8.4f', [d1]))
      else
        RzMemo1.Lines.Add(timeToStr(Now) + ' fail to change the Uab angles');

      // phase C
      if _UAngle.Change(222, d2) then
        RzMemo1.Lines.Add(timeToStr(Now) + format(' Uac changed to %8.4f', [d2]))
      else
        RzMemo1.Lines.Add(timeToStr(Now) + ' fail to change the Uac angles');

      {
      if _UAngle.Change(d1, d2) then
        RzMemo1.Lines.Add(timeToStr(Now) + format(' Uab angle changed to : %8.4f, Uac changed to %8.4f', [d1, d2]))
      else
        RzMemo1.Lines.Add(timeToStr(Now) + ' fail to change the U angles');
      }

    finally
      _UAngle.Free;
    end;
  finally
    _MyComm.Free;
  end;
end;

procedure TForm1.actOutput_UPhaseExecute(Sender: TObject);
begin
  stoptest := false;
  IsWorking := True;
  try
  if MessageDlg('Confirm to change the U phase angles?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    if MultiplePortEnable then
    begin
      MultiplePortRoutine(kofOutputUPhase ) ;
      ShowMessage('Power sources are being output U Phase angle, please check later');
      WaitForWorkThreadFinish();
    end
    else
      ChangeUAngle(rzedtUPhase1.Value, rzedtUPhase2.Value);
  finally
     IsWorking := false;
  end;
end;

procedure TForm1.actRadRDSetPulseRateExecute(Sender: TObject);
var
  RR: TRdMeter;
begin
  if RzRadioGroup3.Buttons[0].Checked then
    rr := TRdMeter.Create(kofRd20, GetRSMCommPort())
  else
    rr := TRdMeter.Create(kofRd33, GetRSMCommPort());

  with RR do
  begin
    OnErrorMsg := RRKitOnErrorMsg;
    OnCommMsg := RRKitOnCommMsg;
  end;

  try
    if RzRadioGroup4.Buttons[0].Checked then
      RR.SetPluseRate(kofWattHours, edtRRPulseSetting.Value)
    else
      RR.SetPluseRate(kofVARHours, edtRRPulseSetting.Value);

  finally
    RR.Free;
  end;

end;

procedure TForm1.actRadSetPulseOutputExecute(Sender: TObject);
const
  Ports: array[0..2] of TKindofPortOuput = (kofPort1, kofPort2, kofPort3);
var
  i: integer;
  RR: TRdMeter;
  function GetValue(ACompName: string; index: integer): Word;
  begin
    with TRzComboBox(FindComponent(ACompName + IntToStr(index))) do
      Result := StrToInt(Values[ItemIndex]);
  end;

begin
  if RzRadioGroup3.Buttons[0].Checked then
    rr := TRdMeter.Create(kofRd20, GetRSMCommPort())
  else
    rr := TRdMeter.Create(kofRd33, GetRSMCommPort());

  with RR do
  begin
    OnErrorMsg := RRKitOnErrorMsg;
    OnCommMsg := RRKitOnCommMsg;
  end;

  try
    with RzCheckGroup3 do
      for i := 0 to 2 do
        if Checks[i].Checked then
          RR.SetPulseOutput(Ports[i], GetValue('cbbFunc', i + 1), GetValue('cbbPhase', i + 1));

  finally
    RR.Free;
  end;
end;

procedure TForm1.actReadStartingPulseTimeExecute(Sender: TObject);
begin
  // read pulse time in Creeping test or Starting test

end;

procedure TForm1.actRRGetPulseRateExecute(Sender: TObject);
var
  RR: TRdMeter;
begin
  if RzRadioGroup3.Buttons[0].Checked then
    rr := TRdMeter.Create(kofRd20, GetRSMCommPort())
  else
    rr := TRdMeter.Create(kofRd33, GetRSMCommPort());

  with RR do
  begin
    OnErrorMsg := RRKitOnErrorMsg;
    OnCommMsg := RRKitOnCommMsg;
  end;

  try
    if RzRadioGroup4.Buttons[0].Checked then
      RzMemo1.Lines.Add(Format('the current pluse rate: %e Wh', [RR.GetPulseRate(kofWattHours)]))
    else
      RzMemo1.Lines.Add(Format('the current pluse rate: %e VARh',[RR.GetPulseRate(kofVARHours)]));

  finally
    RR.Free;
  end;
end;

procedure TForm1.actRS485CloseALLPortsExecute(Sender: TObject);
begin
  HandleRs485Port(GetTestBenchCommPort(), 199, RS485_close);
end;

procedure TForm1.actRs485CloseAPortExecute(Sender: TObject);
begin
  with RzComboBox2 do
    HandleRs485Port(GetTestBenchCommPort(), StrToInt(Values[ItemIndex]), RS485_close);
end;

procedure TForm1.actRs485OpenAPortExecute(Sender: TObject);
begin
  with RzComboBox2 do
    HandleRs485Port(GetTestBenchCommPort(), StrToInt(Values[ItemIndex]), RS485_open);
end;

procedure TForm1.ReadDailTestReadings4IS(portId, APos: Integer);
var
  s : WideString;
  ArrayData: array[1..6] of WideString;
  i: Integer;
  pulse: integer;
begin
  s := geny_api.ErrCounterReadDataAll(portId, geny_comm_setting, APos, ArrayData[1], ArrayData[2], ArrayData[3], ArrayData[4], ArrayData[5], ArrayData[6], 4, 1);
  if SameText(reply_geny, s) then
    with rzStrgrdCreepTest do
    begin
      for i := 1 to 6 do
      begin
        Cells[1, i] :=Trim(GetItem(ArrayData[i],',', 0));
        //Cells[2, i] :=Trim(GetItem(ArrayData[i],',', 1));
        pulse := StrToIntDef(Trim(GetItem(ArrayData[i],',', 1)), 0);
        if pulse > 0 then
        begin
           Cells[3, i] := IntToStr(pulse);
          case pulse of
            1:
              begin
                if SameText('', Trim(Cells[4,i])) then
                begin
                  Cells[4,i] := format('%d', [round(24*3600*(Now() - DailTest_T ))]); // duration time
                  Cells[5,i] := Format('%7.5f', [StrToFloat(SImpulseReading) / rzedtCo.Value]) ;; // energy
                end;
              end ;
            else
              begin
                if SameText('', Trim(Cells[6,i])) then
                begin
                  Cells[6,i] := format('%d', [round(24*3600*(Now() - DailTest_T ))]); // duration time
                  Cells[7,i] := Format('%7.5f', [StrToFloat(SImpulseReading) / rzedtCo.Value]) ;; // energy
                  //delta
                  Cells[8,i] := Format('%d', [StrToIntDef(Cells[6,i],0) - StrToIntdef(Cells[4,i],0)]);
                  Cells[9,i] := Format('%7.5f', [StrToFloatdef(Cells[7,i],0) - StrToFloatdef(Cells[5,i],0)]);
                end
              end ;
          end;
        end;

      end;
    end
  else
    RzMemo1.Lines.add(format('The reading of pluses failed to read @pos# %d with returns:%s', [APos , s]));

end;

procedure TForm1.DailTestOnStopWaitTimeEvent4IS(Sender: TObject; var Value: Boolean);
  function CheckAllPos() : boolean;
  var
    i: Integer;
  begin
     Result := True;
     with rzStrgrdCreepTest do
      for i:= FixedRows to RowCount - 1 do
         if SameText('yes', Cells[2,i]) and (StrToIntDef(Cells[3 , i], 0) < 2) then
         begin
           Result := False;
           Break;
         end;
  end;
begin
   { TODO : display the readings }
  //read Impluses accumulation data;
  if ReadDailTest(RzSpinEdit1.IntValue, SImpulseReading) then
  begin
    rzlbl56.Caption := Format('%s %8.5f KWH', [sDailTestPowerAccum, StrToFloat(SImpulseReading) / rzedtCo.Value ]) ;
  end;

  //readings routine
  ReadDailTestReadings4IS(RzSpinEdit1.IntValue, rzedtHeadPos.IntValue);

  Value := stoptest or CheckAllPos();

  with RzStatusPane1 do
  Caption := 'Time remaining: ' + format('%d seconds', [TWaitTime(Sender).TestLong - round( 24*3600*(Now() - DailTest_T))]);
end;

procedure TForm1.DailTestOnTimeOut4IS(Sender: TObject);
var
  i: integer;
begin
    { TODO -oJ.S -cDail test : Show final result }
    //creeping result
    with rzStrgrdCreepTest do
      for i:= FixedRows to RowCount - 1 do
         if SameText('yes', Cells[2,i]) then
           if (StrToIntDef(Cells[3 , i], 0) > 1) then
            Cells[ColCount - 1,i] := 'FAIL'
           else
            Cells[ColCount - 1,i] := 'PASS';

    ShowMessage('Creep Test is finished!');
end;

procedure TForm1.DailTestOnTimeOut4IS_StartingTest(Sender: TObject);
var
  i: integer;
begin
    { TODO -oJ.S -cDail test : Show final result }
    //creeping result
    with rzStrgrdCreepTest do
      for i:= FixedRows to RowCount - 1 do
         if SameText('yes', Cells[2,i]) then
           if (StrToIntDef(Cells[3 , i], 0) > 1) then
            Cells[ColCount - 1,i] := 'PASS'
           else
            Cells[ColCount - 1,i] := 'FAIL';

    ShowMessage('Starting Test is finished!');
end;

procedure TForm1.DailTestRoutineForIS(AKind: TKindofRoutine4IS; ATestLong: LongWord );
var
  AWaitObj: TWaitTime;
begin

  AWaitObj := TWaitTime.Create;
  with AWaitObj do
  begin
    OnStopWaitTime := DailTestOnStopWaitTimeEvent4IS  ;
    if AKind = kofCreepTestIS then
      OnTimeOutEvent := DailTestOnTimeOut4IS  // creeping test
    else
      OnTimeOutEvent := DailTestOnTimeOut4IS_StartingTest; //starting test
  end;

  try
    //ErrTest(RzSpinEdit1.IntValue, rzedtCircleNbr.IntValue, rzedtAccessNbr.IntValue, 1, GetStdNbr());
    //start dail test
    DailTest_T := Now();
    SetupDailTest(RzSpinEdit1.IntValue, 10000, rzedtAccessNbr.IntValue, 1 );

    AWaitObj.WaitSeconds(ATestLong );

  finally
    AWaitObj.free;
  end;
end;


procedure TForm1.actSetCreepingTestExecute(Sender: TObject);
  procedure doCreepingTest();
  begin
    SetupDisplayCreepTest(6);
    with rzchkbIStd do
      if Checked then
         DailTestRoutineForIS(kofCreepTestIS, edtDuration.IntValue)
         //SetupDailTest(RzSpinEdit1.IntValue, 10000, rzedtAccessNbr.IntValue, 1 )
      else
        CreepingTest(GetTestBenchCommPort(), edtSamples.IntValue, rzedtAccessNbr.IntValue, 0, edtDuration.IntValue);
  end;
begin
  stoptest := false;
  IsWorking := True;

  try
    if MessageDlg('creepting test?', mtConfirmation, [mbYes, mbno], 0) = mrYes then
       doCreepingTest();
  finally
    IsWorking := false;
  end;
end;

procedure TForm1.HandleRs485Port(ComPort, APos: Integer; const Value: TStatus_RS485);
const
  arStatusStr: array[TStatus_RS485] of string = ('open', 'close');
  arStatusInt: array[TStatus_RS485] of Integer = (1, 0);
var
  s: WideString;
begin
  s := geny_api.ErrCounterUser485KaiGuan(ComPort, geny_comm_setting, APos, arStatusInt[Value]);
  if SameText(reply_geny, s) then
  begin
    s := geny_api.ErrCounterUser485KaiGuan(ComPort, geny_comm_setting, APos, arStatusInt[Value]);
    RzMemo1.Lines.add(format('%s: #%d position RS485 port %s', [TimeToStr(now()), APos, arStatusStr[Value]]));
  end
  else
    RzMemo1.Lines.add(format('%s: #%d position RS485 port %s FAIL!', [TimeToStr(now()), APos, arStatusStr[Value]]));
end;

procedure TForm1.WriteFinetuneToIni();
var
  i, j: integer;
begin
  with rzGrdWriteKb do
    for i := FixedRows to RowCount - 1 do
      for j := FixedCols to ColCount - 1 do
        if not SameText('', Cells[j, i]) then
          WriteToINI(Cols[0][i], Rows[0][j], StrToFloat(Cells[j, i]));
end;

procedure TForm1.ReadFinetuneFromIni();
var
  i, j: integer;
  value: Double;
begin
  with rzGrdWriteKb do
    for i := FixedRows to RowCount - 1 do
      for j := FixedCols to ColCount - 1 do
      begin
        ReadFromINI(Cols[0][i], Rows[0][j], -1.0, value);
        if (Value + 1.0) > 0.005 then
          Cells[j, i] := floattostr(value);
      end;
end;

procedure TForm1.RRKitOnCommMsg(Sender: TObject; strInfo: string);
begin
  with RzMemo1 do
    Lines.Add(Format('The RRKit return message: %s', [strInfo]));
end;

procedure TForm1.actConnSrcDBExecute(Sender: TObject);
var
  _fn: string;
begin
  with DataModuleHarnpu, rzbtnSourceDBPath do
  begin
    _fn := IncludeTrailingPathDelimiter(Trim(Text)) + 'cdnb.mdb';
    if FileExists(_fn) then
    begin
      if ConnectDB(kofSourceDB, _fn) then
      begin
        ShowMessage('connected');
        WriteToINI(csSectionDBPath, csKeyHarnpu, Text);
      end
      else
        ShowMessage('fail to connect');
    end
    else
      ShowMessage(format('%s is not exist', [_fn]));
  end;
end;


procedure TForm1.rzbtnSourceDBPathButtonClick(Sender: TObject);
begin
  //ShowMessage('click!')
  with rzDlg1 do
  begin
    if TControl(Sender).Tag = 1000 then
      Title := 'Harnpu database location'
    else
      Title := 'Geny database location';
    if Execute then
      TRzEdit(Sender).Text := SelectedPathName
      //ShowMessage('ok')
    else
      ShowMessage('canel');
  end;
end;

procedure TForm1.actConnTagDBExecute(Sender: TObject);
var
  _fn: string;
begin
  with DataModuleHarnpu, rzbtn1 do
  begin
    _fn := IncludeTrailingPathDelimiter(Trim(Text)) + 'dbdata.mdb';
    if FileExists(_fn) then
    begin
      if ConnectDB(kofTargetDB, _fn) then
      begin
        ShowMessage('connected');
        WriteToINI(csSectionDBPath, csKeyGENY, Text);
      end
      else
        ShowMessage('fail to connect');
    end
    else
      ShowMessage(format('%s is not exist', [_fn]));
  end;
end;

procedure TForm1.actQueryTestDateExecute(Sender: TObject);
begin
  with DataModuleHarnpu, RzDateTimeEdit1 do
    QuerybyTestDate(Date);
end;

procedure TForm1.actQueryTestDateUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DataModuleHarnpu.HarnpuConnected;

end;

procedure TForm1.FormOnTransferProgress(Sender: TObject; Value: Word);
begin
  rzprgrsbr1.Percent := Value;
end;

procedure TForm1.FormOnHarnpuDBStatus(Sender: TObject; StrANy: string);
begin
  RzMemo1.lines.add(Format('Harnpu DB transfer: %s', [StrANy]));
end;

procedure TForm1.actDBConvertExecute(Sender: TObject);
begin
  rzprgrsbr1.Percent := 0;

  // begin to conver
  with  DataModuleHarnpu do
  begin
    NOtifyStatus := FormOnHarnpuDBStatus;
    NotifyProgrss := FormOnTransferProgress;
    TransferTestData();
  end;
end;

procedure TForm1.actDBConvertUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DataModuleHarnpu.HarnpuRstOpened;
end;

procedure TForm1.actOpenAgent4SourceGExecute(Sender: TObject);
var
  s: string;
  procedure doWinExec();
  begin
    if WinExec(PChar(s), SW_SHOWMINIMIZED) > 31 then
      ShowMessage('Agent is running!')
    else
      ShowMessage('Agent is NOT running!');
  end;
begin
  s := IncludeTrailingPathDelimiter(Copy(ParamStr(0), 1, LastDelimiter('\', ParamStr(0)))) + sCommAgentFileName;
  if FindWindow(nil, PChar(s)) > 0 then
    ShowMessage('found Agent running')
  else
    doWinExec();
end;

procedure TForm1.Conn2Agent(strIP: string; intPort: integer);
var
  intval, wait: integer;
  wIp, wPort: widestring;
begin
  wip := strip;
  wport := inttostr(intport);
  intval := 50;
  wait := 3000;
  if not yctcp.CreatLink(wip, wport, intval, wait) then
    ShowMessage('Tcp server 127.0.0.1 failed connecting');
end;

procedure TForm1.actConnectAgentExecute(Sender: TObject);
  procedure Conn();
  begin
    with IdTCPClient1 do
    begin
      Host := sAgentIP;
      Port := AgentPort;
      Connect(3);
    end;
    with TRzToolButton(TAction(Sender).ActionComponent) do
      ImageIndex := 0;
  end;
  procedure DisConn();
  begin
    IdTCPClient1.Disconnect;
    with TRzToolButton(TAction(Sender).ActionComponent) do
      ImageIndex := 1;
  end;
begin
  with IdTCPClient1 do
    if Connected then
      DisConn
    else
      Conn;
end;

procedure TForm1.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  S: string;
begin
  if (ACol > 0) and (ARow > 0) then begin
    S := XLS.Sheets[TabSet.TabIndex].AsFmtString[ACol - 1, ARow - 1];
    if S <> '' then
      TDrawGrid(Sender).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, S);
  end
  else if (ACol <> 0) then begin
    S := ColToText(ACol - 1);
    TDrawGrid(Sender).Canvas.TextRect(Rect, Rect.Left + (Rect.Right - Rect.Left) div 2 - (TDrawGrid(Sender).Canvas.TextWidth(S) div 2), Rect.Top + 2, S);
  end
  else if (ARow <> 0) then
    TDrawGrid(Sender).Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, IntToStr(ARow));
end;

procedure TForm1.GridGetEditText(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
begin
  EditCol := ACol;
  EditRow := ARow;
  case XLS.Sheets[TabSet.TabIndex].CellType[ACol - 1, ARow - 1] of
    ctNumberFormula,
    ctStringFormula,
    ctBooleanFormula:
      Value := '=' + XLS.Sheets[TabSet.TabIndex].AsFormula[ACol - 1, ARow - 1];
    ctInteger, ctFloat:
      Value := FloatToStr(XLS.Sheets[TabSet.TabIndex].AsFloat[ACol - 1, ARow - 1]);
  else
    Value := XLS.Sheets[TabSet.TabIndex].AsWideString[ACol - 1, ARow - 1];
  end;
end;

procedure TForm1.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (EditCol = TDrawGrid(Sender).Col) and (EditRow = TDrawGrid(Sender).Row) then
    SetCellValue(TDrawGrid(Sender).Col - 1, TDrawGrid(Sender).Row - 1);
end;

procedure TForm1.GridSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  lblCell.Caption := ColRowToRefStr(ACol - 1, ARow - 1, False, False);
  case XLS.Sheets[TabSet.TabIndex].CellType[ACol - 1, ARow - 1] of
    ctNumberFormula,
    ctStringFormula,
    ctBooleanFormula:
      edtCell.Text := '=' + XLS.Sheets[TabSet.TabIndex].AsFormula[ACol - 1, ARow - 1];
  else
    edtCell.Text := XLS.Sheets[TabSet.TabIndex].AsWideString[ACol - 1, ARow - 1];
  end;
  if (EditCol = Grid.Col) and (EditRow = Grid.Row) then
    SetCellValue(Grid.Col - 1, Grid.Row - 1);
end;

procedure TForm1.GridSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  EditText := Trim(Value);
end;

function TForm1.ColToText(Col: integer): string;
var
  S: string;
begin
  if (Col div 26) > 0 then
    S := Char(Ord('A') + (Col div 26) - 1)
  else
    S := '';
  Result := S + Char(Ord('A') + (Col mod 26));
end;

procedure TForm1.SetCellValue(Col, Row: integer);
begin
  if Copy(EditText, 1, 1) = '=' then
    XLS.Sheets[TabSet.TabIndex].AsFormula[Col, Row] := Copy(EditText, 2, MAXINT)
  else begin
    try
      XLS.Sheets[TabSet.TabIndex].AsFloat[Col, Row] := StrToFloat(EditText);
    except
      XLS.Sheets[TabSet.TabIndex].AsWideString[Col, Row] := EditText;
    end;
  end;
end;

procedure TForm1.actDlgOpenFileExecute(Sender: TObject);
begin
  dlgOpen.FileName := edtFilename.Text;
  if dlgOpen.Execute then
    edtFilename.Text := dlgOpen.FileName;
end;

procedure TForm1.actReadXlsFileExecute(Sender: TObject);
var
  i: integer;
begin
  XLS.Sheet[0].PrintSettings.FitWidth := 2;
  XLS.Filename := edtFilename.Text;
  XLS.Read;
  TabSet.Tabs.Clear;
  for i := 0 to XLS.Sheets.Count - 1 do
    TabSet.Tabs.Add(XLS.Sheets[i].Name);
  TabSet.TabIndex := 0;
  Grid.Invalidate;
end;

procedure TForm1.actUpdate2mdbExecute(Sender: TObject);
const
  MeterSum = 20;
var
  i: integer;
  procedure doUpdate(RowNum: Integer);
  var
    ReadXLS: TReadXLS;
  begin
    ReadXLS := TReadXLS.Create;
    try
      ReadXLS.read(XLS, RowNum);
      with ReadXLS do
        DataModuleHarnpu.UpdateTestData(fGetBatchNoByFileName(edtFilename.Text), MeterNo, LoadNames, Averages);

    finally
      ReadXLS.Free;
    end;
  end;
begin
  pb1.Max := MeterSum;
  try
    for i := 0 to MeterSum - 1 do
    begin
      doUpdate(10 + i);
      pb1.Position := i + 1;
    end;
  finally

  end;
end;

procedure TForm1.actUpdate2mdbUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DataModuleHarnpu.GenyMDBOpened;
end;

procedure TForm1.ExcelOutputOnNotifyStatus(Sender: TObject; StrANy: string);
begin
  RzMemo1.Lines.Add(Format('Excel output: %s', [StrANy]));
end;

procedure TForm1.ExcelOutputOnErrData(Sender: TObject; MeterNo: string; LoadName, AverageErr: TStrings; Index: integer);
const
  _FirstRow = 9;
var
  i: Integer;
  function fGetValue(strLoad: string): string;
  var
    _index: integer;
  begin
    _index := LoadName.IndexOf(strLoad);
    if _index > -1 then
      Result := AverageErr[_index]
    else
      Result := '';
  end;
begin
  with XLS do
  begin
    Sheet[0].AsString[0, _firstRow + index] := IntToStr(index + 1);
    Sheet[0].AsString[1, _firstRow + index] := MeterNo;
    for i := 2 to 7 do
      Sheet[0].AsString[i, _firstRow + index] := 'V';
    //0.05Ib(1.0)
    Sheet[0].AsString[8, _firstRow + index] := fGetValue('0.05Ib(1.0)');
    //0.1Ib(1.0)
    Sheet[0].AsString[9, _firstRow + index] := fGetValue('0.1Ib(1.0)');
    //0.1Ib(0.5L)
    Sheet[0].AsString[10, _firstRow + index] := fGetValue('0.1Ib(0.5L)');
    //Ib(1.0)
    Sheet[0].AsString[11, _firstRow + index] := fGetValue('Ib(1.0)');
    //Ib(0.5L)
    Sheet[0].AsString[12, _firstRow + index] := fGetValue('Ib(0.5L)');
    //Imax(1.0)
    Sheet[0].AsString[13, _firstRow + index] := fGetValue('Imax(1.0)');
  end;

end;

procedure TForm1.actReadFromMdbByBatchNumberExecute(Sender: TObject);
begin
  // clear XLS data;

  //ClearXls;

  // query for eem
  with DataModuleHarnpu do
  begin
    NOtifyStatus := ExcelOutputOnNotifyStatus;
    OnErrData := ExcelOutputOnErrData;
    QueryByBatchNo_EEM(edt2.Text);
  end;
end;

procedure TForm1.actReadFromMdbByBatchNumberUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := DataModuleHarnpu.GenyMDBOpened and (XLS.Sheets.Count > 0);
end;

procedure TForm1.actExcelWriteExecute(Sender: TObject);
var
  S: string;
begin
  if InputQuery('Save to Excel file', 'Filename', S) then begin
    s := fGetAppPath() + 'report\excel\' + S + '.xls';
    XLS.Filename := s;
    XLS.Write;
  end;
end;

procedure TForm1.actPowerDown4SourceGExecute(Sender: TObject);
  function GetValue(ARzGrid: TRzStringGrid; const APhase: TKindOfTaitiPhase; const AKind: TKindOfParamSet): Double;
  var
    ss: TStrings;
  begin
    with ARzGrid do
      Result := StrToFloat(Rows[fixedrows + Integer(APhase)][fixedcols + Integer(AKind)]);
  end;
  function GetSourceParamStr(APhase: TKindOfTaitiPhase): string;
  var
    ParamStr: TParamStr;
  begin
    ParamStr := TParamStr.Create(APhase);
    try
      with ParamStr do
      begin
        Values[kof_setFre] := GetValue(rzStrgrdSourceParam, APhase, kof_setFre);
        Values[kof_setU] := 0.0;
        Values[kof_setI] := 0.0;
        Values[kof_setPhUI] := GetValue(rzStrgrdSourceParam, APhase, kof_setPhUI);
        Values[kof_setPhUU] := GetValue(rzStrgrdSourceParam, APhase, kof_setPhUU);
      end;
      Result := ParamStr.GetParamStr();
    finally
      ParamStr.Free;
    end;
  end;
var
  s: string;
begin
  s := Format('%s:%s:%s', [GetSourceParamStr(phase_a), GetSourceParamStr(phase_b), GetSourceParamStr(phase_c)]);
  with RzComboBox3 do
    TaitiParamOutput(Format('CHK=%d:%s', [fgetChk(Values[Itemindex]), s]));
end;

procedure TForm1.actPowerUp4SourceGExecute(Sender: TObject);
  function GetValue(ARzGrid: TRzStringGrid; const APhase: TKindOfTaitiPhase; const AKind: TKindOfParamSet): Double;
  var
    ss: TStrings;
  begin
    with ARzGrid do
      Result := StrToFloat(Rows[fixedrows + Integer(APhase)][fixedcols + Integer(AKind)]);
  end;
  function GetSourceParamStr(APhase: TKindOfTaitiPhase): string;
  var
    ParamStr: TParamStr;
  begin
    ParamStr := TParamStr.Create(APhase);
    try
      with ParamStr do
      begin
        Values[kof_setFre] := GetValue(rzStrgrdSourceParam, APhase, kof_setFre);
        Values[kof_setU] := GetValue(rzStrgrdSourceParam, APhase, kof_setU);
        Values[kof_setI] := GetValue(rzStrgrdSourceParam, APhase, kof_setI);
        Values[kof_setPhUI] := GetValue(rzStrgrdSourceParam, APhase, kof_setPhUI);
        Values[kof_setPhUU] := GetValue(rzStrgrdSourceParam, APhase, kof_setPhUU);
      end;
      Result := ParamStr.GetParamStr();
    finally
      ParamStr.Free;
    end;
  end;
var
  s: string;
begin
  s := Format('%s:%s:%s', [GetSourceParamStr(phase_a), GetSourceParamStr(phase_b), GetSourceParamStr(phase_c)]);
  with RzComboBox3 do
    TaitiParamOutput(Format('CHK=%d:%s', [fgetChk(Values[Itemindex]), s]));
end;

procedure TForm1.SetupErrCalcDeviceModelG(AComboBox : TObject);
var
  ss: TStrings;
begin
  ss:= TStringList.Create;
  try
    ReadMeterIP(ss, 12);
    with TComboBox( AComboBox ) do
    begin
      Items := ss;
      ItemIndex := 0;
    end ;
  finally
      FreeAndNil(ss);
  end;
end;

procedure TForm1.SetupDispGridErrCalcModelG();
var
  i: Integer ;
  s: string;
begin
  s:= 'Error';
  for i:= 1 to 15 do
    s := s + ',' + Format('%s', [IntToStr(i)]);
  with rzStrgrdErrCalcReadings do
  begin
    Rows[0].CommaText := s;
    Cols[0].CommaText := 'Error%, #1,#2,#3,#4';
  end;
end;

procedure TForm1.SetupDispErrorG(Index: integer; ARzGrid: TRzStringGrid);
const
  ColNums : array[0..7] of Integer = (6,5,5,3,3,3,2,1);
  Titles : array[0..7] of string = ('Setting,Ref(imp/kWh),Chn,MUT_Co,Time(ms),Up_limit,Lo_limit',
    'Setting,Chn,Clock_fre.,Time(ms),Up_limit,Lo_limit',
    'Setting,Chn,Peruiduc_fre.,Time(ms),Up_limit,Lo_limit',
    'Setting,Chn,Time(ms),Pulse(s)',
    'Setting,Chn,Time(ms),Pulse(s)',
    'Setting,Chn,Time(ms),MUT_Co.(imp/kWh)',
    'Setting,Chn,Advance%',
    'Setting,Loop_id(0/1/2)');
  DefaValues : array[0..7] of string = ('Value,100000000,0,1200,10000,1.0,-1.0',
    'Value,3,1,10000,0.5,-0.5',
    'Value,3,900,50000,0.5,-0.5',
    'Value,1,60000,1',
    'Value,1,60000,1',
    'Value,1,60000,1200',
    'Value,1,10',
    'Value,0');
begin
  with ARzGrid do
  begin
    ColCount := FixedCols + ColNums[Index];
    Rows[0].CommaText := Titles[index];
    Rows[1].CommaText :=  DefaValues[index];
  end;
end;

procedure TForm1.SetupDispParamSourceG(ARzGrid: TRzStringGrid);
const
  Defa_Values: array[TKindOfParamSet] of Double = (50, 230, 5, 0, 120);
var
  __Options: TGridOptions;
  procedure getFixedRowTitle(const ASameStr: string);
  var
    ss: TStrings;
    procedure addItem(index: TKindOfParamSet);
    begin
      if index > high(PResOutput_Array) then exit;
      ss.Add(LoadResString(PResOutput_Array[index]));
      inc(index);
      addItem(index);
    end;
  begin
    ss := TStringList.Create;
    try
      ss.Add(ASameStr);
      addItem(kof_setFre);
      ARzGrid.Rows[0] := ss;
    finally
      ss.Free;
    end;
  end;
  procedure getFixedColTitle(const ASameStr: string);
  var
    ss: TStrings;
  begin
    ss := TStringList.Create;
    try
      ss.Add(ASameStr);
      ss.Add('A'); ss.Add('B'); ss.Add('C');
      ARzGrid.Cols[0] := ss;
    finally
      ss.Free;
    end;
  end;
  procedure SetDefaValue(ARow: integer);
  var
    ss: TStrings;
    procedure doSet(index: TKindOfParamSet);
    begin
      if index > High(Defa_Values) then Exit;
      ss.Add(FloatToStr(Defa_Values[index]));
      inc(index);
      doSet(index);
    end;
  begin
    if ARow > ARzGrid.RowCount - 1 then exit;
    ss := TStringList.Create;
    try
      ss.Add(ARzGrid.Rows[arow][0]);
      doSet(kof_setFre);
      ARzGrid.Rows[ARow] := ss;
      Inc(ARow);
      SetDefaValue(ARow);
    finally
      ss.Free;
    end;
  end;
begin
  with ARzGrid do
  begin
    FixedRows := 1;
    RowHeights[0] := Round(RowHeights[0] * 1.3);
    RowCount := 4;
    FixedCols := 1;
    ColCount := Length(PResOutput_Array) + FixedCols;
    ColWidths[0] := Round(0.688 * ColWidths[0]);
    __Options := Options;
    __options := __Options + [goColSizing, goEditing];
    Options := __options;
    getFixedRowTitle('Phase / Item');
    getFixedColTitle('Phase / Item');
    SetDefaValue(FixedRows);
    //Cols[0] := getFixedColTitle();
  end;
end;

procedure TForm1.actLoadTstFileExecute(Sender: TObject);
//var
//  fn: string;
//  procedure LoadTestFile();
//  var
//    ss: TStrings;
//  begin
//    ss := LoadTestPara(fn);
//    try
//
//    finally
//      FreeAndNil(ss);
//    end;
//  end;
begin
  // load test.tst
//  fn := IncludeTrailingPathDelimiter(rzbtn3.Text) + SFileName_Test;
//  if FileExists(fn) then
//    LoadTestFile()
//  else
//    ShowMessage(Format('%s is not exist.', [fn]));
end;

procedure TForm1.rzStrgrdComportDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  le: integer;
begin
  with TRzStringGrid(Sender).Canvas do
  begin
    SetTextAlign(Handle, TA_CENTER);
    le := (Rect.Left + Rect.Right) div 2;
    TextRect(Rect, le, Rect.Top + 2, TRzStringGrid(Sender).Cells[ACol, ARow]);
  end;

  if Acol = 2 then
  begin
    if not (gdFixed in State) then
      with Tstringgrid(Sender).Canvas do
      begin
        brush.Color := clWindow;
        FillRect(Rect);
        if Tstringgrid(Sender).Cells[ACol, ARow] = 'yes' then
          Draw((rect.right + rect.left - FCheck.width) div 2, (rect.bottom + rect.top - FCheck.height) div 2, FCheck);
        if Tstringgrid(Sender).Cells[ACol, ARow] = 'no' then
          Draw((rect.right + rect.left - FCheck.width) div 2, (rect.bottom + rect.top - FCheck.height) div 2, FNoCheck);
      end;
  end;
end;

procedure TForm1.rzStrgrdComportMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //with rzStrgrdComport do
  with TRzStringGrid(Sender) do
  begin
    if (Col = 2) then
      Options := Options - [goEditing]
    else
    begin
      Options := Options + [goEditing];
      exit;
    end;

    if Cells[Col, Row] = 'yes' then
      Cells[col, row] := 'no'
    else
      Cells[col, row] := 'yes';
  end;
end;

procedure TForm1.actInitRelayControlsExecute(Sender: TObject);
begin
  //initialize the relay of meter

end;

procedure TForm1.actReadRelaysExecute(Sender: TObject);
begin
  //read status of rack from err calculators

end;

procedure TForm1.actRunRelayTestExecute(Sender: TObject);
begin
  // run a whole relay test

end;

function TForm1.GetMyCommRef(AComport: Integer; blnPortOpen: boolean; const ACommSetting: string): TMyComm;
begin
  Result := TMySPComm.Create(AComport, ACommSetting);
  with TMySPComm(Result), RzMemo1 do
    if blnPortOpen then
      try
        InitComm;
        Lines.add(format('%s com%d opened', [timetostr(now()), AComport]));
      except
        on e: exception do
        begin
          Result.Disabled := True;
          lines.add(format('%s error opening com%d', [timetostr(now()), AComport]));
        end
      end
    else
      Lines.add(format('%s com%d created', [timetostr(now()), AComport]));;
end;

procedure TForm1.RelayTestOnFinalComm(Sender: TObject);
begin
  with TMySPComm(Sender) do
  begin
    FinalComm;
    RzMemo1.Lines.Add(format('%s com%d closed', [timetostr(now()), CommPort]));
  end;
end;

function TForm1.fgetMyCommObjList(blnInitComm: Boolean): TMyCommObjList;
var
  i: Integer;
begin
  Result := TMyCommObjList.Create;
  with Result do
  begin
    OnFinalComm := RelayTestOnFinalComm;
  end;
  with rzStrgrdComport do
    for i := FixedRows to RowCount - 1 do
      if SameText('yes', Cells[2, i]) then
        Result.Add(GetMyCommRef(StrToIntDef(Cells[1, i], 255), blnInitComm));
end;

procedure TForm1.MeterCalTestOnFinalComm(Sender: TObject);
var
  index: integer;
begin
  with TMySPComm(Sender), rzStrgrdCalibPortSettings do
  begin
    FinalComm;
    RzMemo1.Lines.Add(format('%s com%d closed', [timetostr(now()), CommPort]));
    //display 'closed' on string grid
    index := Cols[1].IndexOf(IntToStr(CommPort));
    if index > 0 then
      Cells[ColCount - 1, index] := Cells[ColCount - 1, index] + ' | closed';
  end;
end;

function TForm1.MeterCommPortChecked(AGrid: TStringGrid; ACol, AOffset: Integer): boolean;
begin
  with AGrid do
    Result := SameText('yes', Cells[ACol, fixedrows + AOffset]);
end;

function TForm1.fgetMyCommObjList(blnInitComm: Boolean; AGrid: TStringGrid): TMyCommObjList;
var
  i: Integer;
begin
  Result := TMyCommObjList.Create;
  with Result do
  begin
    OnFinalComm := MeterCalTestOnFinalComm;
  end;
  with AGrid do
    for i := FixedRows to RowCount - 1 do
      if SameText('yes', Cells[2, i]) then
      begin
        Result.Add(GetMyCommRef(StrToIntDef(Cells[1, i], 255), blnInitComm, '115200,n,8,1'));
        Cells[3, i] := 'init. comm';
      end;
end;

procedure TForm1.RelayTestOnCommEvent(Sender: TObject; APortNbr: Word; AResult: boolean);
  procedure doCheck();
  var
    _row: Integer;
  begin
    with rzStrgrdComport do
    begin
      _row := Cols[FixedCols].IndexOf(IntToStr(APortNbr));
      if _row > -1 then
        Cells[3, _row] := 'ok';
    end;
  end;
begin
  if AResult then
    doCheck
  else
    RzMemo1.Lines.Add(format('%s com%d communication failed', [TimeToStr(now), APortNbr]));

end;

procedure TForm1.RelayTestOnWatingEvent(Sender: TObject);
begin
  sleep(10);
  Application.ProcessMessages;
end;

procedure TForm1.actMeterSendCommandExecute(Sender: TObject);
var
  _relay: TRelayRoutine;
  _ports: TMyCommObjList;
  procedure clearCells();
  var
    i: Integer;
  begin
    with rzStrgrdComport do
      for i := FixedRows to RowCount - 1 do
        Cells[3, i] := '';
  end;
begin
  // clear the grid;
  clearCells();

  // send corresponind command to meter
  _ports := fgetMyCommObjList(true);
  try
    _relay := TRelayRoutine.Create;
    with _relay do
    begin
      OnComm := RelayTestOnCommEvent;
      OnWaiting := RelayTestOnWatingEvent;
    end;
    try
      _relay.RelayComm(_ports, rbRelayConn.Checked);
    finally
      _relay.Free;
    end;
  finally
    FreeAndNil(_ports);
  end;
end;

procedure TForm1.actRelayTestGateConnExecute(Sender: TObject);
var
  i: integer;
begin
  IsWorkingOnErrCalc := True;
  try
     if rzchkb1.Checked then
        with rzcmbx3.Items do
          for i := 0 to Count - 1 do
            RunLoadSwitchErrorG(getitem(Strings[i], ';', 0), getitem(Strings[i], ';', 1), getitem(Strings[i], ';', 2), True)
     else
        with rzcmbx3 do
          RunLoadSwitchErrorG(getitem(Text, ';', 0), getitem(Text, ';', 1), getitem(Text, ';', 2), True) ;
  finally
     IsWorkingOnErrCalc := False ;
  end;
end;

procedure TForm1.actRelayTestGateDisconnExecute(Sender: TObject);
var
  i: integer;
begin
  IsWorkingOnErrCalc := True;
  try
    if rzchkb1.Checked then
      with rzcmbx3.Items do
        for i := 0 to Count - 1 do
          RunLoadSwitchErrorG(getitem(Strings[i], ';', 0), getitem(Strings[i], ';', 1), getitem(Strings[i], ';', 2), false)
    else
      with rzcmbx3 do
        RunLoadSwitchErrorG(getitem(Text, ';', 0), getitem(Text, ';', 1), getitem(Text, ';', 2), false);
  finally
    IsWorkingOnErrCalc := False ;
  end;
end;

procedure TForm1.actRelayTestGateReadingsExecute(Sender: TObject);
var
  i: integer;
begin
  IsWorkingOnErrCalc := true;
  try
    //Conn2Agent('127.0.0.1', 8001);
    if rzchkb1.Checked then
      with rzcmbx3.Items do
        for i := 0 to Count - 1 do
          RunLoadSwitchErrorG(getitem(Strings[i], ';', 0), getitem(Strings[i], ';', 1), getitem(Strings[i], ';', 2))
    else
      with rzcmbx3 do
      RunLoadSwitchErrorG(getitem(Text, ';', 0), getitem(Text, ';', 1), getitem(Text, ';', 2));
  finally
    IsWorkingOnErrCalc := false;
  end;
end;

procedure TForm1.RunLoadSwitchErrorG(strIP, LanPort, APosLst: string);
var
  clsError1: clsError;
  S: string;
  RSendData, RData: WideString;
  bRet: WordBool;
  procedure DisplayLoadSwitch(SReadings: string);
  var
    n, n1: integer;
    s1: string;
    function getValue(SubStr: string): string;
    var
      n2: integer;
      splite: string;
    begin
      if n < 3 then
        splite := ':'
      else
        splite := '?';

      n2 := Pos(substr, SReadings);
      if n2 > 0 then
      begin
        n2 := n2 + length(substr);
        Result := copy(SReadings, n2, posex(Splite, SReadings, n2) - n2);
      end;
    end;
  begin
    n := 0;
    s1 := GetItem(APosLst, ',', n);
    with rzStrgrdComport do
      while not sametext('', s1) do
      begin
        n1 := Cols[0].IndexOf(s1);
        if n1 > 0 then
          Cells[ColCount - 1, n1] := getValue(format('LOADSWITCH%d=', [n + 1]));
        inc(n);
        s1 := GetItem(APosLst, ',', n);
      end;
  end;
begin
  clsError1 := CoclsError.create;
  with clsError1 do
  begin
    IP := strIp;
    Port := LanPort;
    PlaceNo := '1';
    ErrorCountNo := '1';

    bRet := True; // action of send
    bRet := ReadSwitch(RData, RSendData, bRet);
    if bRet then
      RzMemo1.lines.add(format('%s sent: %s', [timetostr(now), RSendData]));

    TaitiParamOutput(RSendData, APosLst);

//    //delay for response...
//    WaitSeconds(1);
//
//    bret := false;
//    bRet := ReadSwitch(RData, RSendData, bRet);
//    if bRet then;
//    RzMemo1.lines.add(format('%s received: %s', [timetostr(now), RData]));
//
//    if bret then
//      DisplayLoadSwitch(RData);

  end;

end;

procedure TForm1.RunLoadSwitchErrorG(strIP, LanPort, APosLst: string; bSwitchON: boolean);
var
  clsError1: clsError;
  RSendData, RData: WideString;
  bRet: WordBool;
  function GetLoadSwitch(const ItemNo: Integer; const Value: string ) : string;
  var
    N: integer;
    S: string;
  begin
    Result := 'OFF';
    S := GetItem(APosLst, ',', ItemNo - 1);
    with rzStrgrdComport do
     begin
        N := Cols[0].IndexOf(S);
        if N > 0 then
          if SameText('yes', Cells[2, N]) then
            Result := Value
          else
           Result := Cells[ColCount - 1, N];
     end;
  end;
begin

  clsError1 := CoclsError.create;

  with clsError1 do
  begin
    IP := strIp;
    Port := LanPort;
    PlaceNo := '1';
    ErrorCountNo := '1';
    if bSwitchON then
    begin
      LOADSWITCH1 := GetLoadSwitch( 1, 'ON');
      LOADSWITCH2 := GetLoadSwitch( 2, 'ON');
      LOADSWITCH3 := GetLoadSwitch( 3, 'ON');
      LOADSWITCH4 := GetLoadSwitch( 4, 'ON');
      //s := 'ON'
    end
    else
    begin
      LOADSWITCH1 := GetLoadSwitch( 1, 'OFF');
      LOADSWITCH2 := GetLoadSwitch( 2, 'OFF');
      LOADSWITCH3 := GetLoadSwitch( 3, 'OFF');
      LOADSWITCH4 := GetLoadSwitch( 4, 'OFF');
      //s := 'OFF';
    end;

    bRet := True; // action of send
    bRet := SetLoadSwitch(RData, RSendData, bRet);
    if bRet then
      RzMemo1.lines.add(format('%s sent: %s', [timetostr(now), RSendData]));

    TaitiParamOutput(RSendData, APosLst);

//    //delay for response...
//    WaitSeconds(1);
//
//    bret := false;
//    bRet := SetLoadSwitch(RData, RSendData, bRet);
//    if bRet then;
//    RzMemo1.lines.add(format('%s received: %s', [timetostr(now), RData]));

//    if bret and (Pos('OK', RData) > 0) then
//      DisplayLoadSwitch();
  end;

end;

procedure TForm1.rzStrgrdCalParamsDrawCell(Sender: TObject; ACol, ARow:
  Integer; Rect: TRect; State: TGridDrawState);
var
  le: integer;
begin
  with TRzStringGrid(Sender).Canvas do
  begin
    SetTextAlign(Handle, TA_CENTER);
    le := (Rect.Left + Rect.Right) div 2;
    TextRect(Rect, le, Rect.Top + 2, TRzStringGrid(Sender).Cells[ACol, ARow]);
  end;
end;

procedure TForm1.actSourceOutput4Cal1Execute(Sender: TObject);
  function SourceOutputCheck(): boolean;
  begin
    with rzStrgrdCalParams do
      Output(RzSpinEdit1.IntValue, 220, StrToFloat(Cells[fixedcols, fixedrows]),
        StrToFloat(Cells[fixedcols + 1, fixedrows]),
        StrToFloat(Cells[fixedcols + 2, fixedrows]),
        StrToFloat(Cells[fixedcols + 3, fixedrows]), Result);
    //if (not Result) and (MessageDlg('Source output failed, retry?', mtWarning, [mbRetry, mbNo], 0) = mrRetry) then
    if not (Result or stoptest) then
    begin
      MeterCalCountDown(2); 
      result := SourceOutputCheck();
    end;
  end;
begin
  //Ib(1.0)
  //if not (MessageDlg('confirm to output for calibrations?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then exit;

  SourceOutputCheck();

//  with rzStrgrdCalParams do
//    Output(RzSpinEdit1.IntValue, 220, StrToFloat(Cells[fixedcols, fixedrows]),
//      StrToFloat(Cells[fixedcols + 1, fixedrows]),
//      StrToFloat(Cells[fixedcols + 2, fixedrows]),
//      StrToFloat(Cells[fixedcols + 3, fixedrows]));

end;

procedure TForm1.actSourceOutput4Cal2Execute(Sender: TObject);
  function SourceOutputCheck(): boolean;
  begin
    with rzStrgrdCalParams do
      Output(RzSpinEdit1.IntValue, 220, StrToFloat(Cells[fixedcols, fixedrows + 1]),
        StrToFloat(Cells[fixedcols + 1, fixedrows + 1]),
        StrToFloat(Cells[fixedcols + 2, fixedrows + 1]),
        StrToFloat(Cells[fixedcols + 3, fixedrows + 1]), Result);
   // if (not Result) and (MessageDlg('Source output failed, retry?', mtWarning, [mbRetry, mbNo], 0) = mrRetry) then
    if not (Result or stoptest) then
      result := SourceOutputCheck();
  end;
begin
//  if not (MessageDlg('confirm to output for phase shift calibration?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then exit;

  SourceOutputCheck();

//  with rzStrgrdCalParams do
//    Output(RzSpinEdit1.IntValue, 220, StrToFloat(Cells[fixedcols, fixedrows + 1]),
//      StrToFloat(Cells[fixedcols + 1, fixedrows + 1]),
//      StrToFloat(Cells[fixedcols + 2, fixedrows + 1]),
//      StrToFloat(Cells[fixedcols + 3, fixedrows + 1]));
end;

procedure TForm1.actReadError4Cal2Execute(Sender: TObject);
  procedure SetupErrDisp();
  var
    i: integer;
  begin
    with rzStrgrdCalPhaseErr do
      for i := FixedRows to RowCount - 1 do
        Cells[FixedCols, i] := '';
  end;
  function ErrorReadingsCheck(LLimit, RLimit: Double; RetryCount : Word): boolean;  // 0.6% 0.8
  var
    i: integer;
    tmpData: double;
  begin
    if RetryCount = 0 then
    begin
      Result := True;
      Exit;
    end;
    ErrRead(RzSpinEdit1.IntValue, 1, rzStrgrdCalPhaseErr);
    with rzStrgrdCalPhaseErr do
      for i := FixedRows to RowCount - 1 do
        if MeterCommPortChecked(rzStrgrdCalibPortSettings, 2, i - FixedRows) then
        begin
          tmpData := abs(StrToFloatDef(Cells[FixedCols, i], 99.99));
          Result := (LLimit < tmpData) and (tmpData < RLimit);
          if not result then
            break;
        end;

    //if (not Result) and (MessageDlg('Error readings check failed, retry?', mtWarning, [mbRetry, mbNo], 0) = mrRetry) then
    if not (Result or stoptest) then
    begin
      MeterCalCountDown(5);
      Dec(RetryCount );
      result := ErrorReadingsCheck(LLimit, RLimit, RetryCount);
    end;
  end;
begin
  SetupErrDisp();
  ErrorReadingsCheck(0.4, 0.9, 3);
  //ErrRead(RzSpinEdit1.IntValue, 1, rzStrgrdCalPhaseErr);
end;

procedure TForm1.MeterCalOnReadingsAction(Sender: TObject; APort: integer; ABackStr: String);
var
  index: integer;
  procedure dispReadings(s: string);
  begin
    with rzStrgrdMeterReadings do
    begin
      Cells[FixedCols, index] := GetItem(s, ',', 0);     //v
      Cells[FixedCols + 1, index] := GetItem(s, ',', 1);   //I
      Cells[FixedCols + 2, index] := GetItem(s, ',', 2);   //power
      Cells[FixedCols + 3, index] := GetItem(s, ',', 3);
      Cells[FixedCols + 4, index] := GetItem(s, ',', 4);
    end;

    with rzStrgrdCalVolt do
    begin
      Cells[FixedCols, index] := GetItem(s, ',', 0);  //Vmet
      Cells[FixedCols + 3, index] := GetItem(s, ',', 1); //Imet
      Cells[FixedCols + 6, index] := GetItem(s, ',', 2);  //Pmet
    end;
  end;
begin
  with rzStrgrdCalibPortSettings do
  begin
    index := Cols[1].IndexOf(IntToStr(APort));
    if index > 0 then
    begin
      Cells[ColCount - 1, index] := GetItem(ABackStr, ';', 0);
      dispReadings(GetItem(ABackStr, ';', 1));
    end;
  end;

end;

procedure TForm1.MeterCalOnLogonAction(Sender: TObject; APort: integer; ABackStr: String);
var
  index: integer;
begin
  with rzStrgrdCalibPortSettings do
  begin
    index := Cols[1].IndexOf(IntToStr(APort));
    if index > 0 then
    begin
      Cells[ColCount - 1, index] := GetItem(ABackStr, ';', 0);
    end;
  end;

end;

procedure TForm1.actMeterCalLogonExecute(Sender: TObject);
var
  _ports: TMyCommObjList;
  _MeterCal: TMeterCalRoutine;
  procedure clearCells();
  var
    i: Integer;
  begin
    with rzStrgrdCalibPortSettings do
      for i := FixedRows to RowCount - 1 do
        Cells[ColCount - 1, i] := '';
  end;
begin
//  if not (MessageDlg('Meter log on?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then exit;

  Output(RzSpinEdit1.IntValue, 220, 220, 0.0, 0.0, 50.0);

  //log on & read
  ClearCells;

  // send corresponind command to meter
  _ports := fgetMyCommObjList(true, rzStrgrdCalibPortSettings);
  try
    _MeterCal := TMeterCalRoutine.Create;
    with _MeterCal do
    begin
      OnReadComm := MeterCalOnLogonAction;
      OnWaiting := RelayTestOnWatingEvent;
    end;
    try
      _MeterCal.MeterLogon(_ports);
    finally
      _MeterCal.Free;
    end;
  finally
    FreeAndNil(_ports);
  end;

end;

procedure TForm1.ClearStrgrdCells(AGrid: TStringGrid);
var
  i, j: Integer;
begin
  with AGrid do
    for i := FixedRows to RowCount - 1 do
      for j := FixedCols to ColCount - 1 do
        Cells[j, i] := '';
end;

procedure TForm1.ClearStrgrdCells(AGrid: TStringGrid; ACol: Integer);
var
  i: Integer;
begin
  with AGrid do
    for i := FixedRows to RowCount - 1 do
      Cells[ACol, i] := '';
end;

procedure TForm1.ClearStrgrdCells(AGrid: TStringGrid; AColSet: TMyGridColSet);
var
  i, j: Integer;
begin
  with AGrid do
    for i := FixedRows to RowCount - 1 do
      for j := FixedCols to ColCount - 1 do
        if j in AColSet then
          Cells[j, i] := '';
end;

procedure TForm1.MeterCalOnReadCalibrationsAction(Sender: TObject; APort: integer; ABackStr: String);
var
  index: integer;
  procedure dispReadings(s: string);
  begin
    with rzStrgrdCalVolt do
    begin
      Cells[FixedCols + 1, index] := GetItem(s, ',', 0);  //Vdef
      Cells[FixedCols + 4, index] := GetItem(s, ',', 1); //Idef
      Cells[FixedCols + 7, index] := GetItem(s, ',', 2);  //Pdef
    end;

    with rzStrgrdCalPhaseErr do
    begin
      Cells[FixedCols + 2, index] := GetItem(s, ',', 3);  //VIdef
    end;
  end;
begin
  with rzStrgrdCalibPortSettings do
  begin
    index := Cols[1].IndexOf(IntToStr(APort));
    if index > 0 then
    begin
      Cells[ColCount - 1, index] := GetItem(ABackStr, ';', 0);
      dispReadings(GetItem(ABackStr, ';', 1));
    end;
  end;

end;

procedure TForm1.actCalReadExecute(Sender: TObject);
var
  _ports: TMyCommObjList;
  _MeterCal: TMeterCalRoutine;
begin
  //Port status
  ClearStrgrdCells(rzStrgrdCalibPortSettings, 3);

  //grid of readings
  ClearStrgrdCells(rzStrgrdCalVolt, [2, 5, 8]);

  // send corresponind command to meter
  _ports := fgetMyCommObjList(true, rzStrgrdCalibPortSettings);
  try
    _MeterCal := TMeterCalRoutine.Create;
    with _MeterCal do
    begin
      OnReadComm := MeterCalOnReadCalibrationsAction;
      OnWaiting := RelayTestOnWatingEvent;
    end;
    try
      _MeterCal.ReadOnComm(_ports);
    finally
      _MeterCal.Free;
    end;
  finally
    FreeAndNil(_ports);
  end;

end;

procedure TForm1.WaitForWorkThreadFinish();
var
  T: TDateTime;
  N: Longint;
begin
  T := Now();
  N := GetTickCount;
  while (WorkThreadCount > 0) and (not stoptest) do
  begin
    with RzStatusPane1 do
      Caption := Format( 'Work threads(%d) elapsed time: %s', [WorkThreadCount ,  FormatDateTime('hh:mm:ss', (Now() - T))]);
    Application.ProcessMessages;
    Sleep(50);
  end;
end;

procedure TForm1.MeterCalCountDown(ASecond: longword);
var
  T: TDateTime;
  N: Longint;
begin
  T := Now();
  N := GetTickCount;
  while (GetTickCount - N < ASecond * 1000) and (not stoptest) do
  begin
    with RzStatusPane1 do
      Caption := 'wait elapsed time: ' + FormatDateTime('hh:mm:ss', (Now() - T));
    Application.ProcessMessages;
    Sleep(50);
  end;
//  with RzStatusPane1 do
//    Caption := 'wait elapsed time: complete ';
end;

function TForm1.MeterCalCheckCommStatus(ASubstr: string): boolean;
var
  i: integer;
begin
  Result := false;
  with rzStrgrdCalibPortSettings do
    for i := FixedRows to RowCount - 1 do
      if MeterCommPortChecked(rzStrgrdCalibPortSettings, 2, i - FixedRows) then
      begin
        result := pos(ASubstr, Cells[3, i]) > 0;
        if not result then
          break;
      end;
end;

procedure TForm1.actMeterCalAutoExecute(Sender: TObject);
const
  CalNames: array[TKindOfMeterCal] of string = ('voltage', 'current', 'power', 'phase shift');
var
  i: TKindOfMeterCal;
  t: TDateTime;
  procedure MeterCalWriteRoutine(AKind: TKindOfMeterCal); overload;
  begin
    StartMeterCalibrations(AKind);
    //if MessageDlg('please check meter(s) for the gain to write , retry?', mtConfirmation, [mbRetry, mbNo], 0) = mrRetry then
    if not (MeterCalCheckCommStatus('ok') or stoptest) then
    begin
      MeterCalCountDown(1);
      MeterCalWriteRoutine(AKind);
    end;
  end;
  procedure MeterCalWriteRoutine(); overload;
  begin
    actStartCal2Execute(self);
    //if MessageDlg('please check meter(s) for phase shift to write , retry?', mtConfirmation, [mbRetry, mbNo], 0) = mrRetry then
    if not (MeterCalCheckCommStatus('ok') or stoptest) then
    begin
      MeterCalCountDown(1);
      MeterCalWriteRoutine();
    end;
  end;

  procedure MeterCalReadGainsRoutine();
  begin
    actCalReadExecute(self);
    //if MessageDlg('Please check meter(s) Default Gains, retry?', mtConfirmation, [mbRetry, mbNo], 0) = mrRetry then
    if not (MeterCalCheckCommStatus('ok') or stoptest) then
      MeterCalReadGainsRoutine();
  end;

  procedure MeterCalReadRoutine();
  begin
    actMeterReadingsExecute(self);
    //MeterCalCountDown(1);
    actCalReadExecute(self);
    //if MessageDlg('Please check meter(s) readings, retry?', mtConfirmation, [mbRetry, mbNo], 0) = mrRetry then
    if not (MeterCalCheckCommStatus('ok') or stoptest) then
      MeterCalReadRoutine();
  end;

  function SourceDownCheck(): boolean;
  begin
    Output(RzSpinEdit1.IntValue, 220, 0.0, 0.0, 0.0, 50.0, result);
    //if (not Result) and (MessageDlg('Source down failed, retry?', mtWarning, [mbRetry, mbNo], 0) = mrRetry) then
    if not (Result or stoptest) then
    begin
      MeterCalCountDown(2);
      result := SourceDownCheck();
    end
  end;
  
  function Initial2Cal(): boolean;
  begin
    ErrTest(RzSpinEdit1.IntValue, rzedtCircleNbr.IntValue, rzedtAccessNbr.IntValue, 1, GetStdNbr(), Result);

    Result := SyncRefMeter(RzSpinEdit1.IntValue, 'D', 10.0);

    if (not Result) and (MessageDlg('Source is not ready, retry?', mtWarning, [mbRetry, mbNo], 0) = mrRetry) then
      result := Initial2Cal();
  end;

  procedure UpdateTestTime();
  var
    t0: TDateTime;
  begin
    t0 :=  Now() - t;
    with rzstspnCalTime do
      Caption := 'calibration duration: ' + FormatDateTime('hh:mm:ss', t0);
    if Assigned(MeterCalData) then
      MeterCalData.CalTime := t0;
  end;
begin
  if not (MessageDlg('Meter(s) start to auto cal.?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    exit;

  t := Now();
  MeterCalAutoOnTesting := true;
  //MeterCalCountDown(3);
  try
    //initial to start calibartion, std meter & error calc.
    if not Initial2Cal() then
      exit;

    //logon
    actMeterCalLogonExecute(self);
 //   if MessageDlg('please check meter(s) logon, start to cal.?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
//      exit;

    //read default gains
    //MeterCalReadGainsRoutine();

    //source output for calibration V,I, Energy & readings
    actSourceOutput4Cal1Execute(self);
    MeterCalCountDown(RzNmEdtWaitforPower2Stab.IntValue); // wait for stablebility of power

    //calibration for gain V, I , Energy
    for i := kofCalVolt to kofCalPower do
    begin
      MeterCalReadRoutine();
      actReadStdReadingsExecute(self);

      SetupMeterCalValues(i, 0);  //should be calibration 1by 1
//      if MessageDlg(Format('confirm to calibration of %s', [CalNames[i]]), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
//      begin
        //Port status
      ClearStrgrdCells(rzStrgrdCalibPortSettings, 3);
      MeterCalWriteRoutine(i);
//      end
//      else
//        exit;
      if stoptest then
        break
      else
        MeterCalCountDown(RzNmEdtMeterCalInterval.IntValue);
    end;

    MeterCalReadRoutine();

    //if stoptest or (MessageDlg('start to cal. phase shift?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then exit;
    if stoptest then exit;

    //-------------------calibration for phase shift---------------------
    actSourceOutput4Cal2Execute(self);//source output for calibration phase shift & readings
    MeterCalCountDown(RzNmEdtWaitforPower2Stab.IntValue); // wait for stablebility of power
    //setup error calc. device
    ErrTest(RzSpinEdit1.IntValue, 1, rzedtAccessNbr.IntValue, 1, 1.0e8 / rzedtCx.Value);
    actReadError4Cal2Execute(self);
    actReadStdReadingsExecute(self);
    MeterCalWriteRoutine();
    //-------------------the end of block----------------------------

  finally
    stoptest := false;
    MeterCalAutoOnTesting := false;
    SourceDownCheck();
    UpdateTestTime();
    if Assigned(Sender) then
      ShowMessage('calibration finished!');
  end;
end;

procedure TForm1.actMeterCalAutoUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not MeterCalAutoOnTesting;
end;

procedure TForm1.actMeterLogoffExecute(Sender: TObject);
begin
  if not (MessageDlg('Meter log off?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then exit;
  Output(RzSpinEdit1.IntValue, 220, 0.0, 0.0, 0.0, 50.0);
end;

procedure TForm1.actMeterReadingsExecute(Sender: TObject);
var
  _ports: TMyCommObjList;
  _MeterCal: TMeterCalRoutine;
  procedure clearCells();
  var
    i: Integer;
  begin
    with rzStrgrdCalibPortSettings do
      for i := FixedRows to RowCount - 1 do
        Cells[ColCount - 1, i] := '';
  end;
begin
  //log on & read
  ClearCells;

  // send corresponind command to meter
  _ports := fgetMyCommObjList(true, rzStrgrdCalibPortSettings);
  try
    _MeterCal := TMeterCalRoutine.Create;
    with _MeterCal do
    begin
      OnReadComm := MeterCalOnReadingsAction;
      OnWaiting := RelayTestOnWatingEvent;
    end;
    try
      _MeterCal.GetReadingsOnComm(_ports);
    finally
      _MeterCal.Free;
    end;
  finally
    FreeAndNil(_ports);
  end;

end;

procedure TForm1.actReadStdReadingsExecute(Sender: TObject);
  function ReferenceReadingsCheck(): boolean;
  var
    tmpData: TYCRefInstant;
  begin
    ReadReferenceMeasurement();  //1st
    tmpData := _RecData;
    MeterCalCountDown(2);
    ReadReferenceMeasurement();  //2snd
    Result := ((tmpData.Pa - _RecData.Pa) * 100 / _RecData.Pa) < 0.05;
    if (not Result) and (MessageDlg('Reference readings check failed, retry?', mtWarning, [mbRetry, mbNo], 0) = mrRetry) then
      result := ReferenceReadingsCheck();
  end;
begin
  //ReadReferenceMeasurement();
  ReferenceReadingsCheck();
  with _RecData, RzMemo1 do
    Lines.Add(Format('%s U=%8.3f, I=%8.4f, Angle=%8.3f, P=%8.3f, S=%8.3f', [TimeToStr(Now()), Ua, Ia, PHASEa, PSUM / 3, SSUM / 3]));
end;

procedure TForm1.SetupMeterCalValues(AOffset: Integer);
var
  ARow: integer;
  Pmet: Double;
begin
  with  rzStrgrdCalPhaseErr, _RecData do
  begin
    if fixedRows + Aoffset > RowCount - 1 then Exit;
    if MeterCommPortChecked(rzStrgrdCalibPortSettings, 2, AOffset) then
    begin
      ARow := FixedRows + AOffset;
      Pmet := CalPhaseShift(strtofloat(Cells[FixedCols, ARow]), PSUM / 3, SSUM / 3);
      Cells[FixedCols + 1, ARow] := Format('%8.3f', [Pmet]);
      Cells[FixedCols + 3, ARow] := Format('%8.3f', [CalPhaseShift(PHASEa, Pmet)]);
    end;
  end;
  Inc(AOffset);
  SetupMeterCalValues(AOffset);
end;

procedure TForm1.SetupMeterCalValues(AKind: TKindOfMeterCal; AOffset: Integer);
var
  ARow: integer;
begin
  with  rzStrgrdCalVolt, _RecData do
  begin
    if fixedRows + Aoffset > RowCount - 1 then Exit;
    if MeterCommPortChecked(rzStrgrdCalibPortSettings, 2, AOffset) then
    begin
      ARow := FixedRows + AOffset;
      case AKind of
        kofCalVolt: Cells[FixedCols + 2, ARow] := Format('%8.3f', [CalNewGain(StrToFloat(Cells[FixedCols + 1, ARow]),
            Ua, StrToFloat(Cells[FixedCols, ARow]))]);
        kofCalCurr: Cells[FixedCols + 5, ARow] := Format('%8.4f', [CalNewGain(StrToFloat(Cells[FixedCols + 4, ARow]),
            Ia, StrToFloat(Cells[FixedCols + 3, ARow]))]);
        kofCalPower: Cells[FixedCols + 8, ARow] := Format('%8.3f', [CalNewGain(StrToFloat(Cells[FixedCols + 7, ARow]),
            Pa, StrToFloat(Cells[FixedCols + 6, ARow]))]);
        kofCalPhaseShift: ;
      end;
    end;
  end;
  Inc(AOffset);
  SetupMeterCalValues(AKind, AOffset);
end;

procedure TForm1.MeterCalOnNotifyEventRequestGain(Sender: TObject; APort: integer; AKind: TKindOfMeterCal; AWritings: TMeterCalWritings);
var
  offset: Integer;
  function GetValue(AGrid: TStringGrid; ACol: Integer): double;
  begin
    with AGrid do
      if MeterCommPortChecked(rzStrgrdCalibPortSettings, 2, offset) then
        result := StrToFloatDef(Cells[ACol, FixedRows + offset], 0);
  end;
begin

  with rzStrgrdCalibPortSettings do
  begin
    offset := Cols[1].IndexOf(IntToStr(APort));
    if offset > 0 then
      offset := offset - FixedRows
    else
      Exit;
  end;

  with AWritings do
  begin
    word(CalWordVoltage1) := round(GetValue(rzStrgrdCalVolt, rzStrgrdCalVolt.FixedCols + 1));// def_V
    word(CalWordCurrent1) := round(GetValue(rzStrgrdCalVolt, rzStrgrdCalVolt.FixedCols + 4)); //def_I
    word(CalWordEnergy1) := round(GetValue(rzStrgrdCalVolt, rzStrgrdCalVolt.FixedCols + 7)); // def_P
    word(PhaseShift2) := round(GetValue(rzStrgrdCalPhaseErr, rzStrgrdCalPhaseErr.FixedCols + 2)); // def_Phase
    case AKind of
      kofCalVolt:
      begin
        word(CalWordVoltage1) := round(GetValue(rzStrgrdCalVolt, rzStrgrdCalVolt.FixedCols + 2));
//        word(CalWordCurrent1) := round(GetValue(rzStrgrdCalVolt, rzStrgrdCalVolt.FixedCols + 4)); //def_I
//        word(CalWordEnergy1) := round(GetValue(rzStrgrdCalVolt, rzStrgrdCalVolt.FixedCols + 7)); // def_P
//        word(PhaseShift2) := round(GetValue(rzStrgrdCalPhaseErr, rzStrgrdCalPhaseErr.FixedCols + 2)); // def_Phase
      end;
      kofCalCurr:
      begin
        word(CalWordCurrent1) := round(GetValue(rzStrgrdCalVolt, rzStrgrdCalVolt.FixedCols + 5));
//      word(CalWordVoltage1) := round( GetValue(rzStrgrdCalVolt, rzStrgrdCalVolt.FixedCols + 1));// def_V
//      word(CalWordEnergy1) := round(GetValue(rzStrgrdCalVolt, rzStrgrdCalVolt.FixedCols + 7)); // def_P
//      word(PhaseShift2) := round(GetValue(rzStrgrdCalPhaseErr, rzStrgrdCalPhaseErr.FixedCols + 2)); // def_Phase
      end;
      kofCalPower:
      begin
        word(CalWordEnergy1) := round(GetValue(rzStrgrdCalVolt, rzStrgrdCalVolt.FixedCols + 8));
      end;
      kofCalPhaseShift:
      begin
        word(PhaseShift2) := round(GetValue(rzStrgrdCalPhaseErr, rzStrgrdCalPhaseErr.FixedCols + 3));
      end;
    end;
  end;
end;

procedure TForm1.StartMeterCalibrations(index: TKindOfMeterCal);
var
  _ports: TMyCommObjList;
  _MeterCal: TMeterCalRoutine;
begin
   //Setup calibrations
//  case index of
//    kofCalVolt, kofCalCurr, kofCalPower:
//    begin
//      SetupMeterCalValues(index, 0);
//    end;
//    kofCalPhaseShift:
//    begin
//      SetupMeterCalValues(0);
//    end;
//  end;

    // send corresponind command to meter
  _ports := fgetMyCommObjList(true, rzStrgrdCalibPortSettings);
  try
    _MeterCal := TMeterCalRoutine.Create;
    with _MeterCal do
    begin
      OnReadComm := MeterCalOnLogonAction;
      OnWaiting := RelayTestOnWatingEvent;
      OnGainRequest := MeterCalOnNotifyEventRequestGain;
    end;
    try
      _MeterCal.WriteCalibrationOnComm(index, _ports);
    finally
      _MeterCal.Free;
    end;
  finally
    FreeAndNil(_ports);
  end;

end;

procedure TForm1.actStartCal1Execute(Sender: TObject);
const
  CalNames: array[0..2] of string = ('voltage', 'current', 'power');
  CalKinds: array[0..2] of TKindOfMeterCal = (kofCalVolt, kofCalCurr, kofCalPower);
var
  i: integer;
begin
//  ReadReferenceMeasurement();
//  //Port status
//  ClearStrgrdCells(rzStrgrdCalibPortSettings, 3);

  with RzRadioGroup6 do
    for i := 0 to 2 do
      if Buttons[i].Checked then
      begin
         //Setup calibrations
//         if  kofCalPhaseShift = CalKinds[i] then
//            SetupMeterCalValues(0)
//         else
//          begin
//             SetupMeterCalValues(kofCalVolt, 0);
//             SetupMeterCalValues(kofCalCurr, 0);
//             SetupMeterCalValues(kofCalPower, 0);
//          end;

        SetupMeterCalValues(CalKinds[i], 0);  //should be calibration 1by 1

//        case CalKinds[i] of
//          kofCalVolt, kofCalCurr, kofCalPower:
//          begin
//            SetupMeterCalValues(CalKinds[i], 0);
//          end;
//          kofCalPhaseShift:
//          begin
//            SetupMeterCalValues(0);
//          end;
//        end;

        //ReadReferenceMeasurement();
        if MessageDlg(Format('confirm to calibration of %s', [CalNames[i]]), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          //Port status
          ClearStrgrdCells(rzStrgrdCalibPortSettings, 3);
          StartMeterCalibrations(CalKinds[i]);
          break;
        end;
      end;

end;

procedure TForm1.actStartCal2Execute(Sender: TObject);
begin
  SetupMeterCalValues(0);
  //ReadReferenceMeasurement();
//  if MessageDlg('confirm to calibration of phase shift?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
//  begin
      //ReadReferenceMeasurement();
      //Port status
  ClearStrgrdCells(rzStrgrdCalibPortSettings, 3);
  StartMeterCalibrations(kofCalPhaseShift);
//  end;
end;

procedure TForm1.UpdateMeterCalData();
var
  i, j: integer;
begin
  with rzStrgrdCalibPortSettings do
  for i := FixedRows to RowCount - 1 do
    if MeterCommPortChecked(rzStrgrdCalibPortSettings, 2, i-1 ) then
      with MeterCalData do
      begin
        if pos('ok', Cells[3, i]) > 0 then
          MeterPass := MeterPass + 1;
        MeterCount := MeterCount + 1;
      end;

  with XLS.Sheet[0], drwgrdResult, MeterCalData do
  begin
  //update meter cal data to Excel
    with rzStrgrdCalVolt do
      for i := Fixedrows to RowCount - 1 do
        for j:= FixedCols to ColCount - 1 do
          AsString[2 + j-FixedCols, 2+ i-FixedRows] := Cells[j, i];
    //phase shift
    with rzStrgrdCalPhaseErr do
      for i := Fixedrows to RowCount - 1 do
      begin
        AsStringRef[Format('L%d', [i-FixedRows + 3])] := Cells[fixedcols + 1, i];
         AsStringRef[Format('M%d', [i-FixedRows + 3])] := Cells[fixedcols + 2, i];
         AsStringRef[Format('N%d', [i-FixedRows + 3])] := Cells[fixedcols + 3, i];
      end;

    AsStringRef['A9'] := ':' +  FormatDateTime('hh:mm:ss', CalTime  );
    AsStringRef['A10'] := ':' + FormatDateTime('hh:mm:ss', TestTime  );
  //update meter test data to Excel;
    with rzStrgrdErrorTest do
      for i := Fixedrows to RowCount - 1 do
        for j:= FixedCols to ColCount - 1 do
          AsString[15 + j-FixedCols, 2+ i-FixedRows] := Cells[j, i];
  end;

end;

procedure TForm1.actStartFullExecute(Sender: TObject);
begin
   // cal & test  fully start
   //rzStrgrdCalibPortSettings.Enabled := false;
   if Assigned(MeterCalData) then
     FreeAndNil(MeterCalData);

    MeterCalData := TMeterCalData.Create;

   try
     //cal
      actMeterCalAutoExecute(nil);
     if not stoptest then
       actAccuracyTestExecute(nil);
     actMeterLogoffExecute(nil);
   finally
    stoptest := false;
     UpdateMeterCalData();
     //rzStrgrdCalibPortSettings.Enabled := true;
   end;

end;

procedure TForm1.edtBarcodeKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13 :
      begin
       with drwgrdResult, XLS.Sheet[0] do
          if Row > FixedRows+ 1 then
          begin
            AsStringRef[Format('B%d', [Row])] := TEdit(Sender).Text ;
            Invalidate;
            Row := Row + 1;
          end;
            //ShowMessage('click');
       TEdit(Sender).SelectAll;
      end
  end;
end;

procedure TForm1.actSave2ExcelExecute(Sender: TObject);
var
  fn, path: string;
begin
  path := fGetAppPath() + '\output\';
  if InputQuery('Input file name',format('The excel file will save to %s', [path]), fn) then
  begin
    XLS.Filename := path + fn;
    XLS.Write;
  end;
end;

procedure TForm1.drwgrdResultKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  XLS.Sheets[0].AsWideString[TDrawGrid(Sender).Col - 1, TDrawGrid(Sender).Row - 1] := EditText;
end;

procedure TForm1.rzcmbxLevelClick(Sender: TObject);
begin
  with rzcmbxLevel,redtData, rzchkbReadingSample do
  begin
    if Checked then
    begin
      Clear;
      Lines.Add(Values[ItemIndex]) ;
    end;
  end;
end;

procedure TForm1.DispReadings(ATestCmd : TCmdOperaParam);
//const
//  MatchingValues: array[Boolean] of string = ('30V', '60V');
  //ProtectValues : array[Boolean] of string = ('Normal', 'Protected');
//  MuteStrs : array[Boolean] of string = ('Open', 'Close');
//  BuzzerStrs: array[Boolean] of string = ('Close', 'Open');
  var
    Rsp: TResponding;
    i:integer;
    DataLst : TList;
    ArrX : TArrOfCmd;
begin
    DataLst := GetByteList();
    try
        SetLength(ArrX , DataLst.Count );
        with RzMemo1, ATestCmd do
        begin
          for i := 0 to High(arrx) do
            ArrX[i] := PByte(DataLst[i])^;
          if GetResponding(ArrX, Rsp) then
          begin
             Lines.Add(Format('%s : %8.4f V', [SOperatingParam1, Gain_Data])); //增益数据37 (1-140)
             Lines.Add(Format('%s : %8.4f V', [SOperatingParam2, I_out_U])); //电流功放输出电压值5.3063V（34V）
             Lines.Add(Format('%s : %8.4f V', [SOperatingParam3, U_out_U]));    //电压功放输出电压值
             Lines.Add(Format('%s : %8.4f mV', [SOperatingParam4, I_diff]));    // 电流差压值69.2862Mv
             Lines.Add(Format('%s : %8.4f A', [SOperatingParam5, I_Level]));   //当前电流硬档值
             Lines.Add(Format('%s : %8.4f V', [SOperatingParam6, U_level]));   //当前电压硬档值

             Lines.Add(Format('%s : %8.4f A', [SOperatingParam11, Setting_I ]));   //设定电流值
             Lines.Add(Format('%s : %8.4f V', [SOperatingParam12, Setting_U ]));   //设定电压值
             Lines.Add(Format('%s : %8.4f Deg', [SOperatingParam13, Setting_UI]));   //设定相位值

             Lines.Add(Format('%s : %s', [SOperatingParam14, MuteStrs[ Mute_I] ]));   //电流mute开关 0=打开 1=关闭
             Lines.Add(Format('%s : %s', [SOperatingParam15, MuteStrs[Mute_U ]]));   //电压mute开关 0=打开 1=关闭
             Lines.Add(Format('%s : %s', [SOperatingParam16, BuzzerStrs[Gain_Buzzer]]));   //增益板的蜂鸣器控制 0=关闭 1=打开

             Lines.Add(Format('%s : %s', [SOperatingParam7, MatchingValues[Heavy_load]])); //0=30v   1=60v  匹配开关
             Lines.Add(Format('%s : %s', [SOperatingParam8, ProtectValues[U_protect]])); //1为电压功放过压保护 0正常
             Lines.Add(Format('%s : %s', [SOperatingParam9, ProtectValues[I_protect]])); //1为电流功放过压保护 0正常
             Lines.Add(Format('%s : %s', [SOperatingParam10, ProtectValues[I_open_protect]])); //1为电流开路保护 0正常

          end
          else
            case Rsp of
               rspCRCError : Lines.Add('CRC error!');
               rspLength : Lines.Add('Length was wrong');
            end;
        end;
    finally
        SetLength (ArrX , 0);
        FreeAndNil(DataLst);
    end;
end;

procedure TForm1.act158ReadingTestExecute(Sender: TObject);
var
  TestCmd : TCmdOperaParam;
begin

  case rzcmbxLevel.ItemIndex of
    0 : TestCmd := TCmdOperaParam.Create;
    1 : TestCmd := TCmdLevel_0.Create;
    2 : TestCmd := TCmdLevel_1.Create;
    3 : TestCmd := TCmdLevel_2.Create;
    4 : TestCmd := TCmdLevel_3.Create;
    5 : TestCmd := TCmdLevel_4.Create;
    6 : TestCmd := TCmdLevel_5.Create;
    7 : TestCmd := TCmdLevel_6.Create;
    8 : TestCmd := TCmdLevel_7.Create;
    else
      Exit;
  end;

  try
    case rzcmbxLevel.ItemIndex of
        0 : DispReadings(TestCmd);
        1 : DispReadings(TCmdLevel_0(TestCmd));
        2 : DispReadings(TCmdLevel_1(TestCmd));
        3 :DispReadings(TCmdLevel_2(TestCmd));
        4 :DispReadings(TCmdLevel_3(TestCmd));
        5 :DispReadings(TCmdLevel_4(TestCmd));
        6 :DispReadings(TCmdLevel_5(TestCmd));
        7 :DispReadings(TCmdLevel_6(TestCmd));
        8 :DispReadings(TCmdLevel_7(TestCmd));
      else
        Exit;
      end;
  finally
      FreeAndNil(TestCmd);
  end;

end;

procedure TForm1.DispReadings(ATestCmd: TCmdLevel_2);
var
  Rsp: TResponding;
  i:integer;
  DataLst : TList;
  ArrX : TArrOfCmd;
begin
    DataLst := GetByteList();
    try
        SetLength(ArrX , DataLst.Count );
        with RzMemo1, ATestCmd do
        begin
          for i := 0 to High(arrx) do
            ArrX[i] := PByte(DataLst[i])^;
          if GetResponding(ArrX, Rsp) then
          begin
//    hm_I_pctg, hm_mode, hm_I_val, hm_I_times, hm_I_ph : Double;
//    da_I_adj, da_I_high, da_I_low, da_I_feedback: double;
             Lines.Add(Format('%s : %8.4f', [SLevel2_hm_I_pctg, hm_I_pctg]));
             Lines.Add(Format('%s : %8.4f ', [SLevel2_hm_mode, hm_mode]));
             Lines.Add(Format('%s : %8.4f ', [SLevel2_hm_I_val, hm_I_val]));
             Lines.Add(Format('%s : %8.4f ', [SLevel2_hm_I_times, hm_I_times]));
             Lines.Add(Format('%s : %8.4f ', [SLevel2_hm_I_ph, hm_I_ph]));
             Lines.Add(Format('%s : %8.4f ', [SLevel2_da_I_adj, da_I_adj]));
             Lines.Add(Format('%s : %8.4f ', [SLevel2_da_I_high, da_I_high]));
             Lines.Add(Format('%s : %8.4f ', [SLevel2_da_I_low, da_I_low]));
             Lines.Add(Format('%s : %8.4f ', [SLevel2_da_I_feedback, da_I_feedback]));
          end
          else
            case Rsp of
               rspCRCError : Lines.Add('CRC error!');
               rspLength : Lines.Add('Length was wrong');
            end;
        end;
    finally
        SetLength (ArrX , 0);
        FreeAndNil(DataLst);
    end;
end;

procedure TForm1.DispReadings(ATestCmd: TCmdLevel_3);
var
  Rsp: TResponding;
  i:integer;
  DataLst : TList;
  ArrX : TArrOfCmd;
begin
    DataLst := GetByteList();
    try
        SetLength(ArrX , DataLst.Count );
        with RzMemo1, ATestCmd do
        begin
          for i := 0 to High(arrx) do
            ArrX[i] := PByte(DataLst[i])^;
          if GetResponding(ArrX, Rsp) then
          begin
//    hm_U_pctg, hm_U_mode, hm_U_val, hm_U_times, hm_U_ph : Double;
//    da_U_adj, hm_u_LC, da_U_high, da_U_low, UU_order: double;
             Lines.Add(Format('%s : %8.4f', [SLevel3_hm_U_pctg, hm_U_pctg]));
             Lines.Add(Format('%s : %8.4f ', [SLevel3_hm_U_mode, hm_U_mode]));
             Lines.Add(Format('%s : %8.4f ', [SLevel3_hm_U_val, hm_U_val]));
             Lines.Add(Format('%s : %8.4f ', [SLevel3_hm_U_times, hm_U_times]));
             Lines.Add(Format('%s : %8.4f ', [SLevel3_hm_U_ph, hm_U_ph]));
             Lines.Add(Format('%s : %8.4f ', [SLevel3_da_U_adj, da_U_adj]));
             Lines.Add(Format('%s : %8.4f ', [SLevel3_hm_u_LC, hm_u_LC]));
             Lines.Add(Format('%s : %8.4f ', [SLevel3_da_U_high, da_U_high]));
             Lines.Add(Format('%s : %8.4f ', [SLevel3_da_U_low, da_U_low]));
             Lines.Add(Format('%s : %8.4f ', [SLevel3_UU_order, UU_order]));
          end
          else
            case Rsp of
               rspCRCError : Lines.Add('CRC error!');
               rspLength : Lines.Add('Length was wrong');
            end;
        end;
    finally
        SetLength (ArrX , 0);
        FreeAndNil(DataLst);
    end;
end;

procedure TForm1.DispReadings(ATestCmd: TCmdLevel_0);
var
  Rsp: TResponding;
  i:integer;
  DataLst : TList;
  ArrX : TArrOfCmd;
begin
    DataLst := GetByteList();
    try
        SetLength(ArrX , DataLst.Count );
        with RzMemo1, ATestCmd do
        begin
          for i := 0 to High(arrx) do
            ArrX[i] := PByte(DataLst[i])^;
          if GetResponding(ArrX, Rsp) then
          begin
//    Version: string;
//    I_Diff_set, I_diff_lock: Double ; //电流差压设定， 锁定值
//    I_autoRange, I_amp_out, U_autoRange, U_amp_out : double;
//    Matching_Disp, I_gain_Disp : double;
//    Comm_state, selected_gain_chip: double;
//    I_freq_disp, UU_angle: double;
//    Comm_baud_rate, coff_delay, phase_rate : double;
             Lines.Add(Format('%s : %s', [SLevel0_Ver, Version]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading1, I_Diff_set]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading2, I_diff_lock]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading3, I_autoRange]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading4, I_amp_out]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading5, U_autoRange]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading6, U_amp_out]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading7, Matching_Disp]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading8, I_gain_Disp]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading9, Comm_state]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading10, selected_gain_chip]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading11, I_freq_disp]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading12, UU_angle]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading13, Comm_baud_rate]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading14, coff_delay]));
             Lines.Add(Format('%s : %8.4f ', [SLevel0_Reading15, phase_rate]));
          end
          else
            case Rsp of
               rspCRCError : Lines.Add('CRC error!');
               rspLength : Lines.Add('Length was wrong');
            end;
        end;
    finally
        SetLength (ArrX , 0);
        FreeAndNil(DataLst);
    end;
end;

procedure TForm1.DispReadings(ATestCmd: TCmdLevel_1);
var
  Rsp: TResponding;
  i:integer;
  DataLst : TList;
  ArrX : TArrOfCmd;
begin
    DataLst := GetByteList();
    try
        SetLength(ArrX , DataLst.Count );
        with RzMemo1, ATestCmd do
        begin
          for i := 0 to High(arrx) do
            ArrX[i] := PByte(DataLst[i])^;
          if GetResponding(ArrX, Rsp) then
          begin
//    set_I_percntg, set_U_percntg, set_Phase_percentg, set_Freq_percntg: double;
//    I_level_sele, U_level_sele : double;
//    I_auto, U_auto: double;
//    gain_mode, matching_ctrl, freq_type, std_level_ctr: Double;
//    mains_freq, I_diff_correct, U_diff_corr, I1_amp_out, U1_amp_out : Double;
//    I_mute, U_mute, buzz, save_flag: double;
             Lines.Add(Format('%s : %8.4f', [SLevel1_set_I_percntg, set_I_percntg]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_set_U_percntg, set_U_percntg]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_set_Phase_percentg, set_Phase_percentg]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_set_Freq_percntg, set_Freq_percntg]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_I_level_sele, I_level_sele]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_U_level_sele, U_level_sele]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_I_auto, I_auto]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_U_auto, U_auto]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_gain_mode, gain_mode]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_matching_ctrl, matching_ctrl]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_freq_type, freq_type]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_std_level_ctr, std_level_ctr]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_mains_freq, mains_freq]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_I_diff_correct, I_diff_correct]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_U_diff_corr, U_diff_corr]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_I1_amp_out, I1_amp_out]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_U1_amp_out, U1_amp_out]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_I_mute, I_mute]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_U_mute, U_mute]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_buzz, buzz]));
             Lines.Add(Format('%s : %8.4f ', [SLevel1_save_flag, save_flag]));
          end
          else
            case Rsp of
               rspCRCError : Lines.Add('CRC error!');
               rspLength : Lines.Add('Length was wrong');
            end;
        end;
    finally
        SetLength (ArrX , 0);
        FreeAndNil(DataLst);
    end;
end;

procedure TForm1.DispReadings(ATestCmd: TCmdLevel_6);
var
  Rsp: TResponding;
  i:integer;
  DataLst : TList;
  ArrX : TArrOfCmd;
begin
    DataLst := GetByteList();
    try
        SetLength(ArrX , DataLst.Count );
        with RzMemo1, ATestCmd do
        begin
          for i := 0 to High(arrx) do
            ArrX[i] := PByte(DataLst[i])^;
          if GetResponding(ArrX, Rsp) then
          begin
//    lev_U_max, lev_U, lev_U_1, lev_U_2, lev_U_3, lev_U_4 : double;
//    lev_U_5, lev_U_6, lev_U_7, lev_U_8 , lev_U_9, lev_U_10, lev_U_11: double;
//    lev_Relay_type : double;
             Lines.Add(Format('%s : %8.4f', [SLevel6_lev_U_max, lev_U_max]));
             Lines.Add(Format('%s : %8.4f ', [SLevel6_lev_U, lev_U]));
             Lines.Add(Format('%s : %8.4f ', [SLevel6_lev_U_1, lev_U_1]));
             Lines.Add(Format('%s : %8.4f ', [SLevel6_lev_U_2, lev_U_2]));
             Lines.Add(Format('%s : %8.4f ', [SLevel6_lev_U_3, lev_U_3]));
             Lines.Add(Format('%s : %8.4f ', [SLevel6_lev_U_4, lev_U_4]));
             Lines.Add(Format('%s : %8.4f ', [SLevel6_lev_U_5, lev_U_5]));
             Lines.Add(Format('%s : %8.4f ', [SLevel6_lev_U_6, lev_U_6]));
             Lines.Add(Format('%s : %8.4f ', [SLevel6_lev_U_7, lev_U_7]));
             Lines.Add(Format('%s : %8.4f ', [SLevel6_lev_U_8, lev_U_8]));
             Lines.Add(Format('%s : %8.4f', [SLevel6_lev_U_9, lev_U_9]));
             Lines.Add(Format('%s : %8.4f ', [SLevel6_lev_U_10, lev_U_10]));
             Lines.Add(Format('%s : %8.4f ', [SLevel6_lev_U_11, lev_U_11]));
             Lines.Add(Format('%s : %8.4f ', [SLevel6_lev_Relay_type, lev_Relay_type]));
          end
          else
            case Rsp of
               rspCRCError : Lines.Add('CRC error!');
               rspLength : Lines.Add('Length was wrong');
            end;
        end;
    finally
        SetLength (ArrX , 0);
        FreeAndNil(DataLst);
    end;
end;

procedure TForm1.DispReadings(ATestCmd: TCmdLevel_7);
var
  Rsp: TResponding;
  i:integer;
  DataLst : TList;
  ArrX : TArrOfCmd;
begin
    DataLst := GetByteList();
    try
        SetLength(ArrX , DataLst.Count );
        with RzMemo1, ATestCmd do
        begin
          for i := 0 to High(arrx) do
            ArrX[i] := PByte(DataLst[i])^;
          if GetResponding(ArrX, Rsp) then
          begin
//    I_diff_1, I_diff_2,   I_diff_3,  I_diff_4,  I_diff_5 : double;
//    I_diff_6, I_diff_7,   I_diff_8,  I_diff_9,  I_diff_10 : double;
//    lev_matching, gain_value, I_diff_disp : double;
             Lines.Add(Format('%s : %8.4f', [SLevel7_I_diff_1, I_diff_1]));
             Lines.Add(Format('%s : %8.4f ', [SLevel7_I_diff_2, I_diff_2]));
             Lines.Add(Format('%s : %8.4f ', [SLevel7_I_diff_3, I_diff_3]));
             Lines.Add(Format('%s : %8.4f ', [SLevel7_I_diff_4, I_diff_4]));
             Lines.Add(Format('%s : %8.4f ', [SLevel7_I_diff_5, I_diff_5]));
             Lines.Add(Format('%s : %8.4f ', [SLevel7_I_diff_6, I_diff_6]));
             Lines.Add(Format('%s : %8.4f ', [SLevel7_I_diff_7, I_diff_7]));
             Lines.Add(Format('%s : %8.4f ', [SLevel7_I_diff_8, I_diff_8]));
             Lines.Add(Format('%s : %8.4f ', [SLevel7_I_diff_9, I_diff_9]));
             Lines.Add(Format('%s : %8.4f ', [SLevel7_I_diff_10, I_diff_10]));
             Lines.Add(Format('%s : %8.4f', [SLevel7_lev_matching, lev_matching]));
             Lines.Add(Format('%s : %8.4f ', [SLevel7_gain_value, gain_value]));
             Lines.Add(Format('%s : %8.4f ', [SLevel7_I_diff_disp, I_diff_disp]));
          end
          else
            case Rsp of
               rspCRCError : Lines.Add('CRC error!');
               rspLength : Lines.Add('Length was wrong');
            end;
        end;
    finally
        SetLength (ArrX , 0);
        FreeAndNil(DataLst);
    end;
end;

procedure TForm1.DispReadings(ATestCmd: TCmdLevel_4);
var
  Rsp: TResponding;
  i:integer;
  DataLst : TList;
  ArrX : TArrOfCmd;
begin
    DataLst := GetByteList();
    try
        SetLength(ArrX , DataLst.Count );
        with RzMemo1, ATestCmd do
        begin
          for i := 0 to High(arrx) do
            ArrX[i] := PByte(DataLst[i])^;
          if GetResponding(ArrX, Rsp) then
          begin
//    setop_I, setop_U, setop_Phase, setop_LC : double;
//    setop_phase_adj, setop_UU_adj, setop_freq, setop_clock: double;
             Lines.Add(Format('%s : %8.4f', [SLevel4_setop_I, setop_I]));
             Lines.Add(Format('%s : %8.4f ', [SLevel4_setop_U, setop_U]));
             Lines.Add(Format('%s : %8.4f ', [SLevel4_setop_Phase, setop_Phase]));
             Lines.Add(Format('%s : %8.4f ', [SLevel4_setop_LC, setop_LC]));
             Lines.Add(Format('%s : %8.4f ', [SLevel4_setop_phase_adj, setop_phase_adj]));
             Lines.Add(Format('%s : %8.4f ', [SLevel4_setop_UU_adj, setop_UU_adj]));
             Lines.Add(Format('%s : %8.4f ', [SLevel4_setop_freq, setop_freq]));
             Lines.Add(Format('%s : %8.4f ', [SLevel4_setop_clock, setop_clock]));
          end
          else
            case Rsp of
               rspCRCError : Lines.Add('CRC error!');
               rspLength : Lines.Add('Length was wrong');
            end;
        end;
    finally
        SetLength (ArrX , 0);
        FreeAndNil(DataLst);
    end;
end;

procedure TForm1.DispReadings(ATestCmd: TCmdLevel_5);
var
  Rsp: TResponding;
  i:integer;
  DataLst : TList;
  ArrX : TArrOfCmd;
begin
    DataLst := GetByteList();
    try
        SetLength(ArrX , DataLst.Count );
        with RzMemo1, ATestCmd do
        begin
          for i := 0 to High(arrx) do
            ArrX[i] := PByte(DataLst[i])^;
          if GetResponding(ArrX, Rsp) then
          begin
//    lev_I_max, lev_I_1, lev_I_2, lev_I_3, lev_I_4 : double;
//    lev_I_5, lev_I_6, lev_I_7, lev_I_8 , lev_I_9, lev_I_10: double;
//    lev_I_ref_1, lev_I_ref_2,lev_I_ref_3, lev_I_set : double;
             Lines.Add(Format('%s : %8.4f', [SLevel5_lev_I_max, lev_I_max]));
             Lines.Add(Format('%s : %8.4f ', [SLevel5_lev_I_1, lev_I_1]));
             Lines.Add(Format('%s : %8.4f ', [SLevel5_lev_I_2, lev_I_2]));
             Lines.Add(Format('%s : %8.4f ', [SLevel5_lev_I_3, lev_I_3]));
             Lines.Add(Format('%s : %8.4f ', [SLevel5_lev_I_4, lev_I_4]));
             Lines.Add(Format('%s : %8.4f ', [SLevel5_lev_I_5, lev_I_5]));
             Lines.Add(Format('%s : %8.4f ', [SLevel5_lev_I_6, lev_I_6]));
             Lines.Add(Format('%s : %8.4f ', [SLevel5_lev_I_7, lev_I_7]));
             Lines.Add(Format('%s : %8.4f ', [SLevel5_lev_I_8, lev_I_8]));
             Lines.Add(Format('%s : %8.4f ', [SLevel5_lev_I_9, lev_I_9]));
             Lines.Add(Format('%s : %8.4f', [SLevel5_lev_I_10, lev_I_10]));
             Lines.Add(Format('%s : %8.4f ', [SLevel5_lev_I_ref_1, lev_I_ref_1]));
             Lines.Add(Format('%s : %8.4f ', [SLevel5_lev_I_ref_2, lev_I_ref_2]));
             Lines.Add(Format('%s : %8.4f ', [SLevel5_lev_I_ref_3, lev_I_ref_3]));
             Lines.Add(Format('%s : %8.4f ', [SLevel5_lev_I_set, lev_I_set]));
          end
          else
            case Rsp of
               rspCRCError : Lines.Add('CRC error!');
               rspLength : Lines.Add('Length was wrong');
            end;
        end;
    finally
        SetLength (ArrX , 0);
        FreeAndNil(DataLst);
    end;
end;

function TForm1.GetByteList(): TList;
var
  s, tmpstr: string;
  Ptr: PWord;
  i: Integer;
begin
  Result := TList.Create;
  with redtData do
  s := Copy(Text,1, Length(Text));

    i := Pos(#13#10, s);
    while i > 0 do
    begin
      tmpstr := Copy(s,1, i-1);
      while Length(tmpstr) > 0 do
      begin
        new(Ptr);
        Ptr^ := strtoint('0x' + Copy(tmpstr,1,2));
        Result.Add(ptr);
        Delete(tmpstr, 1, 3);
      end;
      Delete(s,1,i+1);
      i := Pos(#13#10, s);
    end;

    while Length(s) > 0 do
    begin
      new(Ptr);
      Ptr^ := strtoint('0x' + Copy(s,1,2));
      Result.Add(ptr);
      Delete(s, 1, 3);
    end;

end;

procedure TForm1.Handle158ReadingText(Sender: TObject; AStr: string);
begin
  with RzMemo1 do
    Lines.Add(AStr) ;

end;

procedure TForm1.Handle158ReadingExport2Excel(Sender: TObject; ACmd: TCmdOperaParam);
begin
  case ACmd.Code of
    coCmdReadOperating : ExportReadings(CurrentlyKindofAddr, ACmd);
    coCmdReadLevel0 : ExportReadings(CurrentlyKindofAddr, TCmdLevel_0( ACmd));
    coCmdReadLevel1 : ExportReadings(CurrentlyKindofAddr, TCmdLevel_1(ACmd));
    coCmdReadLevel2 : ExportReadings(CurrentlyKindofAddr, TCmdLevel_2(ACmd));
    coCmdReadLevel3 : ExportReadings(CurrentlyKindofAddr, TCmdLevel_3(ACmd));
    coCmdReadLevel4 : ExportReadings(CurrentlyKindofAddr, TCmdLevel_4(ACmd));
    coCmdReadLevel5 : ExportReadings(CurrentlyKindofAddr, TCmdLevel_5(ACmd));
    coCmdReadLevel6 : ExportReadings(CurrentlyKindofAddr, TCmdLevel_6(ACmd));
    coCmdReadLevel7 : ExportReadings(CurrentlyKindofAddr, TCmdLevel_7(ACmd));
  end;

end;

procedure TForm1.act158ReadingsExecute(Sender: TObject);
var
  Readings : TRoutine158Readings;
  function GetKindOfPhaseAddr (): TKindofAddr;
  begin
      //kofAddr220, kofAddr221, kofAddr222
     case rzcmbxAddr.ItemIndex of
        0:result:= kofAddr220;
        1:result:= kofAddr221;
        2:result:= kofAddr222;
        else
         result:= kofAddr220;
     end;
  end;
  function GetTKindOfReadings(): TKindOfReadings;
  begin
//    kofWorkPara, kofLevel0, kofLevel1, kofLevel2, kofLevel3,
////      kofLevel4, kofLevel5, kofLevel6, kofLevel7
    case rzcmbxLevel.ItemIndex of
      0:Result:= kofWorkPara;
      1:Result:= kofLevel0;
      2:Result:= kofLevel1;
      3:Result:= kofLevel2;
      4:Result:= kofLevel3;
      5:Result:= kofLevel4;
      6:Result:= kofLevel5;
      7:Result:= kofLevel6;
      8:Result:= kofLevel7;
      else
        Result:= kofWorkPara;
    end;
  end;
begin
  //open box to power source channel
  RzMemo1.Lines.add('open channel of power source');
  openbox(2);
  // read  one
  Readings := TRoutine158Readings.Creat(GetTestBenchCommPort());
  with Readings do
  begin
    NotifyReadings:= Handle158ReadingText;
  end;

  try
     Readings.Read158Para(GetKindOfPhaseAddr(), GetTKindOfReadings());
  finally
     Readings.Free;
  end;
end;

procedure TForm1.act158ReadingsAllExecute(Sender: TObject);
var
  i : TKindOfReadings;
  procedure ReadOnePhase(AKind: TKindofAddr; AKindOfReading : TKindOfReadings);
  var
    Readings : TRoutine158Readings;
  begin
    // read  one
    Readings := TRoutine158Readings.Creat(GetTestBenchCommPort());
    with Readings do
    begin
      NotifyReadings:= Handle158ReadingText;
      NotifyExportReadings := Handle158ReadingExport2Excel;
    end;

    try
       Readings.Read158Para(AKind, AKindOfReading);
    finally
       Readings.Free;
    end;
  end;
  procedure doSetupExcelFile();
  begin
      with XLS do
      begin
         Filename := fGetAppPath() + SReadings2ExcelFileName;
          Read;
      end;
  end;
begin
  stoptest := false;
  // read recursively
  if MessageDlg('start to read?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  if rzchkbLog2xls.Checked then
    doSetupExcelFile();

  openbox(2);
  RzMemo1.Lines.Add('Phase A 158 readings');
  CurrentlyKindofAddr := kofAddr220;
  for i := kofWorkPara to kofLevel7 do
  begin
     ReadOnePhase(kofAddr220, i);
    if stoptest then Exit;
  end ;

  if MessageDlg('go on phase B/C?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;
  RzMemo1.Lines.Add('Phase B 158 readings');
  CurrentlyKindofAddr := kofAddr221;
  for i := kofWorkPara to kofLevel7 do
  begin
     ReadOnePhase(kofAddr221, i);
    if stoptest then Exit;
  end;
  RzMemo1.Lines.Add('Phase C 158 readings');
  CurrentlyKindofAddr := kofAddr222;
  for i := kofWorkPara to kofLevel7 do
  begin
     ReadOnePhase(kofAddr222, i);
    if stoptest then Exit;
  end ;

end;

procedure TForm1.Save2ExcelFile();
var
  S: string;
begin
  if InputQuery('Save to excel file', 'File name', S) then
  begin
    s := fGetAppPath() + 'report\excel\' + S + '.xls';
    XLS.Filename := s;
    XLS.Write;
  end;
end;

procedure TForm1.act158Save2xlsExecute(Sender: TObject);
begin
    Save2ExcelFile();
end;

procedure TForm1.ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_1);
begin

end;

procedure TForm1.ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_2);
begin

end;

procedure TForm1.ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdOperaParam);
begin

end;

procedure TForm1.ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_0);
begin

end;

procedure TForm1.ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_3);
begin

end;

procedure TForm1.ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_6);
begin

end;

procedure TForm1.ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_7);
begin

end;

procedure TForm1.ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_4);
begin

end;

procedure TForm1.ExportReadings(AKind: TKindofAddr;ATestCmd: TCmdLevel_5);
begin

end;

procedure TForm1.actGetSequOfPosExecute(Sender: TObject);
var
  ErrUtil: TUtilErrCalSetting  ;
  i: integer;
//  procedure RefreshStringGrd();
//  begin
//     with rzStrgrdErrSettings do
//     begin
//       RowCount := FixedRows + 1;
//       ColCount := FixedCols + 1;
//       ColWidths[FixedCols]:= 6* ColWidths[0];
//       Rows[0].CommaText := 'SN, Error_Calculator_output'
//     end;
//  end;
  procedure DoSetErrorMode();
  begin
    stoptest := false;
    IsWorking := True;
    try
      ErrTest(RzSpinEdit1.IntValue, 1, 0, 1, 1.0e9);
    finally
      IsWorking := false;
    end;
  end;
  function ReadError(APos : Integer) : boolean;
  var
    ArrayData: array[1..6] of WideString;
    s: WideString;
    i: integer;
  begin
    s := geny_api.ErrCounterReadDataAll(RzSpinEdit1.IntValue, geny_comm_setting, APos, ArrayData[1], ArrayData[2], ArrayData[3], ArrayData[4], ArrayData[5], ArrayData[6], 4, 1);
    Result := SameText(reply_geny, s);
    if Result then
    begin
      ErrUtil.Sequence := IntToStr(Apos);
      for i := 1 to 6 do
        ErrUtil.Setting := ArrayData[i]  //'1,p0  f1   ',
    end
    else
      RzMemo1.Lines.add(format('fail to read @%d for: %s', [APos, s]));
  end;
begin
  //get comma list of err. calculators addr. like 1,7,13...
//  RefreshStringGrd();

  //send error calculator mode
  DoSetErrorMode();

  ErrUtil:= TUtilErrCalSetting.Create;
  stoptest := false;
  IsWorking := True;
  try
    for i := 1 to 48 do
      if not ErrUtil.CheckPosition(i) then
        if not ReadError(i) then
          break ;
    rzdtCommaOfSequ.Text  := ErrUtil.Sequence;
  finally
     ErrUtil.Free ;
     IsWorking := false;
  end
end;

procedure TForm1.actSetErr2Execute(Sender: TObject);
begin
  stoptest := false;
  IsWorking := True;
  try
    WITH RzNmEdt6 DO
      ErrTestHighFreqInput(RzSpinEdit1.IntValue, IntValue, rzedtAccessNbr.IntValue, 1, GetStdNbr(IntValue));
  finally
    IsWorking := false;
  end;
end;

procedure TForm1.Handle158ReadingCheckTu(Sender: TObject; ACmd: TCmdOperaParam);
var
  Vr : Double ;
begin
  with TCmdOperaParam(ACmd), RzMemo1 do
  begin
    if Setting_U >= 73 then
      Vr := (U_out_U  - (RzNumericEdit1.Value  / 10)) / RzNmEdtCoeff.Value
    else
      Vr := (U_out_U  - Setting_U * coTuCheckCoff1) / RzNmEdtCoeff.Value ;
    Lines.Add(Format('Device ID = %d ,Tu = %8.4f, Vs = %8.3f, Vr = %8.4f', [ DeviceID  ,U_out_U, RzNumericEdit1.Value,  Vr])) ;
    if Vr > 4 then
      MyKindofOverloadAlarm := kofEmergencyAlarm  //  ShowMessage(format('Vr (%8.4f) > 4', [Vr]) + ', overload alarm & power source down immediately!')
    else if Vr > 3 then
      MyKindofOverloadAlarm := kofNotifyAlarm  //ShowMessage(format('Vr (%8.4f) > 3', [Vr]) + ', overload alarm!')
    else
      MyKindofOverloadAlarm := kofNoAlarm;  //ShowMessage(format('Vr = %8.4f', [Vr]) + ', it''s normal');
  end;
end;

procedure TForm1.act158CheckTuExecute(Sender: TObject);
//const
//  PhaseNames : array[TKindofAddr] of string = ('Phase A','Phase B','Phase C');
var
  i: Integer ;
   procedure doRead158Param(i: TKindofAddr);
   var
     Readings : TRoutine158Readings;
   begin
      // read  one
      Readings := TRoutine158Readings.Creat(GetTestBenchCommPort());
      with Readings do
      begin
        NotifyExportReadings := Handle158ReadingCheckTu;
      end;

      try
         Readings.Read158Para(i, kofWorkPara);
      finally
         Readings.Free;
      end;
   end;
begin
  //open box to power source channel
  stoptest := false;
  IsWorking := True;
  RzMemo1.Lines.add('open channel of power source');
  try
    openbox(2);
    //check Tu to protect the system
    for i:= 0 to 2 do
    if (not stoptest) and RzCheckGroup1.Checks[i].Checked then
    begin
      MyKindofOverloadAlarm := kofInitAlarm ;
      doRead158Param(KindofAddrs[i]);
      case MyKindofOverloadAlarm of
          kofNoAlarm :ShowMessage('Vr < 3, it''s normal');
          kofNotifyAlarm :ShowMessage('Vr in [3,4], notify of overload alarm!');
          kofEmergencyAlarm :
          begin
            actResetOutputExecute(nil);
             ShowMessage('Vr > 4, overload alarm seriously');
             break;
          end;
      end;
    end;
  finally
       IsWorking := false;
    end;
end;

procedure TForm1.Handle158ReadingCheckRuntimeParameters(Sender: TObject; ACmd: TCmdOperaParam);
var
  dblTmp : Double ;
  dblTmp2 : Double ;
begin
  //check runtime parameters of power source
  with TCmdOperaParam(ACmd), RzMemo1 do
  begin
    //check Reset state, power source output is 0 复位状态，功率源输出为0
    if Setting_I  + Setting_U  +  I_Level + U_level < 0.001  then
       Lines.Add(format('Device id: %d of Source Reset has been completed', [DeviceID]))
    else
       Lines.Add(Format('Device id: %d of Source is output with runtime parameters, setting of current %6.4f A, ' +
       'setting of voltage %6.2f V, ' +
       'current level %6.4f A, ' +
       'voltage level %6.2f V', [ DeviceID  ,Setting_I ,  Setting_U , I_Level , U_level] ));

    //电流输出
    if ((I_out_U + Setting_I + I_Level) > 0) and (I_diff < coI_diff) and not (I_protect or I_open_protect ) then
       Lines.Add(format('Device id: %d of Current Output is normal', [DeviceID]))
    else
       Lines.Add(Format('Device id: %d of Current Output abnormal with runtime parameters, setting of current: %6.4f A, ' +
       'current level: %6.4f A, ' +
       'power amplifier output: %6.2f V, ' +
       'current feedback differentiate(0-210): %6.2f mV, ' +
       'current overload protection: %s, ' +
       'current feedback differentiate protection: %s' , [ DeviceID  ,Setting_I , I_Level , I_out_U , I_diff, ProtectValues[I_protect], ProtectValues[I_open_protect] ] ));

    // 电压输出
    if (Setting_U >= 0) and not U_protect then
      Lines.Add(format('Device id: %d of Voltage Output is normal', [DeviceID]))
    else
       Lines.Add(Format('Device id: %d of Voltage Output abnormal with runtime parameters, setting of voltage: %6.2f V, ' +
       'voltage level: %6.2f V, ' +
       'power amplifier output: %6.2f V, ' +
       'voltage overload protection: %s' , [DeviceID  ,Setting_U , U_Level , U_out_U , ProtectValues[U_protect]] ));

    //电流开路
    if I_protect and Gain_Buzzer then
       Lines.Add(format('Device id: %d of Current Circuit Loop is open', [DeviceID]));
//    else
//       Lines.Add(Format('Device id: %d of Current Circuit Loop is close with runtime parameters, Current overload protection: %s, ' +
//       'Gain buzzer control: %s, ' +
//       'Mute switch of current: %s' , [DeviceID  , ProtectValues[I_protect] ,BuzzerStrs[Gain_Buzzer]  , MuteStrs[Mute_I] ] ));

    //电流突然开路
    if Gain_Buzzer and I_open_protect then
       Lines.Add(format('Device id: %d of Current burst open!', [DeviceID]));

    //电压开路
    if U_protect and Mute_U and Gain_Buzzer then
      Lines.Add(format('Device id: %d of Voltage Circuit Loop is open', [DeviceID])) ;

    //电流过载
    if (not Mute_I) and (Setting_I > 0) and ( I_diff > 100.0) then   //390 / 400
       Lines.Add(format('Device id: %d is on Current Overload!', [DeviceID])) ;

    //电压表架短路过载0.2V
//    if (Setting_U < 1.1) and (U_out_U > 1) then
//       Lines.Add(format('Device id: %d has voltage-short-circuit overload 0.2V at meter rack', [DeviceID]));

    //电压过载

      if (not Mute_U) and (Setting_U > 0) and (U_out_U < Setting_U / 15) then
        Lines.Add(format('Device id: %d is on Voltage Overload!', [DeviceID])) ;


    //电流电压过载, 当电流电压都升上去，无法判断具体过载
//    if (Setting_U > 0) and (U_out_U < 3.0) and (Setting_I > 0) and (I_diff > 400.0) then
//       Lines.Add(format('Device id: %d has overload with runtime with runtime parameters, ' +
//       'setting of voltage: %6.2f V, ' +
//       'power amplifier output: %6.2f V, ' +
//       'setting of current: %6.4f A, ' +
//       'current feedback differentiate(0-210): %6.2f mV, ', [DeviceID, Setting_U, U_out_U,Setting_I, I_diff ]));

    //主板大电流设置异常
    if (Setting_I > 0 ) and (I_Level < 0.1) then
      Lines.Add(format('Device id: %d has Abnormal setting of large current on the 158 feedback board', [DeviceID])) ;

    //主板功放值Tu设置(空载）, 多种条件
    if not (Mute_U or Mute_I or U_protect) then
    begin
      if (Setting_U > coSettingVoltage) and (Setting_U / 10 >= U_out_U + 0.5) then    //电压功放设置值偏低   > 73V
        Lines.Add(format('Device id: %d has a setting issue that voltage amplifier setting value is too low in the 158 feedback board when voltage given greater than 73V', [DeviceID])) ;

      if  (Setting_U > 0) and (Setting_U < coSettingVoltage) and (Setting_U * coTuCheckCoff1 <= U_out_U + 0.5) then    //电压功放设置值偏低  , < 73V
        Lines.Add(format('Device id: %d has a setting issue that voltage amplifier setting value is too low in the 158 feedback board when voltage given less than 73V', [DeviceID])) ;


      if  (Setting_U > coSettingVoltage) and (Setting_U / 10 >= U_out_U - 0.5) then    //电压功放设置值偏高 >73V
        Lines.Add(format('Device id: %d has a setting issue that voltage amplifier setting value is too high in the 158 feedback board when voltage given greater than 73V', [DeviceID])) ;

      if  (Setting_U > 0) and (Setting_U < coSettingVoltage) and (Setting_U * coTuCheckCoff1  <= U_out_U - 0.5) then    //电压功放设置值偏高  <73V
        Lines.Add(format('Device id: %d has a setting issue that voltage amplifier setting value is too high in the 158 feedback board when voltage given less than 73V', [DeviceID])) ;
    end;

    //电流匹配
    if (not Heavy_load) and (I_out_U < 15.0) and (Setting_I > 0) then
      Lines.Add(format('Device id: %d is under Abnormal Current-matching of heavy load on the 158 feedback board with following parameters, ' +
      'current-matching: %s, ' +
      'power amplifier output: %6.2f V, ' +
      'setting of current: %6.4f', [DeviceID, MatchingValues[Heavy_load], I_out_U, Setting_I ])) ;

    //电压负载 , refer to Tu check action

    //电流负载
    if (not Heavy_load) and (I_out_U > 32.0) then
      Lines.Add(format('Device id: %d has Excessive current load with following parameters, ' +
      'current-matching: %s, ' +
      'power amplifier output: %6.2f V, ' +
      'strongly recommmend to turn off the power source immediately!', [DeviceID, MatchingValues[Heavy_load], I_out_U ])) ;

    //电压金属电阻压降
    if Setting_U >= coSettingVoltage then
      Lines.Add(format('Device id: %d measured the metal resistance voltage drop was %6.4f V on voltage given %6.2f,',
        [DeviceID, (U_out_U - Setting_U / 10)/RzNmEdtCoeff.Value, Setting_U ]))
    else
      Lines.Add(format('Device id: %d measured the metal resistance voltage drop was %6.4f V,',
        [DeviceID, (U_out_U - Setting_U  * coTuCheckCoff1)/RzNmEdtCoeff.Value, Setting_U ]));

    //电流自激
    if (I_Level > 0) and (Heavy_load) and (60.0 * Setting_I / I_Level > I_diff * 1.2 ) then
       Lines.Add(format('Device id: %d has issue Current self-excited with following parameters, ' +
      'current-matching: %s, ' +
      'setting current: %6.4f A, ' +
      'current feedback differentiate(0-210): %6.2f mV, ' +
      'level of current: %6.4f A', [DeviceID, MatchingValues[Heavy_load], Setting_I ,I_diff , I_Level  ])) ;

    if (I_Level > 0) and (not Heavy_load) and (30.0 * Setting_I / I_Level > I_diff * 1.2 ) then
       Lines.Add(format('Device id: %d has issue Current self-excited with following parameters, ' +
      'current-matching: %s, ' +
      'setting current: %6.4f A, ' +
      'current feedback differentiate(0-210): %6.2f mV, ' +
      'level of current: %6.4f A', [DeviceID, MatchingValues[Heavy_load], Setting_I ,I_diff , I_Level  ])) ;

    //电压自激
    if (Setting_U > 0) and (Setting_U / U_out_U < 8.0) then
       Lines.Add(format('Device id: %d has issue Voltage self-excited with following parameters, ' +
      'power amplifier output: %6.2f V, ' +
      'setting voltage: %6.2f V', [DeviceID, U_out_U , Setting_U ])) ;

    //电流匹配继电器不动作
    if (not Gain_Buzzer) and (I_Level > 0) and (not Heavy_load) and (30.0 * (Setting_I / I_Level) < I_diff * 1.2 ) then
       Lines.Add(format('Device id: %d has found an issue that Current matching relay does not operate with following parameters, ' +
      'current-matching: %s, ' +
      'setting current: %6.4f A, ' +
      'current feedback differentiate(0-210): %6.2f mV, ' +
      'level of current: %6.4f A', [DeviceID, MatchingValues[Heavy_load], Setting_I , I_diff, I_Level ])) ;

    if U_protect  or I_protect  then Exit;

    // Load capacity display
    if Setting_U >= coSettingVoltage then
      dblTmp := (U_out_U - Setting_U / 10)/RzNmEdtCoeff.Value /5
    else
      dblTmp := (U_out_U - Setting_U  * coTuCheckCoff1)/RzNmEdtCoeff.Value / 5;

     if Heavy_load then
        dblTmp2 := I_out_U /34 /2
     else
        dblTmp2 := I_out_U /34;

    with rzStrgrdLoadCap do
      case DeviceID of
        220:
          begin
             Cells[FixedCols , FixedRows] := Format('%6.2f %s', [dblTmp * 100, '%']);
             Cells[FixedCols + 1 , FixedRows] := Format('%6.2f %s', [dblTmp2 * 100, '%']);
          end;
        221:
          begin
             Cells[FixedCols , FixedRows+1] := Format('%6.2f %s', [dblTmp * 100, '%']);
             Cells[FixedCols + 1 , FixedRows+1] := Format('%6.2f %s', [dblTmp2 * 100, '%']);
          end;
        222:
          begin
             Cells[FixedCols , FixedRows+2] := Format('%6.2f %s', [dblTmp * 100, '%']);
             Cells[FixedCols + 2 , FixedRows+2] := Format('%6.2f %s', [dblTmp2 * 100, '%']);
          end;
      else ;
      end;

  end;
end;

procedure TForm1.act158RuntimeCheckExecute(Sender: TObject);
var
  i: Integer ;
   procedure doRead158Param(i: TKindofAddr);
   var
     Readings : TRoutine158Readings;
   begin
      // read  one
      Readings := TRoutine158Readings.Creat(GetTestBenchCommPort());
      with Readings do
      begin
        NotifyExportReadings := Handle158ReadingCheckRuntimeParameters;
      end;

      try
         Readings.Read158Para(i, kofWorkPara);
      finally
         Readings.Free;
      end;
   end;
begin
  //open box to power source channel
  IsWorking := True;
  stoptest := false;
  RzMemo1.Lines.add('open channel of power source');
  try
    openbox(2);
    //check runtime parameters
    for i := 0 to 2 do
      if (not stoptest) and RzCheckGroup1.Checks[i].Checked then
        doRead158Param( KindofAddrs[i]);
  finally
       IsWorking := false;
    end;
end;


procedure TForm1.actTimingErrorTestExecute(Sender: TObject);
begin
  //set accuracy test mode of clock pulsing

  stoptest := false;
  IsWorking := True;
  try
    ErrTest(RzSpinEdit1.IntValue, 1 , RzNmEdt1.IntValue  , RzNmEdtClockFre.Value );
  finally
    IsWorking := false;
  end;

end;

procedure TForm1.actRelayTestPowerUpExecute(Sender: TObject);
begin
  //power up
  stoptest := false;
  IsWorking := True;
  try
      Output_Current(220, RzNmEdtWorkCurr.Value);
  finally
    IsWorking := false;
  end ;
end;

procedure TForm1.actRelayTestPowerDownExecute(Sender: TObject);
begin
  //power up
  stoptest := false;
  IsWorking := True;
  try
      Output_Current(220, 0.0);
  finally
    IsWorking := false;
  end ;
end;

procedure TForm1.rzcmbxFuncClick(Sender: TObject);
begin
  with TComboBox(Sender) do
    SetupDispErrorG(ItemIndex  ,rzgrdErrDsp_G);
end;

procedure TForm1.actRelayTestGateReadingsUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := not IsWorkingOnErrCalc;
end;

procedure TForm1.RunLoadSwitchErrorG(strIP, LanPort, APosLst: string; AKindOf: TKingOfErrCalcFunc);
var
  clsError1: clsError;
  S: string;
  RSendData, RData: WideString;
  bRet: WordBool;
begin
  MyKindOfErrCalcFunc := AKindOf ;
  clsError1 := CoclsError.create;
  with clsError1 do
  begin
    IP := strIp;
    Port := LanPort;
    PlaceNo := '1';
    ErrorCountNo := '1';
    bRet := True; // action of send
    bRet := Read(RData, RSendData, bRet);
    if bRet then
      RzMemo1.lines.add(format('%s sent: %s', [timetostr(now), RSendData]));

    TaitiParamOutput(RSendData, AKindOf);
  end;
end;

procedure TForm1.RunLoadSwitchErrorG(strIP, LanPort, APosLst: string; FuncNo: Integer; AKindOf: TKingOfErrCalcFunc);
var
  clsError1: clsError;
  S: string;
  RSendData, RData: WideString;
  bRet: WordBool;
  i : integer;
  procedure SetupNormalError();
  begin
    with clsError1, rzgrdErrDsp_G do
    begin
      ErrorCountNo := '1';
      WorkModel := IntToStr(FuncNo);
      DisplyModel := '1';
      StdMeterConstant := Cells[FixedCols, FixedRows] ;
      AccessNo := Cells[FixedCols + 1, FixedRows];
      constant := Cells[FixedCols + 2, FixedRows];
      TestTime := Cells[FixedCols + 3, FixedRows];
    end;
  end;
  procedure SetupClockError();
  begin
    with clsError1, rzgrdErrDsp_G do
    begin
      WorkModel := IntToStr(FuncNo);
      DisplyModel := '2';
      AccessNo := Cells[FixedCols , FixedRows];
      constant := Cells[FixedCols + 1, FixedRows];
      TestTime := Cells[FixedCols + 2, FixedRows];
      UpLimit :=  Cells[FixedCols + 3, FixedRows];
      DownLimit := Cells[FixedCols + 4, FixedRows];
    end;
  end;
  procedure SetupCreepTest();
  begin
    with clsError1, rzgrdErrDsp_G do
    begin
      WorkModel := IntToStr(FuncNo);
      DisplyModel := '1';
      AccessNo := Cells[FixedCols , FixedRows];
      constant := Cells[FixedCols + 2, FixedRows];
      TestTime := Cells[FixedCols + 1, FixedRows];
    end;
  end;

  procedure SetupColorMark();
  begin
    with clsError1, rzgrdErrDsp_G do
    begin
      WorkModel := IntToStr(FuncNo);
      DisplyModel := '1';
      AccessNo := Cells[FixedCols , FixedRows];
      TestTime := Cells[FixedCols + 1, FixedRows];
    end;
  end;

  procedure SetupDoubleLoop();
  begin
    with clsError1, rzgrdErrDsp_G do
    begin
      DoubleLoop := Cells[FixedCols , FixedRows];
    end;
  end;

begin
  MyKindOfErrCalcFunc := AKindOf ;
  clsError1 := CoclsError.create;
  with clsError1 do
  begin
    IP := strIp;
    Port := LanPort;
    ErrorCountNo := '1';
    case AKindOf of
      kofNormalError : SetupNormalError();
      kofClockError , kofDemandCycle : SetupClockError() ;
      kofStartingTest , kofCreepTest, kofDailTest : SetupCreepTest();
      kofColorMark : SetupColorMark() ;
      kofDoubleLoop : SetupDoubleLoop();
    end;
    for i := 0 to 3 do
    begin
      if not SameText( GetItem(APosLst , ',', i) , '') then
      begin
        PlaceNo := IntToStr(i+1);
        bRet := True; // action of send
        bRet := Out(RData, RSendData, bRet);
        if bRet then
          RzMemo1.lines.add(format('%s sent: %s', [timetostr(now), RSendData]));
        TaitiParamOutput(RSendData, AKindOf);
      end ;
    end
  end;
end;

procedure TForm1.actGetErrorGExecute(Sender: TObject);
begin
  IsWorkingOnErrCalc := true;
  try
    ClearStrgrdCells(rzStrgrdErrCalcReadings);
    with rzcmbxErrCalc do
      RunLoadSwitchErrorG(getitem(Text, ';', 0), getitem(Text, ';', 1), getitem(Text, ';', 2), kofGetError);
  finally
    IsWorkingOnErrCalc := false;
  end;
end;

procedure TForm1.actSetupErrorGExecute(Sender: TObject);
begin
  IsWorkingOnErrCalc := true;
  try
    ClearStrgrdCells(rzStrgrdErrCalcReadings);
    with rzcmbxErrCalc do
      case rzcmbxFunc.ItemIndex of
        0: RunLoadSwitchErrorG(getitem(Text, ';', 0), getitem(Text, ';', 1), getitem(Text, ';', 2), 0, kofNormalError);
        1: RunLoadSwitchErrorG(getitem(Text, ';', 0), getitem(Text, ';', 1), getitem(Text, ';', 2), 1, kofClockError);
        2: RunLoadSwitchErrorG(getitem(Text, ';', 0), getitem(Text, ';', 1), getitem(Text, ';', 2), 2, kofDemandCycle);
        3: RunLoadSwitchErrorG(getitem(Text, ';', 0), getitem(Text, ';', 1), getitem(Text, ';', 2), 3, kofStartingTest);
        4: RunLoadSwitchErrorG(getitem(Text, ';', 0), getitem(Text, ';', 1), getitem(Text, ';', 2), 4, kofCreepTest);
        5: RunLoadSwitchErrorG(getitem(Text, ';', 0), getitem(Text, ';', 1), getitem(Text, ';', 2), 5, kofDailTest );
        6: RunLoadSwitchErrorG(getitem(Text, ';', 0), getitem(Text, ';', 1), getitem(Text, ';', 2), 6, kofColorMark);
        7: RunLoadSwitchErrorG(getitem(Text, ';', 0), getitem(Text, ';', 1), getitem(Text, ';', 2), 7, kofDoubleLoop);
      end;

  finally
    IsWorkingOnErrCalc := false;
  end;
end;

procedure TForm1.actSourceOutputExecute(Sender: TObject);
var
  i : Integer ;
begin
  stoptest := false;
  IsWorking := True;
  try
    if MessageDlg('warning: the PSU will be ready to output', mtWarning, [mbNo, mbYes], 0) = mrNo then
      Abort; //exit;

    if MultiplePortEnable then
      begin
        MultiplePortRoutine(kofSourceOutput) ;
        ShowMessage('Power sources are output, please check later');
        WaitForWorkThreadFinish();
      end
    else
      for i := 0 to 2 do
        if RzCheckGroup1.ItemChecked[i] then
        begin
          sleep(100);
          Output(RzSpinEdit1.IntValue, 220 + i, RzNumericEdit1.Value * RzSpinEdit3.Value / 100.0,
            RzNumericEdit2.Value * RzSpinEdit4.Value / 100.0,
            rzedtPhaAngle.Value,
            RzNumericEdit7.Value);
        end;

  finally
     IsWorking := false;
  end;
end;

function TForm1.ReadDailTest(portId, APos: Integer; var Value: string): Boolean  ;
var
   s, cdata : WideString;
begin
   s := geny_api.ErrCounterQQReadData(portId, geny_comm_setting, APos, cdata);
   Result := SameText(reply_geny, s);
   if Result then
      value:= cdata
   else
     RzMemo1.Lines.add(format('The reading of pluses failed to read @pos# %d with returns:%s', [APos , s]));
end;

function TForm1.ReadDailTest(portId, APos: Integer) : Boolean ;
var
  s, cdata : WideString;
  ArrayData: array[1..6] of WideString;
  i, index: Integer;
  function ParseStr(Str : string; index : Integer ) : string;
  begin
      Result := Trim( GetItem(Str,',', index));
  end;
begin
  //ws := geny_api.ErrCounterQQReadData(portId, geny_comm_setting, APos, cdata);
  s := geny_api.ErrCounterReadDataAll(portId, geny_comm_setting, APos, ArrayData[1], ArrayData[2], ArrayData[3], ArrayData[4], ArrayData[5], ArrayData[6], 4, 1);
  Result := SameText(reply_geny, s);
  if Result then
    with rzStrgrdErrsDailTest,RzMemo1 do
    begin
      for i := 1 to 6 do
      begin
         Lines.add(format('reading: %s', [ArrayData[i]])) ;
         index :=  Cols[1].IndexOf(ParseStr(ArrayData[i], 0)) ;
         if (index > -1) and (SameText(Cells[2, index], 'yes')) then
            Cells[3, index] := ParseStr(ArrayData[i], 1) ;
      end;
    end
  else
    RzMemo1.Lines.add(format('The reading of pluses failed to read @pos# %d with returns:%s', [APos , s]));

end;

procedure TForm1.StopErrorCalculator(portId: Integer);
var
  ws : WideString;
begin
  ws := geny_api.ErrCounterSleep(portId, geny_comm_setting, 199);
  RzMemo1.Lines.add(format('Error calculator stop -> %s', [ws]));
end;

function TForm1.ReadDailTest(portId: Integer; var Value: string) : Boolean ;
var
  ws, cdata : WideString;
begin
  ws := geny_api.ErrCounterImpulseReadData(portId, geny_comm_setting, 1, cdata);
  Result := SameText(reply_geny, ws);
  if Result then
    value:= cdata
  else
    RzMemo1.Lines.add(format('Dail test fail->%s', [ws]));
end;

procedure TForm1.SetupDailTest(portId, ImpValue, AccessNbr, Mode: integer);
var
  ws : WideString;
begin
  ws := geny_api.ErrCounterZouZi(portId, geny_comm_setting, 199, ImpValue, AccessNbr , Mode);
  if SameText(reply_geny, ws) then
    RzMemo1.Lines.add(format('Dail test starts->%s', [ws]))
  else
    RzMemo1.Lines.add(format('Dail test fail->%s', [ws]));
end;

procedure TForm1.actSetDailTestExecute(Sender: TObject);
var
  AWaitObj: TWaitTime;
begin
  stoptest := false;
  IsWorking := True;

  AWaitObj := TWaitTime.Create;
  with AWaitObj do
  begin
    OnStopWaitTime := DailTestOnStopWaitTimeEvent;
    OnTimeOutEvent := DailTestOnTimeOut;
  end;

  try
    //ErrTest(RzSpinEdit1.IntValue, rzedtCircleNbr.IntValue, rzedtAccessNbr.IntValue, 1, GetStdNbr());
    // close the relay of current loop
    if rzchkbRelay.Checked then
      RelayCommRoutine(rzcmbxCommand.Values[1]);
      
    //start dail test
    DailTest_T := Now();
    SetupDailTest(RzSpinEdit1.IntValue, 10000, rzedtAccessNbr.IntValue, 1 );
    AWaitObj.WaitSeconds(RzNmEdtDtTime.IntValue);
  finally
    AWaitObj.free;
    IsWorking := false;
  end;
end;

procedure TForm1.actSetStartingTestExecute(Sender: TObject);
  function getTestLong() : LongWord ;
  begin
     Result := 10 + Trunc(3600000 / rzedtCx.Value / (RzNumericEdit1.Value * RzSpinEdit3.Value /100.0)
          / (RzNumericEdit2.Value * RzSpinEdit4.Value /100.0) / getCoeff() );
  end;

  procedure doStartingTest();
  begin
    SetupDisplayCreepTest(6);
    with rzchkbIStd do
      if Checked then
        DailTestRoutineForIS(kofStartTestIS, getTestLong())
        //SetupDailTest(RzSpinEdit1.IntValue, 10000, rzedtAccessNbr.IntValue, 1 )
      else
        StartingTest(GetTestBenchCommPort(), edtSamples.IntValue, rzedtAccessNbr.IntValue, 0, edtDuration.IntValue);
  end;
begin
  stoptest := false;
  IsWorking := True;

  try
    if MessageDlg('Ready for starting test?', mtConfirmation, [mbYes, mbno], 0) = mrYes then
      doStartingTest();
  finally
      IsWorking := False;
  end;
end;

procedure TForm1.actResetWaveExecute(Sender: TObject);
var
  i: Integer;
begin
  //Reset wave...
  stoptest := false;
  IsWorking := True;
  try
    if MessageDlg('clear harmonics', mtWarning, [mbNo, mbYes], 0) = mrNo then
      exit;

    if MultiplePortEnable then
      begin
        MultiplePortRoutine(kofActResetHarmonic) ;
        ShowMessage('Power sources are under harmonic reset, please wait all finished');
        WaitForWorkThreadFinish();
      end
    else
    for i := 0 to 2 do
      if RzCheckGroup1.ItemChecked[i] then
      begin
        sleep(100);
        ResetWave(220 + i);
      end;
  finally
     IsWorking := false;
  end;
end;

procedure TForm1.actWaveOutputExecute(Sender: TObject);
var
  i: Integer;
  Kind: TKindOfHarmonic;
begin
  case rzcmbxHarmoicMode.ItemIndex  of
   0: Kind := kofGeneral ;
   1:  Kind := kofSubharmonics ;
   2:   Kind := kofOddHarmonics ;
   3:    Kind := kofEvenHarmonices ;
   end ;
  //output wave...
  stoptest := false;
  IsWorking := True;
  try
    if MessageDlg('Does harmonics output?', mtWarning, [mbNo, mbYes], 0) = mrNo then
      exit;

    if MultiplePortEnable then
      begin
        MultiplePortRoutine(kofActSetupHarmonic) ;
        ShowMessage('Power sources are under harmonic setup, please wait all finished');
        WaitForWorkThreadFinish();
      end
    else
    for i := 0 to 2 do
      if RzCheckGroup1.ItemChecked[i] then
      begin
        sleep(100);
        if rzrdgrp4.Buttons[0].Checked then
           VoltageWaveOut(220 + i, rzspndtAmplitude.Value, RzNmEdtHarmonice.Value, rzspndtTimes.IntValue , Kind )
        else
           CurrentWaveOut(220 + i, rzspndtAmplitude.Value, RzNmEdtHarmonice.Value, rzspndtTimes.IntValue , Kind );
      end;
  finally
     IsWorking := false;
  end;
end;


procedure TForm1.SetupDisplayPrecOutput();
const
  FixedRowStr = 'Phase, U(V), I(A)';
  FixedColStr = 'Phase, A, B, C';
var
    i : Integer;
begin
   with rzStrgrdPrecOutput do
   begin
      ColCount := 3;
      RowCount := 4;
      Rows[0].CommaText := FixedRowStr ;
      Cols[0].CommaText := FixedColStr ;
      ColWidths[0] := 40;
      for i := FixedRows to RowCount - 1 do
          Rows[i].CommaText := Char(65+ i - FixedRows) +',,' ;
   end;
end;

procedure TForm1.SetupDisplayVATest();
const
  FixedRowStr = 'pos., time,  U_P, U_VA, U_U, U_I, U_Fre, '  +
    'I_P, I_VA, I_U, I_I, I_Fre, U_Max_P, U_Max_VA, U_Mean_P, U_Mean_VA, ' +
    'I_MaxP, I_MaxVA, I_Mean_P, I_Mean_VA';
var
  i: integer;
begin
  with rzStrgrdPConsum do
  begin
      ColCount := 20;
      RowCount := 6;
      Rows[0].CommaText := FixedRowStr;

      for i := FixedRows to RowCount - 1 do
      begin
        Cells[0, i] := IntToStr(i);
      end;
  end;
end;

procedure TForm1.SetupDisplayCreepTest(APosNbr: Integer);
const
  FixedRowStr = 'no., pos, check, pulses, t1(s), e1(kwh), t2, e2, d_t, d_e, result';
var
  i: integer;
begin
  with rzStrgrdCreepTest do
  begin
      ColCount := 11;
      RowCount := FixedRows + APosNbr;
      Rows[0].CommaText := FixedRowStr;

      for i := FixedRows to RowCount - 1 do
      begin
        Rows[i].CommaText := ',,yes,,,,,,,';
        Cells[0, i] := '#' + IntToStr(i);
      end;
  end;
end;

procedure TForm1.SetupDisplayErrDialTest();
const
  FixedRowStr = 'no., pos, check, reading, err(%)';
var
  i: integer;
begin
  with rzStrgrdErrsDailTest do
  begin
      ColCount := 5;
      RowCount := 49;
      Rows[0].CommaText := FixedRowStr;

      for i := FixedRows to RowCount - 1 do
      begin
        Cells[0, i] := IntToStr(i);
        Cells[1, i] := IntToStr(i);
        Cells[2, i] := 'no';
      end;
  end;
end;

procedure TForm1.HandleOnMultiPortNotifyAction(Sender: TObject);
begin
  dec(WorkThreadCount );
   with RzMemo1, TMultiTestSys(Sender) do
    Lines.Add(Format('%s COM port(%d) finished %s', [TimeToStr(now()), PortNo, LoadResString(MultiActionNames[KindOfAction])]));

end;

procedure TForm1.HandleMultiPortNotifyAction(Sender: TObject; APort :Integer ; AKind: TKindOfMultiActions; AMsg: string; var AStopTest: Boolean) ;
begin
   with RzMemo1 do
    Lines.Add(Format('%s COM port(%d) return %s under thread working on %s', [TimeToStr(now()), APort, AMsg, LoadResString(MultiActionNames[AKind])])) ;

   AStopTest := stoptest ;

//   case AKind of
//     kofCommTest: openbox(APort, 1);
//   end ;
end;

function TForm1.GetCLevel(): string;
  procedure ChangeClever(AValue: Double);
  begin
    if AValue <= 0.8 then
      Result := '0.8'
    else
      Result := '160'
  end;
begin
  with RzRadioGroup5 do
    if Buttons[0].Checked or Buttons[2].Checked then
      Result := RzNumericEdit2.Text           // for -K3D / K6D
    else if Buttons[1].Checked then
      Result := FloatToStr( RzNumericEdit2.Value  / 2)  //K3F
    else if Buttons[3].Checked then
      ChangeClever(RzNumericEdit2.Value);
end;

function TForm1.GetHarmonicMode(): TKindOfHarmonic;
begin
  case rzcmbxHarmoicMode.ItemIndex  of
   0: result := kofGeneral ;
   1: result := kofSubharmonics ;
   2: result := kofOddHarmonics ;
   3: result := kofEvenHarmonices ;
   end ;
end;

procedure TForm1.MultiplePortRoutine(AKind : TKindOfMultiActions);
const
  MyPhaseNames: array[0..2] of TPhaseName = (ptPhaseA, ptPhaseB , ptPhaseC );
var
  i, port, chn : Integer;
  value: double;
  procedure RunMultiplePort();
  var
    i: integer;
    MySet : TPhaseSet ;
    PortThread : TMultiTestSys;
  begin
    case AKind of
      kofCommTest : PortThread := TThreadCommTest.Create(port, 1);
      kofClearPower :
        begin
          PortThread := TThreadClearPower.Create(port, GetPhaseSet);
        end;
      kofOutput_Voltage :
        begin
           if not rzchkbPercentOutput.Checked then
              value := RzNumericEdit1.Value * RzSpinEdit3.Value / 100.0
           else
              value := RzSpinEdit3.Value;
           PortThread := TThreadOutputVoltage.Create(port, GetPhaseSet, value);
           with TThreadOutputVoltage(PortThread) do
              Percentagewise := rzchkbPercentOutput.Checked;
        end;
      kofactReset_Voltage:
         begin
           PortThread := TThreadOutputVoltage.Create(port, GetPhaseSet, 0.0);
         end;
      kofactOutput_Current:
        begin
           if not rzchkbPercentOutput.Checked then
              value := RzNumericEdit2.Value * RzSpinEdit4.Value / 100.0
           else
              value := RzSpinEdit4.Value;
           PortThread := TThreadOutputCurrent.Create(port, GetPhaseSet, value);
           with TThreadOutputVoltage(PortThread) do
              Percentagewise := rzchkbPercentOutput.Checked;
        end;
      kofactReset_Current :
        begin
           PortThread := TThreadOutputCurrent.Create(port, GetPhaseSet, 0.0);
        end;
      kofOutput_Cos :
        begin
           PortThread := TThreadOutputCOS.Create(port, GetPhaseSet, rzedtPhaAngle.Value);
        end;
      kofSourceOutput :
        begin
           PortThread := TThreadSourceOutput.Create(port, GetPhaseSet, RzNumericEdit1.Value * RzSpinEdit3.Value / 100.0,
            RzNumericEdit2.Value * RzSpinEdit4.Value / 100.0,
            rzedtPhaAngle.Value,
            RzNumericEdit7.Value);
        end;
      kofFreqSet:
        begin
           PortThread := TThreadOutputFreq.Create(port, GetPhaseSet, RzNumericEdit7.Value);
        end;
      kofOutputUPhase :
        begin
           PortThread := TThreadOutputUPhase.Create(port, rzedtUPhase1.Value, rzedtUPhase2.Value);
        end ;
      kofOutputConnectMode :
        begin
            with RzComboBox1, RzRadioGroup1 do
            begin
              PortThread := TThreadOutputConnectMode.Create(port, GetPhaseSet, Values[ItemIndex]);
              TThreadOutputConnectMode(PortThread).IsCapacitveLoad := Buttons[0].Checked;
            end;
        end ;
       kofActReadingOfRSM :
       begin
          if RzSpinEdit1.IntValue = RzSpinEdit7.IntValue then
            chn :=7
          else
            chn := 0;
          PortThread := TThreadActReadingOfRSM.Create(port, chn);
       end;
       kofActSetupModeRSM :
       begin
          if RzSpinEdit1.IntValue = RzSpinEdit7.IntValue then
            chn :=7
          else
            chn := 0;
          PortThread := TThreadActSetupModeRSM.Create(port, chn);
          with TThreadActSetupModeRSM(PortThread), RzComboBox1 do
          begin
             StrMode := Values[ItemIndex];
             //IsYouGong := ;

             StrLevel := GetCLevel();
          end;
       end;
       kofActResetHarmonic:
       begin
           PortThread := TThreadResetHarmonic.Create(port, GetPhaseSet);
       end;
       kofActSetupHarmonic:
       begin
          PortThread := TThreadSetupHarmonic.Create(port, GetPhaseSet);
          with TThreadSetupHarmonic(PortThread) do
          begin
             IsVoltage := rzrdgrp4.Buttons[0].Checked;
             KindOfHarmonic := GetHarmonicMode;
             Times := rzspndtTimes.IntValue;
             Amplitude := rzspndtAmplitude.Value;
             PhaseAngle := RzNmEdtHarmonice.Value;
          end;
       end;
       kofActOutput1P3W:
       begin
          PortThread := TThreadOutput1P3W.Create(port);
          with TThreadOutput1P3W(PortThread), rzchckgrpLoad do
          begin
            IsFirstLoop := Checks[0].Checked;
            Voltage := RzNumericEdit1.Value;
            Current := RzNumericEdit2.Value * RzSpinEdit4.Value / 100.0;
            PhaseAngle := rzedtPhaAngle.Value;
          end;
       end;
       kofActPhaseAngleOutput1P3W:
       begin
          PortThread := TThreadPhaseAngleOutput1P3W.Create(port);
          with TThreadOutput1P3W(PortThread) do
          begin
            PhaseAngle := RzNmEdt8.Value;
          end;
       end;

       kofErrCalcPulsingTest:
       begin
          PortThread := TThreadErrCalcPulsingTest.Create(port);
          with TThreadErrCalcPulsingTest(PortThread) do
          begin
            TestPulses := rzedtCircleNbr.IntValue;
            TestChan := rzedtAccessNbr.IntValue;
            TestStdPulse := GetStdNbr();
          end;
       end;

       kofErrCalcReading:
       begin
           PortThread := TThreadErrCalcReading.Create(port);
           with TThreadErrCalcReading(PortThread) do
           begin
             Position := rzedtHeadPos.IntValue;
           end;
       end;

       kofCorrectOfVoltage:
       begin
           PortThread := TThreadOutputVoltageCorr.Create(port, GetPhaseSet, RzNumericEdit1.Value * RzSpinEdit3.Value / 100.0);
           with TThreadOutputVoltageCorr(PortThread) do
           begin
             AccuracyLimit := rzspndtAccuray.Value;
             RefPortNo := RzSpinEdit7.IntValue;
           end;
       end;
       kofCorrectOfCurrent :
       begin
           PortThread := TThreadOutputCurrCorr.Create(port, GetPhaseSet, RzNumericEdit2.Value * RzSpinEdit4.Value / 100.0);
           with TThreadOutputCurrCorr(PortThread) do
           begin
             AccuracyLimit := rzspndtAccuray.Value;
             RefPortNo := RzSpinEdit7.IntValue;
           end;
       end;
    end;

    with PortThread do
    begin
      NotifyAction := HandleMultiPortNotifyAction;
      NotifyFinish := HandleOnMultiPortNotifyAction;
      Resume;
    end

  end;
begin
  with rzStrgrdMultiPort do
    for i := FixedRows to RowCount - 1 do
      if getMultipleSerialPortNo(i- FixedRows , port ) then
      begin
         Inc(WorkThreadCount);
         RunMultiplePort;
      end;
end;

function TForm1.MultiplePortEnable() : boolean ;
begin
    result := rzchkbMultiSubSys.Checked ;
end;

function TForm1.getMultipleSerialPortNo(Index : Integer; var PortNo: Integer) : Boolean;
var
  i : integer;
begin
   Result := False;
   with rzStrgrdMultiPort do
    for i:= FixedRows to RowCount - 1 do
      if (index = i - FixedRows) and SameText('yes', Cells[2, i]) then
      begin
        PortNo := StrToInt(Cells[3, i]);
        Result := True;
        Break; 
      end;
end;

procedure TForm1.SetupDisplayMultiPort();
const
  FixedRowStr = 'no., name, check, port';
var
  i: integer;
  _check : Boolean;
begin
  ReadFromINI('multiple', 'check', False, _check);
  rzchkbMultiSubSys.Checked := _check;
  
  with rzStrgrdMultiPort do
  begin
      ColCount := 4;
      RowCount := 10;
      Rows[0].CommaText := FixedRowStr ;
      ColWidths[1] := Round(ColWidths[1] * 1.618);
      ColWidths[0] := Round(ColWidths[0] * 0.6);
      Cells[1, 1] := 'test bench';//format('sub.sys %d', [i]);
      for i := FixedRows to RowCount - 1 do
      begin
        Cells[0, i] := IntToStr(i);
        Cells[1, i] := ReadStringByINI(format('SubSYS #%d', [i]), 'Desc', '') ;
        Cells[2, i] := ReadStringByINI(format('SubSYS #%d', [i]), 'check', 'no');
        Cells[3, i] := ReadStringByINI(format('SubSYS #%d', [i]), 'source', '') ;;
      end;
  end;
end;

procedure TForm1.SetupDisplayMultiHarmonic();
const
  FixedRowStr = 'no., times, check, amp(%), angle(φ)';
var
  i: integer;
begin
  with rzStrgrdMultiHarmonic do
  begin
      ColCount := 5;
      RowCount := 22;
      Rows[0].CommaText := FixedRowStr ;
      //ColWidths[1] := Round(ColWidths[1] * 1.618);
      ColWidths[0] := Round(ColWidths[0] * 0.6);
      for i := FixedRows to RowCount - 1 do
      begin
        Cells[0, i] := IntToStr(i);
        Cells[1, i] := IntToStr(i);
        if i = FixedRows then
        begin
          Cells[3, i] := '100';
          Cells[2, i] := 'yes';
        end
        else
        begin
          Cells[3, i] := '10';
          Cells[2, i] := 'no';
        end;
        Cells[4, i] := '0';
      end;
  end;
end;

procedure TForm1.MultipleWaveOut(id: integer; AKind: TKindOfMultiple);
var
 s: WideString;
 psaOrders, psaRanges, psaAngles : PSafeArray;
 ptData: Pointer ;
 abData : SAFEARRAYBOUND;
 function GetSumOfRange() : double;
 var
   i: integer;
 begin
   result:=0;
    with rzStrgrdMultiHarmonic do
       for i:= FixedRows to RowCount - 1 do
          if SameText('yes', Cells[2, i]) then
             Result := result +  Sqr( StrToFloat(cells[3, i]) );
    Result := Sqrt(Result);
 end;
 function GetPSafeArray(index : TKindOfHarmonicParameter): PSafeArray ;
 var
   i, n : integer;
   dblSum : Double ;
 begin
    n:= 0;
    //dblSum := GetSumOfRange();

    case index of
      kofOrder :   Result := SafeArrayCreate(varWord, 1, abData);
      kofRange, kofPhase: Result :=SafeArrayCreate(varDouble, 1, abData);
      else
        Result := SafeArrayCreate(varWord, 1, abData);
    end;

    with rzStrgrdMultiHarmonic do
    if SafeArrayAccessData(Result, ptData) = s_ok then
    begin
        for i:= FixedRows to RowCount - 1 do
        begin
          if SameText('yes', Cells[2, i]) then
            case index of
              kofOrder : TMyInts(ptData)[n] := StrToInt(Cells[1, i]) ;
              kofPhase : TMyDbls(ptData)[n] := StrToFloatDef(Cells[4, i], 0.0);
              kofRange : TMyDbls(ptData)[n] := StrToFloatDef(Cells[3, i], 0.0); //StrToFloat(cells[3, i]) * 100 / dblSum;
            end
          else
            case index of
              kofOrder : TMyInts(ptData)[n] := 0 ;
              kofPhase : TMyDbls(ptData)[n] := 0;
              kofRange : TMyDbls(ptData)[n] := 0; //StrToFloat(cells[3, i]) * 100 / dblSum;
            end;
          Inc(n);
        end;
    end;

 end;
begin
  with abData do
  begin
    cElements := 21;
    lLbound := 0;
  end;

  try
    psaOrders := GetPSafeArray(kofOrder );
    psaRanges := GetPSafeArray(kofRange );
    psaAngles := GetPSafeArray(kofPhase );
    case AKind of
      kofMultiVoltage : s := geny_api.VoltageXieBoMulti(RzSpinEdit1.IntValue,  geny_comm_setting, id, psaRanges ,psaOrders, psaAngles  );
      kofMultiCurrent : s := geny_api.CurrentXieBoMulti(RzSpinEdit1.IntValue,  geny_comm_setting, id, psaRanges, psaOrders, psaAngles  );
    end;
    while not (SameText(reply_geny, s) or stoptest) do
    begin
      RzMemo1.Lines.add(format('%s: Harmonic(multiple) of %s (%d) output returns %s',
          [TimeToStr(now()), StrHarmonicKindNames[AKind], id,  s]));
      Sleep(100);
      case AKind of
        kofMultiVoltage : s := geny_api.VoltageXieBoMulti(RzSpinEdit1.IntValue,  geny_comm_setting, id, psaRanges, psaOrders, psaAngles  );
        kofMultiCurrent : s := geny_api.CurrentXieBoMulti(RzSpinEdit1.IntValue,  geny_comm_setting, id, psaRanges, psaOrders, psaAngles  );
      end;
    end;

    RzMemo1.Lines.add(format('%s: Harmonic(multiple) of %s (%d) output returns %s',
          [TimeToStr(now()), StrHarmonicKindNames[AKind], id,  s]));

  finally
     SafeArrayUnaccessData(psaOrders);
     SafeArrayUnaccessData(psaRanges);
     SafeArrayUnaccessData(psaAngles);
  end;

end;

procedure TForm1.actVoltageMultipleExecute(Sender: TObject);
var
  i: Integer;
begin
  stoptest := false;
  IsWorking := True;
  try
    if MessageDlg('Voltage harmonic superposition output?', mtWarning, [mbNo, mbYes], 0) = mrYes then
      for i := 0 to 2 do
        if RzCheckGroup1.ItemChecked[i] then
        begin
          sleep(100);
          MultipleWaveOut(220+ i, kofMultiVoltage ) ;
        end;
  finally
     IsWorking := false;
  end;
end;

procedure TForm1.actCurrentMultipleExecute(Sender: TObject);
var
  i: Integer;
begin
  stoptest := false;
  IsWorking := True;
  try
    if MessageDlg('Current harmonic superposition output?', mtWarning, [mbNo, mbYes], 0) = mrYes then
      for i := 0 to 2 do
        if RzCheckGroup1.ItemChecked[i] then
        begin
          sleep(100);
          MultipleWaveOut(220+ i, kofMultiCurrent ) ;
        end;
  finally
     IsWorking := false;
  end;
end;

procedure TForm1.RzNmEdt4Change(Sender: TObject);
begin
  with RzNmEdt6 do
    Value := calc_test_pulse(calc_test_pulse_1(RzNmEdt4.IntValue));

  with RzNmEdt5 do
    value := calc_freq_divi(RzNmEdt6.IntValue);
end;

procedure TForm1.actClearHarmonicTypeGExecute(Sender: TObject);
begin
  //clear harmonic for type-g bench
  with rzrdgrp5 do
    if Buttons[0].Checked then
      ResetWave('192.168.1.2', '1234','U', kofMultiVoltage  )
    else
      ResetWave('192.168.1.2', '1234','I', kofMultiCurrent  )  ;
end;

procedure TForm1.ResetWave(StrIP, StrPort, strType : WideString; AKind: TKindOfMultiple);
var
  GenyYCSS : GenyYCSS_TLB.YCSS ;
  S: WideString;
begin
     GenyYCSS := CoYCSS.Create;
     with GenyYCSS do
      S := Harmonics.ReSet(StrIP , StrPort, strType);

     RzMemo1.Lines.add(format('%s: Harmonic of %s reset, %s', [TimeToStr(now()), StrHarmonicKindNames[AKind] ,s]));
end;

procedure TForm1.MultipleWaveOut(StrIP, StrPort, strType, StrMode: WideString; AKind: TKindOfMultiple;  ATimes, AAngel, AAmp, ACheck,
  BTimes, BAngel, BAmp, BCheck,
  CTimes, CAngel, CAmp, CCheck : TStrings) ;
var
  GenyYCSS : GenyYCSS_TLB.YCSS ;
  s: WideString;
  psaOrders, psaRanges, psaAngles,
  psaOrders1, psaRanges1, psaAngles1,
  psaOrders2, psaRanges2, psaAngles2 : PSafeArray;
  ptData: Pointer ;
  abData : SAFEARRAYBOUND;
 function GetPSafeArray(Strs, Check: TStrings): PSafeArray ;
 var
   i, n : integer;
   dblSum : Double ;
 begin
    n:= 0;
    Result := SafeArrayCreate(varOleStr, 1, abData);

    if SafeArrayAccessData(Result, ptData) = s_ok then
      for i:= 1 to  Strs.Count - 1 do
        begin
          if SameText('yes', Check[i]) then
            TMyWideStrs(ptData)[n] := ATimes[i]
          else
             TMyWideStrs(ptData)[n] := '';
          Inc(n);
        end;

 end;
begin
  with abData do
  begin
    cElements := 12;
    lLbound := 0;
  end;

  GenyYCSS := CoYCSS.Create;

  try
    psaOrders := GetPSafeArray(ATimes, ACheck);
    psaRanges := GetPSafeArray(AAmp, ACheck );
    psaAngles := GetPSafeArray(AAngel, ACheck);
    psaOrders1 := GetPSafeArray(BTimes, BCheck);
    psaRanges1 := GetPSafeArray(BAmp , BCheck);
    psaAngles1 := GetPSafeArray(BAngel, BCheck);
    psaOrders2 := GetPSafeArray(CTimes, CCheck);
    psaRanges2 := GetPSafeArray(CAmp , CCheck);
    psaAngles2 := GetPSafeArray(CAngel, CCheck);

    s := GenyYCSS.Harmonics.SetValue(StrIP , StrPort  , StrMode,  strType,  psaRanges, psaAngles, psaOrders,
           psaRanges1, psaAngles1, psaOrders1,
           psaRanges2, psaAngles2, psaOrders2);


//    while not (SameText('ok', LowerCase(s)) or stoptest) do
//    begin
//      RzMemo1.Lines.add(format('%s: Harmonic(multiple) of %s output returns %s',
//          [TimeToStr(now()), StrHarmonicKindNames[AKind],  s]));
//      Sleep(100);
//      s := GenyYCSS.Harmonics.SetValue(StrIP , StrPort  , StrMode,  strType,  psaRanges, psaAngles, psaOrders,
//           psaRanges1, psaAngles1, psaOrders1,
//           psaRanges2, psaAngles2, psaOrders2);
//    end;
    RzMemo1.Lines.add(format('%s: Harmonic(multiple) of %s output returns %s',
          [TimeToStr(now()), StrHarmonicKindNames[AKind],  s]));

  finally
     SafeArrayUnaccessData(psaOrders);
     SafeArrayUnaccessData(psaRanges);
     SafeArrayUnaccessData(psaAngles);
     SafeArrayUnaccessData(psaOrders1);
     SafeArrayUnaccessData(psaRanges1);
     SafeArrayUnaccessData(psaAngles1);
     SafeArrayUnaccessData(psaOrders2);
     SafeArrayUnaccessData(psaRanges2);
     SafeArrayUnaccessData(psaAngles2);
  end;

end;


procedure TForm1.MultipleWaveOut(StrIP, StrPort, strType, StrMode: WideString; AKind: TKindOfMultiple;  ATimes, AAngel, AAmp : TStrings) ;
var
    GenyYCSS : GenyYCSS_TLB.YCSS ;
 s: WideString;
 psaOrders, psaRanges, psaAngles : PSafeArray;
 ptData: Pointer ;
 abData : SAFEARRAYBOUND;
 function GetPSafeArray(index : TKindOfHarmonicParameter): PSafeArray ;
 var
   i, n : integer;
   dblSum : Double ;
 begin
    n:= 0;
    Result := SafeArrayCreate(varOleStr, 1, abData);

    if SafeArrayAccessData(Result, ptData) = s_ok then
    begin
        for i:= 0 to  ATimes.Count - 1 do
        begin
            case index of
              kofOrder : TMyWideStrs(ptData)[n] := ATimes[i] ;
              kofPhase : TMyWideStrs(ptData)[n] := AAngel[i];
              kofRange : TMyWideStrs(ptData)[n] := AAmp[i]; //StrToFloat(cells[3, i]) * 100 / dblSum;
            end ;
          Inc(n);
        end;
    end;

 end;
begin
  with abData do
  begin
    cElements := ATimes.Count;
    lLbound := 0;
  end;

  GenyYCSS := CoYCSS.Create;

  try
    psaOrders := GetPSafeArray(kofOrder );
    psaRanges := GetPSafeArray(kofRange );
    psaAngles := GetPSafeArray(kofPhase );

    s := GenyYCSS.Harmonics.SetValue(StrIP , StrPort  , StrMode,  strType,  psaRanges, psaAngles, psaOrders,
           psaRanges, psaAngles, psaOrders,
           psaRanges, psaAngles, psaOrders);


    while not (SameText('ok', LowerCase(s)) or stoptest) do
    begin
      RzMemo1.Lines.add(format('%s: Harmonic(multiple) of %s output returns %s',
          [TimeToStr(now()), StrHarmonicKindNames[AKind],  s]));
      Sleep(100);
      s := GenyYCSS.Harmonics.SetValue(StrIP , StrPort  , StrMode,  strType,  psaRanges, psaAngles, psaOrders,
           psaRanges, psaAngles, psaOrders,
           psaRanges, psaAngles, psaOrders);
    end;
    RzMemo1.Lines.add(format('%s: Harmonic(multiple) of %s output returns %s',
          [TimeToStr(now()), StrHarmonicKindNames[AKind],  s]));

  finally
     SafeArrayUnaccessData(psaOrders);
     SafeArrayUnaccessData(psaRanges);
     SafeArrayUnaccessData(psaAngles);
  end;

end;

procedure TForm1.actOutputHarmonicTypeGExecute(Sender: TObject);
var
  ssTimes,ssAngel, ssAmp : TStrings;
  i: Integer;
begin
  //output harmonic for type-g bench
  stoptest := false;
  if MessageDlg('Is the output harmonic?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  ssTimes:= TStringList.Create;
  ssAngel:= TStringList.Create;
  ssAmp := TStringList.Create;

  try
    ssTimes.Add('1');
    ssAngel.Add('0.0');
    ssAmp.Add('100');
    ssTimes.Add(rzspndt1.Text);
    ssAngel.Add(RzNmEdt7.Text);
    ssAmp.Add(rzspndt2.Text);
    for i:= 1 to 10 do
    begin
      ssTimes.Add('0');
      ssAngel.Add('0');
      ssAmp.Add('0');
    end;

  with rzrdgrp5 do
    if Buttons[0].Checked then
      MultipleWaveOut('192.168.1.2', '1234','U', rzcmbx4.Value, kofMultiVoltage,ssTimes, ssAngel,ssAmp)
    else
      MultipleWaveOut('192.168.1.2', '1234','I', rzcmbx4.Value, kofMultiCurrent ,ssTimes, ssAngel,ssAmp);

  finally
    ssTimes.Free;
    ssAngel.Free;
    ssAmp.Free;
  end;

end;

procedure TForm1.OnNotifyMultiHarmonic(Sender: TObject; AKind : TKindOfMultiple;
      ssATimes, ssAAmp, ssAAngel, ACheck,
      ssBTimes, ssBAmp, ssBAngel, BCheck,
      ssCTimes, ssCAmp, ssCAngel, CCheck : TStrings);
begin

  case AKind of
    kofMultiVoltage:
      MultipleWaveOut('192.168.1.2', '1234','U', rzcmbx4.Value, kofMultiVoltage,ssATimes, ssAAmp, ssAAngel, ACheck,
        ssBTimes, ssBAmp, ssBAngel, BCheck,
        ssCTimes, ssCAmp, ssCAngel, CCheck);
    kofMultiCurrent:
          MultipleWaveOut('192.168.1.2', '1234','I', rzcmbx4.Value, kofMultiCurrent,ssATimes, ssAAmp, ssAAngel, ACHeck,
        ssBTimes, ssBAmp, ssBAngel,  BCheck,
        ssCTimes, ssCAmp, ssCAngel, CCheck);
  end;

end;

procedure TForm1.actOutputMultiHarmonicTypeGExecute(Sender: TObject);
begin
  with FormMultiHarmonic  do
  begin
    NotifyMultiHarmonic := OnNotifyMultiHarmonic;
    Show;
  end;
end;

procedure TForm1.actErrCalcSeleAllExecute(Sender: TObject);
var
  i: integer;
begin
  with rzchkbAll, rzStrgrdErrsDailTest do
    for i := FixedRows to RowCount - 1 do
      if Checked then
        Cells[2, i] := 'yes'
      else
        Cells[2, i] := 'no'
end;

procedure TForm1.HandleReadingsRoutine(AKind:TKindOfPreciOutput; APhaseSet : TPhaseSet);
  function GetRelatedErrorPercentage(d1, d2: Double) : Double ;
  begin
    Result := Abs(100.0 * (d1-d2) / d2)
  end;
  function CheckReading(ErrLimit: Double) : boolean;
  var
    d: Double;
    i : TPhaseName;
  begin
    Result := True;
    with _RecData do
      for i := ptPhaseA to ptPhaseC do
      begin
        if i in APhaseSet then
          case i of
            ptPhaseA :
                if kofVoltage = AKind then
                 begin
                    Result := Result and  (GetRelatedErrorPercentage(Ua , RzNumericEdit1.Value) < ErrLimit );
                    //Readings1 := Ua;
                 end
                else
                  begin
                    Result := Result and (GetRelatedErrorPercentage(Ia , RzNumericEdit2.Value) < ErrLimit );
                    //Readings1 := Ia ;
                  end;
            ptPhaseB :
                if kofVoltage = AKind then
                begin
                  Result := Result and  (GetRelatedErrorPercentage(Ub , RzNumericEdit1.Value) < ErrLimit ) ;
                  //readings2 := Ub;
                end
                else
                begin
                  Result := Result and  (GetRelatedErrorPercentage(Ib , RzNumericEdit2.Value) < ErrLimit );
                  //readings2 := Ib ;
                end ;
            ptPhaseC :
                if kofVoltage = AKind then
                begin
                  Result := Result and  (GetRelatedErrorPercentage(Uc , RzNumericEdit1.Value) < ErrLimit );
                  //Readings3 := Uc;
                end
                else
                begin
                  Result := Result and  (GetRelatedErrorPercentage(Ic , RzNumericEdit2.Value) < ErrLimit );
                  //Readings3 := Ic;
                end;
          end;
        if not Result  then
          Break;
      end;
  end;
  procedure DispRefData();
  begin
    with rzStrgrdPrecOutput, _RecData do
    begin
        Cells[FixedCols,  FixedRows] :=  Format('%8.3f', [Ua]);
        Cells[FixedCols , FixedRows + 1] :=  Format('%8.3f', [Ub]);
        Cells[FixedCols, FixedRows + 2] :=  Format('%8.3f', [Uc]);
        Cells[FixedCols + 1 , FixedRows] :=  Format('%8.4f', [Ia]);
        Cells[FixedCols + 1, FixedRows + 1] :=  Format('%8.4f', [Ib]);
        Cells[FixedCols + 1, FixedRows + 2] :=  Format('%8.4f', [Ic]);
    end
  end;
begin
  ReadReferenceMeasurement();
//  while Not (CheckReading(2.0) or stoptest) do
//  begin
//     DispRefData();
//     MeterCalCountDown(2);
//     ReadReferenceMeasurement();
//  end;
  DispRefData();
end;

procedure TForm1.PreciseOutputCurrenOn158Reading(Sender: TObject; ACmd: TCmdOperaParam);
begin
  MySI  := TCmdLevel_1(ACmd).set_I_percntg ;
end;

procedure TForm1.Form1OnHandle158ReadingNotify(Sender: TObject; AKind:TKindOfPreciOutput; var Readings1, Readings2, Readings3 : Double) ;
const
  Addrs : array[0..2] of TKindofAddr = (kofAddr220, kofAddr221 , kofAddr222 );
var
  i : Integer;
  Readings : TRoutine158Readings;
begin

  //open box to power source channel
  RzMemo1.Lines.add('open channel of power source, and read the SI');
  openbox(2);

  // read  one
  Readings := TRoutine158Readings.Creat(GetTestBenchCommPort());

  with Readings do
  begin
    NotifyExportReadings := PreciseOutputCurrenOn158Reading;
  end;

  try
     with RzCheckGroup1, Readings do
       for i := 0 to 2 do
          if Checks[i].Checked then
          begin
            MySI := -1;
            Reset();
            Read158Para(Addrs[i], kofLevel1);
            while (not stoptest) and ((0 > mySI) or (MySI > 120)) do
            begin
                Read158Para(Addrs[i], kofLevel1);
            end;

            case i of
             0: Readings1 := MySI;
             1: Readings2 := MySI;
             2: Readings3 := MySI;
            end;
          end ;

  finally
     Readings.Free;
  end;
end;

procedure TForm1.Form1OnHandleReadingNotify(Sender: TObject; AKind:TKindOfPreciOutput; var Readings1, Readings2, Readings3 : Double) ;
var
  i : TPhaseName;
begin
    HandleReadingsRoutine(AKind , TPreciOutput(Sender).PhaseSet );
    with _RecData, TPreciOutput(Sender) do
      for i := ptPhaseA to ptPhaseC do
        if i in PhaseSet then
          case i of
            ptPhaseA :
                if kofVoltage = AKind then
                 begin
                    //Result := Result and  (GetRelatedErrorPercentage(Ua , RzNumericEdit1.Value) < ErrLimit );
                    Readings1 := Ua;
                 end
                else
                  begin
                    //Result := Result and (GetRelatedErrorPercentage(Ia , RzNumericEdit2.Value) < ErrLimit );
                    Readings1 := Ia ;
                  end;
            ptPhaseB :
                if kofVoltage = AKind then
                begin
                  //Result := Result and  (GetRelatedErrorPercentage(Ub , RzNumericEdit1.Value) < ErrLimit ) ;
                  readings2 := Ub;
                end
                else
                begin
                  //Result := Result and  (GetRelatedErrorPercentage(Ib , RzNumericEdit2.Value) < ErrLimit );
                  readings2 := Ib ;
                end ;
            ptPhaseC :
                if kofVoltage = AKind then
                begin
                  //Result := Result and  (GetRelatedErrorPercentage(Uc , RzNumericEdit1.Value) < ErrLimit );
                  Readings3 := Uc;
                end
                else
                begin
                  //Result := Result and  (GetRelatedErrorPercentage(Ic , RzNumericEdit2.Value) < ErrLimit );
                  Readings3 := Ic;
                end;
          end;
end;

procedure TForm1.Form1OnCurrentNotify(Sender: TObject; APhase: TPhaseName; Value: Double);
//var
//  i : TPhaseName ;
begin
//    with TPreciOutput(Sender) do
//      for i := ptPhaseA to ptPhaseC do
//        if i in PhaseSet then
//        begin
//          sleep(100);
//          Output_Current_Percentage(220 + Integer(i), Value);
//        end;
  if (0 < value) and (Value < 120.0) then
    Output_Current_Percentage(220 + Integer(APhase), Value);
end;

procedure TForm1.Form1OnVoltgeNotify(Sender: TObject; APhase: TPhaseName; Value: Double);
const
  MyPhases : array[TPhaseName] of Integer = (220,221,222);
begin
    openbox(2);
    Output_Voltage(MyPhases[APhase], Value);
end;

procedure TForm1.PreciseOutputCurrentRoutine();
var
  Output : TPreciOutput;
begin
  Output := TCurrentPreciOutput.Create;
  with output do
  begin
     PhaseSet:= GetPhaseSet;
     AccuraySetting:= rzspndtAccuray.Value ;
     CurrentNotify:= Form1OnCurrentNotify;
     ReadingNotify := Form1OnHandleReadingNotify;
     StopTestNotify := Form1OnStopTestNotify;
     MainBoardReadingNotify:= Form1OnHandle158ReadingNotify;
  end;

  try
      Output.OutputRoutine(RzNumericEdit2.Value * RzSpinEdit4.Value / 100.0);
  finally
      Output.Free ;
  end;
end;

procedure TForm1.Form1OnStopTestNotify( Sender: TObject; var bStopTest: Boolean);
begin
  bStopTest := stoptest ;
end;

procedure TForm1.PreciseOutputRoutine();
var
  Output : TPreciOutput;
begin
  Output := TVoltagePreciOutput.Create;
  with output do
  begin
     PhaseSet:= GetPhaseSet;
     AccuraySetting:= rzspndtAccuray.Value ;
     VoltgeNotify:= Form1OnVoltgeNotify;
     ReadingNotify := Form1OnHandleReadingNotify;
     StopTestNotify := Form1OnStopTestNotify;
  end;

  try
      Output.OutputRoutine(RzNumericEdit1.Value * RzSpinEdit3.Value / 100.0);
  finally
      Output.Free ;
  end;
end;

function TForm1.GetPhaseSet() : TPhaseSet;
const
  Phases : array[0..2] of TPhaseName = (ptPhaseA, ptPhaseB, ptPhaseC);
var
  i : Integer ;
begin
  Result := [];
   with RzCheckGroup1 do
      for i := 0 to 2 do
      if Checks[i].Checked then
        Include(Result, Phases[i]);
end;

procedure TForm1.actOutputPrecVoltExecute(Sender: TObject);
  procedure SingleThread();
  begin
    // Precise voltage output
    actOutput_VoltageExecute(nil);

    RzMemo1.Lines.add('Wait for stablility output');
    //wait for 15 seconds for stability power
    MeterCalCountDown(RzNmEdtStabilize.IntValue);

    //output routine
    PreciseOutputRoutine();
  end;
begin
  stoptest := false;
  IsWorking := True;

  try

    SetupDisplayPrecOutput();

    if MultiplePortEnable then
    begin
      //output voltage
      MultiplePortRoutine(kofOutput_Voltage) ;
      ShowMessage('Power sources are under ouput voltage, please check later');
      WaitForWorkThreadFinish();
      //wait for 15 seconds for stability power
      RzMemo1.Lines.add('Wait for stablility output');
      MeterCalCountDown(RzNmEdtStabilize.IntValue);

      //start correction of voltage
      MultiplePortRoutine(kofCorrectOfVoltage);
      ShowMessage('Power sources are under voltage correction, please check later');
      WaitForWorkThreadFinish();
    end
    else
      SingleThread();

    ShowMessage('precise output voltage finished');

  finally
     IsWorking := false;
  end;

end;

procedure TForm1.actOutputPrecCurrExecute(Sender: TObject);
   procedure SingleThread();
   begin
    //setup range for reference meter
    with RzComboBox1 do
    if MessageDlg('Set current range for reference meter?', mtWarning, [mbNo, mbYes], 0) = mrYes then
      SyncRefMeter(RzSpinEdit7.IntValue, Values[ItemIndex], RzNumericEdit2.Value);

    // Precise Current output
    actOutput_CurrentExecute(nil);

    RzMemo1.Lines.add('Wait for stablility output');
    //wait for 15 seconds for stability power
    MeterCalCountDown(RzNmEdtStabilize.IntValue);

    //output routine
    PreciseOutputCurrentRoutine();
   end;
begin
  // precise current output
  stoptest := false;
  IsWorking := True;

  try
    SetupDisplayPrecOutput();

    if MultiplePortEnable then
    begin
      //output voltage
      MultiplePortRoutine(kofactOutput_Current) ;
      ShowMessage('Power sources are under ouput current, please check later');
      WaitForWorkThreadFinish();
      //wait for 15 seconds for stability power
      RzMemo1.Lines.add('Wait for stablility output');
      MeterCalCountDown(RzNmEdtStabilize.IntValue);

      //start correction of voltage
      MultiplePortRoutine(kofCorrectOfCurrent);
      ShowMessage('Power sources are under current correction, please check later');
      WaitForWorkThreadFinish();
    end
    else
      SingleThread();

    ShowMessage('precise output curent finished');

  finally
     IsWorking := false;
  end;
end;

procedure TForm1.actOutput_cos1p3WExecute(Sender: TObject);
var
  d: double;
begin
  stoptest := false;
  IsWorking := True;
  try
    d := RzNmEdt8.Value;
    if MessageDlg(format('warning: phase angle is given by %8.3f ', [d]), mtWarning, [mbNo, mbYes], 0) = mrNo then
        exit;

    if MultiplePortEnable then
    begin
      MultiplePortRoutine(kofActPhaseAngleOutput1P3W) ;
      ShowMessage('Power sources are changing the phase angle for 1p3w mode, please check later');
      WaitForWorkThreadFinish();
    end
    else
    begin
      Output_PhaseAngle(220, d);
      Output_PhaseAngle(221, d + 180);
    end;
  finally
     IsWorking := false;
  end;
end;

procedure TForm1.actSwitchCurrLoopExecute(Sender: TObject);
begin
  //switch current loop
   if MessageDlg('Warning: please confirm that the current loop output is 0, Yes or Not?', mtWarning, [mbNo, mbYes], 0) = mrNo then
    Abort; //exit;

   with rzrdgrpSwitching do
    if Buttons[0].Checked then
      openbox(13)
    else if Buttons[1].Checked then
      openbox(14)
    else if Buttons[3].Checked then
      openbox(13)
    else
      ShowMessage('under development!');

end;

procedure TForm1.ResizePanel(index: Integer);
  function GetRefComp(i: Integer): TRzPanel;
  begin
    Result := TRzPanel(FindComponent(Format('%s%d', [SNameOfPanel, i])));
  end;
var
  Prev: TRzPanel;
  function isoverlength(): Boolean;
  begin
    Result := Prev.Left + Prev.Width * 2 > ScrollBox1.Width;
  end;
begin
  Assert(Assigned(GetRefComp(index - 1)), 'the prev object is nil');
  if not Assigned(GetRefComp(index)) then Exit;
  Prev := GetRefComp(index - 1);
  if isoverlength() then
    with GetRefComp(index) do
    begin
      Top := Prev.Top + Prev.Height + 5;
      Left := GetRefComp(1).Left;
    end
  else
    with GetRefComp(index) do
    begin
      Top := Prev.Top;
      Left := Prev.Left + Prev.Width + 5;
    end;
  ResizePanel(index + 1);
end;

procedure TForm1.ScrollBox1Resize(Sender: TObject);
begin
  ResizePanel(2);
end;

function TForm1.getCoeff() : integer;
begin
   Result:= 1;
   with RzCheckGroup1 do
   begin
     if Checks[1].Checked then
      Inc(Result);
      if Checks[2].Checked then
      Inc(Result);
   end;
end;

procedure TForm1.RzNmEdtDosageChange(Sender: TObject);
var
  d: double;

begin
  with TRzNumericEdit(Sender) do
    RzNmEdtDtTime.value := 1 + Value * 3600 * 1000 / RzNumericEdit1.value / RzNumericEdit2.value / getCoeff();
end;

procedure TForm1.VaTestOnNotifyPowerTest(Sender: TObject; AMsg: string);
begin
     with RzMemo1 do
      Lines.Add(Format('%s %s' ,[TimeToStr(Now()), AMsg]));
end;

procedure TForm1.VaTestNotifyReadings(Sender: TObject; ACmd: TCmdPowerTest);
var
  Index: integer;
  procedure DispReadings(Value: TCmdRealTimeReadings); overload;
  begin
      with rzStrgrdPConsum, Value do
      begin
        Cells[FixedCols , index] := FormatDateTime('hh:mm:ss', Now());
        Cells[FixedCols + 1 , index] := Format('%8.3f ', [UCoils_P]);
        Cells[FixedCols + 2 , index] := Format('%8.3f ', [UCoils_VA]);
        Cells[FixedCols + 3 , index] := Format('%8.3f ', [UCoils_U]);
        Cells[FixedCols + 4 , index] := Format('%8.3f ', [UCoils_I]);
        Cells[FixedCols + 5 , index] := Format('%8.3f ', [UCoils_Fre]);
        Cells[FixedCols + 6 , index] := Format('%8.3f ', [ICoils_P]);
        Cells[FixedCols + 7 , index] := Format('%8.3f ', [ICoils_U]);
        Cells[FixedCols + 8 , index] := Format('%8.3f ', [ICoils_U]);
        Cells[FixedCols + 9 , index] := Format('%8.3f ', [ICoils_I]);
        Cells[FixedCols + 10 , index] := Format('%8.3f ', [ICoils_Fre]);

      end;
  end;
  procedure DispReadings(Value: TCmdTestReadings); overload;
  begin
      with rzStrgrdPConsum, Value do
      begin
        Cells[FixedCols , index] := FormatDateTime('hh:mm:ss', Now());
        Cells[FixedCols + 11 , index] := Format('%8.3f ', [UCoils_MaxP]);
        Cells[FixedCols + 12 , index] := Format('%8.3f ', [UCoils_MaxVA]);
        Cells[FixedCols + 13 , index] := Format('%8.3f ', [UCoils_AveP]);
        Cells[FixedCols + 14 , index] := Format('%8.3f ', [UCoils_AveVA]);
        Cells[FixedCols + 15 , index] := Format('%8.3f ', [ICoils_MaxP]);
        Cells[FixedCols + 16 , index] := Format('%8.3f ', [ICoils_MaxVA]);
        Cells[FixedCols + 17 , index] := Format('%8.3f ', [ICoils_AveP]);
        Cells[FixedCols + 18 , index] := Format('%8.3f ', [ICoils_AveVA]);
      end;
  end;
begin
  with TPowerConsum(Sender), rzStrgrdPConsum do
       index := Cols[0].IndexOf(IntToStr(Address));

  if (index > -1) and (ACmd is TCmdRealTimeReadings) then
     DispReadings(TCmdRealTimeReadings(acmd))
  else if (index > -1) and (ACmd is TCmdTestReadings) then
    DispReadings(TCmdTestReadings(acmd))  ;


end;

procedure TForm1.actPowerConsumptionTestExecute(Sender: TObject);
  procedure RunVAtest(blnTestOn : Boolean);
  var
     testVA : TPowerConsum;
  begin
    with cbprtlst2, rzcmbxPos do
      testVA := TPowerConsum.Creat(CommPort, StrToInt( Values[ItemIndex]) );

    with testVA do
    begin
       { DONE -oszh -cVA Test : fill in properties }
       OnNotifyPowerTest := VaTestOnNotifyPowerTest;
       //OnNotifyReadings := VaTestNotifyReadings;
    end;

    try
        testVA.PowerTest(RzNmEdtPowerTestTime.IntValue , blnTestOn);

    finally
       testVA.Free ;
    end;
  end;
begin
  stoptest := false;
  IsWorking := True;
  try
   with rzrdgrpPowerTest do
    if Buttons[0].Checked then
      RunVAtest(True)
    else
      RunVAtest(False);
   finally
     IsWorking := False;
   end;
end;

procedure TForm1.actPowerReadingsExecute(Sender: TObject);
  procedure GetVAtestReadings(blnRealTimeData : Boolean);
  var
     testVA : TPowerConsum;
  begin
    with cbprtlst2, rzcmbxPos do
      testVA := TPowerConsum.Creat(CommPort, StrToInt( Values[ItemIndex]) );

    with testVA do
    begin
       { DONE -oszh -cVA Test : fill in properties }
       OnNotifyPowerTest := VaTestOnNotifyPowerTest;
       OnNotifyReadings := VaTestNotifyReadings;
    end;

    try
        testVA.GetReadings(blnRealTimeData);
    finally
       testVA.Free ;
    end;
  end;
begin
  //readings of VA test
  stoptest := false;
  IsWorking := True;
  try
      with rzrdgrpReading do
        if Buttons[0].Checked then
           GetVAtestReadings(False)
        else
          GetVAtestReadings(True);
  finally
     IsWorking := False;
   end;
end;

procedure TForm1.AddPanel(ARef: TRzPanel; index: Integer; const ACount: Integer);
var
  panel: TRzPanel;
  function getPanelCaption: string;
  begin
//    if TestBoardType = kofSinglePhase then
//      Result := Format('device id: %d', [index])
//    else
      Result := Format('position: %d', [index]);
  end;
begin
  if index > ACount then Exit;
  panel := TRzPanel.Create(Self);
  panel.Name := Format('%s%d', [SNameOfPanel, index]);
  panel.Parent := ScrollBox1;
  panel.AlignmentVertical := ARef.AlignmentVertical;
  with ARef do
    panel.SetBounds(Left, Top, Width, Height);
  panel.Caption := getPanelCaption;
  panel.Tag := ARef.Tag + 1;
  AddComponent(panel, 1);
  AddPanel(panel, index + 1, ACount);
end;

procedure TForm1.AddComponent(ARef: TRzPanel; index: Integer);
const
  RefCompNames: array[1..4] of string = (SNameOfButtRead, SNameOfButtReset, SNameOfShape, SNameOfLable);
  //CompTypes: array[1..4] of TComponentClass = (TRzButton, TRzButton, TShape, TRzLabel);
  function GetRefComp(i: Integer): TComponent;
  begin
    Result := FindComponent(Format('%s%d', [RefCompNames[index], i]));
  end;
  function GetSerialNo(i: Integer): Integer;
  begin
    Result := (ARef.Tag - 1) * 3 + i;
  end;
  procedure AddShapes(i: Integer);
  var
    comp: TShape;
  begin
    if i > 3 then Exit;
    comp := TShape.Create(Self);
    comp.Parent := ARef;
    with TShape(GetRefComp(i)) do
    begin
      comp.SetBounds(Left, Top, Width, Height);
      comp.Name := Format('%s%d', [RefCompNames[index], GetSerialNo(i)]);
      comp.Brush.Assign(Brush);
      comp.Shape := Shape;
    end;
    AddShapes(i + 1);
  end;
  procedure AddLables(i: Integer);
  var
    comp: TRzLabel;
    function GetLableCaption(): string;
    const
      Strs: array[1..3] of string = ('Phase A', 'Phase B', 'Phase C');
    begin
      //if TestBoardType = kofThreePhase then
        Result := Strs[i]
//      else
//        Result := Format('Position: %d', [GetSerialNo(i)]);
    end;
  begin
    if i > 3 then exit;
    comp := TRzLabel.Create(Self);
    comp.Parent := ARef;
    with TRzLabel(GetRefComp(i)) do
    begin
      comp.SetBounds(Left, Top, Width, Height);
      comp.Name := Format('%s%d', [RefCompNames[index], GetSerialNo(i)]);
      comp.Caption := GetLableCaption;
    end;
    AddLables(i + 1);
  end;
var
  comp : TRzButton;
begin
  if index > high(RefCompNames) then exit;
  if index in [1, 2] then
  begin
    comp := TRzButton.Create(Self);
    comp.Parent := ARef;
    with TRzButton(GetRefComp(1)) do
    begin
      comp.SetBounds(Left, Top, Width, Height);
      comp.Name := Format('%s%d', [RefCompNames[index], ARef.Tag]);
      comp.Caption := Caption;
      comp.Action := Action;
      comp.Tag := ARef.Tag;
    end;
  end
  else if index = 3 then
    AddShapes(1)
  else
    AddLables(1);

  Inc(index);
  AddComponent(ARef, index);
end;

procedure TForm1.setICTcaption();
  procedure setLblCaption(i: Integer);
    function GetLableCaption(): string;
    const
      Strs: array[1..3] of string = ('Phase A', 'Phase B', 'Phase C');
    begin
        Result := Strs[i]
    end;
  begin
    if i > 3 then Exit;
    with TRzLabel(FindComponent(Format('%s%d', [SNameOfLable, i]))) do
      Caption := GetLableCaption();
    setLblCaption(i + 1);
  end;
begin
  with rzpnlIct1 do
      Caption := 'position: 1';
  setLblCaption(1);
end;


procedure TForm1.actReadStateExecute(Sender: TObject);
begin
    stoptest := false;
  IsWorking := True;
  try
    SetPortUsedState(kofICTComm, True);
    try
      with TAction(Sender).ActionComponent do
        TestICT(Tag);
    finally
      SetPortUsedState(kofICTComm, False);
      IsWorking := false;
    end;
  except
    on e: Exception do ShowException(e, @e);
  end;
end;

procedure TForm1.SetPortUsedState(const AKind: TKindOfCommPort; const Value: Boolean);
  procedure setImgIndex(RzSta: TRzGlyphStatus);
  begin
    with RzSta do
      if Value then
      begin
        ImageIndex := 10;
        Caption := StrPortIsOpened;
      end
      else
      begin
        ImageIndex := 11;
        Caption := '';
      end;
  end;
begin
  case AKind of
    kofTestBoardComm:
      begin
        //PortUsed.SourcePortUsed := Value;
        setImgIndex(rzglyphstsCommSta1);
      end;
    kofICTComm:
      begin
        //PortUsed.ICTPortUsed := Value;
        setImgIndex(rzglyphstsCommSta2);
      end;
  end;
  Application.ProcessMessages;
end;

procedure TForm1.TestICT(id: TDeviceID);
var
  MyComm: TMyComm;
  keyb: TICTKeyB;
begin
  MyComm := TMySPComm.Create(cbprtlstICTs.CommPort, rzdtICTPortSetting.Text);
  try
    InitProgress(1);
    keyb := TICTKeyB.Create(nil);
    with keyb do
    begin
      Comm := MyComm;
      OnBeforeTest := TestICTOnBeforeTest;
      OnRead := TestICTOnRead;
      NotifyResult := TestICTOnResult;
    end;
    try
      keyb.Read(id);
    finally
      keyb.Free;
    end;
  finally
    MyComm.Free;
  end;
end;

procedure TForm1.TestICTOnBeforeTest(Sender: TObject; ADeviceID: TDeviceID; var Terminated: Boolean);
  procedure SetShapeColor(i: Integer);
  begin
    if i > 3 then exit;
    with TShape(FindComponent(Format('shp%d', [GetSerialNbr(ADeviceID, i)]))) do
      Brush.Color := clSilver;
    SetShapeColor(i + 1);
  end;
begin
  SetShapeColor(1);
  DispWorkingStatus(format(StrWorkingState7, [ADeviceID]));
  Terminated := StopTest_ICT;
end;

procedure TForm1.DispWorkingStatus(const value: string);
begin
  with rzstspnMsg do
    Caption := value;
end;

function GetSerialNbr(ADeviceID: TDeviceID; const i: Integer): integer;
begin
  Result := (ADeviceID - 1) * 3 + i;
end;

procedure TForm1.TestICTOnRead(Sender: TObject; ADeviceID: TDeviceID; T1, T2, T3: TKindOfICTState);
  procedure CalcPercent;
  begin
    Inc(CountOfICTItem);
    RzProgressStatus1.Percent := Trunc(100 * (CountOfICTItem / TotalOfICTTestItem));
  end;
  procedure SetShapeColor(Value: TKindOfICTState; index: Integer);
  begin
    with TShape(FindComponent(Format('shp%d', [GetSerialNbr(ADeviceID, index)]))).Brush do
      case Value of
        kofUnknown: ;
        kofOpened: Color := clRed;
        kofClosed: Color := clGreen;
      end;
  end;
begin
  CalcPercent;
  SetShapeColor(T1, 1);
  SetShapeColor(T2, 2);
  SetShapeColor(T3, 3);
end;

procedure TForm1.TestICTOnResult(Sender: TObject; const Ret: Boolean);
begin
  if Ret then
    ShowMessage('test of reading is completed')
  else
    ShowMessage('test of reading is fail');
end;

procedure TForm1.InitProgress(const total: Integer);
begin
  CountOfICTItem := 0;
  TotalOfICTTestItem := total;
  RzProgressStatus1.Percent := 0;
end;


procedure TForm1.actResetICTExecute(Sender: TObject);
begin
  stoptest := false;
  IsWorking := True;

  try
    SetPortUsedState(kofICTComm, True);
    try
      with TAction(Sender).ActionComponent do
        ResetICT(Tag, False);
    finally
      SetPortUsedState(kofICTComm, False);
      IsWorking := false;
    end;
  except
    on e: Exception do ShowException(e, @e);
  end;
end;

procedure TForm1.ResetICT(id: TDeviceID; const Broadcase: Boolean);
var
  MyComm: TMyComm;
  keyb: TICTKeyB;
begin
  MyComm := TMySPComm.Create(cbprtlstICTs.CommPort, rzdtICTPortSetting.Text);
  try
    keyb := TICTKeyB.Create(nil);
    with keyb do
    begin
      Comm := MyComm;
      NotifyResult := ResetICTOnResult;
    end;
    try
      if Broadcase then
        keyb.Reset
      else
        keyb.Reset(id);
    finally
      keyb.Free;
    end;
  finally
    MyComm.Free;
  end;
end;

procedure TForm1.ResetICTOnResult(Sender: TObject; const Ret: Boolean);
begin
  if Ret then
    ShowMessage('reset ICT is completed')
  else
    ShowMessage('reset ICT is fail');
end;


procedure TForm1.actResetAllICTsExecute(Sender: TObject);
begin
  stoptest := false;
  IsWorking := True;

  try
    SetPortUsedState(kofICTComm, True);
    try
      with TAction(Sender).ActionComponent do
        ResetICT(Tag, True );
    finally
      SetPortUsedState(kofICTComm, False);
      IsWorking := false;
    end;
  except
    on e: Exception do ShowException(e, @e);
  end;
end;

procedure TForm1.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if WheelDelta < 0 then
    ScrollBox1.Perform(WM_VSCROLL,SB_LINEDOWN,0)
  else
    ScrollBox1.Perform(WM_VSCROLL,SB_LINEUP,0);
end;

procedure TForm1.rzcmbxCommandClick(Sender: TObject);
begin
  with  rzdtCommand do
    Text := TRzComboBox(Sender).Value;
end;

procedure TForm1.RelayCommRoutine(CmdStr: string);
var
  _myComm: TMyComm;
  MyCommRelay: TCommForRelayModule ;
begin
  _myComm := TMySPComm.Create(cbprtlstSendCommand.CommPort, rzdtPortSetting.Text);

  try
    MyCommRelay := TCommForRelayModule.Create(nil);

    try
       with MyCommRelay, RzMemo1 do
       begin
          MyComm := _myComm;
          CommandStr := CmdStr ;
          MyComm.InitComm;
          Operate;
          mycomm.FinalComm;
          Lines.Add(format('%s Eletechsup switch board returned message: %s', [ TimeToStr(now), ReturnStr]));
       end;
    finally
       MyCommRelay.Free;
    end;
  finally
     FreeAndNil(_myComm);
  end
end;

procedure TForm1.actSendCommandExecute(Sender: TObject);
begin
  IsWorking := True;
  try
    RelayCommRoutine(rzdtCommand.Text) ;
  finally
    IsWorking := False;
  end;
end;

procedure TForm1.actGoFinetuneExecute(Sender: TObject);
var
  dblRet: Double;
begin
  IsWorking:= True;
  try

   with rzrdgrpKind do
     if Buttons[0].Checked then
        dblRet := VoltageFinetune(RzSpinEdit1.IntValue , rzrdgrpPhase.ItemIndex,
           edtFinetuneValue.Value , (RzNumericEdit1.Value - edtReading.Value ) / RzNumericEdit1.Value )
     else
        dblRet := CurrentFinetune(RzSpinEdit1.IntValue , rzrdgrpPhase.ItemIndex,
           edtFinetuneValue.Value , (RzNumericEdit2.Value - edtReading.Value ) / RzNumericEdit2.Value ) ;

     if ( 0.95 < dblRet) and (dblRet < 1.05) then
     begin
       edtFinetuneValue.Value := dblRet;
       ShowMessage(Format('The power source has been finetuned with new value %8.5f', [dblRet]));
       //save to file
       WriteFinetuneValueToFile(FloatToStr(dblRet)) ;
     end ;
   finally
      IsWorking:= false;
   end
end;

procedure TForm1.actWriteFinetuneExecute(Sender: TObject);
var
   intRet : Integer ;
begin
   IsWorking:= True;

   try
   with rzrdgrpKind do
    if  Buttons[0].Checked then
       //ShowMessage('write value for voltage fine-tuned')
       intRet := WriteVoltageFinetuneValue(RzSpinEdit1.IntValue , rzrdgrpPhase.ItemIndex, edtFinetuneValue.Value )
    else
      // ShowMessage('write value for current fine-tuned')  ;
      intRet := WriteCurrentFinetuneValue(RzSpinEdit1.IntValue , rzrdgrpPhase.ItemIndex, edtFinetuneValue.Value  ) ;

    if intRet = 0 then
       ShowMessage('it''s fine-tuned successfully')
    else
       ShowMessage(Format('finetuned is fail with code %d', [intRet]));
   finally
      IsWorking:= False;
   end
end;

procedure TForm1.WriteFinetuneValueToFile(strValue: string);
  function GetSectionStr () : string;
  begin
    with rzrdgrpKind do
       if Buttons[0].Checked then
          Result := '_U'
       else
          Result := '_I'
  end;
  function GetKeyStr () : string;
  begin
    with rzrdgrpKind do
       if Buttons[0].Checked then
          Result := RzNumericEdit1.Text
       else
          Result := RzNumericEdit2.Text ;
  end;
begin
   with rzrdgrpPhase do
   begin
     if Buttons[0].Checked then
        WriteToINI('220'+ GetSectionStr(), GetKeyStr(), strValue )
     else if Buttons[1].Checked then
        WriteToINI('221'+ GetSectionStr(), GetKeyStr(), strValue )
     else
        WriteToINI('222'+ GetSectionStr(), GetKeyStr(), strValue );

   end;

end;

procedure TForm1.rzrdgrpPhaseClick(Sender: TObject);
  function GetSectionStr () : string;
  begin
    with rzrdgrpKind do
       if Buttons[0].Checked then
          Result := '_U'
       else
          Result := '_I'
  end;
  function GetKeyStr () : string;
  begin
    with rzrdgrpKind do
       if Buttons[0].Checked then
          Result := RzNumericEdit1.Text
       else
          Result := RzNumericEdit2.Text ;
  end;
begin
   with TRzRadioGroup(Sender), edtFinetuneValue do
   begin
     if Buttons[0].Checked then
        Text:= ReadStringByINI('220'+ GetSectionStr(), GetKeyStr(), '1.0' )
     else if Buttons[1].Checked then
        Text:= ReadStringByINI('221'+ GetSectionStr(), GetKeyStr(), '1.0' )
     else
        Text:= ReadStringByINI('222'+ GetSectionStr(), GetKeyStr(), '1.0' );

   end;


end;

procedure TForm1.FormOnRRkitErrorMsg(Sender: TObject; strInfo: string);
begin
    with RzMemo1 do
      Lines.Add(Format('RRKit error msg: %s', [strInfo]));
end;

procedure TForm1.FormOnRRKitOnCommMsg(Sender: TObject; strInfo: string);
begin
  with RzMemo1 do
      Lines.Add(Format('The RRKit return message: %s', [strInfo]));
end;

function TForm1.GetRdMeterRef(AKind: TRdMeterKind): TRdMeter;
begin
  Result := TRdMeter.Create(AKind, RzSpinEdit7.IntValue);
end;

procedure TForm1.ReadMatrix_Instant(AKind: TRdMeterKind);
var
  RR: TRdMeter;
  procedure goReadInstant(const APhase: TKindofPhaseDefine);
  const
    FixTitles: array[TKindofPhaseDefine] of string = ('Single phase', 'Phase Net', 'Phase A', 'Phase B', 'Phase C', 'Phase N');
  var
    Ptr: PRd20InstData;
    procedure DisplayData(P: PSingle);
    var
      ss: TStrings;
      i: TKindofDisplyInstant;
      strCommText : string;
    begin
      ss := TStringList.Create;
      try
        ss.Add(FixTitles[APhase]);
        for i := kofVolts to kofVAR_Delt_XCONN do
        begin
          ss.Add(copy(Format('%8.4f', [P^]), 1, 7));
          Inc(P);
        end;
        with rzgrdRdInstn do
          case APhase of
            kofRAD_PHASE_NONE, kofRAD_PHASE_A: Cols[1] := ss;
            kofRAD_PHASE_B: Cols[2] := ss;
            kofRAD_PHASE_C: Cols[3] := ss;
          end;


        //display for YCmeter grid
        strCommText := ss[0] +',,' + ss[1] + ',,' + ss[2] + ',' + ss[4] + ',' + ss[7] + ',' + ss[6] ;
        with StringGridYC1 do
          case APhase of
            kofRAD_PHASE_NONE, kofRAD_PHASE_A: Rows[1].CommaText := strCommText ;
            kofRAD_PHASE_B: Rows[2].CommaText  := strCommText;
            kofRAD_PHASE_C: Rows[3].CommaText  := strCommText;
          end;


      finally
        ss.free;
      end;
    end;
  begin
    new(ptr);
    try
      FillChar(Ptr^, SizeOf(Ptr^), 0);
      RR.ReadInstData(APhase, Ptr^);
      DisplayData(@Ptr.rdVolts);
    finally
      Dispose(Ptr);
    end;
  end;
begin
  RR := GetRdMeterRef(AKind);
  with RR do
  begin
    OnErrorMsg := FormOnRRkitErrorMsg;
    OnCommMsg := FormOnRRKitOnCommMsg;
  end;

  try
    try
//      if RzCheckBox1.Checked then
//        RR.OpenAccessChannel(False);

      if AKind = kofRd20 then
        goReadInstant(kofRAD_PHASE_NONE)
      else
      begin
        goReadInstant(kofRAD_PHASE_A);
        goReadInstant(kofRAD_PHASE_B);
        goReadInstant(kofRAD_PHASE_C);
      end;
    except
      on e: exception do
      begin
        ShowException(e, @e);
        //LogEvent('Rd reading', e.Message);
      end
    end;
  finally
    FreeAndNil(RR);
  end;
end;

procedure TForm1.SetupDisplayRadian;
var
  ss: TStrings;
  procedure doFixRowString();
  begin
    ss := TStringList.Create;
    try
      ss.Add('Instantaneous');
      ss.Add('phase A');
      ss.Add('phase B');
      ss.Add('phase C');
      with rzgrdRdInstn do
        Rows[0] := ss;
    finally
      ss.Free;
    end;
  end;

  procedure doFixedColString();
  var
    i: TKindofDisplyInstant;
  begin
    ss := TStringList.Create;
    try
      ss.Add('Instantaneous');
      for i := Low(ArrayDispStrs) to High(ArrayDispStrs) do
        ss.Add(LoadResString(ArrayDispStrs[i]));
      with rzgrdRdInstn do
        Cols[0] := ss;
    finally
      ss.Free;
    end;
  end;

begin
  with rzgrdRdInstn do
  begin
    RowCount := FixedRows + Ord(High(ArrayDispStrs)) + 1;
  end;
  doFixRowString;
  doFixedColString;
end;


procedure TForm1.actReadMatrixExecute(Sender: TObject);
begin

  OnReadings := true;

  try

    if RzRadioGroup3.Buttons[0].Checked then
      ReadMatrix_Instant(kofRd20)
    else
      ReadMatrix_Instant(kofRd33);
  finally
     OnReadings := false;
  end;

end;

procedure TForm1.actReadMatrixUpdate(Sender: TObject);
begin
    with TAction(Sender) do
    Enabled := not OnReadings;
end;

procedure TForm1.actReadThreadExecute(Sender: TObject);
  procedure ReadThreadRoutine();
  var
    _rr: TThreadRead;
  begin
    if OnReadings then exit;
    OnReadings := True;
    _rr := TThreadRead.Create(True, GetRdMeterRef(kofRd33));
    with _rr do
    begin
      OnThreadErrMsg := FormOnRRkitErrorMsg;
      OnThreadCommMsg := FormOnRRKitOnCommMsg;
      OnReadings := Form1OnReadings;
      Resume;
      while not Stop do
      begin
        Stop := not (rzchckbxReadThread.Checked or stoptest);
        Waitmilliseconds(edtSpinIntvReadings.IntValue * 1000);
      end;
    end;
     //ShowMessage('readings done');
  end;
begin
  try
    ReadThreadRoutine;
  finally
    OnReadings := False;
    stoptest:=False;
  end;
end;

procedure TForm1.Form1OnReadings(Sender: TObject; AKind: TKindofPhaseDefine; AReadings: TStrings);
const
  FixTitles: array[TKindofPhaseDefine] of string = ('Single phase', 'Phase Net', 'Phase A', 'Phase B', 'Phase C', 'Phase N');
begin
  AReadings.Insert(0, FixTitles[AKind]);
  with rzgrdRdInstn do
    case AKind of
      kofRAD_PHASE_NONE, kofRAD_PHASE_A: Cols[1] := AReadings;
      kofRAD_PHASE_B: Cols[2] := AReadings;
      kofRAD_PHASE_C: Cols[3] := AReadings;
    end;

//  with rzgrdRdInstn2 do
//    case AKind of
//      kofRAD_PHASE_NONE, kofRAD_PHASE_A: Rows[1] := AReadings;
//      kofRAD_PHASE_B: Rows[2] := AReadings;
//      kofRAD_PHASE_C: Rows[3] := AReadings;
//    end;
end;

//procedure TForm1.GetPhaseAngle(AKindConnMode : TModeOfConn ; AKindPF: TKindOfPowerFactor; var strValue1, strValue2, strValue3 : string);
//begin
//     strValue1 := BalancePhaseAngles[AKindConnMode, ptPhaseA, AKindPF];
//     strValue2 := BalancePhaseAngles[AKindConnMode, ptPhaseB, AKindPF];
//     strValue3 := BalancePhaseAngles[AKindConnMode, ptPhaseC, AKindPF];
//end;

procedure TForm1.cbbPowerFactorChange(Sender: TObject);
var
  str1, str2, str3 : string;
  BalanceLoad: boolean;
  function getKindOfPowerFactor(): TKindOfPowerFactor ;
  begin
       with cbbPowerFactor do
        case ItemIndex of
            0: result:= kofUnity ;
            1: Result := kof05L ;
            2: Result := kof08L ;
            3: Result := kof05C ;
            4: Result := kof08C ;
        else
          result:= kofUnity ;
        end;
  end;

  function IsUnblancePhaseAngel() : Boolean ;
  var
    i,n: Integer ;
  begin
      n:=0;
      with RzCheckGroup1 do
        for i:= 0 to 2 do
            if ItemChecked[i] then
              inc(n,1) ;
      Result := (n =1);
  end;
begin
  //ShowMessage('stop');
  if IsUnblancePhaseAngel() then
    with RzComboBox1 do
      case ItemIndex  of
        0,2 :
          begin
            GetPhaseAngle(mocAcFourW , getKindOfPowerFactor(), ptPhaseA  , str1 );
            GetPhaseAngle(mocAcFourW , getKindOfPowerFactor(), ptPhaseB  , str2 );
            GetPhaseAngle(mocAcFourW , getKindOfPowerFactor(), ptPhaseC   , str3 );
          end;
         5 :
         begin
          GetPhaseAngle(mocAcThreeW  , getKindOfPowerFactor() ,ptPhaseA ,str1  );
          GetPhaseAngle(mocAcThreeW  , getKindOfPowerFactor() ,ptPhaseB, str2  );
          GetPhaseAngle(mocAcThreeW  , getKindOfPowerFactor() ,ptPhaseC ,str3 );
         end;
         3:
         begin
          GetPhaseAngle(mocReFourW , getKindOfPowerFactor(),ptPhaseA ,str1 );
          GetPhaseAngle(mocReFourW , getKindOfPowerFactor(), ptPhaseB,str2  );
          GetPhaseAngle(mocReFourW , getKindOfPowerFactor(), ptPhaseC,str3  );
         end;
         6:
         begin
          GetPhaseAngle(mocReThreeW , getKindOfPowerFactor(),ptPhaseA ,str1 );
            GetPhaseAngle(mocReThreeW , getKindOfPowerFactor() ,ptPhaseB,str2  );
            GetPhaseAngle(mocReThreeW , getKindOfPowerFactor(),ptPhaseC ,str3 );
         end;
      end
  else
    with RzComboBox1 do
      case ItemIndex  of
        0,2 : GetPhaseAngle(mocAcFourW , getKindOfPowerFactor() ,str1 , str2 , str3 );
         5 : GetPhaseAngle(mocAcThreeW  , getKindOfPowerFactor() ,str1 , str2 , str3 );
         3:GetPhaseAngle(mocReFourW , getKindOfPowerFactor() ,str1 , str2 , str3 );
         6:GetPhaseAngle(mocReThreeW , getKindOfPowerFactor() ,str1 , str2 , str3 );
      end;

    rzedtPhaAngle.Text := str1 ;
    edtPhaseB.Text := str2 ;
    edtPhaseC.Text := str3 ;

end;

//procedure TForm1.GetPhaseAngle(AKindConnMode: TModeOfConn;
//  AKindPF: TKindOfPowerFactor; AKindOfPhase: TPhaseName;
//  var strValue: string);
//begin
//   strValue := UnBalancePhaseAngles[AKindConnMode, AKindOfPhase, AKindPF];
//end;

//procedure TForm1.GetPhaseAngle(AKindConnMode: TModeOfConn; APowFactor: string; var strValue : string);
//var
//  dblX, dblConst : Double;
//  Code: integer;
//begin
//   Val( APowFactor, dblX, code);
//   if code <> 0 then
//      dblx := StrToFloat(Copy(APowFactor, 0, Code-1 ))
//   else
//     dblx := StrToFloat(APowFactor);
//
//   //strX :=  StringReplace(APowFactor , '[^0-9]', '', [rfReplaceAll,rfIgnoreCase]);
//
//   case AKindConnMode of
//    mocAcFourW ,mocSingle , mocAcThreeW : dblConst := 360.0;
//    mocReFourW , mocReThreeW :dblConst := 450.0 ;
//   end;
//
//     dblX := CalcArccos(dblX);
//     if Pos('c', LowerCase(APowFactor)) > 0 then
//       dblX := dblConst- dblX
//     else
//       dblX := dblConst + dblX;
//     if dblX >= 360 then
//        dblX := dblX - 360;
//   strValue := FloatToStr(RoundTo(dblx, -2));
//end;

procedure TForm1.cbbPowerFactorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  strValue: string;

  function GetKindOfConnMode(): TModeOfConn;
  begin
      with RzComboBox1 do
      case ItemIndex  of
        0,2 :
          begin
            Result := mocAcFourW;
          end;
         5 :
         begin
            Result := mocAcThreeW;
         end;
         3:
         begin
            Result := mocReFourW;
         end;
         6:
         begin
            Result := mocReThreeW;
         end;
         else
           Result := mocAcFourW;
      end
  end;
begin
    with TComboBox(Sender) do
    case Key of
      13	:
        begin
          //ShowMessage( Text  + ' Enter pressed!');
          GetPhaseAngle(GetKindOfConnMode(), Text , strValue );
          rzedtPhaAngle.Text := strValue ;
          edtPhaseB.Text := strValue ;
          edtPhaseC.Text := strValue ;
        end;
    end;
end;

initialization

finalization
  begin
  FreeAndNil(FCheck);
  FreeAndNil(FNoCheck);
  end;

end.

