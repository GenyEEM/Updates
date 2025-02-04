Attribute VB_Name = "basCustomer"
Option Explicit
Public Const gTotalRows = 34
Public Const gFixTitleRow = 31

Public test_lst() As String
Public err1() As String
Public err2() As String
Public err3() As String

Global gMtSum As Long
Global gMtGood As Long
Global gMtBad  As Long

Public gstrPNO As String  ' lot number
Public gstrRangeName As String ' for address of meter data

Public Enum KindOfTest
    kofVoltage
    kofFrequency
End Enum

Sub ClearContents()
    With Sheet1
        .Range("a12", "m59").ClearContents
    End With
End Sub
Sub getTitleInfo(rst As Recordset)
    
    rst.MoveFirst
    
    gstrPNO = rst.Fields!PNO
    
    Select Case LCase(rst.Fields!Model)
        Case "u3400"
            gstrRangeName = "_u3400"
        Case "e650"
            gstrRangeName = "_u650"
        Case Else
            gstrRangeName = "_u3400"
    End Select
    
'    With Sheet1
'        '--beginn/end time--
'        .Range("_beginn") = rst.Fields("ForConclusion") & ""
'        .Range("_endTest") = rst.Fields("AftConclusion") & ""
'
'        '---print on-----------
'        .Range("_printOn") = Format(Now, "short date")
'
'        '------meter parameters------------
'        .Range("_type") = rst.Fields("type") & ""
'        .Range("_Curr") = GetBracketStr(rst.Fields("current") & "") & " [A]"
'        .Range("_volt") = rst.Fields("voltage") & " V"
'        .Range("_MeterCo1") = rst.Fields("Constant") & ""
'        .Range("_maxCurr") = CStr(Val(rst.Fields("current") & ""))
'        .Range("_meterType") = rst.Fields("WireModel") & ""
'        .Range("_mtModel") = rst.Fields("Model") & ""
'        .Range("_mtSize") = rst.Fields("current") & ""
'        .Range("_mtf") = rst.Fields("MadePlace") & ""
'
'    End With

End Sub
Sub getMeterInfo(rst As Recordset, index As Integer)
    Dim strRange As String
    Dim strRow As String
    
    strRow = CStr(11 + index)
    
    With Sheet1
        'meter nbr
        strRange = "A" & strRow
        .Range(strRange) = rst.Fields("meterno") & ""
        
        'serial nbr
        strRange = "C" & strRow
        .Range(strRange) = CStr(index)
    
        'C.T conclusion
        strRange = "G" & strRow
        .Range(strRange) = rst.Fields("HIDDENTEST") & ""
        
        
        'S.T conclusion
        strRange = "H" & strRow
        .Range(strRange) = rst.Fields("STARTEST") & ""
        
        'conclusion
        strRange = "I" & strRow
        .Range(strRange) = rst.Fields("Conclusion") & ""
        
        'Initial R
        strRange = "J" & strRow
        .Range(strRange) = rst.Fields("STARTDEG") & ""
    
        'Final R
        strRange = "K" & strRow
        .Range(strRange) = rst.Fields("ENDDEG") & ""
        
        'Result of Dial Test
        strRange = "L" & strRow
        .Range(strRange) = rst.Fields("CUNDUTOTAL") & ""
        
        'Error of Dial Test
        strRange = "M" & strRow
        .Range(strRange) = rst.Fields("CUNDUVALEY") & ""
    

    End With

End Sub
Sub getErrorData(rst As Recordset, index As Integer)
    Dim strCol As String
    
    If rst.EOF And rst.BOF Then Exit Sub
    
    rst.MoveFirst

    While Not rst.EOF
        If getChkPointdata(rst.Fields("LoadName") & "", strCol) Then
            Sheet1.Range(strCol & CStr(11 + index)) = rst.Fields("AveData") & ""
        End If
        rst.MoveNext
    Wend
    

End Sub

Function getChkPointdata(strChkP As String, ByRef strCol As String) As Boolean
    
    getChkPointdata = True
    
    Select Case LCase(strChkP)
        Case "0.1ib(1.0)"
            strCol = "d"
        Case "ib(1.0)"
            strCol = "e"
        Case "ib(0.5l)"
            strCol = "f"
        Case Else
           getChkPointdata = False
    End Select
    
End Function



