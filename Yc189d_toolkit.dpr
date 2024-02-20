program Yc189d_toolkit;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  CtrComm_TLB in 'lib\CtrComm_TLB.pas',
  Unit_Config in 'Unit_Config.pas' {FrmTestBenchConfig},
  uConvertHarnpuDB in '..\database\uConvertHarnpuDB.pas' {DataModuleHarnpu: TDataModule},
  Unit_INI in 'common\unit_INI.pas',
  uReadWriteXls in '..\xls\uReadWriteXls.pas',
  uHarnpuCommon in '..\database\uHarnpuCommon.pas',
  uMeterCommRelay in '..\RelayTest\uMeterCommRelay.pas',
  uCommRelayRoutine in '..\RelayTest\uCommRelayRoutine.pas',
  Unit_errorG in '..\YC189G Toolkit\Source code\robot\client\Unit_errorG.pas',
  unit_CommG in '..\YC189G Toolkit\Source code\robot\client\unit_CommG.pas',
  uMeterCalComm in '..\MeterCal\uMeterCalComm.pas',
  uCRC16 in '..\MeterCal\uCRC16.pas',
  uStrUtil in 'common\uStrUtil.pas',
  uDelayRoutine in 'common\uDelayRoutine.pas',
  GenyCommunication_TLB in 'lib\GenyCommunication_TLB.pas',
  Unit_sourcG in '..\YC189G Toolkit\Source code\robot\client\Unit_sourcG.pas',
  uMeterCalRoutine in '..\MeterCal\uMeterCalRoutine.pas',
  uMeterCalData in '..\MeterCal\uMeterCalData.pas',
  udmSQLServer in '..\MeterCal\udmSQLServer.pas' {DataModSQLServer: TDataModule},
  uFinetune158PCBA in '..\AutoAdjustment\uFinetune158PCBA.pas',
  uAdjustParamComm in '..\AutoAdjustment\uAdjustParamComm.pas',
  uCmd_AutoAdjustment in '..\AutoAdjustment\uCmd_AutoAdjustment.pas',
  uCmd158Readings in '..\ReadingsMB158\uCmd158Readings.pas',
  uComm158Readings in '..\ReadingsMB158\uComm158Readings.pas',
  uRoutine158Readings in '..\ReadingsMB158\uRoutine158Readings.pas',
  uErrCalUtils in '..\pulsingtest\uErrCalUtils.pas',
  uAPI_TestBench in '..\testbench_dll\uAPI_TestBench.pas',
  uCmdPowerConsumption in '..\PowerConsumption\uCmdPowerConsumption.pas',
  uCommPowerConsum in '..\PowerConsumption\uCommPowerConsum.pas',
  uTestParam in '..\AccuracyTest\uTestParam.pas',
  uTypeHarmonic in '..\yc189d\uTypeHarmonic.pas',
  uPreciOutput in 'uPreciOutput.pas',
  uFrmMultiHarmonic in 'uFrmMultiHarmonic.pas' {FormMultiHarmonic},
  uMultiHarmonic in 'uMultiHarmonic.pas',
  uTestPulseNumber in 'uTestPulseNumber.pas',
  uMultiTestSys in 'uMultiTestSys.pas',
  uRoPowerConsum in '..\PowerConsumption\uRoPowerConsum.pas',
  uCmdYc99T in '..\yc99t\uCmdYc99T.pas',
  uComm99T in '..\yc99t\uComm99T.pas',
  uCommRelay4Current in '..\RelayTest\uCommRelay4Current.pas',
  uMyUtils in 'common\uMyUtils.pas',
  uTempReadingComm in '..\Modbus\uTempReadingComm.pas',
  uPhaseAngle in '..\yc189d\uPhaseAngle.pas',
  ufrmMonitor in 'ufrmMonitor.pas' {FrmMonitor};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmTestBenchConfig, FrmTestBenchConfig);
  Application.CreateForm(TDataModuleHarnpu, DataModuleHarnpu);
  Application.CreateForm(TDataModSQLServer, DataModSQLServer);
  Application.CreateForm(TFormMultiHarmonic, FormMultiHarmonic);
  Application.CreateForm(TFrmMonitor, FrmMonitor);
  //Application.CreateForm(TFrmTestBenchConfig, FrmTestBenchConfig);
  Application.Run;

end.
