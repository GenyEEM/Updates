object Form1: TForm1
  Left = 259
  Top = 153
  Width = 1461
  Height = 789
  Caption = 'GENY toolkit for test bench'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  PixelsPerInch = 96
  TextHeight = 13
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 714
    Width = 1445
    ActionOk = actStopTest
    ActionCancel = actCloseWin
    CaptionOk = 'Stop Test'
    CaptionCancel = 'Close'
    HotTrack = True
    OKDefault = False
    TabOrder = 0
  end
  object RzMemo1: TRzMemo
    Left = 0
    Top = 488
    Width = 1445
    Height = 188
    Align = alBottom
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 695
    Width = 1445
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 2
    object RzVersionInfoStatus1: TRzVersionInfoStatus
      Left = 1345
      Top = 0
      Height = 19
      Align = alRight
      Alignment = taCenter
      Field = vifFileVersion
      VersionInfo = RzVersionInfo1
    end
    object rzglyphstsCommSta1: TRzGlyphStatus
      Left = 55
      Top = 0
      Width = 58
      Height = 19
      Align = alLeft
      AutoSize = True
      ImageIndex = 1
      Images = ImageList1
    end
    object rzglyphstsCommSta2: TRzGlyphStatus
      Left = 170
      Top = 0
      Width = 58
      Height = 19
      Align = alLeft
      AutoSize = True
      ImageIndex = 1
      Images = ImageList1
    end
    object rzstspnMsg: TRzStatusPane
      Left = 228
      Top = 0
      Width = 40
      Height = 19
      Align = alLeft
      AutoSize = True
    end
    object rzprgrsts1: TRzProgressStatus
      Left = 268
      Top = 0
      Width = 152
      Height = 19
      Align = alLeft
      ParentShowHint = False
      PartsComplete = 0
      Percent = 0
      ShowPercent = True
      TotalParts = 0
    end
    object rzstspn1: TRzStatusPane
      Left = 0
      Top = 0
      Width = 55
      Height = 19
      Align = alLeft
      AutoSize = True
      Caption = 'PSU COM'
    end
    object rzstspn2: TRzStatusPane
      Left = 113
      Top = 0
      Width = 57
      Height = 19
      Align = alLeft
      AutoSize = True
      Caption = 'RSM COM'
    end
  end
  object rzstsbr1: TRzStatusBar
    Left = 0
    Top = 676
    Width = 1445
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 3
    VisualStyle = vsGradient
    object RzClockStatus1: TRzClockStatus
      Left = 1295
      Top = 0
      Height = 19
      Align = alRight
    end
    object RzStatusPane1: TRzStatusPane
      Left = 0
      Top = 0
      Width = 31
      Height = 19
      Align = alLeft
      AutoSize = True
      Caption = 'sta1'
    end
    object RzProgressStatus1: TRzProgressStatus
      Left = 31
      Top = 0
      Height = 19
      Align = alLeft
      ParentShowHint = False
      PartsComplete = 0
      Percent = 0
      TotalParts = 0
    end
    object rzstspnVerifyTime: TRzStatusPane
      Left = 1209
      Top = 0
      Width = 86
      Height = 19
      Align = alRight
      AutoSize = True
      Caption = 'verification time'
    end
    object rzstspnCalTime: TRzStatusPane
      Left = 1127
      Top = 0
      Width = 82
      Height = 19
      Align = alRight
      AutoSize = True
      Caption = 'calibration time'
    end
    object rzstspnYield: TRzStatusPane
      Left = 1027
      Top = 0
      Height = 19
      Align = alRight
    end
  end
  object rztlbr1: TRzToolbar
    Left = 0
    Top = 0
    Width = 1445
    Height = 29
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    TabOrder = 4
    VisualStyle = vsGradient
    ToolbarControls = (
      btnConfig
      RzToolButton1
      RzToolButton2)
    object btnConfig: TRzToolButton
      Left = 4
      Top = 2
      Width = 85
      ImageIndex = 4
      Images = ImageList1
      ShowCaption = True
      UseToolbarShowCaption = False
      Action = actOpenConfigration
    end
    object RzToolButton1: TRzToolButton
      Left = 89
      Top = 2
      Width = 144
      ImageIndex = 2
      Images = ImageList1
      ShowCaption = True
      UseToolbarShowCaption = False
      Action = actOpenAgent4SourceG
    end
    object RzToolButton2: TRzToolButton
      Left = 233
      Top = 2
      Width = 112
      DisabledIndex = 1
      ImageIndex = 1
      Images = ImageList1
      ShowCaption = True
      UseToolbarShowCaption = False
      Action = actConnectAgent
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 29
    Width = 1445
    Height = 459
    ActivePage = TabSheet1
    ActivePageDefault = RzTabSheet2
    Align = alClient
    MultiLine = True
    ParentColor = False
    TabIndex = 1
    TabOrder = 5
    FixedDimension = 19
    object RzTabSheet2: TRzTabSheet
      Caption = 'Communication test'
      object RzLabel1: TRzLabel
        Left = 38
        Top = 42
        Width = 100
        Height = 26
        Caption = 'COM Port: '#13'of Power Supply Unit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel17: TRzLabel
        Left = 193
        Top = 42
        Width = 94
        Height = 26
        Caption = 'COM Port : '#13'of Reference meter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rzlbl52: TRzLabel
        Left = 376
        Top = 48
        Width = 154
        Height = 13
        Caption = 'Serial port(s) setting for multiple'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzSpinEdit1: TRzSpinEdit
        Left = 94
        Top = 32
        Width = 60
        Height = 21
        AllowKeyEdit = True
        Max = 100.000000000000000000
        Min = 1.000000000000000000
        Value = 1.000000000000000000
        TabOrder = 0
      end
      object RzPanel1: TRzPanel
        Left = 32
        Top = 200
        Width = 310
        Height = 141
        BorderOuter = fsGroove
        TabOrder = 1
        object RzLabel2: TRzLabel
          Left = 19
          Top = 19
          Width = 126
          Height = 13
          Caption = 'Repeatablity of openbox: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object RzBitBtn1: TRzBitBtn
          Left = 166
          Top = 91
          Width = 118
          Height = 28
          Action = actTestOpenBox
          Caption = 'start test'
          TabOrder = 0
        end
        object RzSpinEdit2: TRzSpinEdit
          Left = 18
          Top = 48
          Width = 107
          Height = 21
          Max = 100.000000000000000000
          Min = 1.000000000000000000
          Value = 1.000000000000000000
          TabOrder = 1
        end
      end
      object RzSpinEdit7: TRzSpinEdit
        Left = 253
        Top = 32
        Width = 60
        Height = 21
        AllowKeyEdit = True
        Max = 100.000000000000000000
        Min = 1.000000000000000000
        Value = 2.000000000000000000
        TabOrder = 2
      end
      object rzStrgrdMultiPort: TRzStringGrid
        Left = 376
        Top = 72
        Width = 393
        Height = 265
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 3
        OnDrawCell = rzStrgrdComportDrawCell
        OnMouseDown = rzStrgrdComportMouseDown
      end
      object rzchkbMultiSubSys: TRzCheckBox
        Left = 376
        Top = 24
        Width = 119
        Height = 15
        Caption = 'Multiple test systems'
        State = cbUnchecked
        TabOrder = 4
      end
      object rzrdgrp6: TRzRadioGroup
        Left = 32
        Top = 80
        Width = 305
        Caption = 'Reference standard meter'
        ItemIndex = 0
        Items.Strings = (
          'Geny series (K3/K6/K8)'
          'Radian RD series (RD30/RD20...)')
        TabOrder = 5
      end
      object rzpnlSendCommd: TRzPanel
        Left = 808
        Top = 48
        Width = 561
        Height = 201
        AlignmentVertical = avTop
        BorderOuter = fsGroove
        Caption = 'Send command for current controlled relays'
        TabOrder = 6
        object rzlbl55: TRzLabel
          Left = 32
          Top = 34
          Width = 56
          Height = 13
          Caption = 'Serial Port: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzlbl57: TRzLabel
          Left = 32
          Top = 72
          Width = 70
          Height = 13
          Caption = 'Command list: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzlbl58: TRzLabel
          Left = 32
          Top = 104
          Width = 54
          Height = 13
          Caption = 'Command: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzlbl61: TRzLabel
          Left = 247
          Top = 34
          Width = 61
          Height = 13
          Caption = 'Com setting:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzcmbxCommand: TRzComboBox
          Left = 112
          Top = 64
          Width = 145
          Height = 21
          AllowEdit = False
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnClick = rzcmbxCommandClick
          Items.Strings = (
            'disconnect the relay'
            'close the relay')
          Values.Strings = (
            '55 56 00 00 00 01 01 ad'
            '55 56 00 00 00 01 02 ae')
        end
        object rzdtCommand: TRzEdit
          Left = 32
          Top = 128
          Width = 489
          Height = 21
          TabOrder = 1
        end
        object rzbtnSend: TRzButton
          Left = 448
          Top = 160
          Action = actSendCommand
          TabOrder = 2
        end
        object cbprtlstSendCommand: TCboPortList
          Left = 112
          Top = 26
          Width = 89
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          Text = 'com1'
          CommPort = 1
        end
        object rzdtPortSetting: TRzEdit
          Left = 318
          Top = 26
          Width = 89
          Height = 21
          Text = '19200,n,8,2'
          TabOrder = 4
        end
      end
    end
    object TabSheet1: TRzTabSheet
      Caption = 'Power source'
      object RzLabel3: TRzLabel
        Left = 467
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Ratio of U'
      end
      object RzLabel4: TRzLabel
        Left = 660
        Top = 16
        Width = 45
        Height = 13
        Caption = 'Ratio of I'
      end
      object RzLabel5: TRzLabel
        Left = 606
        Top = 16
        Width = 6
        Height = 13
        Caption = 'V'
      end
      object RzLabel6: TRzLabel
        Left = 796
        Top = 16
        Width = 7
        Height = 13
        Caption = 'A'
      end
      object RzLabel16: TRzLabel
        Left = 150
        Top = 16
        Width = 103
        Height = 13
        Caption = 'CONNECTION MODE:'
      end
      object rzlbl5: TRzLabel
        Left = 547
        Top = 357
        Width = 80
        Height = 13
        Caption = 'U Phase (UAB) : '
      end
      object rzlbl7: TRzLabel
        Left = 547
        Top = 389
        Width = 81
        Height = 13
        Caption = 'U Phase (UAC) : '
      end
      object bvl1: TBevel
        Left = 518
        Top = 337
        Width = 321
        Height = 79
      end
      object RzLabel42: TRzLabel
        Left = 20
        Top = 136
        Width = 74
        Height = 13
        Caption = 'Frequency (Hz)'
      end
      object RzCheckGroup1: TRzCheckGroup
        Left = 12
        Top = 3
        Width = 127
        Height = 80
        Caption = 'Phase Group'
        Items.Strings = (
          'Phase A'
          'Phase B'
          'phase C')
        TabOrder = 0
        CheckStates = (
          1
          0
          0)
      end
      object RzNumericEdit1: TRzNumericEdit
        Left = 531
        Top = 8
        Width = 65
        Height = 21
        TabOrder = 1
        IntegersOnly = False
        DisplayFormat = '#.###'
        Value = 120.000000000000000000
      end
      object RzNumericEdit2: TRzNumericEdit
        Left = 716
        Top = 8
        Width = 65
        Height = 21
        TabOrder = 2
        IntegersOnly = False
        DisplayFormat = '#0.###'
        Value = 10.000000000000000000
      end
      object RzComboBox1: TRzComboBox
        Left = 261
        Top = 8
        Width = 196
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = 'P-1 Single phase'
        Items.Strings = (
          'P-1 Single phase'
          'Q-1 Reactive power'
          'P3-3 Active power'
          'Q3-3 Reactive power'
          'Q3-3 Reactive (Cross-connected)'
          'P3-2 Active power'
          'Q3-2 Reactive power'
          'Q3-2 Reactive (Cross-connected)')
        ItemIndex = 0
        Values.Strings = (
          'D'
          'DR'
          '4W'
          '4R'
          '4RX'
          '3W'
          '3R'
          '3RX')
      end
      object RzButton7: TRzButton
        Left = 312
        Top = 83
        Width = 93
        Height = 28
        Action = actRoutine1
        TabOrder = 4
      end
      object RzRadioGroup1: TRzRadioGroup
        Left = 150
        Top = 44
        Width = 138
        Height = 66
        Caption = 'Load charactor'
        ItemIndex = 0
        Items.Strings = (
          'Capacitive load'
          'Inductive load')
        TabOrder = 5
      end
      object RzCheckBox1: TRzCheckBox
        Left = 143
        Top = 244
        Width = 194
        Height = 15
        Caption = 'sync with reference meter(k3/k6/k8)'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object RzButton8: TRzButton
        Left = 310
        Top = 131
        Width = 93
        Height = 28
        Action = actReadMeasuredData
        TabOrder = 7
      end
      object rzedtUPhase1: TRzNumericEdit
        Left = 635
        Top = 353
        Width = 89
        Height = 21
        TabOrder = 8
        IntegersOnly = False
        DisplayFormat = '#0.0###'
        Value = 180.000000000000000000
      end
      object rzedtUPhase2: TRzNumericEdit
        Left = 634
        Top = 383
        Width = 89
        Height = 21
        TabOrder = 9
        IntegersOnly = False
        DisplayFormat = '#0.0###'
      end
      object btnOutput_UPhase: TRzButton
        Left = 737
        Top = 377
        Action = actOutput_UPhase
        TabOrder = 10
      end
      object rzchckbx1: TRzCheckBox
        Left = 736
        Top = 352
        Width = 96
        Height = 15
        Caption = 'Broadcast mode'
        Checked = True
        State = cbChecked
        TabOrder = 11
        WordWrap = True
      end
      object RzNumericEdit7: TRzNumericEdit
        Left = 20
        Top = 152
        Width = 45
        Height = 21
        TabOrder = 12
        IntegersOnly = False
        DisplayFormat = '#.###'
        Value = 50.000000000000000000
      end
      object RzButton22: TRzButton
        Left = 20
        Top = 185
        Width = 95
        Height = 28
        Action = actFreqSet
        TabOrder = 13
      end
      object RzButton10: TRzButton
        Left = 618
        Top = 46
        Width = 97
        Height = 28
        Action = actResetOutput
        TabOrder = 14
      end
      object RzRadioGroup5: TRzRadioGroup
        Left = 147
        Top = 127
        Width = 142
        Height = 106
        Caption = 'RSM option'
        ItemIndex = 0
        Items.Strings = (
          'SZ01A-K3D'
          'SZ01A-K3F'
          'SZ03A-K6D'
          'SZ03A-K8F')
        TabOrder = 15
      end
      object rzbtnSourceOutput: TRzButton
        Left = 496
        Top = 46
        Width = 97
        Height = 28
        Action = actSourceOutput
        TabOrder = 16
      end
      object rzpgcntrlHarmonic: TRzPageControl
        Left = 864
        Top = 144
        Width = 537
        Height = 225
        ActivePage = rzshtSingleHarmonic
        ActivePageDefault = rzshtSingleHarmonic
        TabIndex = 0
        TabOrder = 17
        TabStyle = tsDoubleSlant
        FixedDimension = 19
        object rzshtSingleHarmonic: TRzTabSheet
          Caption = 'Single Harmonic'
          object rzpnlHarmonic: TRzPanel
            Left = 0
            Top = 0
            Width = 533
            Height = 202
            Align = alClient
            BorderOuter = fsGroove
            Caption = 'Harmonic'
            TabOrder = 0
            object rzlbl37: TRzLabel
              Left = 186
              Top = 21
              Width = 66
              Height = 13
              Caption = 'Order(1~21):'
            end
            object rzlbl39: TRzLabel
              Left = 282
              Top = 21
              Width = 93
              Height = 13
              Caption = 'Range(max. 40%):'
            end
            object rzlbl40: TRzLabel
              Left = 416
              Top = 21
              Width = 54
              Height = 13
              Caption = 'Angle ('#34817'):'
            end
            object rzbtnResetWave: TRzButton
              Left = 395
              Top = 126
              Width = 76
              Height = 28
              Action = actResetWave
              TabOrder = 0
            end
            object rzspndtTimes: TRzSpinEdit
              Left = 186
              Top = 45
              Width = 57
              Height = 21
              AllowKeyEdit = True
              Max = 21.000000000000000000
              Min = 1.000000000000000000
              Value = 21.000000000000000000
              TabOrder = 1
            end
            object rzspndtAmplitude: TRzSpinEdit
              Left = 301
              Top = 45
              Width = 57
              Height = 21
              AllowKeyEdit = True
              Decimals = 2
              IntegersOnly = False
              Max = 40.000000000000000000
              Value = 20.220000000000000000
              TabOrder = 2
            end
            object RzNmEdtHarmonice: TRzNumericEdit
              Left = 416
              Top = 45
              Width = 55
              Height = 21
              TabOrder = 3
              IntegersOnly = False
              Max = 360.000000000000000000
              DisplayFormat = '#0.0###'
            end
            object rzbtnHarmonicOutput: TRzButton
              Left = 291
              Top = 126
              Width = 76
              Height = 28
              Action = actWaveOutput
              TabOrder = 4
            end
            object rzrdgrp4: TRzRadioGroup
              Left = 16
              Top = 16
              Width = 145
              Height = 121
              Columns = 2
              ItemIndex = 0
              Items.Strings = (
                'Voltage'
                'Current')
              TabOrder = 5
              object rzlbl38: TRzLabel
                Left = 11
                Top = 45
                Width = 28
                Height = 13
                Caption = 'Type:'
              end
              object rzcmbxHarmoicMode: TRzComboBox
                Left = 11
                Top = 69
                Width = 118
                Height = 21
                AllowEdit = False
                Style = csDropDownList
                ItemHeight = 13
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'General harmonics'
                Items.Strings = (
                  'General harmonics'
                  'Subharmonics'
                  'Odd harmonics'
                  'Even harmonics')
                ItemIndex = 0
                Values.Strings = (
                  '1'
                  '2'
                  '4'
                  '3')
              end
            end
          end
        end
        object rzshtMultipleHarmonic: TRzTabSheet
          Caption = 'Superposition of harmonic'
          object rzStrgrdMultiHarmonic: TRzStringGrid
            Left = 0
            Top = 0
            Width = 345
            Height = 202
            Align = alLeft
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
            TabOrder = 0
            OnDrawCell = rzStrgrdComportDrawCell
            OnMouseDown = rzStrgrdComportMouseDown
          end
          object rzbtnMultipleVoltage: TRzButton
            Left = 361
            Top = 158
            Width = 76
            Height = 28
            Action = actVoltageMultiple
            TabOrder = 1
          end
          object rzbtnCurrentMultiple: TRzButton
            Left = 449
            Top = 158
            Width = 76
            Height = 28
            Action = actCurrentMultiple
            TabOrder = 2
          end
          object rzcmbxScheme4Multiple: TRzComboBox
            Left = 363
            Top = 13
            Width = 78
            Height = 21
            AllowEdit = False
            Style = csDropDownList
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object rzbtnSaveScheme: TRzButton
            Left = 449
            Top = 6
            Width = 76
            Height = 28
            Action = actSaveMultipleScheme
            TabOrder = 4
          end
        end
        object rzsht1p3w: TRzTabSheet
          Caption = '1P3W output'
          object rzpnl5: TRzPanel
            Left = 0
            Top = 0
            Width = 533
            Height = 202
            Align = alClient
            Alignment = taLeftJustify
            AlignmentVertical = avTop
            BorderOuter = fsGroove
            Caption = 'Custom output'
            TabOrder = 0
            object rzlbl36: TRzLabel
              Left = 27
              Top = 24
              Width = 167
              Height = 13
              Caption = 'Output for testing of 1P3W meters'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object rzlbl51: TRzLabel
              Left = 17
              Top = 141
              Width = 85
              Height = 13
              Caption = 'Phase angle ('#34817'):'
            end
            object rzbtn2: TRzButton
              Left = 259
              Top = 59
              Width = 118
              Height = 38
              Action = actOutput1P3W
              TabOrder = 0
            end
            object rzchckgrpLoad: TRzCheckGroup
              Left = 8
              Top = 48
              Width = 209
              Height = 49
              Caption = 'Load output selection'
              Columns = 2
              Items.Strings = (
                'Load of L1'
                'Load of L2')
              TabOrder = 1
              CheckStates = (
                1
                0)
            end
            object RzNmEdt8: TRzNumericEdit
              Left = 106
              Top = 133
              Width = 89
              Height = 21
              Alignment = taCenter
              TabOrder = 2
              IntegersOnly = False
              DisplayFormat = '#0.0###'
              Value = 60.000000000000000000
            end
            object rzbtnactCnPrefixWizard2: TRzButton
              Left = 218
              Top = 126
              Width = 76
              Height = 28
              Action = actOutput_cos1p3W
              TabOrder = 3
            end
          end
        end
      end
      object rzpnlPrecOut: TRzPanel
        Left = 864
        Top = 16
        Width = 537
        Height = 113
        Alignment = taLeftJustify
        AlignmentVertical = avTop
        BorderOuter = fsGroove
        Caption = 'Precise output'
        TabOrder = 18
        object rzlblAccuacy: TRzLabel
          Left = 16
          Top = 21
          Width = 103
          Height = 13
          Caption = 'Setting accuracy(%):'
        end
        object rzlbl50: TRzLabel
          Left = 16
          Top = 45
          Width = 97
          Height = 13
          Caption = 'Wait for stabilize(s):'
        end
        object rzspndtAccuray: TRzSpinEdit
          Left = 127
          Top = 13
          Width = 63
          Height = 21
          AllowKeyEdit = True
          Decimals = 2
          Increment = 0.010000000000000000
          IntegersOnly = False
          Max = 100.000000000000000000
          Value = 0.050000000000000000
          TabOrder = 0
        end
        object rzStrgrdPrecOutput: TRzStringGrid
          Left = 238
          Top = 2
          Width = 297
          Height = 109
          Align = alRight
          DefaultColWidth = 120
          TabOrder = 1
          OnDrawCell = rzstrngrd1DrawCell
        end
        object rzbtnPrecOutput: TRzButton
          Left = 16
          Top = 71
          Width = 57
          Action = actOutputPrecVolt
          TabOrder = 2
        end
        object rzbtnPrecCurr: TRzButton
          Left = 104
          Top = 71
          Width = 57
          Action = actOutputPrecCurr
          TabOrder = 3
        end
        object RzNmEdtStabilize: TRzNumericEdit
          Left = 124
          Top = 40
          Width = 65
          Height = 21
          TabOrder = 4
          IntegersOnly = False
          DisplayFormat = '#.###'
          Value = 15.000000000000000000
        end
      end
      object rzchkbPercentOutput: TRzCheckBox
        Left = 24
        Top = 96
        Width = 95
        Height = 15
        Caption = 'Percentagewise'
        State = cbUnchecked
        TabOrder = 19
      end
      object rzpnlOutput: TRzPanel
        Left = 416
        Top = 88
        Width = 409
        Height = 225
        BorderOuter = fsGroove
        TabOrder = 20
        object RzLabel7: TRzLabel
          Left = 208
          Top = 37
          Width = 11
          Height = 13
          Caption = '%'
        end
        object RzLabel8: TRzLabel
          Left = 27
          Top = 40
          Width = 77
          Height = 13
          Caption = 'Voltage Output:'
        end
        object RzLabel9: TRzLabel
          Left = 207
          Top = 77
          Width = 11
          Height = 13
          Caption = '%'
        end
        object RzLabel10: TRzLabel
          Left = 27
          Top = 80
          Width = 78
          Height = 13
          Caption = 'Current Output:'
        end
        object RzLabel31: TRzLabel
          Left = 17
          Top = 149
          Width = 84
          Height = 13
          Caption = 'Phase angle (UI):'
        end
        object lblPowerFactor: TRzLabel
          Left = 37
          Top = 117
          Width = 68
          Height = 13
          Caption = 'Power Factor:'
        end
        object lblDegree: TRzLabel
          Left = 212
          Top = 149
          Width = 34
          Height = 13
          Caption = 'degree'
        end
        object RzButton1: TRzButton
          Left = 211
          Top = 25
          Width = 76
          Height = 28
          Action = actOutput_Voltage
          TabOrder = 0
        end
        object RzButton2: TRzButton
          Left = 299
          Top = 25
          Width = 76
          Height = 28
          Action = actReset_Voltage
          TabOrder = 1
        end
        object RzButton3: TRzButton
          Left = 211
          Top = 65
          Width = 76
          Height = 28
          Action = actOutput_Current
          TabOrder = 2
        end
        object RzButton4: TRzButton
          Left = 299
          Top = 65
          Width = 76
          Height = 28
          Action = actReset_Current
          TabOrder = 3
        end
        object rzedtPhaAngle: TRzNumericEdit
          Left = 116
          Top = 141
          Width = 89
          Height = 21
          TabOrder = 4
          IntegersOnly = False
          DisplayFormat = '#0.0###'
        end
        object RzButton15: TRzButton
          Left = 211
          Top = 102
          Width = 76
          Height = 28
          Action = actOutput_Cos
          Caption = 'Set'
          TabOrder = 5
        end
        object RzButton16: TRzButton
          Left = 307
          Top = 134
          Width = 74
          Height = 28
          Action = actOutput_Cos_1
          TabOrder = 6
          Visible = False
        end
        object RzSpinEdit3: TRzNumericEdit
          Left = 116
          Top = 32
          Width = 85
          Height = 21
          TabOrder = 7
          IntegersOnly = False
          DisplayFormat = '#0.###'
          Value = 100.000000000000000000
        end
        object RzSpinEdit4: TRzNumericEdit
          Left = 116
          Top = 72
          Width = 85
          Height = 21
          TabOrder = 8
          IntegersOnly = False
          DisplayFormat = '#0.###'
          Value = 100.000000000000000000
        end
        object cbbPowerFactor: TRzComboBox
          Left = 116
          Top = 109
          Width = 77
          Height = 21
          ItemHeight = 13
          TabOrder = 9
          Text = '1.0'
          OnChange = cbbPowerFactorChange
          OnKeyDown = cbbPowerFactorKeyDown
          Items.Strings = (
            '1.0'
            '0.5L'
            '0.8L'
            '0.5C'
            '0.8C')
          ItemIndex = 0
          Values.Strings = (
            ''
            ''
            ''
            ''
            '')
        end
        object edtPhaseB: TRzNumericEdit
          Left = 116
          Top = 169
          Width = 89
          Height = 21
          TabOrder = 10
          IntegersOnly = False
          DisplayFormat = '#0.0###'
        end
        object edtPhaseC: TRzNumericEdit
          Left = 116
          Top = 197
          Width = 89
          Height = 21
          TabOrder = 11
          IntegersOnly = False
          DisplayFormat = '#0.0###'
        end
      end
    end
    object TabSheet6: TRzTabSheet
      Caption = 'Output fine-tune'
      object RzLabel34: TRzLabel
        Left = 3
        Top = 284
        Width = 131
        Height = 13
        Caption = '158 board details as below '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel35: TRzLabel
        Left = 397
        Top = 5
        Width = 122
        Height = 13
        Caption = 'finetune details as below '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RzLabel36: TRzLabel
        Left = 194
        Top = 178
        Width = 50
        Height = 26
        Alignment = taCenter
        Caption = 'second(s) delay'
        WordWrap = True
      end
      object RzBitBtn2: TRzBitBtn
        Left = 157
        Top = 216
        Width = 100
        Height = 33
        Action = actDebugRead158Params
        Caption = 'Read 158 '
        TabOrder = 0
      end
      object rzGrd158Param: TRzStringGrid
        Left = 0
        Top = 304
        Width = 1441
        Height = 132
        TabOrder = 1
        OnDrawCell = rzstrngrd1DrawCell
        ColWidths = (
          60
          60
          60
          60
          60)
        RowHeights = (
          18
          18
          18
          18
          18)
      end
      object btBtnWriteFinetune: TRzBitBtn
        Left = 19
        Top = 122
        Width = 108
        Height = 33
        Action = actDEbugWriteFinetune
        Caption = 'Adjust selected phase'
        TabOrder = 2
      end
      object rzGrdWriteKb: TRzStringGrid
        Left = 397
        Top = 21
        Width = 513
        Height = 94
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 3
        OnDrawCell = rzstrngrd1DrawCell
        ColWidths = (
          60
          60
          60
          60
          60)
        RowHeights = (
          18
          18
          18
          18
          18)
      end
      object rzrdgrpFinetune: TRzRadioGroup
        Left = 151
        Top = 24
        Width = 158
        Height = 141
        Caption = 'Finetune select'
        ItemIndex = 0
        Items.Strings = (
          'Voltage L'
          'Voltage C'
          'Phase Position L'
          'Phase Postion C'
          'Current'
          'Frequency')
        TabOrder = 4
      end
      object RzRadioGroup2: TRzRadioGroup
        Left = 19
        Top = 24
        Width = 109
        Height = 90
        Caption = 'Select Phase'
        ItemIndex = 0
        Items.Strings = (
          'Phase A'
          'Phase B'
          'Phase C')
        TabOrder = 5
      end
      object RzBitBtn3: TRzBitBtn
        Left = 19
        Top = 172
        Width = 108
        Height = 35
        Action = actDebugAutoAdjust
        Caption = 'Adjustment All phases'
        TabOrder = 6
      end
      object StringGridYC1: TStringGridYC
        Left = 397
        Top = 127
        Width = 502
        Height = 122
        ColCount = 10
        RowCount = 4
        TabOrder = 7
        YCType = ycThreePhase
        ColWidths = (
          64
          64
          3
          64
          2
          64
          64
          64
          64
          2)
        RowHeights = (
          24
          22
          22
          20)
      end
      object RzBitBtn4: TRzBitBtn
        Left = 268
        Top = 174
        Width = 108
        Height = 33
        Action = actDebugReadRef
        Caption = 'Read Reference'
        TabOrder = 8
      end
      object RzCheckBox3: TRzCheckBox
        Left = 19
        Top = 217
        Width = 124
        Height = 15
        Caption = 'Directly connect to K8'
        State = cbUnchecked
        TabOrder = 9
      end
      object RzBitBtn5: TRzBitBtn
        Left = 805
        Top = 256
        Width = 88
        Height = 27
        Action = actDebugWriteToINI
        Caption = 'Save finetune'
        TabOrder = 10
      end
      object RzBitBtn6: TRzBitBtn
        Left = 699
        Top = 257
        Width = 88
        Height = 27
        Action = actDebugReadFinetune
        Caption = 'Read Finetune'
        TabOrder = 11
      end
      object RzBitBtn7: TRzBitBtn
        Left = 268
        Top = 216
        Width = 107
        Height = 33
        Action = actDebugSaveFinetuneTo158
        Caption = 'Save'
        TabOrder = 12
      end
      object edtWaitTime: TRzNumericEdit
        Left = 152
        Top = 185
        Width = 39
        Height = 21
        Alignment = taCenter
        MaxLength = 6
        TabOrder = 13
        Max = 360.000000000000000000
        Min = 5.000000000000000000
        DisplayFormat = '#.###'
        Value = 10.000000000000000000
      end
      object rzpnlFinetune: TRzPanel
        Left = 944
        Top = 16
        Width = 369
        Height = 249
        AlignmentVertical = avTop
        BorderOuter = fsGroove
        Caption = 'Finetune of manual input'
        TabOrder = 14
        object lblFinetune: TRzLabel
          Left = 24
          Top = 144
          Width = 75
          Height = 13
          Caption = 'Finetune value:'
        end
        object lbl2: TRzLabel
          Left = 176
          Top = 144
          Width = 43
          Height = 13
          Caption = 'Reading:'
        end
        object rzrdgrpKind: TRzRadioGroup
          Left = 24
          Top = 80
          Width = 177
          Height = 49
          Caption = 'Kind of finetune'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Voltage'
            'Current')
          TabOrder = 0
        end
        object btnGoFinetune: TRzButton
          Left = 176
          Top = 208
          Width = 105
          Action = actGoFinetune
          TabOrder = 1
        end
        object btnWriteFinetune: TRzButton
          Left = 24
          Top = 208
          Action = actWriteFinetune
          TabOrder = 2
        end
        object edtFinetuneValue: TRzNumericEdit
          Left = 24
          Top = 168
          Width = 121
          Height = 21
          Alignment = taCenter
          TabOrder = 3
          CheckRange = True
          IntegersOnly = False
          Max = 1.050000000000000000
          Min = 0.950000000000000000
          DisplayFormat = '#0.0#####'
          Value = 1.000000000000000000
        end
        object edtReading: TRzNumericEdit
          Left = 176
          Top = 168
          Width = 121
          Height = 21
          Alignment = taCenter
          TabOrder = 4
          IntegersOnly = False
          DisplayFormat = '#0.0#####'
          Value = 220.002300000000000000
        end
        object rzrdgrpPhase: TRzRadioGroup
          Left = 24
          Top = 24
          Width = 297
          Height = 49
          Caption = 'Phase selection'
          Columns = 3
          ItemIndex = 0
          Items.Strings = (
            'Phase A'
            'Phase B'
            'Phase C')
          TabOrder = 5
          OnClick = rzrdgrpPhaseClick
        end
      end
    end
    object rzsht158Readings: TRzTabSheet
      Caption = 'Feedback board-158'
      object rzcmbxAddr: TRzComboBox
        Left = 32
        Top = 40
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'Phase A'
        Items.Strings = (
          'Phase A'
          'Phase B'
          'Phase C')
        ItemIndex = 0
        Values.Strings = (
          '220'
          '221'
          '222')
      end
      object rzcmbxLevel: TRzComboBox
        Left = 216
        Top = 40
        Width = 161
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'CMD 40H'
        OnClick = rzcmbxLevelClick
        Items.Strings = (
          'Runtime parameters'
          'Level 0'
          'Level 1'
          'Level 2'
          'Level 3'
          'Level 4'
          'Level 5'
          'Level 6'
          'Level 7')
        Values.Strings = (
          
            'DC 52 2B 40 40 00 00 40 47 7C 69 42 00 2B 73 42 87 5D 33 41 20 0' +
            '0 00 43 7A 00 00 41 20 00 00 43 5C 00 00 42 70 00 00 00 00 00 01' +
            ' 00 00 00 4C 36'
          
            'DD 49 44 56 45 52 33 2E 31 2D 32 3D 8F 5C 29 42 87 F8 05 3F 80 0' +
            '0 00 40 74 38 6B 41 B8 00 00 41 25 24 0A 42 70 00 00 41 D0 00 00' +
            ' 00 00 00 00 3F 80 00 00 00 00 00 00 00 00 00 00 46 96 00 00 42 ' +
            'BE 00 00 3C 23 D7 0A 7E 64'
          
            'DD 4A 54 42 C9 D5 5C 42 1F 5C D0 00 00 00 00 42 48 00 00 3F 80 0' +
            '0 00 42 66 EB 85 3F 80 00 00 41 B8 00 00 00 00 00 00 42 70 00 00' +
            ' 3F 80 00 00 3F 99 99 9A 00 00 00 00 42 88 38 A7 42 88 38 A7 40 ' +
            '74 80 65 41 25 80 C7 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0' +
            '0 00 0B 77'
          
            'DD 4B 24 42 C9 D5 5C 3F 80 00 00 00 00 00 00 3F 80 00 00 00 00 0' +
            '0 00 00 00 00 00 3F 7C ED 92 00 00 00 00 00 00 00 00 26 65'
          
            'DD 4C 28 42 1F 5C D0 3F 80 00 00 00 00 00 00 3F 80 00 00 00 00 0' +
            '0 00 00 00 00 00 3F 80 00 00 3F 82 9C 77 00 00 00 00 3F 80 00 00' +
            ' 09 F7'
          
            'DD 4D 30 42 C9 D5 5C 42 1F 5C D0 00 00 00 00 3F 80 00 00 3F 7A E' +
            '1 48 3D CC CC CD 00 00 00 00 00 00 00 00 3D 8F 5C 29 00 00 00 00' +
            ' 46 2D 9C 00 00 00 00 00 17 CE'
          
            'DC 4E 3C 42 F0 00 00 42 C8 00 00 41 C8 00 00 41 20 00 00 40 A0 0' +
            '0 00 40 20 00 00 3F 80 00 00 3E 80 00 00 3D CC CC CD 3C 23 D7 0A' +
            ' 3A 83 12 6F 42 F0 00 00 41 40 00 00 3F 99 99 9A 00 00 00 00 B0 ' +
            '6F'
          
            'DC 4F 38 43 96 00 00 42 66 EB 85 00 00 00 00 00 00 00 00 00 00 0' +
            '0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00' +
            ' 00 00 00 00 43 7A 00 00 42 66 EB 85 00 00 00 00 9D E3'
          
            'DC 50 34 3D 8F 5C 29 3D 8F 5C 29 3D 8F 5C 29 3D 8F 5C 29 3D 8F 5' +
            'C 29 3D 8F 5C 29 3D 8F 5C 29 3D 23 D7 11 3D 8F 5C 29 3D 8F 5C 29' +
            ' 42 70 00 00 41 C8 00 00 42 84 A5 61 DC 07')
      end
      object redtData: TRzRichEdit
        Left = 24
        Top = 96
        Width = 969
        Height = 169
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Lines.Strings = (
          
            'DC 40 1C 42 14 00 00 40 A9 CD 36 41 4C AC A9 42 8A 92 87 3F 80 0' +
            '0 00 43 7A 00 00 01 00 00 00 E9 3B')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object rzbtnRead: TRzButton
        Left = 408
        Top = 32
        Action = act158Readings
        TabOrder = 3
      end
      object rzbtnParseText: TRzButton
        Left = 24
        Top = 275
        Width = 89
        Height = 33
        Action = act158ReadingTest
        TabOrder = 4
      end
      object rzchkbReadingSample: TRzCheckBox
        Left = 216
        Top = 64
        Width = 94
        Height = 15
        Caption = 'Display samples'
        State = cbUnchecked
        TabOrder = 5
      end
      object rzbtn158ReadingsAll: TRzButton
        Left = 504
        Top = 32
        Width = 97
        Action = act158ReadingsAll
        TabOrder = 6
      end
      object rzchkbLog2xls: TRzCheckBox
        Left = 704
        Top = 32
        Width = 94
        Height = 15
        Caption = 'Log to excel file'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object rzbtnSave2xls: TRzButton
        Left = 824
        Top = 32
        Width = 97
        Action = act158Save2xls
        TabOrder = 8
      end
      object rzpnlCheckTu: TRzPanel
        Left = 128
        Top = 275
        Width = 329
        Height = 118
        Hint = 
          'Mainboard power amplifier voltage (Tu), set voltage value (Vs), ' +
          'booster ratio (1:10), conversion factor I =1.45'#13#10'Vr = (TU-vs / 1' +
          '0) / 1.45'#13#10'Calculated on general situation, 0.2 O / 50 w the big' +
          'gest withstand voltage as metal resistance (Vr) = 4 v, the calor' +
          'ific value has reached 80% of its nominal value.'#13#10'When Vr > 3, r' +
          'emind the user that the load is too heavy'#13#10'When Vr > 4, force th' +
          'e source to drop through the software|Mainboard power amplifier ' +
          'voltage (Tu), set voltage value (Vs), booster ratio (1:10), conv' +
          'ersion factor I =1.45'#13#10'Vr = (TU-vs / 10) / 1.45'#13#10'Calculated on g' +
          'eneral situation, 0.2 O / 50 w the biggest withstand voltage as ' +
          'metal resistance (Vr) = 4 v, the calorific value has reached 80%' +
          ' of its nominal value.'#13#10'When Vr > 3, remind the user that the lo' +
          'ad is too heavy'#13#10'When Vr > 4, force the source to drop through t' +
          'he software'
        Alignment = taLeftJustify
        AlignmentVertical = avTop
        BorderOuter = fsGroove
        Caption = 'Check Tu for protection'
        TabOrder = 9
        object rzlblCoeff: TRzLabel
          Left = 5
          Top = 24
          Width = 51
          Height = 26
          Caption = 'Coversion factor i: '
          WordWrap = True
        end
        object RzNmEdtCoeff: TRzNumericEdit
          Left = 62
          Top = 30
          Width = 67
          Height = 21
          TabOrder = 0
          IntegersOnly = False
          DisplayFormat = '#0.0###'
          Value = 1.450000000000000000
        end
        object rzbtnCheckTu: TRzButton
          Left = 172
          Top = 11
          Width = 139
          Height = 30
          Action = act158CheckTu
          TabOrder = 1
        end
        object rzbtnRuntimeCheck: TRzButton
          Left = 171
          Top = 54
          Width = 139
          Height = 35
          Action = act158RuntimeCheck
          TabOrder = 2
        end
      end
      object rzStrgrdLoadCap: TRzStringGrid
        Left = 472
        Top = 274
        Width = 513
        Height = 135
        DefaultColWidth = 80
        TabOrder = 10
        OnDrawCell = rzstrngrd1DrawCell
      end
    end
    object rztbshtOnClick: TRzTabSheet
      TabVisible = False
      Caption = 'Auto Adjustment'
      object rzlbl17: TRzLabel
        Left = 16
        Top = 265
        Width = 186
        Height = 25
        Caption = 'Accuracy of setting:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rzlbl16: TRzLabel
        Left = 176
        Top = 305
        Width = 133
        Height = 25
        Caption = '% percentage'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rzpnl1: TRzPanel
        Left = 0
        Top = 162
        Width = 1441
        Height = 81
        Align = alTop
        Alignment = taRightJustify
        AlignmentVertical = avBottom
        BorderOuter = fsGroove
        Caption = 'phase B'
        TabOrder = 0
        object rzlbl4: TRzLabel
          Left = 16
          Top = 16
          Width = 99
          Height = 13
          Caption = 'Given voltage value:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object rzlbl_U3: TRzLabel
          Left = 16
          Top = 48
          Width = 79
          Height = 13
          Caption = 'Feedback value:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object rzlbl6: TRzLabel
          Left = 264
          Top = 16
          Width = 98
          Height = 13
          Caption = 'Given current value:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object rzlbl_I3: TRzLabel
          Left = 264
          Top = 48
          Width = 79
          Height = 13
          Caption = 'Feedback value:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object rzedt_U3: TRzNumericEdit
          Left = 123
          Top = 10
          Width = 110
          Height = 31
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          IntegersOnly = False
          DisplayFormat = '#.###'
          Value = 220.000000000000000000
        end
        object rzedt_I3: TRzNumericEdit
          Left = 371
          Top = 10
          Width = 110
          Height = 31
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          IntegersOnly = False
          DisplayFormat = '#.###'
          Value = 5.000000000000000000
        end
      end
      object rzpnl2: TRzPanel
        Left = 0
        Top = 0
        Width = 1441
        Height = 81
        Align = alTop
        Alignment = taRightJustify
        AlignmentVertical = avBottom
        BorderOuter = fsGroove
        Caption = 'phase R'
        TabOrder = 1
        object rzlbl8: TRzLabel
          Left = 16
          Top = 16
          Width = 99
          Height = 13
          Caption = 'Given voltage value:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzlbl_U1: TRzLabel
          Left = 16
          Top = 48
          Width = 79
          Height = 13
          Caption = 'Feedback value:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzlbl10: TRzLabel
          Left = 264
          Top = 16
          Width = 98
          Height = 13
          Caption = 'Given current value:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzlbl_I1: TRzLabel
          Left = 264
          Top = 48
          Width = 79
          Height = 13
          Caption = 'Feedback value:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzedt_U1: TRzNumericEdit
          Left = 123
          Top = 10
          Width = 110
          Height = 31
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          IntegersOnly = False
          DisplayFormat = '#.###'
          Value = 220.000000000000000000
        end
        object rzedt_I1: TRzNumericEdit
          Left = 371
          Top = 10
          Width = 110
          Height = 31
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          IntegersOnly = False
          DisplayFormat = '#.###'
          Value = 5.000000000000000000
        end
      end
      object rzpnl3: TRzPanel
        Left = 0
        Top = 81
        Width = 1441
        Height = 81
        Align = alTop
        Alignment = taRightJustify
        AlignmentVertical = avBottom
        BorderOuter = fsGroove
        Caption = 'phase Y'
        TabOrder = 2
        object rzlbl12: TRzLabel
          Left = 16
          Top = 16
          Width = 99
          Height = 13
          Caption = 'Given voltage value:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzlbl_U2: TRzLabel
          Left = 16
          Top = 48
          Width = 79
          Height = 13
          Caption = 'Feedback value:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzlbl14: TRzLabel
          Left = 264
          Top = 16
          Width = 98
          Height = 13
          Caption = 'Given current value:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzlbl_I2: TRzLabel
          Left = 264
          Top = 48
          Width = 79
          Height = 13
          Caption = 'Feedback value:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzedt_U2: TRzNumericEdit
          Left = 123
          Top = 10
          Width = 110
          Height = 31
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          IntegersOnly = False
          DisplayFormat = '#.###'
          Value = 220.000000000000000000
        end
        object rzedt_I2: TRzNumericEdit
          Left = 371
          Top = 10
          Width = 110
          Height = 31
          Alignment = taCenter
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          IntegersOnly = False
          DisplayFormat = '#.###'
          Value = 5.000000000000000000
        end
      end
      object btnOneClickOn: TRzButton
        Left = 600
        Top = 278
        Width = 140
        Height = 35
        Caption = 'Adjust on'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object rzedt9: TRzNumericEdit
        Left = 16
        Top = 297
        Width = 150
        Height = 33
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        IntegersOnly = False
        DisplayFormat = '0.####'
      end
      object rzrdgrp1: TRzRadioGroup
        Left = 328
        Top = 264
        Width = 193
        Height = 65
        Caption = 'load-characteristic'
        ItemIndex = 1
        Items.Strings = (
          'Inductive (mechanical meters)'
          'Capacitive (electrical meters)')
        TabOrder = 5
      end
      object btnSaveAdjustment: TRzButton
        Left = 752
        Top = 278
        Width = 140
        Height = 35
        Caption = 'Save Adjustment'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
    end
    object TabSheet4: TRzTabSheet
      Caption = 'Err. Calculator'
      object RzLabel26: TRzLabel
        Left = 24
        Top = 24
        Width = 83
        Height = 13
        Caption = 'Sampling pulse(s)'
      end
      object RzLabel27: TRzLabel
        Left = 128
        Top = 24
        Width = 129
        Height = 13
        Caption = 'DUT'#39's Constant (imp k/Wh)'
      end
      object RzLabel28: TRzLabel
        Left = 272
        Top = 24
        Width = 133
        Height = 13
        Caption = 'RSM '#39's Constant (imp k/Wh)'
      end
      object RzLabel29: TRzLabel
        Left = 24
        Top = 74
        Width = 60
        Height = 13
        Caption = 'DUT position'
        CenterPoint = cpLeftCenter
      end
      object RzLabel30: TRzLabel
        Left = 121
        Top = 69
        Width = 106
        Height = 13
        Caption = 'DUT input channel no.'
      end
      object rzlblErrSetting: TRzLabel
        Left = 553
        Top = 8
        Width = 146
        Height = 13
        Caption = 'Error Calculator Setting in EEM'
      end
      object rzedtHeadPos: TRzNumericEdit
        Left = 23
        Top = 94
        Width = 82
        Height = 21
        Alignment = taCenter
        TabOrder = 0
        DisplayFormat = ',0;(,0)'
        Value = 1.000000000000000000
      end
      object rzedtCircleNbr: TRzNumericEdit
        Left = 24
        Top = 43
        Width = 81
        Height = 21
        Alignment = taCenter
        TabOrder = 1
        DisplayFormat = ',0;(,0)'
        Value = 1.000000000000000000
      end
      object rzedtCx: TRzNumericEdit
        Left = 127
        Top = 43
        Width = 82
        Height = 21
        Alignment = taCenter
        TabOrder = 2
        IntegersOnly = False
        DisplayFormat = '#.,###'
        Value = 1000.000000000000000000
      end
      object rzedtCo: TRzNumericEdit
        Left = 271
        Top = 40
        Width = 106
        Height = 21
        Alignment = taCenter
        TabOrder = 3
        IntegersOnly = False
        DisplayFormat = '#.,##'
        Value = 100000000.000000000000000000
      end
      object RzButton11: TRzButton
        Left = 263
        Top = 90
        Action = actSetErr
        Caption = 'Set Err%'
        TabOrder = 4
      end
      object RzButton14: TRzButton
        Left = 359
        Top = 90
        Action = actReadErr
        Caption = 'Read Err%'
        TabOrder = 5
      end
      object rzedtAccessNbr: TRzNumericEdit
        Left = 121
        Top = 94
        Width = 88
        Height = 21
        Alignment = taCenter
        TabOrder = 6
        DisplayFormat = ',0;(,0)'
        Value = 1.000000000000000000
      end
      object RzPanel5: TRzPanel
        Left = 24
        Top = 127
        Width = 257
        Height = 113
        BorderOuter = fsGroove
        TabOrder = 7
        object RzLabel38: TRzLabel
          Left = 15
          Top = 23
          Width = 48
          Height = 13
          Caption = 'Duration: '
        end
        object RzLabel39: TRzLabel
          Left = 15
          Top = 52
          Width = 41
          Height = 13
          Caption = 'Sample: '
        end
        object RzLabel40: TRzLabel
          Left = 142
          Top = 23
          Width = 39
          Height = 13
          Caption = 'seconds'
        end
        object RzLabel41: TRzLabel
          Left = 143
          Top = 52
          Width = 18
          Height = 13
          Caption = 'Nos'
        end
        object edtDuration: TRzNumericEdit
          Left = 70
          Top = 15
          Width = 65
          Height = 21
          TabOrder = 0
          DisplayFormat = ',0;(,0)'
          Value = 60.000000000000000000
        end
        object edtSamples: TRzNumericEdit
          Left = 70
          Top = 44
          Width = 65
          Height = 21
          TabOrder = 1
          DisplayFormat = ',0;(,0)'
          Value = 1.000000000000000000
        end
        object btnSetCreeping: TRzButton
          Left = 15
          Top = 78
          Width = 92
          Action = actSetCreepingTest
          TabOrder = 2
        end
        object btnSetStarting: TRzButton
          Left = 140
          Top = 78
          Width = 85
          Action = actSetStartingTest
          TabOrder = 3
        end
      end
      object rzdtCommaOfSequ: TRzEdit
        Left = 553
        Top = 28
        Width = 329
        Height = 21
        Text = '1,2,3,5'
        TabOrder = 8
      end
      object rzbtnGetSequOfPos: TRzButton
        Left = 896
        Top = 19
        Width = 122
        Height = 30
        Action = actGetSequOfPos
        TabOrder = 9
      end
      object RzPanel8: TRzPanel
        Left = 296
        Top = 128
        Width = 233
        Height = 111
        BorderOuter = fsGroove
        TabOrder = 10
        object rzlbl24: TRzLabel
          Left = 15
          Top = 23
          Width = 61
          Height = 13
          Caption = 'Clock Freq.: '
        end
        object rzlbl25: TRzLabel
          Left = 151
          Top = 23
          Width = 12
          Height = 13
          Caption = 'Hz'
        end
        object rzlbl26: TRzLabel
          Left = 15
          Top = 51
          Width = 57
          Height = 13
          Caption = 'Input chn.: '
        end
        object rzbtnClockPulsingTest: TRzButton
          Left = 13
          Top = 77
          Width = 130
          Action = actTimingErrorTest
          TabOrder = 0
        end
        object RzNmEdtClockFre: TRzNumericEdit
          Left = 78
          Top = 15
          Width = 65
          Height = 21
          Alignment = taCenter
          TabOrder = 1
          DisplayFormat = ',0;(,0)'
          Value = 1.000000000000000000
        end
        object RzNmEdt1: TRzNumericEdit
          Left = 78
          Top = 43
          Width = 65
          Height = 21
          Alignment = taCenter
          TabOrder = 2
          DisplayFormat = ',0;(,0)'
          Value = 7.000000000000000000
        end
      end
      object rzpnlDailTest: TRzPanel
        Left = 553
        Top = 167
        Width = 745
        Height = 261
        Alignment = taLeftJustify
        AlignmentVertical = avTop
        BorderOuter = fsGroove
        Caption = 'For Dail test / Maximum demand test'
        TabOrder = 11
        object rzlblAccumValue: TRzLabel
          Left = 16
          Top = 22
          Width = 136
          Height = 13
          Caption = 'Ref. impulses accumulation: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzlblCurrPower: TRzLabel
          Left = 16
          Top = 42
          Width = 139
          Height = 13
          Caption = ' Power accumulation:  (KWH)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzlbl41: TRzLabel
          Left = 163
          Top = 126
          Width = 39
          Height = 13
          Caption = 'seconds'
        end
        object rzlbl42: TRzLabel
          Left = 14
          Top = 126
          Width = 68
          Height = 13
          Caption = 'Duration time:'
        end
        object rzlblMeanPower: TRzLabel
          Left = 16
          Top = 64
          Width = 96
          Height = 13
          Caption = ' Mean Power:  (KW)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzlbl53: TRzLabel
          Left = 14
          Top = 94
          Width = 67
          Height = 13
          Caption = 'Dosage(kwh):'
        end
        object rzbtnSetDailTest: TRzButton
          Left = 15
          Top = 162
          Width = 90
          Action = actSetDailTest
          TabOrder = 0
        end
        object RzNmEdtDtTime: TRzNumericEdit
          Left = 86
          Top = 118
          Width = 68
          Height = 21
          TabOrder = 1
          CalculatorVisible = True
          DisplayFormat = ',0;(,0)'
          Value = 60.000000000000000000
        end
        object rzStrgrdErrsDailTest: TRzStringGrid
          Left = 281
          Top = 2
          Width = 462
          Height = 257
          Align = alRight
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
          TabOrder = 2
          OnDrawCell = rzStrgrdComportDrawCell
          OnMouseDown = rzStrgrdComportMouseDown
        end
        object rzchkbPlusingError: TRzCheckBox
          Left = 160
          Top = 150
          Width = 79
          Height = 15
          Caption = 'Pulsing error'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
        object rzchkbAll: TRzCheckBox
          Left = 160
          Top = 174
          Width = 61
          Height = 15
          Action = actErrCalcSeleAll
          State = cbUnchecked
          TabOrder = 4
        end
        object RzNmEdtDosage: TRzNumericEdit
          Left = 86
          Top = 88
          Width = 83
          Height = 21
          Alignment = taCenter
          TabOrder = 5
          OnChange = RzNmEdtDosageChange
          IntegersOnly = False
          DisplayFormat = '#0.#####'
          Value = 1.000000000000000000
        end
        object rzchkbRelay: TRzCheckBox
          Left = 160
          Top = 198
          Width = 77
          Height = 28
          Caption = 'Cut off the current loop'
          Checked = True
          State = cbChecked
          TabOrder = 6
          WordWrap = True
          OnClick = actErrCalcSeleAllExecute
        end
      end
      object rzpnl6: TRzPanel
        Left = 553
        Top = 72
        Width = 521
        Height = 89
        AlignmentVertical = avTop
        BorderOuter = fsGroove
        Caption = 'High frequency pulsing test (Automatic frequency division)'
        TabOrder = 12
        object rzlbl43: TRzLabel
          Left = 9
          Top = 28
          Width = 91
          Height = 13
          Caption = 'Test pulses (>20K)'
        end
        object rzlbl44: TRzLabel
          Left = 128
          Top = 28
          Width = 93
          Height = 13
          Caption = 'Frequency division:'
        end
        object rzlbl45: TRzLabel
          Left = 256
          Top = 28
          Width = 67
          Height = 13
          Caption = 'Actual pulses:'
        end
        object rzbtnSetErr2: TRzButton
          Left = 375
          Top = 38
          Width = 130
          Action = actSetErr2
          TabOrder = 0
        end
        object RzNmEdt4: TRzNumericEdit
          Left = 9
          Top = 44
          Width = 89
          Height = 21
          TabOrder = 1
          OnChange = RzNmEdt4Change
          DisplayFormat = ',0;(,0)'
          Value = 80000.000000000000000000
        end
        object RzNmEdt5: TRzNumericEdit
          Left = 128
          Top = 44
          Width = 89
          Height = 21
          Enabled = False
          TabOrder = 2
          DisplayFormat = ',0;(,0)'
          Value = 40.000000000000000000
        end
        object RzNmEdt6: TRzNumericEdit
          Left = 256
          Top = 44
          Width = 89
          Height = 21
          Enabled = False
          TabOrder = 3
          DisplayFormat = ',0;(,0)'
          Value = 2000.000000000000000000
        end
      end
      object rzrdgrpSwitching: TRzRadioGroup
        Left = 1081
        Top = 8
        Width = 217
        Height = 153
        Caption = 'Circuit-loop Switching'
        ItemIndex = 0
        Items.Strings = (
          '#1 current loop'
          '#2 current loop'
          '#3 current loop'
          'Neutral current loop')
        TabOrder = 13
        object rzbtnSwitchLoop: TRzButton
          Left = 15
          Top = 112
          Action = actSwitchCurrLoop
          TabOrder = 0
        end
      end
      object rzpnl7: TRzPanel
        Left = 24
        Top = 245
        Width = 505
        Height = 184
        BorderOuter = fsGroove
        TabOrder = 14
        object rzlbl56: TRzLabel
          Left = 8
          Top = 10
          Width = 135
          Height = 13
          Caption = ' Power accumulation:  (kwh)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object rzStrgrdCreepTest: TRzStringGrid
          Left = 2
          Top = 31
          Width = 501
          Height = 151
          Align = alBottom
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
          TabOrder = 0
          OnDrawCell = rzStrgrdComportDrawCell
          OnMouseDown = rzStrgrdComportMouseDown
          ColWidths = (
            60
            60
            60
            60
            60)
        end
        object rzchkbIStd: TRzCheckBox
          Left = 400
          Top = 8
          Width = 90
          Height = 15
          Caption = 'IS 13779:2020'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
    end
    object rzshtAccuracyTest: TRzTabSheet
      Caption = 'Test sequence'
      object rzspltr1: TRzSplitter
        Left = 0
        Top = 0
        Width = 1441
        Height = 436
        Position = 399
        Percent = 28
        SplitterWidth = 6
        Align = alClient
        BorderOuter = fsGroove
        TabOrder = 0
        BarSize = (
          403
          4
          409
          432)
        UpperLeftControls = (
          rzgrpbr1)
        LowerRightControls = (
          rzpnlTestParam
          rzpnlDisplay
          rzpnlButton)
        object rzgrpbr1: TRzGroupBar
          Left = 0
          Top = 0
          Width = 399
          Height = 428
          GradientColorStart = clBtnFace
          GradientColorStop = clBtnShadow
          GroupBorderSize = 8
          Align = alClient
          Color = clBtnShadow
          ParentColor = False
          TabOrder = 0
          object rzgrp1: TRzGroup
            Items = <
              item
                Action = actTestSeqXlsOpen
              end>
            Opened = True
            OpenedHeight = 47
            DividerVisible = False
            Caption = 'Open & read from excel file'
            ParentColor = False
          end
          object rzgrp2: TRzGroup
            Items = <>
            Opened = True
            OpenedHeight = 202
            DividerVisible = False
            Caption = 'Show test points'
            ParentColor = False
            object rztrvw1: TRzTreeView
              Left = 1
              Top = 20
              Width = 381
              Height = 181
              SelectionPen.Color = clBtnShadow
              Align = alClient
              Indent = 19
              TabOrder = 0
              Items.Data = {
                030000002C0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
                135465737420706F696E74323A5761726D2055503B0000000000000000000000
                FFFFFFFFFFFFFFFF0000000000000000225465737420706F696E74333A416374
                697665203A205374617274696E672D546573743D0000000000000000000000FF
                FFFFFFFFFFFFFF0000000004000000245465737420706F696E74343A41637469
                7665203A2041636375726163795F496D706F7274210000000000000000000000
                FFFFFFFFFFFFFFFF000000000000000008312549622055504621000000000000
                0000000000FFFFFFFFFFFFFFFF00000000000000000832254962205550462100
                00000000000000000000FFFFFFFFFFFFFFFF0000000000000000083525496220
                555046220000000000000000000000FFFFFFFFFFFFFFFF000000000000000009
                313025496220555046}
            end
          end
          object rzgrp3: TRzGroup
            Items = <
              item
                Action = actTestSequAddNew
              end
              item
                Action = actTestSequModify
              end
              item
                Action = actTestSequDele
              end>
            Opened = True
            OpenedHeight = 87
            DividerVisible = False
            Caption = 'Manage test points'
            ParentColor = False
          end
        end
        object rzpnlTestParam: TRzPanel
          Left = 0
          Top = 0
          Width = 1028
          Height = 105
          Align = alTop
          BorderOuter = fsGroove
          Caption = 'Test parameter'
          TabOrder = 0
        end
        object rzpnlDisplay: TRzPanel
          Left = 0
          Top = 105
          Width = 1028
          Height = 262
          Align = alClient
          BorderOuter = fsGroove
          Caption = 'Error display'
          TabOrder = 1
        end
        object rzpnlButton: TRzPanel
          Left = 0
          Top = 367
          Width = 1028
          Height = 61
          Align = alBottom
          BorderOuter = fsGroove
          Caption = 'button'
          TabOrder = 2
          object rzbtnTestSequBegin: TRzButton
            Left = 48
            Top = 16
            Action = actTestSequBegin
            TabOrder = 0
          end
        end
      end
    end
    object TabSheet3: TRzTabSheet
      TabVisible = False
      Caption = 'Self-Excitation Testing'
      object RzLabel18: TRzLabel
        Left = 38
        Top = 27
        Width = 67
        Height = 13
        Caption = 'Voltage ouput'
      end
      object RzLabel19: TRzLabel
        Left = 217
        Top = 32
        Width = 6
        Height = 13
        Caption = 'V'
      end
      object RzLabel20: TRzLabel
        Left = 19
        Top = 67
        Width = 93
        Height = 13
        Caption = 'A Phase reference:'
      end
      object RzLabel21: TRzLabel
        Left = 217
        Top = 72
        Width = 6
        Height = 13
        Caption = 'V'
      end
      object RzLabel23: TRzLabel
        Left = 293
        Top = 27
        Width = 51
        Height = 13
        Caption = 'Amplitude:'
      end
      object RzLabel24: TRzLabel
        Left = 423
        Top = 27
        Width = 11
        Height = 13
        Caption = '%'
      end
      object RzLabel22: TRzLabel
        Left = 269
        Top = 67
        Width = 98
        Height = 13
        Caption = 'Voltage percentage:'
      end
      object RzLabel25: TRzLabel
        Left = 423
        Top = 67
        Width = 11
        Height = 13
        Caption = '%'
      end
      object rzedtU0: TRzNumericEdit
        Left = 128
        Top = 24
        Width = 81
        Height = 21
        TabOrder = 0
        IntegersOnly = False
        DisplayFormat = '#0.0###'
        Value = 220.000000000000000000
      end
      object rzedtU1: TRzNumericEdit
        Left = 128
        Top = 64
        Width = 81
        Height = 21
        TabOrder = 1
        IntegersOnly = False
        DisplayFormat = '#0.0###'
      end
      object RzButton12: TRzButton
        Left = 38
        Top = 200
        Action = actRaiseV
        TabOrder = 2
      end
      object RzButton13: TRzButton
        Left = 134
        Top = 200
        Action = actAdjustV
        TabOrder = 3
      end
      object RzCheckGroup2: TRzCheckGroup
        Left = 25
        Top = 91
        Width = 185
        Height = 94
        Caption = 'Phase Group'
        Items.Strings = (
          'Phase A'
          'Phase B'
          'phase C')
        TabOrder = 4
        CheckStates = (
          1
          1
          1)
      end
      object rzspndtU: TRzSpinEdit
        Left = 359
        Top = 64
        Width = 58
        Height = 21
        AllowKeyEdit = True
        CheckRange = True
        Increment = 10.000000000000000000
        Max = 100.000000000000000000
        Min = 10.000000000000000000
        Value = 50.000000000000000000
        TabOrder = 5
      end
      object rzspndtAmp: TRzSpinEdit
        Left = 359
        Top = 24
        Width = 58
        Height = 21
        AllowKeyEdit = True
        CheckRange = True
        Increment = 10.000000000000000000
        Max = 100.000000000000000000
        Min = 10.000000000000000000
        Value = 50.000000000000000000
        TabOrder = 6
      end
    end
    object TabSheet5: TRzTabSheet
      TabVisible = False
      Caption = 'Clamp Calc'
      object rzlbl2: TRzLabel
        Left = 466
        Top = 56
        Width = 36
        Height = 13
        Caption = 'Voltage'
      end
      object rzlbl1: TRzLabel
        Left = 437
        Top = 24
        Width = 65
        Height = 13
        Caption = 'Terminal type'
      end
      object rzlbl3: TRzLabel
        Left = 277
        Top = 16
        Width = 102
        Height = 26
        Caption = 'serial port for instrument via RS485'
        WordWrap = True
      end
      object rzchckgrp1: TRzCheckGroup
        Left = 8
        Top = 6
        Width = 137
        Height = 145
        Caption = 'position options'
        Items.Strings = (
          'pos.1 (addr: 1)'
          'pos.2'
          'pos.3'
          'pos.4'
          'pos.5'
          'pos.6')
        TabOrder = 0
        CheckStates = (
          1
          0
          0
          0
          0
          0)
      end
      object rzstrngrd1: TRzStringGrid
        Left = 0
        Top = 257
        Width = 1441
        Height = 179
        Align = alBottom
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 1
        OnDrawCell = rzstrngrd1DrawCell
        ColWidths = (
          60
          60
          60
          60
          60)
        RowHeights = (
          18
          18
          18
          18
          18)
      end
      object btnClampTestOn: TRzButton
        Left = 277
        Top = 78
        Action = actClampTestOn
        TabOrder = 2
      end
      object btnClampTestOff: TRzButton
        Left = 360
        Top = 78
        Action = actClampTestOff
        TabOrder = 3
      end
      object rzcmbx1: TRzComboBox
        Left = 515
        Top = 48
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 4
        Text = '100 V'
        Items.Strings = (
          '100 V'
          '220 V'
          '380 V'
          '57.7 V')
        ItemIndex = 0
        Values.Strings = (
          '100'
          '220'
          '380'
          '57.7')
      end
      object rzrdgrp2: TRzRadioGroup
        Left = 150
        Top = 8
        Width = 115
        Height = 143
        Caption = 'check point'
        ItemIndex = 0
        Items.Strings = (
          'full range'
          'lineal'
          'capacitive'
          'angle line')
        TabOrder = 5
      end
      object rzcmbx2: TRzComboBox
        Left = 515
        Top = 16
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 6
        Text = 'Direct 5A'
        Items.Strings = (
          'Direct 1A'
          'Direct 5A'
          'Clamp CT 1A'
          'Clamp CT 5A'
          'Clamp CT 20A'
          'Clamp CT 100A')
        ItemIndex = 1
        Values.Strings = (
          '1'
          '5'
          '1'
          '5'
          '20'
          '100')
      end
      object btnClampCheckResult: TRzButton
        Left = 696
        Top = 118
        Width = 97
        Action = actGetResult
        TabOrder = 7
      end
      object cbprtlst1: TCboPortList
        Left = 277
        Top = 48
        Width = 121
        Height = 21
        ItemHeight = 13
        TabOrder = 8
        Text = 'com1'
        CommPort = 1
      end
      object btnShakeHand: TRzButton
        Left = 506
        Top = 118
        Width = 89
        Action = actShakeHand
        TabOrder = 9
      end
      object btnSetCT: TRzButton
        Left = 602
        Top = 118
        Width = 89
        Action = actSetChkpToClamp
        TabOrder = 10
      end
      object btnAutoCalc: TRzButton
        Left = 277
        Top = 118
        Width = 89
        Action = actAutoCalc
        TabOrder = 11
      end
    end
    object TabSheet7: TRzTabSheet
      TabVisible = False
      Caption = 'MTU RS485 '
      object RzButton18: TRzButton
        Left = 185
        Top = 43
        Height = 26
        Action = actRS485CloseALLPorts
        TabOrder = 0
      end
      object RzButton19: TRzButton
        Left = 132
        Top = 91
        Height = 26
        Action = actRs485CloseAPort
        TabOrder = 1
      end
      object RzButton20: TRzButton
        Left = 243
        Top = 89
        Height = 26
        Action = actRs485OpenAPort
        TabOrder = 2
      end
      object RzComboBox2: TRzComboBox
        Left = 16
        Top = 44
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
      end
    end
    object rztbshtRRKit: TRzTabSheet
      Caption = 'Radian RRKit'
      object RzPanel6: TRzPanel
        Left = 24
        Top = 150
        Width = 236
        Height = 195
        BorderOuter = fsGroove
        TabOrder = 0
        object rzlblRRkit1: TRzLabel
          Left = 19
          Top = 17
          Width = 189
          Height = 14
          Caption = 'New constant (Unit: KWh/KVARh)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtRRPulseSetting: TRzNumericEdit
          Left = 17
          Top = 41
          Width = 180
          Height = 21
          TabOrder = 0
          CalculatorVisible = True
          IntegersOnly = False
          DisplayFormat = ',0.##'
          Value = 1000000000.000000000000000000
        end
        object RzButton25: TRzButton
          Left = 118
          Top = 129
          Width = 92
          Height = 21
          Action = actRadRDSetPulseRate
          TabOrder = 1
        end
        object RzRadioGroup4: TRzRadioGroup
          Left = 18
          Top = 73
          Width = 193
          Height = 43
          Caption = 'Pulse type'
          Columns = 2
          Items.Strings = (
            'Watt Hours'
            'VAR Hours')
          TabOrder = 2
        end
        object RzButton26: TRzButton
          Left = 19
          Top = 129
          Width = 92
          Height = 21
          Action = actRRGetPulseRate
          TabOrder = 3
        end
      end
      object RzButton23: TRzButton
        Left = 38
        Top = 102
        Action = actGetVerInfo
        TabOrder = 1
      end
      object RzRadioGroup3: TRzRadioGroup
        Left = 27
        Top = 18
        Width = 181
        Height = 71
        Caption = 'Radian type'
        ItemIndex = 1
        Items.Strings = (
          'RD2x'
          'RD3x')
        TabOrder = 2
      end
      object RzCheckGroup3: TRzCheckGroup
        Left = 296
        Top = 32
        Width = 366
        Height = 329
        Caption = 'RAD RD SET PULSE OUTPUT'
        Columns = 3
        Items.Strings = (
          'Port 1'
          'Port 2'
          'Port 3')
        TabOrder = 3
        CheckStates = (
          0
          0
          0)
        object RzLabel11: TRzLabel
          Left = 11
          Top = 61
          Width = 72
          Height = 13
          Caption = 'Port 1 setting: '
        end
        object RzLabel12: TRzLabel
          Left = 11
          Top = 101
          Width = 72
          Height = 13
          Caption = 'Port 2 setting: '
        end
        object RzLabel13: TRzLabel
          Left = 12
          Top = 136
          Width = 72
          Height = 13
          Caption = 'Port 3 setting: '
        end
        object RzButton5: TRzButton
          Left = 187
          Top = 209
          Width = 102
          Height = 29
          Action = actRadSetPulseOutput
          TabOrder = 0
        end
        object cbbFunc1: TRzComboBox
          Left = 88
          Top = 56
          Width = 126
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          Text = 'RAD_PO_WH'
          Items.Strings = (
            'RAD_PO_WH'
            'RAD_PO_WH_DELTA'
            'RAD_PO_VARH'
            'RAD_PO_VARH_DELTA')
          ItemIndex = 0
          Values.Strings = (
            '0'
            '12'
            '1'
            '15')
        end
        object cbbPhase1: TRzComboBox
          Left = 230
          Top = 56
          Width = 122
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
          Text = 'RAD_PHASE_NET'
          Items.Strings = (
            'RAD_PHASE_NET'
            'RAD_PHASE_A'
            'RAD_PHASE_B'
            'RAD_PHASE_C'
            'RAD_PHASE_N')
          ItemIndex = 0
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
        end
        object cbbFunc2: TRzComboBox
          Left = 89
          Top = 92
          Width = 126
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 6
          Text = 'RAD_PO_WH'
          Items.Strings = (
            'RAD_PO_WH'
            'RAD_PO_WH_DELTA'
            'RAD_PO_VARH'
            'RAD_PO_VARH_DELTA')
          ItemIndex = 0
          Values.Strings = (
            '0'
            '12'
            '1'
            '15')
        end
        object cbbPhase2: TRzComboBox
          Left = 231
          Top = 94
          Width = 122
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          Text = 'RAD_PHASE_NET'
          Items.Strings = (
            'RAD_PHASE_NET'
            'RAD_PHASE_A'
            'RAD_PHASE_B'
            'RAD_PHASE_C'
            'RAD_PHASE_N')
          ItemIndex = 0
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
        end
        object cbbFunc3: TRzComboBox
          Left = 91
          Top = 129
          Width = 126
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          Text = 'RAD_PO_WH'
          Items.Strings = (
            'RAD_PO_WH'
            'RAD_PO_WH_DELTA'
            'RAD_PO_VARH'
            'RAD_PO_VARH_DELTA')
          ItemIndex = 0
          Values.Strings = (
            '0'
            '12'
            '1'
            '15')
        end
        object cbbPhase3: TRzComboBox
          Left = 233
          Top = 129
          Width = 122
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 5
          Text = 'RAD_PHASE_NET'
          Items.Strings = (
            'RAD_PHASE_NET'
            'RAD_PHASE_A'
            'RAD_PHASE_B'
            'RAD_PHASE_C'
            'RAD_PHASE_N')
          ItemIndex = 0
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
        end
      end
      object rzgrdRdInstn: TRzStringGrid
        Left = 920
        Top = 23
        Width = 495
        Height = 384
        ColCount = 4
        DefaultColWidth = 120
        TabOrder = 4
      end
      object rzrdgrp3: TRzRadioGroup
        Left = 680
        Top = 23
        Width = 219
        Height = 250
        Caption = 'Read option'
        ItemIndex = 0
        Items.Strings = (
          'Instantaneous'
          'Accumulated'
          'Pulse Constants'
          'Harmonics'
          'Waveform Capture')
        TabOrder = 5
        object lbl3: TRzLabel
          Left = 5
          Top = 123
          Width = 54
          Height = 26
          Caption = 'Interval of readings'
          WordWrap = True
        end
        object lblMonitorCheck: TRzLabel
          Left = 16
          Top = 184
          Width = 183
          Height = 48
          Caption = 
            'Note: Cheked for monitor thread to start, uncheck to stop the mo' +
            'nitor thread'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object btnReadMatrix: TRzButton
          Left = 134
          Top = 150
          Height = 26
          Action = actReadMatrix
          TabOrder = 0
        end
        object rzchckbxReadThread: TRzCheckBox
          Left = 9
          Top = 157
          Width = 99
          Height = 15
          Action = actReadThread
          State = cbUnchecked
          TabOrder = 1
          WordWrap = True
        end
        object edtSpinIntvReadings: TRzSpinEdit
          Left = 69
          Top = 127
          Width = 47
          Height = 21
          Max = 10.000000000000000000
          Min = 1.000000000000000000
          Value = 1.000000000000000000
          TabOrder = 2
        end
      end
    end
    object rzshtModelG: TRzTabSheet
      Caption = 'Model G Test Bench'
      object RzLabel14: TRzLabel
        Left = 10
        Top = 111
        Width = 103
        Height = 13
        Caption = 'CONNECTION MODE:'
      end
      object RzLabel45: TRzLabel
        Left = 8
        Top = 175
        Width = 90
        Height = 13
        Caption = 'Setup parameters:'
      end
      object rzlblFunc: TRzLabel
        Left = 419
        Top = 111
        Width = 124
        Height = 13
        Caption = 'Error calculator functions:'
      end
      object rzlbl28: TRzLabel
        Left = 8
        Top = 292
        Width = 48
        Height = 13
        Caption = 'Readings:'
      end
      object rzlblErrCalc: TRzLabel
        Left = 619
        Top = 111
        Width = 124
        Height = 13
        Caption = 'Error calculator device(s):'
      end
      object RzButton6: TRzButton
        Left = 183
        Top = 130
        Width = 83
        Action = actPowerUp4SourceG
        TabOrder = 0
      end
      object RzComboBox3: TRzComboBox
        Left = 9
        Top = 132
        Width = 150
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'Single phase'
        Items.Strings = (
          'Single phase'
          '1P Reactive power'
          '3P4W Active power'
          '3P4W Reactive power'
          '3P3W Active power'
          '3P3W Reactive power'
          'Single phase (YCSS-101)')
        ItemIndex = 0
        Values.Strings = (
          'D'
          'DR'
          '4W'
          '4R'
          '3W'
          '3R'
          '4W')
      end
      object RzButton27: TRzButton
        Left = 286
        Top = 129
        Width = 83
        Action = actPowerDown4SourceG
        TabOrder = 2
      end
      object rzgrdErrDsp_G: TRzStringGrid
        Left = 8
        Top = 194
        Width = 1273
        Height = 87
        DefaultColWidth = 120
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 3
        OnDrawCell = rzstrngrd1DrawCell
        RowHeights = (
          18
          17)
      end
      object rzcmbxFunc: TRzComboBox
        Left = 420
        Top = 132
        Width = 177
        Height = 21
        ItemHeight = 13
        TabOrder = 4
        Text = '0-Normal error'
        OnClick = rzcmbxFuncClick
        Items.Strings = (
          '0-Normal error'
          '1-Clock error'
          '2-Demand cycle'
          '3-Starting test'
          '4-Creep test'
          '5-Dail test'
          '6-Color mark'
          '7-Current loop switching')
        ItemIndex = 0
        Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6')
      end
      object rzcmbxErrCalc: TRzComboBox
        Left = 620
        Top = 132
        Width = 165
        Height = 21
        ItemHeight = 13
        TabOrder = 5
      end
      object rzStrgrdErrCalcReadings: TRzStringGrid
        Left = 0
        Top = 312
        Width = 1441
        Height = 124
        ColCount = 16
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 6
        OnDrawCell = rzstrngrd1DrawCell
        ColWidths = (
          60
          60
          60
          60
          60
          60
          60
          60
          60
          60
          60
          60
          60
          60
          60
          60)
        RowHeights = (
          18
          18
          18
          18
          18)
      end
      object rzbtnErrCalcSend: TRzButton
        Left = 799
        Top = 129
        Width = 83
        Action = actSetupErrorG
        TabOrder = 7
      end
      object rzbtnErrCalcRead: TRzButton
        Left = 895
        Top = 129
        Width = 83
        Action = actGetErrorG
        TabOrder = 8
      end
      object rzpnlSourceParam: TRzPanel
        Left = 3
        Top = 3
        Width = 414
        Height = 103
        BorderOuter = fsGroove
        TabOrder = 9
        object rzStrgrdSourceParam: TRzStringGrid
          Left = 2
          Top = 2
          Width = 410
          Height = 99
          Align = alClient
          DefaultRowHeight = 20
          TabOrder = 0
          RowHeights = (
            20
            21
            20
            20
            20)
        end
      end
      object rzpnlHarmonicOutput: TRzPanel
        Left = 424
        Top = 8
        Width = 593
        Height = 97
        Alignment = taLeftJustify
        AlignmentVertical = avTop
        BorderOuter = fsGroove
        Caption = 'Harmonic injection'
        TabOrder = 10
        object rzlbl46: TRzLabel
          Left = 192
          Top = 13
          Width = 68
          Height = 13
          Caption = 'Times (1~41):'
        end
        object rzlbl47: TRzLabel
          Left = 192
          Top = 45
          Width = 93
          Height = 13
          Caption = 'Range(max. 40%):'
        end
        object rzlbl48: TRzLabel
          Left = 192
          Top = 69
          Width = 54
          Height = 13
          Caption = 'Angle ('#34817'):'
        end
        object rzbtnactCnPrefixWizard: TRzButton
          Left = 491
          Top = 54
          Width = 76
          Height = 28
          Action = actClearHarmonicTypeG
          TabOrder = 0
        end
        object rzspndt1: TRzSpinEdit
          Left = 296
          Top = 5
          Width = 57
          Height = 21
          AllowKeyEdit = True
          Max = 41.000000000000000000
          Min = 1.000000000000000000
          Value = 21.000000000000000000
          TabOrder = 1
        end
        object rzspndt2: TRzSpinEdit
          Left = 296
          Top = 37
          Width = 57
          Height = 21
          AllowKeyEdit = True
          Decimals = 2
          IntegersOnly = False
          Max = 40.000000000000000000
          Value = 20.220000000000000000
          TabOrder = 2
        end
        object RzNmEdt7: TRzNumericEdit
          Left = 296
          Top = 69
          Width = 55
          Height = 21
          TabOrder = 3
          IntegersOnly = False
          Max = 360.000000000000000000
          DisplayFormat = '#0.0###'
        end
        object rzbtnactCnPrefixWizard1: TRzButton
          Left = 395
          Top = 6
          Width = 76
          Height = 28
          Action = actOutputHarmonicTypeG
          TabOrder = 4
        end
        object rzrdgrp5: TRzRadioGroup
          Left = 16
          Top = 16
          Width = 153
          Height = 73
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Voltage'
            'Current')
          TabOrder = 5
          object rzlbl49: TRzLabel
            Left = 11
            Top = 53
            Width = 28
            Height = 13
            Caption = 'Type:'
          end
          object rzcmbx4: TRzComboBox
            Left = 48
            Top = 45
            Width = 97
            Height = 21
            AllowEdit = False
            Style = csDropDownList
            ItemHeight = 13
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Text = 'General harmonics'
            Items.Strings = (
              'General harmonics'
              'Even harmonics'
              'Odd harmonics'
              'Subharmonics')
            ItemIndex = 0
            Values.Strings = (
              '1'
              '2'
              '3'
              '4')
          end
        end
        object rzbtnMultiHarmonic: TRzButton
          Left = 491
          Top = 6
          Width = 78
          Height = 28
          Action = actOutputMultiHarmonicTypeG
          TabOrder = 6
        end
      end
    end
    object rzshtMDB: TRzTabSheet
      TabVisible = False
      Caption = 'MDB Convert'
      object rzlblSourceDBPath: TRzLabel
        Left = 35
        Top = 30
        Width = 74
        Height = 13
        Caption = 'Source DB path'
      end
      object rzlbl9: TRzLabel
        Left = 35
        Top = 92
        Width = 199
        Height = 13
        Caption = 'Target DB path (GENY Database location)'
      end
      object rzlbl11: TRzLabel
        Left = 27
        Top = 159
        Width = 93
        Height = 13
        Caption = 'Query 1:  test date'
      end
      object rzprgrsbr1: TRzProgressBar
        Left = 128
        Top = 294
        BorderWidth = 0
        InteriorOffset = 0
        PartsComplete = 0
        Percent = 0
        TotalParts = 0
      end
      object rzbtnSourceDBPath: TRzButtonEdit
        Tag = 1000
        Left = 32
        Top = 50
        Width = 273
        Height = 21
        TabOrder = 0
        AltBtnKind = bkFolder
        ButtonKind = bkFolder
        OnButtonClick = rzbtnSourceDBPathButtonClick
      end
      object rzbtn1: TRzButtonEdit
        Tag = 1001
        Left = 32
        Top = 114
        Width = 273
        Height = 21
        TabOrder = 1
        ButtonKind = bkFolder
        OnButtonClick = rzbtnSourceDBPathButtonClick
      end
      object rzbtnConvert: TRzButton
        Left = 32
        Top = 294
        Action = actDBConvert
        TabOrder = 2
      end
      object rzbtnConnSrcDB: TRzButton
        Tag = 1000
        Left = 320
        Top = 46
        Action = actConnSrcDB
        TabOrder = 3
      end
      object rzbtnCnnTagDB: TRzButton
        Tag = 1001
        Left = 320
        Top = 110
        Action = actConnTagDB
        TabOrder = 4
      end
      object rzdbgrd1: TRzDBGrid
        Left = 408
        Top = 16
        Width = 617
        Height = 337
        DataSource = DataModuleHarnpu.dsSource
        DefaultDrawing = True
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object RzDateTimeEdit1: TRzDateTimeEdit
        Left = 27
        Top = 186
        Width = 193
        Height = 21
        CalendarElements = [ceYear, ceMonth, ceArrows, ceFillDays, ceTodayButton, ceClearButton]
        EditType = etDate
        TabOrder = 6
      end
      object rzbtnQuery: TRzButton
        Left = 240
        Top = 182
        Action = actQueryTestDate
        TabOrder = 7
      end
    end
    object rzshtExcel: TRzTabSheet
      TabVisible = False
      Caption = 'Excel Read'
      DesignSize = (
        1441
        436)
      object lbl1: TLabel
        Left = 28
        Top = 24
        Width = 42
        Height = 13
        Caption = 'Filename'
      end
      object lblCell: TLabel
        Left = 32
        Top = 48
        Width = 13
        Height = 13
        Caption = 'A1'
      end
      object TabSet: TTabSet
        Left = 32
        Top = 368
        Width = 1303
        Height = 20
        Anchors = [akLeft, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Tabs.Strings = (
          'Sheet1')
        TabIndex = 0
      end
      object edtFilename: TEdit
        Left = 76
        Top = 20
        Width = 365
        Height = 21
        TabOrder = 1
      end
      object btnDlgOpenFile: TButton
        Left = 444
        Top = 20
        Width = 21
        Height = 21
        Action = actDlgOpenFile
        TabOrder = 2
      end
      object btnReadXlsFile: TButton
        Left = 468
        Top = 20
        Width = 53
        Height = 21
        Action = actReadXlsFile
        TabOrder = 3
      end
      object edtCell: TEdit
        Left = 76
        Top = 44
        Width = 1007
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ReadOnly = True
        TabOrder = 4
      end
      object Grid: TDrawGrid
        Left = 24
        Top = 72
        Width = 1310
        Height = 268
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColCount = 32
        DefaultRowHeight = 16
        RowCount = 255
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
        TabOrder = 5
        OnDrawCell = GridDrawCell
        OnGetEditText = GridGetEditText
        OnKeyDown = GridKeyDown
        OnSelectCell = GridSelectCell
        OnSetEditText = GridSetEditText
      end
      object btnUpdateExcel2MDB: TButton
        Left = 532
        Top = 20
        Width = 53
        Height = 21
        Action = actUpdate2mdb
        TabOrder = 6
      end
      object pb1: TProgressBar
        Left = 600
        Top = 24
        Width = 177
        Height = 17
        Step = 1
        TabOrder = 7
      end
    end
    object rzshtExcelPrintOut: TRzTabSheet
      TabVisible = False
      Caption = 'Excel output'
      object rzlbl18: TRzLabel
        Left = 19
        Top = 31
        Width = 128
        Height = 13
        Caption = 'test batch number of EEM:'
      end
      object rzlbl13: TRzLabel
        Left = 275
        Top = 31
        Width = 140
        Height = 13
        Caption = 'Write to %EEM\report\excel\'
      end
      object rzlbl19: TRzLabel
        Left = 19
        Top = 95
        Width = 46
        Height = 13
        Caption = 'Begin of :'
      end
      object rzlbl20: TRzLabel
        Left = 115
        Top = 95
        Width = 35
        Height = 13
        Caption = 'End of:'
      end
      object btnExcelWrite: TButton
        Left = 276
        Top = 52
        Width = 117
        Height = 21
        Action = actExcelWrite
        TabOrder = 0
      end
      object edt2: TEdit
        Left = 20
        Top = 52
        Width = 169
        Height = 21
        TabOrder = 1
      end
      object btnReadMdbByBatchNumber: TButton
        Left = 204
        Top = 52
        Width = 53
        Height = 21
        Action = actReadFromMdbByBatchNumber
        TabOrder = 2
      end
      object btnBatchPrintOut: TButton
        Left = 204
        Top = 116
        Width = 117
        Height = 21
        Action = actBatchPrintOut
        TabOrder = 3
      end
      object edt1: TEdit
        Left = 20
        Top = 116
        Width = 77
        Height = 21
        TabOrder = 4
      end
      object edt3: TEdit
        Left = 116
        Top = 116
        Width = 77
        Height = 21
        TabOrder = 5
      end
    end
    object rzshtPulsingTest: TRzTabSheet
      TabVisible = False
      Caption = 'Pulsing test (.tst)'
      object lstTst1: TRzListBox
        Left = 0
        Top = 0
        Width = 193
        Height = 436
        Align = alLeft
        HorzScrollBar = True
        ItemHeight = 16
        Items.Strings = (
          '12'
          '123'
          '21'
          '3'
          '12'
          '31'
          '2'
          '31'
          '2'
          '4234'
          '1324'
          '213'
          '41'
          '23'
          '12'
          '123'
          '21'
          '3'
          '12'
          '31'
          '2'
          '31'
          '2'
          '4234'
          '1324'
          '213'
          '41'
          '23'
          '4'
          '21'
          '34'
          '321'
          '4'
          '21'
          '4'
          '321'
          '4'
          '21'
          '34'
          '321'
          '4'
          '21'
          '4'
          '321')
        Style = lbOwnerDrawFixed
        TabOrder = 0
      end
      object rzbtn3: TRzButtonEdit
        Tag = 1000
        Left = 201
        Top = 20
        Width = 273
        Height = 21
        TabOrder = 1
        AltBtnKind = bkFolder
        ButtonKind = bkFolder
        OnButtonClick = rzbtnSourceDBPathButtonClick
      end
      object rzbtnLoadTstFile: TRzButton
        Tag = 1000
        Left = 496
        Top = 16
        Action = actLoadTstFile
        TabOrder = 2
      end
      object rzbtnStartTest: TRzButton
        Left = 593
        Top = 16
        Action = actStartPulsingTest
        TabOrder = 3
      end
      object rzStrgrdPulsingTestPara: TRzStringGrid
        Left = 201
        Top = 64
        Width = 776
        Height = 273
        TabOrder = 4
        RowHeights = (
          18
          18
          18
          18
          18)
      end
    end
    object rzshtRelayTest: TRzTabSheet
      Caption = 'Relay Test'
      object rzlbl27: TRzLabel
        Left = 465
        Top = 118
        Width = 95
        Height = 13
        Caption = 'Working current (A)'
      end
      object rzlbl29: TRzLabel
        Left = 459
        Top = 167
        Width = 124
        Height = 13
        Caption = 'Error calculator device(s):'
      end
      object rzStrgrdComport: TRzStringGrid
        Left = 0
        Top = 0
        Width = 433
        Height = 436
        Align = alLeft
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 0
        OnDrawCell = rzStrgrdComportDrawCell
        OnMouseDown = rzStrgrdComportMouseDown
      end
      object rzbtnCreateDUTs: TRzButton
        Left = 757
        Top = 234
        Action = actRunRelayTest
        TabOrder = 1
      end
      object rzpnlMeterComm: TRzPanel
        Left = 456
        Top = 8
        Width = 377
        Height = 97
        AlignmentVertical = avTop
        BorderOuter = fsGroove
        Caption = 'Sending commnad via RS232 '
        TabOrder = 2
        object rzbtnSendCmd: TRzButton
          Left = 235
          Top = 48
          Width = 105
          Action = actMeterSendCommand
          TabOrder = 0
        end
        object rbRelayConn: TRzRadioButton
          Left = 24
          Top = 24
          Width = 59
          Height = 15
          Caption = 'Connect'
          Checked = True
          TabOrder = 1
          TabStop = True
        end
        object rbRelayDisconn: TRzRadioButton
          Left = 24
          Top = 56
          Width = 71
          Height = 15
          Caption = 'Disconnect'
          TabOrder = 2
        end
      end
      object rzbtnRelayTestGateOn: TRzButton
        Left = 562
        Top = 234
        Action = actRelayTestGateConn
        TabOrder = 3
      end
      object rzbtnRelayTestGateOff: TRzButton
        Left = 659
        Top = 234
        Action = actRelayTestGateDisconn
        TabOrder = 4
      end
      object rzbtnRelayTestGateReadings: TRzButton
        Left = 458
        Top = 234
        Action = actRelayTestGateReadings
        TabOrder = 5
      end
      object RzNmEdtWorkCurr: TRzNumericEdit
        Left = 465
        Top = 134
        Width = 88
        Height = 21
        Alignment = taCenter
        TabOrder = 6
        IntegersOnly = False
        DisplayFormat = '#0.###'
        Value = 100.000000000000000000
      end
      object rzbtnPowerUp: TRzButton
        Left = 589
        Top = 132
        Action = actRelayTestPowerUp
        TabOrder = 7
      end
      object rzbtnPowerDown: TRzButton
        Left = 685
        Top = 132
        Action = actRelayTestPowerDown
        TabOrder = 8
      end
      object rzcmbx3: TRzComboBox
        Left = 460
        Top = 188
        Width = 165
        Height = 21
        ItemHeight = 13
        TabOrder = 9
        Items.Strings = (
          '0-Normal error'
          '1-Clock error'
          '2-Demand cycle'
          '3-Starting test'
          '4-Creep test'
          '5-Dail test'
          '6-Color mark')
        Values.Strings = (
          'D'
          'DR'
          '4W'
          '4R'
          '3W'
          '3R')
      end
      object rzchkb1: TRzCheckBox
        Left = 640
        Top = 192
        Width = 69
        Height = 15
        Caption = 'All devices'
        State = cbUnchecked
        TabOrder = 10
      end
    end
    object rzshtCalibration: TRzTabSheet
      Caption = 'Meter Calib.'
      object rzlbl15: TRzLabel
        Left = 0
        Top = 0
        Width = 1441
        Height = 23
        Align = alTop
        Caption = 'Calibration for EMS12JT Meter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 16737843
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rzStrgrdCalParams: TRzStringGrid
        Left = 0
        Top = 23
        Width = 1441
        Height = 83
        Align = alTop
        DefaultColWidth = 120
        RowCount = 8
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 0
        OnDrawCell = rzStrgrdCalParamsDrawCell
        RowHeights = (
          18
          18
          18
          18
          18
          18
          18
          18)
      end
      object rzStrgrdCalibPortSettings: TRzStringGrid
        Left = 0
        Top = 106
        Width = 308
        Height = 330
        Align = alLeft
        DefaultColWidth = 30
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
        TabOrder = 1
        OnDrawCell = rzStrgrdComportDrawCell
        OnMouseDown = rzStrgrdComportMouseDown
      end
      object rzpgcntrl1: TRzPageControl
        Left = 308
        Top = 106
        Width = 1133
        Height = 330
        ActivePage = rzshtReadings
        ActivePageDefault = rzshtReadings
        Align = alClient
        ParentColor = False
        TabIndex = 0
        TabOrder = 2
        FixedDimension = 19
        object rzshtReadings: TRzTabSheet
          Caption = 'Readings'
          object rzlbl22: TRzLabel
            Left = 520
            Top = 24
            Width = 185
            Height = 13
            Caption = 'Waiting for power to stabilize (second)'
          end
          object rzlbl23: TRzLabel
            Left = 520
            Top = 85
            Width = 153
            Height = 13
            Caption = 'Interval of calibrations (second)'
          end
          object rzStrgrdMeterReadings: TRzStringGrid
            Left = 16
            Top = 16
            Width = 473
            Height = 145
            ColCount = 6
            RowCount = 7
            TabOrder = 0
            OnDrawCell = rzStrgrdCalParamsDrawCell
            RowHeights = (
              18
              18
              18
              18
              18
              18
              18)
          end
          object RzButton29: TRzButton
            Left = 27
            Top = 190
            Width = 107
            Height = 30
            Action = actMeterCalLogon
            TabOrder = 1
          end
          object RzButton31: TRzButton
            Left = 158
            Top = 190
            Width = 107
            Height = 30
            Action = actMeterReadings
            TabOrder = 2
          end
          object RzButton32: TRzButton
            Left = 287
            Top = 190
            Width = 107
            Height = 30
            Action = actMeterLogoff
            TabOrder = 3
          end
          object RzButton33: TRzButton
            Left = 475
            Top = 190
            Width = 107
            Height = 30
            Action = actMeterCalAuto
            TabOrder = 4
          end
          object rzbtnFullyStart: TRzButton
            Left = 605
            Top = 190
            Width = 107
            Height = 30
            Action = actStartFull
            TabOrder = 5
          end
          object RzNmEdtWaitforPower2Stab: TRzNumericEdit
            Left = 520
            Top = 48
            Width = 65
            Height = 21
            Alignment = taCenter
            TabOrder = 6
            DisplayFormat = ',0;(,0)'
            Value = 15.000000000000000000
          end
          object RzNmEdtMeterCalInterval: TRzNumericEdit
            Left = 520
            Top = 109
            Width = 65
            Height = 21
            Alignment = taCenter
            TabOrder = 7
            DisplayFormat = ',0;(,0)'
            Value = 15.000000000000000000
          end
        end
        object rztbshtCalibrations: TRzTabSheet
          Caption = 'Calibrations'
          object rzStrgrdCalVolt: TRzStringGrid
            Left = 14
            Top = 7
            Width = 691
            Height = 183
            ColCount = 10
            RowCount = 7
            TabOrder = 0
            OnDrawCell = rzStrgrdCalParamsDrawCell
          end
          object rzbtnCalVolt: TRzButton
            Left = 606
            Top = 207
            Width = 105
            Height = 30
            Action = actStartCal1
            TabOrder = 1
          end
          object RzRadioGroup6: TRzRadioGroup
            Left = 20
            Top = 198
            Width = 215
            Height = 43
            Caption = 'Calibraton option'
            Columns = 3
            ItemIndex = 0
            Items.Strings = (
              'Voltage'
              'Current'
              'Energy')
            TabOrder = 2
          end
          object RzButton30: TRzButton
            Left = 365
            Top = 207
            Width = 105
            Height = 30
            Action = actCalRead
            TabOrder = 3
          end
          object rzbtnSourceOutput4Cal1: TRzButton
            Left = 246
            Top = 207
            Width = 105
            Height = 30
            Action = actSourceOutput4Cal1
            TabOrder = 4
          end
          object rzbtnStartCal1: TRzButton
            Left = 486
            Top = 207
            Width = 105
            Height = 30
            Action = actReadStdReadings
            TabOrder = 5
          end
        end
        object rztbshtPhaseShift: TRzTabSheet
          Caption = 'PhaseShift'
          object rzStrgrdCalPhaseErr: TRzStringGrid
            Left = 16
            Top = 7
            Width = 609
            Height = 153
            HelpType = htKeyword
            RowCount = 7
            TabOrder = 0
            OnDrawCell = rzStrgrdCalParamsDrawCell
          end
          object rzbtnCalPhaseShift: TRzButton
            Left = 268
            Top = 192
            Width = 105
            Height = 30
            Action = actStartCal2
            TabOrder = 1
          end
          object rzbtnReadError: TRzButton
            Left = 132
            Top = 192
            Width = 105
            Height = 30
            Action = actReadError4Cal2
            TabOrder = 2
          end
          object rzbtnSourceOutput4Cal2: TRzButton
            Left = 12
            Top = 192
            Width = 105
            Height = 30
            Action = actSourceOutput4Cal2
            TabOrder = 3
          end
        end
        object rzshtErrorVerify: TRzTabSheet
          Caption = 'Accuray Test'
          object RzLabel50: TRzLabel
            Left = 18
            Top = 198
            Width = 60
            Height = 13
            Caption = 'Errors limit:  '
          end
          object rzStrgrdErrorTest: TRzStringGrid
            Left = 16
            Top = 6
            Width = 609
            Height = 153
            HelpType = htKeyword
            ColCount = 7
            RowCount = 6
            TabOrder = 0
            OnDrawCell = rzStrgrdCalParamsDrawCell
          end
          object RzNumericEdit8: TRzNumericEdit
            Left = 79
            Top = 190
            Width = 71
            Height = 21
            Alignment = taCenter
            TabOrder = 1
            IntegersOnly = False
            DisplayFormat = '#0.###'
            Value = 1234.000000000000000000
          end
          object RzButton34: TRzButton
            Left = 421
            Top = 185
            Width = 107
            Height = 30
            Action = actAccuracyTest
            TabOrder = 2
          end
        end
        object rztbshtDataProc: TRzTabSheet
          Caption = 'Data Process'
          DesignSize = (
            1129
            307)
          object rzlbl21: TRzLabel
            Left = 18
            Top = 20
            Width = 70
            Height = 13
            Caption = 'Barcode input:'
          end
          object edtBarcode: TEdit
            Left = 95
            Top = 12
            Width = 618
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnKeyPress = edtBarcodeKeyPress
          end
          object drwgrdResult: TDrawGrid
            Left = 0
            Top = 105
            Width = 1129
            Height = 182
            Align = alBottom
            ColCount = 32
            DefaultRowHeight = 16
            RowCount = 255
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing]
            TabOrder = 1
            OnDrawCell = GridDrawCell
            OnGetEditText = GridGetEditText
            OnKeyDown = drwgrdResultKeyDown
            OnSelectCell = GridSelectCell
            OnSetEditText = GridSetEditText
          end
          object rzbtnSave2Excel: TRzButton
            Left = 344
            Top = 8
            Action = actSave2Excel
            TabOrder = 2
          end
          object tsExcelSheet: TTabSet
            Left = 0
            Top = 287
            Width = 1129
            Height = 20
            Align = alBottom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Tabs.Strings = (
              'Sheet1')
            TabIndex = 0
          end
        end
      end
    end
    object rzshtPowerConsum: TRzTabSheet
      Caption = 'Power Consumption'
      object rzlbl54: TRzLabel
        Left = 32
        Top = 34
        Width = 61
        Height = 26
        Caption = 'The Port '#13'for VA Test: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rzrdgrpCal: TRzRadioGroup
        Left = 568
        Top = 24
        Width = 457
        Height = 129
        Caption = 'Calibration'
        ItemIndex = 0
        Items.Strings = (
          'calibration of voltage coil'
          'calibration of current coil')
        TabOrder = 0
        object rzlbl32: TRzLabel
          Left = 225
          Top = 16
          Width = 89
          Height = 13
          Caption = 'Volt. of Calibration'
        end
        object rzlbl33: TRzLabel
          Left = 225
          Top = 48
          Width = 92
          Height = 13
          Caption = 'Ampy of calibration'
        end
        object rzlbl34: TRzLabel
          Left = 403
          Top = 16
          Width = 6
          Height = 13
          Caption = 'V'
        end
        object rzlbl35: TRzLabel
          Left = 403
          Top = 48
          Width = 7
          Height = 13
          Caption = 'A'
        end
        object RzNmEdt2: TRzNumericEdit
          Left = 331
          Top = 8
          Width = 65
          Height = 21
          Alignment = taCenter
          TabOrder = 0
          IntegersOnly = False
          DisplayFormat = '#.###'
          Value = 220.000000000000000000
        end
        object RzNmEdt3: TRzNumericEdit
          Left = 331
          Top = 40
          Width = 65
          Height = 21
          Alignment = taCenter
          TabOrder = 1
          IntegersOnly = False
          DisplayFormat = '#.###'
          Value = 5.000000000000000000
        end
        object rzbtnCalibration: TRzButton
          Left = 320
          Top = 88
          Width = 113
          Action = actPowerCalib
          TabOrder = 2
        end
      end
      object rzrdgrpPowerTest: TRzRadioGroup
        Left = 256
        Top = 24
        Width = 297
        Height = 97
        Caption = 'Test on/off'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Test on'
          'Test off')
        TabOrder = 1
        object rzlbl30: TRzLabel
          Left = 112
          Top = 40
          Width = 67
          Height = 13
          Caption = 'Test time (s) :'
        end
        object rzlbl31: TRzLabel
          Left = 8
          Top = 40
          Width = 68
          Height = 13
          Caption = 'Test position :'
        end
        object RzNmEdtPowerTestTime: TRzNumericEdit
          Left = 112
          Top = 64
          Width = 51
          Height = 21
          Alignment = taCenter
          TabOrder = 2
          DisplayFormat = ',0;(,0)'
          Value = 60.000000000000000000
        end
        object rzbtnPowerTest: TRzButton
          Left = 200
          Top = 60
          Action = actPowerConsumptionTest
          TabOrder = 0
        end
        object rzcmbxPos: TRzComboBox
          Left = 8
          Top = 64
          Width = 65
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Text = '#1'
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '127')
          Values.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '127')
        end
      end
      object rzStrgrdPConsum: TRzStringGrid
        Left = 0
        Top = 232
        Width = 1441
        Height = 204
        Align = alBottom
        DefaultColWidth = 80
        RowCount = 8
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
        TabOrder = 2
        OnDrawCell = rzStrgrdCalParamsDrawCell
        RowHeights = (
          18
          18
          18
          18
          18
          18
          18
          18)
      end
      object cbprtlst2: TCboPortList
        Left = 102
        Top = 34
        Width = 99
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = 'com1'
        CommPort = 1
      end
      object rzrdgrpReading: TRzRadioGroup
        Left = 256
        Top = 128
        Width = 297
        Height = 73
        Caption = 'VA test readings'
        ItemIndex = 0
        Items.Strings = (
          'Test data'
          'Real-time data')
        TabOrder = 4
        object rzbtnReadings: TRzButton
          Left = 206
          Top = 32
          Action = actPowerReadings
          TabOrder = 0
        end
      end
    end
    object rzshtICTs: TRzTabSheet
      Caption = 'Comm. of ICTs'
      object ScrollBox1: TScrollBox
        Left = 0
        Top = 89
        Width = 1441
        Height = 347
        Align = alClient
        TabOrder = 0
        OnResize = ScrollBox1Resize
        object rzpnlIct1: TRzPanel
          Tag = 1
          Left = 9
          Top = 11
          Width = 164
          Height = 202
          AlignmentVertical = avBottom
          Caption = '#1 device'
          TabOrder = 0
          object shp1: TShape
            Left = 10
            Top = 77
            Width = 32
            Height = 27
            Brush.Color = clSilver
            Shape = stCircle
          end
          object ictlbl1: TRzLabel
            Left = 53
            Top = 83
            Width = 99
            Height = 13
            Caption = 'phase A ( Position 1)'
          end
          object shp2: TShape
            Left = 10
            Top = 111
            Width = 32
            Height = 27
            Brush.Color = clSilver
            Shape = stCircle
          end
          object ictlbl2: TRzLabel
            Left = 53
            Top = 117
            Width = 99
            Height = 13
            Caption = 'phase A ( Position 1)'
          end
          object shp3: TShape
            Left = 10
            Top = 145
            Width = 32
            Height = 27
            Brush.Color = clSilver
            Shape = stCircle
          end
          object ictlbl3: TRzLabel
            Left = 53
            Top = 152
            Width = 99
            Height = 13
            Caption = 'phase A ( Position 1)'
          end
          object btnRead1: TRzButton
            Tag = 1
            Left = 24
            Top = 10
            Width = 110
            Action = actReadState
            TabOrder = 0
          end
          object btnReset1: TRzButton
            Tag = 1
            Left = 24
            Top = 41
            Width = 110
            Action = actResetICT
            TabOrder = 1
          end
        end
      end
      object rzpnl4: TRzPanel
        Left = 0
        Top = 0
        Width = 1441
        Height = 89
        Align = alTop
        BorderOuter = fsGroove
        TabOrder = 1
        object rzlblICTport: TRzLabel
          Left = 48
          Top = 34
          Width = 81
          Height = 13
          Caption = 'ICTs Serial Port: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object RzLabel15: TRzLabel
          Left = 247
          Top = 34
          Width = 89
          Height = 13
          Caption = 'Serial port setting:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object cbprtlstICTs: TCboPortList
          Left = 142
          Top = 26
          Width = 89
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = 'com1'
          CommPort = 1
        end
        object rzbtnResetAll: TRzButton
          Tag = 1
          Left = 464
          Top = 22
          Width = 110
          Action = actResetAllICTs
          TabOrder = 1
        end
        object rzdtICTPortSetting: TRzEdit
          Left = 342
          Top = 26
          Width = 89
          Height = 21
          Text = '19200,n,8,2'
          TabOrder = 2
        end
      end
    end
    object rzshtGateTest: TRzTabSheet
      Caption = 'Gating Control'
      object rzlbl59: TRzLabel
        Left = 259
        Top = 45
        Width = 174
        Height = 13
        Caption = 'Gate time (s) between 2 gate pulses'
      end
      object rzlbl60: TRzLabel
        Left = 364
        Top = 83
        Width = 54
        Height = 14
        Caption = 'second(s)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object rzpnlMonitor: TRzPanel
        Left = 0
        Top = 288
        Width = 1441
        Height = 148
        Align = alBottom
        Alignment = taLeftJustify
        AlignmentVertical = avTop
        BorderOuter = fsGroove
        Caption = 'Monitor'
        TabOrder = 0
        object rzStrgrdPulseCount: TRzStringGrid
          Left = 2
          Top = 2
          Width = 666
          Height = 144
          Align = alLeft
          DefaultColWidth = 120
          DefaultRowHeight = 24
          TabOrder = 0
        end
      end
      object RzNmEdtGateTime: TRzNumericEdit
        Tag = 2004
        Left = 259
        Top = 79
        Width = 97
        Height = 21
        Alignment = taCenter
        TabOrder = 1
        DisplayFormat = '#0.###########'
        Value = 3.000000000000000000
      end
      object rzbtnStartGate: TRzButton
        Left = 260
        Top = 123
        Width = 101
        Height = 30
        Action = actGatingTest
        TabOrder = 2
      end
      object rzrdgrpKindOfRSM: TRzRadioGroup
        Left = 24
        Top = 32
        Width = 185
        Height = 145
        Caption = 'Category of RSM'
        ItemIndex = 0
        Items.Strings = (
          'Radian / RD '
          'Geny / K3/K6/K8')
        TabOrder = 3
      end
    end
  end
  object actlst1: TActionList
    Left = 747
    Top = 620
    object actTestOpenBox: TAction
      Category = 'Repeatablity'
      Caption = 'start test'
      OnExecute = actTestOpenBoxExecute
      OnUpdate = actRaiseVUpdate
    end
    object actCloseWin: TAction
      Caption = 'Close'
      OnExecute = actCloseWinExecute
    end
    object actOutput_Voltage: TAction
      Category = 'Output'
      Caption = 'output'
      OnExecute = actOutput_VoltageExecute
      OnUpdate = actRaiseVUpdate
    end
    object actSendCommand: TAction
      Category = 'Repeatablity'
      Caption = 'Send'
      OnExecute = actSendCommandExecute
      OnUpdate = actRaiseVUpdate
    end
    object act158Save2xls: TAction
      Category = '158Readings'
      Caption = 'Save2xls'
      OnExecute = act158Save2xlsExecute
    end
    object actReset_Voltage: TAction
      Category = 'Output'
      Caption = 'Reset'
      OnExecute = actReset_VoltageExecute
      OnUpdate = actRaiseVUpdate
    end
    object actOutput_Current: TAction
      Category = 'Output'
      Caption = 'Output'
      OnExecute = actOutput_CurrentExecute
      OnUpdate = actRaiseVUpdate
    end
    object actReset_Current: TAction
      Category = 'Output'
      Caption = 'Reset'
      OnExecute = actReset_CurrentExecute
      OnUpdate = actRaiseVUpdate
    end
    object actNeturelControl: TAction
      Category = 'Output'
      Caption = '??'#31699'?|y|??'#30683'????'#31699'???'#25602'|??'
    end
    object actNeturelReset: TAction
      Category = 'Output'
      Caption = '?????'
    end
    object actTestCtrConnMode: TAction
      Caption = 'actTestCtrConnMode'
      OnExecute = actTestCtrConnModeExecute
    end
    object actRoutine1: TAction
      Category = 'Routine'
      Caption = 'sync. Wire Mode'
      OnExecute = actRoutine1Execute
      OnUpdate = actRaiseVUpdate
    end
    object actReadMeasuredData: TAction
      Category = 'Routine'
      Caption = 'Read K3/K6/K8'
      OnExecute = actReadMeasuredDataExecute
      OnUpdate = actRaiseVUpdate
    end
    object actOutput1P3W: TAction
      Category = 'Output'
      Caption = 'Output for 1P3W'
      OnExecute = actOutput1P3WExecute
    end
    object actResetOutput: TAction
      Category = 'Output'
      Caption = 'Reset SOURCE'
      OnExecute = actResetOutputExecute
      OnUpdate = actRaiseVUpdate
    end
    object actReOutput: TAction
      Category = 'Repeatablity'
      Caption = '?????(10)'
      OnExecute = actReOutputExecute
    end
    object actRaiseV: TAction
      Category = 'self-excited'
      Caption = '??'#31699'?|y?1'
      OnExecute = actRaiseVExecute
      OnUpdate = actRaiseVUpdate
    end
    object actAdjustV: TAction
      Category = 'self-excited'
      Caption = '|??'#30683'?????'
    end
    object actSetErr: TAction
      Category = 'errcalc'
      Caption = 'Err %'
      OnExecute = actSetErrExecute
      OnUpdate = actRaiseVUpdate
    end
    object actReadErr: TAction
      Category = 'errcalc'
      Caption = 'Read Err'
      OnExecute = actReadErrExecute
      OnUpdate = actRaiseVUpdate
    end
    object actOutput_Cos: TAction
      Category = 'Output'
      Caption = 'Go'
      OnExecute = actOutput_CosExecute
      OnUpdate = actRaiseVUpdate
    end
    object actOutput_Cos_1: TAction
      Category = 'Output'
      Caption = 'continues(1->360)'
      OnExecute = actOutput_Cos_1Execute
      OnUpdate = actRaiseVUpdate
    end
    object actSetErrorTest: TAction
      Category = 'errcalc'
      Caption = 'Err Cal Test'
      OnUpdate = actRaiseVUpdate
    end
    object actSetCreepingTest: TAction
      Category = 'errcalc'
      Caption = 'Creeping Test'
      OnExecute = actSetCreepingTestExecute
      OnUpdate = actRaiseVUpdate
    end
    object actSetStartingTest: TAction
      Category = 'errcalc'
      Caption = 'Starting Test'
      OnExecute = actSetStartingTestExecute
      OnUpdate = actRaiseVUpdate
    end
    object actReadCreepingData: TAction
      Category = 'errcalc'
      Caption = 'Read C.T.'
    end
    object actReadStartingTestData: TAction
      Category = 'errcalc'
      Caption = 'Read S.T. '
      OnExecute = actReadStartingTestDataExecute
      OnUpdate = actRaiseVUpdate
    end
    object actClampTestOn: TAction
      Category = 'ClampTest'
      Caption = 'Test On'
      OnExecute = actClampTestOnExecute
      OnUpdate = actClampTestOnUpdate
    end
    object actClampTestOff: TAction
      Category = 'ClampTest'
      Caption = 'Test Off'
      OnExecute = actClampTestOffExecute
    end
    object actOpenConfigration: TAction
      Caption = 'configration'
      OnExecute = actOpenConfigrationExecute
    end
    object actShakeHand: TAction
      Category = 'ClampTest'
      Caption = 'Conn to CT'
      OnExecute = actShakeHandExecute
    end
    object actSetChkpToClamp: TAction
      Category = 'ClampTest'
      Caption = 'Set to CT'
      OnExecute = actSetChkpToClampExecute
    end
    object actGetResult: TAction
      Category = 'ClampTest'
      Caption = 'Check CT'
      OnExecute = actGetResultExecute
    end
    object actAutoCalc: TAction
      Category = 'ClampTest'
      Caption = 'Auto Calc.'
      OnExecute = actAutoCalcExecute
    end
    object actOutput_UPhase: TAction
      Category = 'Output'
      Caption = 'Change'
      OnExecute = actOutput_UPhaseExecute
      OnUpdate = actRaiseVUpdate
    end
    object actDebugRead158Params: TAction
      Category = 'Debug1'
      Caption = 'Read 158 '
      OnExecute = actDebugRead158ParamsExecute
      OnUpdate = actRaiseVUpdate
    end
    object actDEbugWriteFinetune: TAction
      Category = 'Debug1'
      Caption = 'Adjust selected phase'
      OnExecute = actDEbugWriteFinetuneExecute
      OnUpdate = actRaiseVUpdate
    end
    object actDebugCalcFinetune: TAction
      Category = 'Debug1'
      Caption = 'Calculate'
    end
    object actDebugReadRef: TAction
      Category = 'Debug1'
      Caption = 'Read Reference'
      OnExecute = actDebugReadRefExecute
      OnUpdate = actReadMatrixUpdate
    end
    object actDebugWriteToINI: TAction
      Category = 'Debug1'
      Caption = 'Save finetune'
      OnExecute = actDebugWriteToINIExecute
    end
    object actDebugReadFinetune: TAction
      Category = 'Debug1'
      Caption = 'Read Finetune'
      OnExecute = actDebugReadFinetuneExecute
    end
    object actDebugAutoAdjust: TAction
      Category = 'Debug1'
      Caption = 'Adjustment All phases'
      OnExecute = actDebugAutoAdjustExecute
      OnUpdate = actRaiseVUpdate
    end
    object actDebugSaveFinetuneTo158: TAction
      Category = 'Debug1'
      Caption = 'Save'
      OnExecute = actDebugSaveFinetuneTo158Execute
    end
    object actRS485CloseALLPorts: TAction
      Category = 'Rs485'
      Caption = 'Close ALL'
      OnExecute = actRS485CloseALLPortsExecute
    end
    object actRs485OpenAPort: TAction
      Category = 'Rs485'
      Caption = 'Open'
      OnExecute = actRs485OpenAPortExecute
    end
    object actRs485CloseAPort: TAction
      Category = 'Rs485'
      Caption = 'Close'
      OnExecute = actRs485CloseAPortExecute
    end
    object actReadStartingPulseTime: TAction
      Category = 'errcalc'
      Caption = 'get Pulse Time'
      OnExecute = actReadStartingPulseTimeExecute
      OnUpdate = actRaiseVUpdate
    end
    object actFreqSet: TAction
      Category = 'Output'
      Caption = 'Frequency set'
      OnExecute = actFreqSetExecute
      OnUpdate = actRaiseVUpdate
    end
    object actStartDialTest: TAction
      Category = 'Dial Test'
      Caption = 'Start Dial Test'
    end
    object actGetVerInfo: TAction
      Category = 'RRKit'
      Caption = 'Connect'
      OnExecute = actGetVerInfoExecute
    end
    object actRadRDInstMetricTable: TAction
      Category = 'RRKit'
      Caption = 'Get Metric'
    end
    object actRadRDSetPulseRate: TAction
      Category = 'RRKit'
      Caption = 'Set PulseRate'
      OnExecute = actRadRDSetPulseRateExecute
    end
    object actRRGetPulseRate: TAction
      Category = 'RRKit'
      Caption = 'Get pluse rate'
      OnExecute = actRRGetPulseRateExecute
    end
    object actUnlockES30B: TAction
      Category = 'ES30B'
      Caption = 'Unlock'
    end
    object actTestCmd_F001: TAction
      Category = 'ES30B'
      Caption = 'test F001'
    end
    object actTestCMD_F002: TAction
      Category = 'ES30B'
      Caption = 'Test F002'
    end
    object actTestCMD_F010: TAction
      Category = 'ES30B'
      Caption = 'Test F010'
    end
    object actTestCMD_F011: TAction
      Category = 'ES30B'
      Caption = 'Test F011'
    end
    object actTestCMD_F012: TAction
      Category = 'ES30B'
      Caption = 'actTestCMD_F012'
    end
    object actTestCMD_F013: TAction
      Category = 'ES30B'
      Caption = 'actTestCMD_F013'
    end
    object actTestCMD_F014: TAction
      Category = 'ES30B'
      Caption = 'actTestCMD_F014'
    end
    object actTestCMD_F015: TAction
      Category = 'ES30B'
      Caption = 'actTestCMD_F015'
    end
    object actTestCMD_F016: TAction
      Category = 'ES30B'
      Caption = 'actTestCMD_F016'
    end
    object Action7: TAction
      Category = 'ES30B'
      Caption = 'Action7'
    end
    object actRadSetPulseOutput: TAction
      Category = 'RRKit'
      Caption = 'Set Pulse Output'
      OnExecute = actRadSetPulseOutputExecute
    end
    object actOpenAgent4SourceG: TAction
      Category = 'Model_G'
      Caption = 'actOpenAgent4SourceG'
      OnExecute = actOpenAgent4SourceGExecute
    end
    object actConnectAgent: TAction
      Category = 'Model_G'
      Caption = 'actConnectAgent'
      OnExecute = actConnectAgentExecute
    end
    object actPowerUp4SourceG: TAction
      Category = 'Model_G'
      Caption = 'Power up'
      OnExecute = actPowerUp4SourceGExecute
    end
    object actPowerDown4SourceG: TAction
      Category = 'Model_G'
      Caption = 'Power down'
      OnExecute = actPowerDown4SourceGExecute
    end
    object actDBConvert: TAction
      Category = 'MDB'
      Caption = 'Convert'
      OnExecute = actDBConvertExecute
      OnUpdate = actDBConvertUpdate
    end
    object actConnSrcDB: TAction
      Category = 'MDB'
      Caption = 'Open'
      OnExecute = actConnSrcDBExecute
    end
    object actConnTagDB: TAction
      Category = 'MDB'
      Caption = 'Open'
      OnExecute = actConnTagDBExecute
    end
    object actQueryTestDate: TAction
      Category = 'MDB'
      Caption = 'Query'
      OnExecute = actQueryTestDateExecute
      OnUpdate = actQueryTestDateUpdate
    end
    object actDlgOpenFile: TAction
      Category = 'excel2mdb'
      Caption = '...'
      OnExecute = actDlgOpenFileExecute
    end
    object actReadXlsFile: TAction
      Category = 'excel2mdb'
      Caption = 'Read'
      OnExecute = actReadXlsFileExecute
    end
    object actUpdate2mdb: TAction
      Category = 'excel2mdb'
      Caption = 'Update'
      OnExecute = actUpdate2mdbExecute
      OnUpdate = actUpdate2mdbUpdate
    end
    object actCloseXlsFile: TAction
      Category = 'excel2mdb'
      Caption = 'actCloseXlsFile'
    end
    object actReadFromMdbByBatchNumber: TAction
      Category = 'PrintOutExcel'
      Caption = 'Read'
      OnExecute = actReadFromMdbByBatchNumberExecute
      OnUpdate = actReadFromMdbByBatchNumberUpdate
    end
    object actExcelWrite: TAction
      Category = 'PrintOutExcel'
      Caption = 'Write to Excel'
      OnExecute = actExcelWriteExecute
    end
    object actBatchPrintOut: TAction
      Category = 'PrintOutExcel'
      Caption = 'Batch Output'
    end
    object actSetupErrorG: TAction
      Category = 'Model_G'
      Caption = 'Send'
      OnExecute = actSetupErrorGExecute
    end
    object actGetErrorG: TAction
      Category = 'Model_G'
      Caption = 'Read'
      OnExecute = actGetErrorGExecute
    end
    object actLoadTstFile: TAction
      Category = 'PulsingTest'
      Caption = 'Load .tst'
      OnExecute = actLoadTstFileExecute
    end
    object actStartPulsingTest: TAction
      Category = 'PulsingTest'
      Caption = 'Start test'
    end
    object actRunRelayTest: TAction
      Category = 'RelayTest'
      Caption = 'Run test'
      OnExecute = actRunRelayTestExecute
    end
    object actMeterSendCommand: TAction
      Category = 'RelayTest'
      Caption = 'send command'
      OnExecute = actMeterSendCommandExecute
    end
    object actRelayTestGateConn: TAction
      Category = 'RelayTest'
      Caption = 'Conn'
      OnExecute = actRelayTestGateConnExecute
      OnUpdate = actRelayTestGateReadingsUpdate
    end
    object actRelayTestGateDisconn: TAction
      Category = 'RelayTest'
      Caption = 'Disconn'
      OnExecute = actRelayTestGateDisconnExecute
      OnUpdate = actRelayTestGateReadingsUpdate
    end
    object actRelayTestGateReadings: TAction
      Category = 'RelayTest'
      Caption = 'Readings'
      OnExecute = actRelayTestGateReadingsExecute
      OnUpdate = actRelayTestGateReadingsUpdate
    end
    object actStartCal1: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Start Cal'
      OnExecute = actStartCal1Execute
      OnUpdate = actMeterCalAutoUpdate
    end
    object actStartCal2: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Cal Phase'
      OnExecute = actStartCal2Execute
      OnUpdate = actMeterCalAutoUpdate
    end
    object actMeterCalLogon: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Log on'
      OnExecute = actMeterCalLogonExecute
      OnUpdate = actMeterCalAutoUpdate
    end
    object actCalRead: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Read'
      OnExecute = actCalReadExecute
      OnUpdate = actMeterCalAutoUpdate
    end
    object actSourceOutput4Cal1: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Source output 1'
      OnExecute = actSourceOutput4Cal1Execute
      OnUpdate = actMeterCalAutoUpdate
    end
    object actSourceOutput4Cal2: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Source output 2'
      OnExecute = actSourceOutput4Cal2Execute
      OnUpdate = actMeterCalAutoUpdate
    end
    object actReadError4Cal2: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Read Err %'
      OnExecute = actReadError4Cal2Execute
      OnUpdate = actMeterCalAutoUpdate
    end
    object actReadStdReadings: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Ref. Read'
      OnExecute = actReadStdReadingsExecute
      OnUpdate = actMeterCalAutoUpdate
    end
    object actMeterReadings: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Readings'
      OnExecute = actMeterReadingsExecute
      OnUpdate = actMeterCalAutoUpdate
    end
    object actMeterLogoff: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Log off'
      OnExecute = actMeterLogoffExecute
      OnUpdate = actMeterCalAutoUpdate
    end
    object actMeterCalAuto: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Auto Cal.'
      OnExecute = actMeterCalAutoExecute
      OnUpdate = actMeterCalAutoUpdate
    end
    object actStopTest: TAction
      Caption = 'Stop Test'
      OnExecute = actStopTestExecute
    end
    object actAccuracyTest: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Accuray test'
      OnExecute = actAccuracyTestExecute
      OnUpdate = actMeterCalAutoUpdate
    end
    object actStartFull: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Fully start'
      Hint = 'Cal & Test'
      OnExecute = actStartFullExecute
    end
    object actSave2Excel: TAction
      Category = 'EMS12JT Meter'
      Caption = 'Save'
      OnExecute = actSave2ExcelExecute
    end
    object act158Readings: TAction
      Category = '158Readings'
      Caption = 'Read'
      OnExecute = act158ReadingsExecute
    end
    object act158ReadingTest: TAction
      Category = '158Readings'
      Caption = 'Test msg'
      OnExecute = act158ReadingTestExecute
    end
    object act158ReadingsAll: TAction
      Category = '158Readings'
      Caption = 'Read (recursive)'
      OnExecute = act158ReadingsAllExecute
    end
    object actGetSequOfPos: TAction
      Category = 'errcalc'
      Caption = 'Err. calculaor setting'
      OnExecute = actGetSequOfPosExecute
      OnUpdate = actRaiseVUpdate
    end
    object actSetErr2: TAction
      Category = 'errcalc'
      Caption = 'Err % (high freq.)'
      OnExecute = actSetErr2Execute
      OnUpdate = actRaiseVUpdate
    end
    object act158CheckTu: TAction
      Category = '158Readings'
      Caption = 'Check Tu'
      Hint = 
        'When Vr > 3, remind the user that the load is too heavy'#13#10'When Vr' +
        ' > 4, force the source to drop through the software|Mainboard po' +
        'wer amplifier voltage (Tu), set voltage value (Vs), booster rati' +
        'o (1:10), conversion factor I =1.45'#13#10'Vr = (TU-vs / 10) / 1.45'#13#10'C' +
        'alculated on general situation, 0.2 O / 50 w the biggest withsta' +
        'nd voltage as metal resistance (Vr) = 4 v, the calorific value h' +
        'as reached 80% of its nominal value.'#13#10'When Vr > 3, remind the us' +
        'er that the load is too heavy'#13#10'When Vr > 4, force the source to ' +
        'drop through the software'
      OnExecute = act158CheckTuExecute
      OnUpdate = actRaiseVUpdate
    end
    object act158RuntimeCheck: TAction
      Category = '158Readings'
      Caption = 'Check runtime parameters'
      OnExecute = act158RuntimeCheckExecute
      OnUpdate = actRaiseVUpdate
    end
    object actTimingErrorTest: TAction
      Category = 'errcalc'
      Caption = 'Clock pulse test'
      OnExecute = actTimingErrorTestExecute
      OnUpdate = actRaiseVUpdate
    end
    object actRelayTestPowerUp: TAction
      Category = 'RelayTest'
      Caption = 'Power Up'
      OnExecute = actRelayTestPowerUpExecute
      OnUpdate = actRaiseVUpdate
    end
    object actRelayTestPowerDown: TAction
      Category = 'RelayTest'
      Caption = 'Power down'
      OnExecute = actRelayTestPowerDownExecute
      OnUpdate = actRaiseVUpdate
    end
    object actPowerConsumptionTest: TAction
      Category = 'PowerConsumption'
      Caption = 'Send'
      OnExecute = actPowerConsumptionTestExecute
      OnUpdate = actRaiseVUpdate
    end
    object actPowerReadings: TAction
      Category = 'PowerConsumption'
      Caption = 'Read'
      OnExecute = actPowerReadingsExecute
      OnUpdate = actRaiseVUpdate
    end
    object actPowerCalib: TAction
      Category = 'PowerConsumption'
      Caption = 'Calib. of Coils'
    end
    object actSourceOutput: TAction
      Category = 'Output'
      Caption = 'Source output'
      OnExecute = actSourceOutputExecute
      OnUpdate = actRaiseVUpdate
    end
    object actSetDailTest: TAction
      Category = 'errcalc'
      Caption = 'Start'
      OnExecute = actSetDailTestExecute
      OnUpdate = actRaiseVUpdate
    end
    object actResetWave: TAction
      Category = 'Output'
      Caption = 'Reset'
      OnExecute = actResetWaveExecute
      OnUpdate = actRaiseVUpdate
    end
    object actWaveOutput: TAction
      Category = 'Output'
      Caption = 'Output'
      OnExecute = actWaveOutputExecute
      OnUpdate = actRaiseVUpdate
    end
    object actVoltageMultiple: TAction
      Category = 'Output'
      Caption = 'Output (V)'
      OnExecute = actVoltageMultipleExecute
      OnUpdate = actRaiseVUpdate
    end
    object actCurrentMultiple: TAction
      Category = 'Output'
      Caption = 'Output(I)'
      OnExecute = actCurrentMultipleExecute
      OnUpdate = actRaiseVUpdate
    end
    object actSaveMultipleScheme: TAction
      Category = 'Output'
      Caption = 'Save'
    end
    object actTestSeqXlsOpen: TAction
      Category = 'Test Sequence'
      Caption = 'Open a Xls'
    end
    object actTestSequAddNew: TAction
      Category = 'Test Sequence'
      Caption = 'Add new item'
    end
    object actTestSequDele: TAction
      Category = 'Test Sequence'
      Caption = 'Delete select item'
    end
    object actTestSequModify: TAction
      Category = 'Test Sequence'
      Caption = 'Modify selected item'
    end
    object actTestSequBegin: TAction
      Category = 'Test Sequence'
      Caption = 'Star'
    end
    object actOutputPrecVolt: TAction
      Category = 'Output'
      Caption = 'Output U'
      OnExecute = actOutputPrecVoltExecute
      OnUpdate = actRaiseVUpdate
    end
    object actOutputPrecCurr: TAction
      Category = 'Output'
      Caption = 'Output I'
      OnExecute = actOutputPrecCurrExecute
      OnUpdate = actRaiseVUpdate
    end
    object actOutputHarmonicTypeG: TAction
      Category = 'Model_G'
      Caption = 'Output'
      OnExecute = actOutputHarmonicTypeGExecute
    end
    object actClearHarmonicTypeG: TAction
      Category = 'Model_G'
      Caption = 'Clear'
      OnExecute = actClearHarmonicTypeGExecute
    end
    object actOutputMultiHarmonicTypeG: TAction
      Category = 'Model_G'
      Caption = 'Mult-Harmonic'
      OnExecute = actOutputMultiHarmonicTypeGExecute
    end
    object actErrCalcSeleAll: TAction
      Category = 'errcalc'
      Caption = 'Select all'
      OnExecute = actErrCalcSeleAllExecute
    end
    object actOutput_cos1p3W: TAction
      Category = 'Output'
      Caption = 'Change'
      OnExecute = actOutput_cos1p3WExecute
      OnUpdate = actRaiseVUpdate
    end
    object actSwitchCurrLoop: TAction
      Category = 'errcalc'
      Caption = 'Switch'
      OnExecute = actSwitchCurrLoopExecute
      OnUpdate = actRaiseVUpdate
    end
    object actResetICT: TAction
      Category = 'ICTs'
      Caption = 'Reset'
      OnExecute = actResetICTExecute
      OnUpdate = actRaiseVUpdate
    end
    object actReadState: TAction
      Category = 'ICTs'
      Caption = 'Get lights'
      OnExecute = actReadStateExecute
      OnUpdate = actRaiseVUpdate
    end
    object actResetAllICTs: TAction
      Category = 'ICTs'
      Caption = 'Reset ICTs'
      OnExecute = actResetAllICTsExecute
      OnUpdate = actRaiseVUpdate
    end
    object actPortSendCommand: TAction
      Caption = 'actPortSendCommand'
    end
    object actGatingTest: TAction
      Category = 'Gating Pulse'
      Caption = 'Start gating'
    end
    object actTriggerGate: TAction
      Category = 'Gating Pulse'
      Caption = 'Trigger gate signal'
    end
    object actStartCounting: TAction
      Category = 'Gating Pulse'
      Caption = 'Start counter'
    end
    object actResetCounting: TAction
      Category = 'Gating Pulse'
      Caption = 'Reset counter'
    end
    object actGoFinetune: TAction
      Category = 'Debug1'
      Caption = 'Fine-tune'
      OnExecute = actGoFinetuneExecute
      OnUpdate = actRaiseVUpdate
    end
    object actWriteFinetune: TAction
      Category = 'Debug1'
      Caption = 'Write value'
      OnExecute = actWriteFinetuneExecute
      OnUpdate = actRaiseVUpdate
    end
    object actReadMatrix: TAction
      Category = 'RRKit'
      Caption = 'Get readings'
      OnExecute = actReadMatrixExecute
      OnUpdate = actReadMatrixUpdate
    end
    object actReadThread: TAction
      Category = 'RRKit'
      Caption = 'Monitor readings'
      OnExecute = actReadThreadExecute
    end
  end
  object RzVersionInfo1: TRzVersionInfo
    Left = 654
    Top = 616
  end
  object tmr1: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = tmr1Timer
    Left = 696
    Top = 617
  end
  object YCMeter1: TYCMeter
    Location = MLIntra
    ChannelNo = 7
    CommPort = 3
    Settings = '19200,n,8,1'
    PortOpen = False
    wait = 1
    Stop = False
    Left = 611
    Top = 617
  end
  object IdTCPClient1: TIdTCPClient
    MaxLineAction = maException
    Port = 0
    Left = 894
    Top = 613
  end
  object ImageList1: TImageList
    Left = 816
    Top = 597
    Bitmap = {
      494C010106000A00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C3100009C310000CE6300009C310000CE6300009C3100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C00CECECE009C9C9C00CECECE009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C310000CE6300009C310000CE6300009C3100009C3100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00CECECE009C9C9C00CECECE009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C3100009C310000CE6300009C310000CE6300009C3100000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C00CECECE009C9C9C00CECECE009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C009C3100009C3100009C3100009C3100009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00FFCECE0063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00CECECE009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00FFCECE0063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00CECECE009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00FFCECE0063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00CECECE009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00FFCECE0063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00CECECE009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00FFCECE0063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00FFFFFF00CECECE009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300636363006363630063636300000000000000
      0000000000000000000000000000636363000000000000000000000000000000
      000000000000000000009C9C9C009C9C9C009C9C9C009C9C9C00000000000000
      00000000000000000000000000009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300636363000000
      000000000000636363009C9C9C009C9C9C009C9C9C009C9C9C00636363000000
      000000000000000000006363630063636300000000009C9C9C009C9C9C000000
      0000000000009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C000000
      000000000000000000009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C009C9C9C009C9C9C006363
      6300636363009C9C9C00CECECE00CECECE00CECECE009C9C9C00636363006363
      63006363630063636300CECECE00636363009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C00CECECE00CECECE00CECECE009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C00CECECE009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00FFFFFF00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE009C9C9C009C9C
      9C009C9C9C00CECECE0063636300000000009C9C9C00FFFFFF00CECECE00CECE
      CE00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE009C9C9C009C9C
      9C009C9C9C00CECECE009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00FFFFFF00CECECE00CECE
      CE00FFFFFF00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE009C9C9C0000000000000000009C9C9C00FFFFFF00CECECE00CECE
      CE00FFFFFF00CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009C9C9C00FFFFFF00FFFFFF009C9C
      9C009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C
      9C009C9C9C000000000000000000000000009C9C9C00FFFFFF00FFFFFF009C9C
      9C009C9C9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C
      9C009C9C9C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C000000
      0000000000009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C000000
      000000000000000000000000000000000000000000009C9C9C009C9C9C000000
      0000000000009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063CECE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CE9C63009C3100009C3100009C3100009C310000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C0063636300636363006363630063636300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063CECE00009CCE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE9C6300FFFFFF00FFCE9C00FFCE9C00CE9C6300CE9C63009C3100000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00FFFFFF00CECECE00CECECE009C9C9C009C9C9C00636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063CECE00009CCE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C009C9C9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CE9C63009C3100009C3100009C3100009C3100009C3100009C3100000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C006363630063636300636363006363630063636300636363000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063CECE009CFFFF00009CCE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C9C00E7E7E7009C9C9C0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CE9C
      6300FFFFFF00FFCE9C00FFCE9C00FFCE9C00FFCE9C00FFCE9C00CE9C63009C31
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C00FFFFFF00CECECE00CECECE00CECECE00CECECE00CECECE009C9C9C006363
      6300000000000000000000000000000000000000000000000000000000000000
      000063CECE00009CCE00009CCE00009CCE0063FFFF00009CCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C009C9C9C009C9C9C009C9C9C00CECECE009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000CE9C6300FFFF
      FF00CE9C6300CE9C6300CE9C6300CE9C6300CE9C6300FFCE9C00CE9C6300CE9C
      63009C31000000000000000000000000000000000000000000009C9C9C00FFFF
      FF009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00CECECE009C9C9C009C9C
      9C00636363000000000000000000000000000000000000000000000000000000
      000063CECE009CFFFF0063FFFF0063FFFF0063FFFF0063FFFF00009CCE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00E7E7E700CECECE00CECECE00CECECE00CECECE009C9C9C000000
      00000000000000000000000000000000000000000000CE9C6300FFFFFF00FFCE
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFCE9C00FFCE9C00CE9C
      63009C310000000000000000000000000000000000009C9C9C00FFFFFF00CECE
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECECE00CECECE009C9C
      9C00636363000000000000000000000000000000000000000000000000000000
      00000000000063CECE009CFFFF0063FFFF00009CCE0063CECE0063CECE0063CE
      CE00000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00E7E7E700CECECE009C9C9C009C9C9C009C9C9C009C9C
      9C000000000000000000000000000000000000000000CE9C6300FFFFFF00FFCE
      9C00CE9C6300CE9C6300CE9C6300CE9C6300CE9C6300FFCE9C00FFCE9C00CE9C
      6300CE9C63009C3100000000000000000000000000009C9C9C00FFFFFF00CECE
      CE009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00CECECE00CECECE009C9C
      9C009C9C9C006363630000000000000000000000000000000000000000000000
      00000000000063CECE009CFFFF0063FFFF0063FFFF00009CCE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00E7E7E700CECECE00CECECE009C9C9C00000000000000
      00000000000000000000000000000000000000000000CE9C6300FFFFFF00FFCE
      9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFCE9C00FFCE9C00CE9C
      6300CE9C63009C3100000000000000000000000000009C9C9C00FFFFFF00CECE
      CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CECECE00CECECE009C9C
      9C009C9C9C00636363000000000000000000000000000000000063CECE00009C
      CE00009CCE00009CCE00009CCE009CFFFF0063FFFF0063FFFF00009CCE000000
      00000000000000000000000000000000000000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C00E7E7E700CECECE00CECECE009C9C9C000000
      00000000000000000000000000000000000000000000CE9C6300CE9C6300CE9C
      6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C
      63009C3100009C3100000000000000000000000000009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C0063636300636363000000000000000000000000000000000063CECE009CFF
      FF009CFFFF0063FFFF0063FFFF0063FFFF0063FFFF0063FFFF0063FFFF00009C
      CE000000000000000000000000000000000000000000000000009C9C9C00E7E7
      E700E7E7E700CECECE00CECECE00CECECE00CECECE00CECECE00CECECE009C9C
      9C0000000000000000000000000000000000CE9C6300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE9C
      6300CE9C63009C31000000000000000000009C9C9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C
      9C009C9C9C0063636300000000000000000000000000000000000000000063CE
      CE009CFFFF009CFFFF0063FFFF0063FFFF00009CCE0063CECE0063CECE0063CE
      CE00000000000000000000000000000000000000000000000000000000009C9C
      9C00E7E7E700E7E7E700CECECE00CECECE009C9C9C009C9C9C009C9C9C009C9C
      9C0000000000000000000000000000000000CE9C6300FFCE9C00FFCE9C009CCE
      CE00009CCE00FFCE9C00FFCE9C00FFCE9C009CCECE00009CCE00FFCE9C00FFFF
      FF00CE9C6300CE9C63009C310000000000009C9C9C00CECECE00CECECE00E7E7
      E7009C9C9C00CECECE00CECECE00CECECE00E7E7E7009C9C9C00CECECE00FFFF
      FF009C9C9C009C9C9C00636363000000000000000000000000000000000063CE
      CE009CFFFF009CFFFF009CFFFF0063FFFF0063FFFF00009CCE00000000000000
      0000000000000000000000000000000000000000000000000000000000009C9C
      9C00E7E7E700E7E7E700E7E7E700CECECE00CECECE009C9C9C00000000000000
      00000000000000000000000000000000000000000000CE9C6300FFCE9C009CCE
      CE0000FFFF00009CCE00CE9C6300FFCE9C009CCECE0000FFFF00009CCE00FFCE
      9C00FFFFFF00CE9C63009C31000000000000000000009C9C9C00CECECE00E7E7
      E700CECECE009C9C9C009C9C9C00CECECE00E7E7E700CECECE009C9C9C00CECE
      CE00FFFFFF009C9C9C0063636300000000000000000000000000000000000000
      000063CECE009CFFFF009CFFFF009CFFFF0063FFFF0063FFFF00009CCE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00E7E7E700E7E7E700E7E7E700CECECE00CECECE009C9C9C000000
      0000000000000000000000000000000000000000000000000000CE9C63009CCE
      CE0000FFFF00009CCE00CE9C6300CE9C63009CCECE0000FFFF00009CCE00CE9C
      6300CE9C6300CE9C6300000000000000000000000000000000009C9C9C00E7E7
      E700CECECE009C9C9C009C9C9C009C9C9C00E7E7E700CECECE009C9C9C009C9C
      9C009C9C9C009C9C9C0000000000000000000000000000000000000000000000
      000063CECE009CFFFF009CFFFF009CFFFF0063FFFF0063FFFF0063FFFF00009C
      CE00000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00E7E7E700E7E7E700E7E7E700CECECE00CECECE00CECECE009C9C
      9C00000000000000000000000000000000000000000000000000000000009CCE
      CE0000FFFF00009CCE0000000000000000009CCECE0000FFFF00009CCE000000
      000000000000000000000000000000000000000000000000000000000000E7E7
      E700CECECE009C9C9C000000000000000000E7E7E700CECECE009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063CECE009CFFFF009CFFFF009CFFFF0063FFFF0063FFFF0063FF
      FF00009CCE000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C00E7E7E700E7E7E700E7E7E700CECECE00CECECE00CECE
      CE009C9C9C000000000000000000000000000000000000000000000000009CCE
      CE0000FFFF00009CCE0000000000000000009CCECE0000FFFF00009CCE000000
      000000000000000000000000000000000000000000000000000000000000E7E7
      E700CECECE009C9C9C000000000000000000E7E7E700CECECE009C9C9C000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000063CECE0063CECE0063CECE0063CECE0063CECE0063CECE0063CE
      CE0063CECE0063CECE0000000000000000000000000000000000000000000000
      0000000000009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C0000000000000000000000000000000000000000000000
      00009CCECE00009CCE000000000000000000000000009CCECE00009CCE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E7E7E7009C9C9C00000000000000000000000000E7E7E7009C9C9C000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F81FF81F00000000F81FF81F00000000
      F81FF81F00000000F81FF81F00000000FC3FFC3F00000000FC3FFC3F00000000
      FC3FFC3F00000000FC3FFC3F00000000FC3FFC3F00000000FC3EFC3E00000000
      981C981C00000000000000000000000000010001000000000003000300000000
      0007000700000000981F981F00000000FBFFFBFFF83FF83FF9FFF9FFF01FF01F
      FCFFFCFFF01FF01FFC7FFC7FE00FE00FF03FF03FC007C007F01FF01F80078007
      F80FF80F80038003F83FF83F80038003C01FC01F80038003C00FC00F00030003
      E00FE00F00010001E03FE03F80018001F01FF01FC003C003F00FF00FE31FE31F
      F807F807E31FE31FF803F803F39FF39F00000000000000000000000000000000
      000000000000}
  end
  object rzDlg1: TRzSelectFolderDialog
    Left = 552
    Top = 624
  end
  object XLS: TXLSReadWriteII4
    Version = xvExcel97
    Sheets = <
      item
        Name = 'Sheet1'
        DefaultColWidth = 8
        DefaultRowHeight = 255
        PrintSettings.Copies = 0
        PrintSettings.FooterMargin = 0.500000000000000000
        PrintSettings.FooterMarginCm = 1.270000000000000000
        PrintSettings.HeaderMargin = 0.500000000000000000
        PrintSettings.HeaderMarginCm = 1.270000000000000000
        PrintSettings.MarginBottom = 1.000000000000000000
        PrintSettings.MarginLeft = 0.750000000000000000
        PrintSettings.MarginRight = 0.750000000000000000
        PrintSettings.MarginTop = 1.000000000000000000
        PrintSettings.MarginBottomCm = 2.540000000000000000
        PrintSettings.MarginLeftCm = 1.905000000000000000
        PrintSettings.MarginRightCm = 1.905000000000000000
        PrintSettings.MarginTopCm = 2.540000000000000000
        PrintSettings.Options = [psoPortrait]
        PrintSettings.PaperSize = psA4
        PrintSettings.ScalingFactor = 100
        PrintSettings.StartingPage = 1
        PrintSettings.HorizPagebreaks = <>
        PrintSettings.VertPagebreaks = <>
        PrintSettings.Resolution = 600
        PrintSettings.FitWidth = 1
        PrintSettings.FitHeight = 1
        MergedCells = <>
        Options = [soGridlines, soRowColHeadings, soShowZeros]
        WorkspaceOptions = [woShowAutoBreaks, woRowSumsBelow, woColSumsRight, woOutlineSymbols]
        SheetProtection = [spEditObjects, spEditScenarios, spEditCellFormatting, spEditColumnFormatting, spEditRowFormatting, spInsertColumns, spInsertRows, spInsertHyperlinks, spDeleteColumns, spDeleteRows, spSelectLockedCells, spSortCellRange, spEditAutoFileters, spEditPivotTables, spSelectUnlockedCells]
        Zoom = 0
        ZoomPreview = 0
        RecalcFormulas = True
        Hidden = hsVisible
        Validations = <>
        DrawingObjects.Texts = <>
        DrawingObjects.Notes = <>
        DrawingObjects.Basics = <>
        DrawingObjects.AutoShapes = <>
        DrawingObjects.Pictures = <>
        ControlsObjects.ListBoxes = <>
        ControlsObjects.ComboBoxes = <>
        ControlsObjects.Buttons = <>
        ControlsObjects.CheckBoxes = <>
        ControlsObjects.RadioButtons = <>
        Hyperlinks = <>
        ConditionalFormats = <>
      end>
    Workbook.Left = 100
    Workbook.Top = 100
    Workbook.Width = 10000
    Workbook.Height = 7000
    Workbook.SelectedTab = 0
    Workbook.Options = [woHScroll, woVScroll, woTabs]
    OptionsDialog.SaveExtLinkVal = False
    OptionsDialog.CalcCount = 100
    OptionsDialog.CalcMode = cmAutomatic
    OptionsDialog.Delta = 0.001000000000000000
    OptionsDialog.ShowObjects = soShowAll
    OptionsDialog.Iteration = False
    OptionsDialog.PrecisionAsDisplayed = True
    OptionsDialog.R1C1Mode = False
    OptionsDialog.RecalcBeforeSave = False
    OptionsDialog.Uncalced = False
    OptionsDialog.SaveRecalc = True
    BookProtected = False
    Backup = False
    RefreshAll = False
    StrTRUE = 'TRUE'
    StrFALSE = 'FALSE'
    ShowFormulas = False
    IsMac = False
    PreserveMacros = True
    ComponentVersion = '4.00.21a'
    MSOPictures = <>
    RecomendReadOnly = False
    TempFileMode = tfmOnDisk
    Left = 504
    Top = 608
  end
  object dlgOpen: TOpenDialog
    Filter = 
      'Excel files (*.xls)|*.xls|2007 Excel files (*.xlsx)|*.xlsx|All f' +
      'iles (*.*)|*.*'
    Left = 444
    Top = 608
  end
  object ImgLTestSequ: TImageList
    Left = 378
    Top = 613
  end
end