Public Sub copysheet()
    Dim i As Integer
    
    Application.DisplayAlerts = False
    
    Sheet2.Visible = xlSheetVisible
    
    For i = 1 To Sheets.Count
        If InStr(1, "printout", Sheets(i).Name) > 0 Then
            Sheets(i).Delete
        End If
    Next i
    
    Sheets("Landis_templete").Copy After:=Sheets(2)
    Sheets("Landis_templete (2)").Name = "printout"
    
    Sheet2.Visible = xlSheetHidden
    Application.DisplayAlerts = True
    
End Sub

Public Sub HandleSheet(ByRef times As Integer, ByRef StartRow As Integer)
    Dim i As Integer
    Dim index As Integer
    
    'clear context
    Sheets("landis_templete").Range("meter_result").ClearContents
    
    'iterate of templete
    For i = 0 To gTotalRows - 1
        index = times * gTotalRows + i
        If index > UBound(test_lst) Then Exit For
        Sheet2.Range("a" & CStr(9 + i)) = test_lst(index)
        Sheet2.Range("h" & CStr(9 + i)) = err1(index)
        Sheet2.Range("q" & CStr(9 + i)) = err2(index)
        Sheet2.Range("z" & CStr(9 + i)) = err3(index)
    Next i
    
    'copy and paste
    If StartRow = 1 Then
        copysheet
    Else
        Sheets("Landis_templete").Range("whole_rpt").Copy Sheets("printout").Rows(StartRow)
        Sheets("printout").Rows(StartRow).RowHeight = Sheets("Landis_templete").Rows(1).RowHeight
    End If
    
    StartRow = Sheets("printout").UsedRange.Rows.Count + 1
    
    If (times + 1) * gTotalRows < UBound(test_lst) + 1 Then
        times = times + 1
        HandleSheet index, StartRow
    End If
End Sub

Public Sub gen_report()
    Dim strBatchNbr As String
    Dim RstMeterInfo As adodb.Recordset
    Dim i As Integer
    
    Application.ScreenUpdating = False
    Application.DisplayAlerts = False
'    Sheet5.Visible = xlSheetVisible
'    Sheet1.Visible = xlSheetVisible
    'copysheet
    If Not OpenDatabase(True) Then Exit Sub
    strBatchNbr = GetSetting(gstrAppName, gstrSection, gstrKeyBatchNbr, "")
    
    Set RstMeterInfo = getMeterInfoRst(strBatchNbr)
    
    If Not (RstMeterInfo.EOF And RstMeterInfo.BOF) Then
        For i = Sheets.Count To 1 Step -1
            If InStr(1, Sheets(i).Name, "template") < 1 Then
                Sheets(i).Delete
            End If
        Next i
        
        '---Init. global variables---
'        gMtSum = 0: gMtGood = 0:    gMtBad = 0
        
        '---handle fixed title---
        getTitleInfo RstMeterInfo
        
        '---Terminal_entry---
        process_Terminal_entry Sheet1.Name, RstMeterInfo
        
        '---Test result---
'        process_iron_1 Sheet1.Name, RstMeterInfo
        
    End If
'    If Sheets.Count > 2 Then
'        Sheet5.Visible = xlSheetHidden
'        Sheet1.Visible = xlSheetHidden
'    End If
    
    '-----------save as-------------------
    
    
    '----------show result----------------
    Set RstMeterInfo = Nothing
    Application.DisplayAlerts = True
    Application.ScreenUpdating = True
    
End Sub

Public Function interpreter(strChkPName As String, ByRef strIb As String, ByRef strpf As String) As Boolean
    Dim N As Integer
    Dim T
    
    N = InStr(1, LCase(strChkPName), "ib")
    If N > 0 Then
        interpreter = True
        If N = 1 Then
            strIb = "100%"
        Else
            T = Val(strChkPName)
            strIb = CInt(T * 100) & "%"
        End If
        T = GetBracketStr(strChkPName)
        
        If CInt(Val(T)) = 1 Then
            strpf = "1.0"
        ElseIf InStr(1, T, "L") > 0 Then
            strpf = Format(Val(T), "#0.#") & "i"
        ElseIf InStr(1, T, "C") > 0 Then
            strpf = Format(Val(T), "#0.#") & "c"
        Else
            interpreter = False
        End If
    Else
        interpreter = False
    End If
