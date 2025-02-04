Attribute VB_Name = "basDB"
Option Explicit
Public Const gstrAppName = "GENY-EMCS"
Public Const gstrSection = "App"
Public Const gstrKeyFilePath = "Path"
Public Const gstrKeyBatchNbr = "BatchNbr"

Public myErrDB As adodb.Connection 'DAO.Database


Function GetParentFolder(ByVal folderPath As String) As String
    ' 使用FileSystemObject来获取父文件夹路径
    Dim fso As Object
    Set fso = CreateObject("Scripting.FileSystemObject")
    
    ' 检查路径是否为空或者是否是根目录
    If fso.GetBaseName(folderPath) <> "" And fso.GetParentFolderName(folderPath) <> "" Then
        GetParentFolder = fso.GetParentFolderName(folderPath)
    Else
        GetParentFolder = folderPath
    End If
End Function


Function OpenDatabase(bReadOnly As Boolean) As Boolean
    Dim strDBPath As String
    
    On Error Resume Next
    
    strDBPath = GetParentFolder(CreateObject("WScript.Shell").SpecialFolders("desktop")) + "\AppData\Local\VirtualStore\Program Files (x86)\EEM Calibrator system\geny soft\emcs\database\dbdata.mdb"
    
    If Len(Dir(strDBPath)) = 0 Then
        strDBPath = GetPath(GetSetting(gstrAppName, gstrSection, gstrKeyFilePath)) & "Database\DBData.mdb"
    End If
    
    Set myErrDB = New adodb.Connection
    
    myErrDB.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath
    
    If Err > 0 Then
        myErrDB.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & strDBPath & ";Jet OLEDB:Database Password="
    End If
    
    'Set myErrDB = DAO.OpenDatabase(strDBPath, False, bReadOnly)
    OpenDatabase = (Err = 0)

    Exit Function
ErrorHandle:
    If ErrorRetry("database can not be opened") Then Resume
End Function


Function getMeterInfoRst(strBatchNbr As String) As Recordset
    Dim strSQL As String
    Dim rst As adodb.Recordset
    
    On Error GoTo errhandle
    strSQL = "select * from ResultData " & strBatchNbr ' where PNO = '" & strBatchNbr & "' Order by MeterID"
    
    Set rst = New adodb.Recordset
    rst.Open strSQL, myErrDB, adOpenDynamic, adLockOptimistic
    'Set rst = myErrDB.OpenRecordset(strSQL, dbOpenDynaset)
    
    Set getMeterInfoRst = rst
    Exit Function
errhandle:
    Set getMeterInfoRst = Nothing
End Function

Function getTestRangeRst(dblMeterID As Double, intRangeCode As Integer) As Recordset
    Dim strSQL As String
    Dim rst As adodb.Recordset
    
    On Error GoTo errhandle
    strSQL = "select * from TestRange where MeterID = " & dblMeterID & " and RangeCode =" & intRangeCode & ""
    
    Set rst = New adodb.Recordset
    rst.Open strSQL, myErrDB, adOpenDynamic, adLockOptimistic
    
    'Set rst = myErrDB.OpenRecordset(strSQL, dbOpenDynaset)
    
    Set getTestRangeRst = rst
    Exit Function
    
errhandle:
    Set getTestRangeRst = Nothing
End Function

Function getErrorDataRst(dblMeterID As Double, Optional intRangeCode As Integer = 1) As Recordset
    Dim strSQL As String
    Dim rst As adodb.Recordset
    
    On Error GoTo errhandle
    strSQL = "select * from ErrData where MeterID = " & dblMeterID & " and RangeCode =" & intRangeCode & " order by SortNo"
    
    Set rst = New adodb.Recordset
    rst.Open strSQL, myErrDB, adOpenDynamic, adLockOptimistic
    
    'Set rst = myErrDB.OpenRecordset(strSQL, dbOpenDynaset)
    
    Set getErrorDataRst = rst
    Exit Function
    
errhandle:
    Set getErrorDataRst = Nothing
End Function

Function getInfluenceErrorDataRst(dblMeterID As Double) As Recordset
    Dim strSQL As String
    Dim rst As adodb.Recordset
    
    On Error GoTo errhandle
    strSQL = "select * from SpecialErrorData where MeterID = " & dblMeterID & " AND iRangeNo <> 20 order by indexID, iRangeNo"
    
    Set rst = New adodb.Recordset
    rst.Open strSQL, myErrDB, adOpenDynamic, adLockOptimistic
    
    'Set rst = myErrDB.OpenRecordset(strSQL, dbOpenDynaset)
    
    Set getInfluenceErrorDataRst = rst
    Exit Function
    
errhandle:
    Set getInfluenceErrorDataRst = Nothing
End Function

Function getRepeatTestErrorDataRst(dblMeterID As Double) As Recordset
    Dim strSQL As String
    Dim rst As adodb.Recordset
    
    On Error GoTo errhandle
    strSQL = "select * from SpecialErrorData where MeterID = " & dblMeterID & " AND iRangeNo = 20 order by indexID, iRangeNo"
    
    Set rst = New adodb.Recordset
    rst.Open strSQL, myErrDB, adOpenDynamic, adLockOptimistic
    
    'Set rst = myErrDB.OpenRecordset(strSQL, dbOpenDynaset)
    
    Set getRepeatTestErrorDataRst = rst
    Exit Function
    
errhandle:
    Set getRepeatTestErrorDataRst = Nothing
End Function


Function getSpecialErrorDataRst(dblMeterID As Double, Optional index As KindOfTest = 0) As Recordset
    ' 0: frequency , 1: voltage
    
    Dim strSQL As String
    Dim rst As adodb.Recordset
    
    On Error GoTo errhandle
    
    strSQL = "SELECT SpecialErrorData.MeterID, SpecialErrorData.*, SpecialErrorData.cRange" _
                & " FROM SpecialErrorData" _
                & " WHERE (((SpecialErrorData.MeterID)=" & dblMeterID & ")" '
    Select Case index
        Case kofFrequency
           strSQL = strSQL + " AND ((SpecialErrorData.cRange) Like 'freq*'));"
        Case kofVoltage
            strSQL = strSQL + " AND ((SpecialErrorData.cRange) Like 'volt*'));"
    End Select
    
    'strSQL = "select * from ErrData where MeterID = " & dblMeterID & " and RangeCode =" & intRangeCode
    
    'Set rst = myErrDB.OpenRecordset(strSQL, dbOpenDynaset)
    Set rst = New adodb.Recordset
    rst.Open strSQL, myErrDB, adOpenDynamic, adLockOptimistic
    
    Set getSpecialErrorDataRst = rst
    Exit Function
    
errhandle:
    Set getSpecialErrorDataRst = Nothing
End Function