End Function

Public Function GetColoumStr(strChkPName As String, ByRef col As Integer) As Boolean
    Dim i As Integer
    Dim strIb As String
    Dim strpf As String
    
    GetColoumStr = interpreter(strChkPName, strIb, strpf)
    
    With ActiveSheet
    
        If GetColoumStr Then
            GetColoumStr = False
            For i = 5 To 26 Step 2
                'Debug.Print .Cells(10, i)
                If (StrComp(strIb, Trim(.Cells(10, i))) = 0) And (StrComp(strpf, Trim(.Cells(11, i))) = 0) Then
                    col = i
                    GetColoumStr = True
                    Exit Function
                End If
            Next i
        End If
    
    End With
    
End Function
Public Function GetColoumStrExt(strChkPName As String, strTagExt As String, ByRef col As Integer) As Boolean
    Dim i As Integer
    Dim strIb As String
    Dim strpf As String
    
    GetColoumStrExt = interpreter(strChkPName, strIb, strpf)
    
    With ActiveSheet
    
        If GetColoumStrExt Then
            GetColoumStrExt = False
            For i = 5 To 15 Step 2
                'Debug.Print .Cells(10, i)
                If (StrComp(strIb, Trim(.Cells(10, i))) = 0) And (StrComp(strpf, Trim(.Cells(11, i))) = 0) _
                   And (StrComp(strTagExt, Trim(.Cells(12, i))) = 0) Then
                    col = i
                    GetColoumStrExt = True
                    Exit Function
                End If
            Next i
        End If
    
    End With
    
End Function

Sub deleteRows(strName As String, Value As Integer)
    On Error Resume Next
    With Sheets(strName)
        Do While Not (.Rows(Value).Name = .Range("_bline").Name)
            .Rows(Value).Select
            Selection.Delete Shift:=xlUp
            .Rows(Value).Select
        Loop
    End With
    
End Sub

Sub HandleOtherMeterDataDisp(rstData As Recordset, rst_Meter As Recordset, a_offset As Integer)
    Dim index As Integer
    Dim str
    rstData.MoveFirst
    index = 1
    Do While (Not rstData.EOF)
        Range("$B$24").Offset(a_offset) = rstData!SortNo & "" 'rst_Meter!serialno & "" 'rst_Meter!meterNo & ""
        Range("$G$24").Offset(a_offset) = GetVoltagePercent(rstData!LoadName & "") 'rst_Meter!meterNo & "" 'rst_Meter!serialno & ""
        Range("$L$24").Offset(a_offset) = GetCurrentPercent(rstData!LoadName & "", rst_Meter!current & "")  ' rst_Meter!HIDDENTEST & ""
        Range("$Q$24").Offset(a_offset) = GetCosStr(rstData!LoadName & "") 'rst_Meter!STARTEST & ""
        Range("$V$24").Offset(a_offset) = "--"
        Range("$AA$24").Offset(a_offset) = rstData!AveData & "" ' rst_Meter!WALKTEST & ""
        Range("$AF$24").Offset(a_offset) = "--" 'rst_Meter!Conclusion & ""
        'Range("_pf" & CStr(index)).Offset(a_offset + 1) = rstData!AveData & ""
        index = index + 1
        rstData.MoveNext
    Loop
    
End Sub

Sub CopySelectionWithFormatting(strName As String)
    Dim ws As Worksheet
    Dim newWs As Worksheet
    Dim rng As Range
    
    ' 设置当前选中的范围
    Set rng = Selection
    
    ' 创建一个新的工作表
    Set newWs = Sheets.Add(After:=Sheets(Sheets.Count))
    newWs.Name = strName ' 可以根据需要修改新工作表的名字
    
    rng.Copy
    rng.PasteSpecial Paste:=xlPasteColumnWidths, Operation:=xlPasteSpecialOperationNone, SkipBlanks:=False, Transpose:=False
    ActiveSheet.Paste
    
    rng.EntireColumn.Copy
    newWs.Range(rng.Address).EntireColumn.PasteSpecial Paste:=xlPasteColumnWidths
    
    ' 清除剪贴板
    Application.CutCopyMode = False
    
End Sub

Sub AddNewRow(aRow As Integer)
    With Sheet5
        '------------add 1 row for display next meter data------------------
        .Range("_bline").Select
        Selection.Insert Shift:=xlDown
        '.Rows("24:24").Select
        .Rows(aRow).Select
        Selection.Copy
        .Range("_bline").Offset(-1).Select
        Selection.PasteSpecial Paste:=xlPasteFormats, Operation:=xlNone, _
        SkipBlanks:=False, Transpose:=False
        Application.CutCopyMode = False
        '------------the end of block---------------------------------------
    End With
End Sub

Public Sub process_Terminal_entry(strName As String, rst_Meter As Recordset)
    Dim strItem As String
    Dim s As String
    Dim i As Integer
    Dim N As Integer
    
'    strItem = "Meter Number, Constr. Year, New Meter R.I, User Status, Sealcode, Lot No, Result code1, Result code2, " + _
'            "Result code3, REMARK 1/1, REMARK 1/2, REMARK 1/3, REMARK 2/1, REMARK 2/2, REMARK 2/3," + _
'            "Meter for QC, kWh 1 start, kWh 1 end, kWh 2 start, kWh 2 end, kWh 3 start, kWh 3 end," + _
'            "kvah 1 start, kvah 1 end, kvah 2 start, kvah 2 end, kVAh 1 start, kVAh 1 end, kVAh 2 start, kVAh 2 end," + _
'            "UII, MODULE, REMARK3/1, REMARK3/2, REMARK3/3, Total Evaluation"
'
'    Range("_section") = "Terminal_entry"

    'delete rows
'    deleteRows strName, gFixTitleRow + 1
    
    With Sheets(strName)
        'do loop for first page
        '---set up for fixed column------
'        N = GetItem(strItem, ",", -1)
'        For i = 0 To N - 1
'            s = GetItem(strItem, ",", i)
'            AddNewRow 31 'where the tital row is @
'            Range("Test_Range").Offset(i + 1) = s
'        Next i

        .Select
        '---clear contents---
        Range("__clear").Select
        Selection.ClearContents
         
        gMtSum = 1
        rst_Meter.MoveFirst
        Do While Not rst_Meter.EOF And (gMtSum <= 32)
           Range("err" + CStr(gMtSum)) = "MP" + CStr(rst_Meter!MeterPlace)
           Range("err" + CStr(gMtSum)).Offset(1) = "'" & Trim(rst_Meter!meterno & "")
           Range("err" + CStr(gMtSum)).Offset(2) = Sheet2.Range(gstrRangeName).Offset(2) '"U"
           Range("err" + CStr(gMtSum)).Offset(3) = Sheet2.Range(gstrRangeName).Offset(3) '"1"
           Range("err" + CStr(gMtSum)).Offset(4) = Sheet2.Range(gstrRangeName).Offset(4) ' "'" & "05"
           Range("err" + CStr(gMtSum)).Offset(5) = Sheet2.Range(gstrRangeName).Offset(5) '"KWH"
           Range("err" + CStr(gMtSum)).Offset(6) = Sheet2.Range(gstrRangeName).Offset(6) '"'05"
           Range("err" + CStr(gMtSum)).Offset(7) = Sheet2.Range(gstrRangeName).Offset(7) '"6"
           Range("err" + CStr(gMtSum)).Offset(8) = Sheet2.Range(gstrRangeName).Offset(8) '"3"
           Range("err" + CStr(gMtSum)).Offset(9) = Sheet2.Range(gstrRangeName).Offset(9) '"1"
           Range("err" + CStr(gMtSum)).Offset(10) = Sheet2.Range(gstrRangeName).Offset(10) ' "SM03R004"
           Range("err" + CStr(gMtSum)).Offset(11) = Sheet2.Range(gstrRangeName).Offset(11) ' "1002"
           Range("err" + CStr(gMtSum)).Offset(12) = Sheet2.Range(gstrRangeName).Offset(12) '"2007"
           Range("err" + CStr(gMtSum)).Offset(13) = Sheet2.Range(gstrRangeName).Offset(13) '"30"
           Range("err" + CStr(gMtSum)).Offset(14) = Sheet2.Range(gstrRangeName).Offset(14) '"SMP3PH380V3PH4W01"
           Range("err" + CStr(gMtSum)).Offset(15) = Sheet2.Range(gstrRangeName).Offset(15) '"LANDIS & GYR"
           Range("err" + CStr(gMtSum)).Offset(16) = Sheet2.Range(gstrRangeName).Offset(16) '"U3400"
           Range("err" + CStr(gMtSum)).Offset(17) = "'" & Format(rst_Meter!testdate, "ddmmyyyy")
           Range("err" + CStr(gMtSum)).Offset(18) = Sheet2.Range(gstrRangeName).Offset(18) '"2024"
           Range("err" + CStr(gMtSum)).Offset(19) = Year(rst_Meter!testdate)
           Range("err" + CStr(gMtSum)).Offset(20) = Sheet2.Range(gstrRangeName).Offset(20) '"'01"
           Range("err" + CStr(gMtSum)).Offset(21) = Sheet2.Range(gstrRangeName).Offset(21) '"?"
           Range("err" + CStr(gMtSum)).Offset(22) = "'" & Trim(rst_Meter!ENDDEG & "")
           Range("err" + CStr(gMtSum)).Offset(23) = Sheet2.Range(gstrRangeName).Offset(23) '"'0"
           Range("err" + CStr(gMtSum)).Offset(24) = Sheet2.Range(gstrRangeName).Offset(24) '"'380"
           Range("err" + CStr(gMtSum)).Offset(25) = Sheet2.Range(gstrRangeName).Offset(25) '"'380"
           Range("err" + CStr(gMtSum)).Offset(26) = Sheet2.Range(gstrRangeName).Offset(26) '"'10-100"
           Range("err" + CStr(gMtSum)).Offset(27) = Sheet2.Range(gstrRangeName).Offset(27) '""
           Range("err" + CStr(gMtSum)).Offset(28) = "'" & Format(rst_Meter!testdate & "", "yyyymm")
           Range("err" + CStr(gMtSum)).Offset(29) = Sheet2.Range(gstrRangeName).Offset(29) '"Status"
           Range("err" + CStr(gMtSum)).Offset(30) = "'" & Format(rst_Meter!testdate, "ddmmyyyy")
           Range("err" + CStr(gMtSum)).Offset(34) = IIf(rst_Meter!HIDDENTEST & "" = "pass", "'01", "'02")
           Range("err" + CStr(gMtSum)).Offset(35) = IIf(rst_Meter!WALKTEST & "" = "pass", "'01", "'02")
 
           Range("err" + CStr(gMtSum)).Offset(37) = Sheet2.Range(gstrRangeName).Offset(37) '"Remark 1/1 + 1/2 + 1/3"
           Range("err" + CStr(gMtSum)).Offset(38) = Sheet2.Range(gstrRangeName).Offset(38) '"Remark 2/1 + 2/2 + 2/3"
           Range("err" + CStr(gMtSum)).Offset(39) = Sheet2.Range(gstrRangeName).Offset(39) '"DUM"
           
           Range("err" + CStr(gMtSum)).Offset(44) = rst_Meter!tester & ""
           Range("err" + CStr(gMtSum)).Offset(45) = Sheet2.Range(gstrRangeName).Offset(45) '"Remark 3/1 + 3/2 + 3/3"

           
           
'           Range("err" + CStr(gMtSum)).Offset(3) = rst_Meter!TESTYER & ""
'           Range("err" + CStr(gMtSum)).Offset(17) = rst_Meter!STARTDEG & ""
'           Range("err" + CStr(gMtSum)).Offset(18) = rst_Meter!ENDDEG & ""
'           Range("err" + CStr(gMtSum)).Offset(N) = rst_Meter!conclusion & ""
           
'           If InStr(1, LCase(rst_Meter!conclusion & ""), "pass") > 0 Then
'              gMtGood = gMtGood + 1
'           Else
'              gMtBad = gMtBad + 1
'           End If
           gMtSum = gMtSum + 1
           rst_Meter.MoveNext
        Loop
        
        '--------copy to new sheet--------------
'        Range("A1:" & "CQ" & CStr(31 + N)).Select  'Range("P32 :" & "CQ" & CStr(31 + i - 1)).Select
'        CopySelectionWithFormatting "Terminal_entry"
'        Sheet1.Select
        '--------the end of copy--------------
        
        '---clear all contents---
'        Range("P32 :" & "CQ" & CStr(N + 31)).Select
'        Selection.ClearContents
'
'        Range("_section") = "Terminal_entry 2"
'        Range("_meterplace").ClearContents
        'do rest
'       Do While Not rst_Meter.EOF And (gMtSum <= 32)
'            Range("err" + CStr(gMtSum - 16)) = "MP" + CStr(rst_Meter!MeterPlace)
'            Range("err" + CStr(gMtSum - 16)).Offset(1) = "'" & rst_Meter!meterno & ""
'            Range("err" + CStr(gMtSum - 16)).Offset(3) = rst_Meter!TESTYER & ""
'            Range("err" + CStr(gMtSum - 16)).Offset(17) = rst_Meter!STARTDEG & ""
'            Range("err" + CStr(gMtSum - 16)).Offset(18) = rst_Meter!ENDDEG & ""
'            Range("err" + CStr(gMtSum - 16)).Offset(N) = rst_Meter!conclusion & ""
'
'           If InStr(1, LCase(rst_Meter!conclusion & ""), "pass") > 0 Then
'              gMtGood = gMtGood + 1
'           Else
'              gMtBad = gMtBad + 1
'           End If
'           gMtSum = gMtSum + 1
'            rst_Meter.MoveNext
'       Loop
       
'       Sheets(2).Range("_mtSum") = CStr(gMtSum - 1)
'       Sheets(2).Range("_mtPass") = CStr(gMtGood)
'       Sheets(2).Range("_mtFail") = CStr(gMtBad)
       
'       If gMtSum > 16 Then
'            ' copy to new sheet
'            Range("A30:" & "CQ" & CStr(31 + N)).Select
'            CopySelectionWithFormatting "Terminal_entry 2"
'            Sheets(1).Select
'       End If
       


    End With

End Sub

Public Function getLoadPointFormatCLP(strLP As String, strCurrPct As String, strQ As String) As String
    Dim strTmp As String
    Dim dblTmp As Double
    
    getLoadPointFormatCLP = strCurrPct + "Ib/"
    
    '-----phase------------
    If InStr(1, strLP, "A") Then
        getLoadPointFormatCLP = getLoadPointFormatCLP + "A/"
    ElseIf InStr(1, strLP, "B") Then
        getLoadPointFormatCLP = getLoadPointFormatCLP + "B/"
    ElseIf InStr(1, strLP, "C") Then
        getLoadPointFormatCLP = getLoadPointFormatCLP + "C/"
    Else
        getLoadPointFormatCLP = getLoadPointFormatCLP + "ABC/"
    End If
    
    strTmp = GetBracketStr(strLP)
    dblTmp = Val(strTmp)
    
    If Abs(dblTmp - 1) < 0.0001 Then
        getLoadPointFormatCLP = getLoadPointFormatCLP & "PF=1"
    Else
        getLoadPointFormatCLP = getLoadPointFormatCLP & "PF=" & CStr(strTmp) & "/" & strQ

    End If
    
End Function

Public Sub process_iron_1(strName As String, rst_Meter As Recordset)
    Dim rstData As adodb.Recordset
    Dim rstTestRange As adodb.Recordset
    Dim i As Integer
    Dim N As Integer
    Dim NewSheetCount As Integer
    Dim RangeCode As Integer
    Dim SNo As Integer
    Dim strItem As String
    Dim MtCount As Integer
    
'    strItem = "Visual (Remarks), Creeping Test, Starting Test, Dial Test"
    
    NewSheetCount = 1
    rst_Meter.MoveFirst
    
    With Sheets(strName)
        .Select

        'delete rows
'        deleteRows strName, gFixTitleRow + 1
        
'        Range("_section") = "Result"
'        Range("_meterplace").ClearContents
        
        '---Dial Test, Creeping, Starting Test---
'        N = GetItem(strItem, ",", -1)
'        For i = 0 To N - 1
'            AddNewRow 31
'            Range("Test_Range").Offset(i + 1) = GetItem(strItem, ",", i)
'
'        Next i
        
        MtCount = 1
        '------------------------the first 16 postion----------------------------------
        Do While Not rst_Meter.EOF And MtCount <= 32
            '---creeping & others----------
'            Range("err" + CStr(MtCount)).Offset(1) = "pass"
'            Range("err" + CStr(MtCount)).Offset(2) = rst_Meter!HIDDENTEST
'            Range("err" + CStr(MtCount)).Offset(3) = rst_Meter!STARTEST
'            Range("err" + CStr(MtCount)).Offset(4) = rst_Meter!WALKTEST
            
            '---error data--------
'            i = N + 1
'            For RangeCode = 1 To 4
                Set rstData = getErrorDataRst(rst_Meter!meterid, 1)
                Set rstTestRange = getTestRangeRst(rst_Meter!meterid, 1)
                If Not (rstData.EOF And rstData.BOF) Then
                    rstData.MoveFirst
                    Do While (Not rstData.EOF)
                        '------------add 1 row for display next meter data------------------
                        'AddNewRow gFixTitleRow
                        '------------the end of block---------------------------------------
'                        If MtCount = 1 Then
'                             '------------add 1 row for display next meter data------------------
'                            AddNewRow gFixTitleRow
'                            '------------the end of block---------------------------------------
'                            If InStr(1, LCase(rstTestRange!connectmode & ""), "forward active") > 0 Then
'                                Range("Test_Range").Offset(i) = "'KWH" & getLoadPointFormatCLP(rstData!LoadName, GetCurrentPercent(rstData!LoadName, rst_Meter!current), "Q1") & "(err%)"
'                            ElseIf InStr(1, LCase(rstTestRange!connectmode & ""), "reverse active") > 0 Then
'                                Range("Test_Range").Offset(i) = "'-KWH" & getLoadPointFormatCLP(rstData!LoadName, GetCurrentPercent(rstData!LoadName, rst_Meter!current), "Q3") & "(err%)"
'                            ElseIf InStr(1, LCase(rstTestRange!connectmode & ""), "reverse reactive") > 0 Then
'                                Range("Test_Range").Offset(i) = "'-KVARH" & getLoadPointFormatCLP(rstData!LoadName, GetCurrentPercent(rstData!LoadName, rst_Meter!current), "Q4") & "(err%)"
'                            Else
'                                Range("Test_Range").Offset(i) = "'KVARH" & getLoadPointFormatCLP(rstData!LoadName, GetCurrentPercent(rstData!LoadName, rst_Meter!current), "Q1") & "(err%)"
'                            End If
'                        End If
                        Select Case LCase(rstData!LoadName)
                            Case "imax(1.0)"
                                Range("err" & CStr(MtCount)).Offset(31) = "' " & rstData!AveData & "%,100A 1PF"
                            Case "ib(1.0)"
                                Range("err" & CStr(MtCount)).Offset(32) = "' " & rstData!AveData & "%,10A 1PF"
                            Case "imax(0.5l)"
                                Range("err" & CStr(MtCount)).Offset(33) = "' " & rstData!AveData & "%,100A 0.5PF"
                        End Select
                        
'                        Range("err" & CStr(MtCount)) = "MP" + CStr(rst_Meter!MeterPlace)
'                        Range("err" & CStr(MtCount)).Offset(i) = "'" & rstData!AveData & IIf(Trim(rstData!qualified) = "yes", "", "*")
'                        i = i + 1
                        rstData.MoveNext
                    Loop
                End If
'            Next RangeCode
            MtCount = MtCount + 1
            rst_Meter.MoveNext
        Loop
        
        ' copy to new sheet
'        Range("G31:FT78").Select
'        CopySelectionWithFormatting "MTS Result"
        
'        .Select
'        .Copy After:=Sheets(Sheets.Count)
'        Sheets(Sheets.Count).Select
'        Sheets(Sheets.Count).Name = "Result " + CStr(NewSheetCount)
'        NewSheetCount = NewSheetCount + 1
'        Sheet5.Select

        '---clear all contents---
'        Range("P32 :" & "CQ" & CStr(31 + i - 1)).Select
'        Selection.ClearContents
'
'        Range("_section") = "Result 2"
'        Range("_meterplace").ClearContents
        
         '------------------------the second 16 postion----------------------------------
'        Do While Not rst_Meter.EOF And MtCount <= 32
'            '---creeping & others----------
'            Range("err" + CStr(MtCount - 16)).Offset(1) = "pass"
'            Range("err" + CStr(MtCount - 16)).Offset(2) = rst_Meter!HIDDENTEST
'            Range("err" + CStr(MtCount - 16)).Offset(3) = rst_Meter!STARTEST
'            Range("err" + CStr(MtCount - 16)).Offset(4) = rst_Meter!WALKTEST
'            '---error data--------
'            i = N + 1
'            For RangeCode = 1 To 4
'                Set rstData = getErrorDataRst(rst_Meter!meterid, RangeCode)
'                Set rstTestRange = getTestRangeRst(rst_Meter!meterid, RangeCode)
'                If Not (rstData.EOF And rstData.BOF) Then
'                    rstData.MoveFirst
'                    Do While (Not rstData.EOF)
'                        Range("err" & CStr(MtCount - 16)) = "MP" + CStr(rst_Meter!MeterPlace)
'                        Range("err" & CStr(MtCount - 16)).Offset(i) = "'" & rstData!AveData & IIf(Trim(rstData!qualified) = "yes", "", "*")
'                        i = i + 1
'                        rstData.MoveNext
'                    Loop
'                End If
'            Next RangeCode
'            MtCount = MtCount + 1
'            rst_Meter.MoveNext
'        Loop
                
        'Range("30:" & CStr(31 + i - 1)).Select
'        Range("A30:" & "CQ" & CStr(31 + i - 1)).Select
'        CopySelectionWithFormatting "Result 2"
                
    End With
    
    Set rstData = Nothing
    
End Sub

Public Sub process_iron_5(strName As String, rst_Meter As Recordset, Optional index As KindOfTest = kofFrequency)
    Dim rstData As adodb.Recordset
    Dim row As Integer
    Dim col As Integer
    Dim strTagExt As String
    Dim T
    
    row = 14
    rst_Meter.MoveFirst
    With Sheets(strName)
        .Select
        .Range("c3") = rst_Meter!Precision & ""
        .Range("f4") = rst_Meter!Voltage & ""
        .Range("f5") = GetBracketStr(rst_Meter!current) & "A"
        .Range("g6") = Val(rst_Meter!current) & "A"
        .Range("f7") = rst_Meter!Constant
        
        .Range("E14:O61").Select
        Selection.ClearContents
        Do
            Set rstData = getSpecialErrorDataRst(rst_Meter!meterid, index)
            If rstData.EOF And rstData.BOF Then
            Else
                rstData.MoveFirst
                Do
                    If index = kofVoltage Then
                        T = Val(rst_Meter!Voltage & "") * rstData!fvoltage
                        strTagExt = str(CInt(T)) & "V"
                    ElseIf index = kofFrequency Then
                        strTagExt = str(rstData!fFrequency)
                    End If
                    
                    If GetColoumStrExt(rstData!cLoadName & "", Trim(strTagExt), col) Then
                        .Cells(row, col) = rstData!cAvedata & ""
                    End If
                    rstData.MoveNext
                Loop Until rstData.EOF
            End If
            rst_Meter.MoveNext
            row = row + 1
        Loop Until rst_Meter.EOF
    End With
    rst_Meter.MoveFirst
End Sub

'Public Sub init_templet(rst_batch As Recordset)
'    'clear error data context
'    Sheet2.Range("meter_nbr").ClearContents
'    Sheet2.Range("meter_result").ClearContents
'
'    With rst_batch
'        Sheet2.Range("meter_co") = .Fields("Constant") & ""
'        Sheet2.Range("meter_current") = .Fields("Current") & ""
'        Sheet2.Range("meter_accuracy") = .Fields("Precision") & ""
'    End With
'End Sub

Public Sub load_chkp(meterid As Double, index As Integer, Optional bInit As Boolean = True)
    Dim RstErrorData As DAO.Recordset
    Dim i As Integer
    
    Set RstErrorData = getErrorDataRst(meterid)
    With RstErrorData
        If .EOF And .BOF Then Exit Sub
        .MoveLast
        
        If bInit Then
            ReDim test_lst(.RecordCount - 1)
            ReDim err1(.RecordCount - 1)
            ReDim err2(.RecordCount - 1)
            ReDim err3(.RecordCount - 1)
        End If
        
        i = 0
        .MoveFirst
        While Not .EOF
            If bInit Then test_lst(i) = .Fields("LoadName") & ""
            Select Case index
                Case 0
                    err1(i) = .Fields("AveData") & ""
                Case 1
                    err2(i) = .Fields("AveData") & ""
                Case 2
                    err3(i) = .Fields("AveData") & ""
            End Select
            i = i + 1
            .MoveNext
        Wend
    End With
    Set RstErrorData = Nothing
End Sub


