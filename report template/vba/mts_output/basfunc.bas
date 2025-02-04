Attribute VB_Name = "basfunc"
Option Explicit
'Public Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Public Const vbCrLf2 = vbCrLf & vbCrLf

Function GetPath(CurrPath As String) As String
  '返回末尾带"\"的路径
  GetPath = IIf(Right(CurrPath, 1) = "\", CurrPath, CurrPath & "\")
End Function

Function ErrorRetry(Optional MsgTitle) As Boolean
  '错误时重试?
  Dim msg As String
  
  msg = "错误信息:" & vbCrLf2 & Err.Description & vbCrLf2 & "是否重试?"
  If Err <> 0 Then ErrorRetry = (MsgBox(msg, vbExclamation + vbRetryCancel + vbDefaultButton1, MsgTitle) = vbRetry)
End Function

Function GetItem(ByVal msg As String, ByVal Split As String, ByVal index As Long, Optional ByVal ByValue As Boolean) As Variant
  '取指定项,EX: GetItem("1A,5A,10A,20A",",",2) = "10A"
  'Index = -1 , Get Items Count
  Dim SplitLen As Long
  Dim s As Long
  Dim N As Long
  Dim Count As Long
  Dim Item As String
  
  SplitLen = Len(Split)
  If Len(msg) * SplitLen > 0 Then   '有效的字符串和分隔符
    s = 1
    If index < 0 Then   '取项数
      Do
        N = InStr(s, msg, Split)
        Count = Count + 1
        If N > 0 Then s = N + SplitLen
      Loop Until (N = 0)
      GetItem = Count
    Else                '取指定项
      Do
        N = InStr(s, msg, Split)
        If Count = index Then
          Item = Mid(msg, s, IIf(N = 0, Len(msg), N - s))
          Exit Do
        Else
          Count = Count + 1
          If N > 0 Then s = N + SplitLen
        End If
      Loop Until (N = 0)
      GetItem = IIf(ByValue, Val(Item), Item)
    End If
  End If
End Function

Function GetItemNo(ByVal msg As String, Split As String, Item As String) As Long
  '取指定项的序号(0..N),找不到返回-1
  Dim SplitLen As Long
  Dim s As Long
  Dim N As Long
  Dim Count As Long
  
  GetItemNo = -1
  SplitLen = Len(Split)
  If SplitLen > 0 Then  '有效的分隔符
    s = 1
    Do
      N = InStr(s, msg, Split)
      If N = 0 Then
        If Mid(msg, s) = Item Then GetItemNo = Count
      Else
        If Mid(msg, s, N - s) = Item Then GetItemNo = Count
        s = N + SplitLen
        Count = Count + 1
      End If
    Loop Until (N = 0)
  End If
End Function

Function GetItemCount(strResult As String) As Long
    Dim N As Long
    Dim strTmp As String
    Dim lngItemCount As Long
    Dim lngX As Long
    Dim intX As Integer
    
    N = GetItem(strResult, "@", -1)
    For intX = 0 To N - 1
        strTmp = GetItem(strResult, "@", intX)
        strTmp = GetItem(strTmp, "!", 1)
        lngX = GetItem(strTmp, gItemListSplite, -1)
        lngItemCount = lngItemCount + lngX
    Next intX
    
    GetItemCount = lngItemCount
End Function

Function GetPrecision(strLevel As String, intNo As Integer) As String
    Dim s As String
    Dim p As Integer
    p = InStr(1, strLevel, "\")
    If p > 0 Then
    Select Case intNo
        Case 1, 3
            s = Left(strLevel, p - 1)
        Case 2, 4
            s = Right(strLevel, Len(strLevel) - p)
    End Select
    Else
        s = strLevel
    End If
    
    GetPrecision = s
End Function

Function GetBracketStr(strSource As String) As String
    On Error GoTo errhandle
    
    Dim N As Integer
    N = InStr(1, strSource, "(")
    
    If N > 0 Then
        GetBracketStr = Mid(strSource, N + 1, InStr(1, strSource, ")") - N - 1)
    Else
        GetBracketStr = ""
    End If
    Exit Function
errhandle:
    GetBracketStr = ""
End Function

Function GetIniInfo(ByVal FileName As String, ByVal Section As String, ByVal KeyName As String, Optional ByVal Default As Variant, Optional ByVal ByValue As Boolean) As Variant
    Dim strDefault As String
    Dim Result As String
    Dim ValueLen As Long
    Dim msg As String
    On Error Resume Next
    strDefault = Default
    ValueLen = 4096
    Result = Space$(ValueLen)
    ValueLen = GetPrivateProfileString(Section, KeyName, strDefault, Result, ValueLen, FileName)
    If ByValue Then
        GetIniInfo = Val(Result)
    Else
        Result = Trim(Result)
        If Asc(Right(Result, 1)) = 0 Then Result = Left(Result, Len(Result) - 1)
        GetIniInfo = Trim(Result)
    End If
End Function

Function GetVoltagePercent(TestPointName As String) As String
    'Ib(1.0)_1.2u_L3
    Dim strX As String
    Dim Value As Double
    
    strX = GetItem(TestPointName, "_", 1)
    Value = Val(strX)
    
    If Value = 0 Then
        GetVoltagePercent = "100%"
    Else
        GetVoltagePercent = Format(Value, "0.00%")
    End If
End Function

Function GetCurrentPercent(TestPointName As String, StrCurr As String) As String
    Dim sngIb As Single
    Dim sngImax As Single
    Dim sngRatio As Single
    Dim strX As String
    Dim i As Integer
    
    If InStr(1, LCase(TestPointName), "imax") > 0 Then
        sngImax = Val(GetItem(StrCurr, "(", 0))
        sngIb = Val(GetItem(StrCurr, "(", 1))
        For i = 1 To InStr(1, LCase(TestPointName), "imax") - 1
           strX = strX + Mid(TestPointName, i, 1)
           If Not IsNumeric(strX) Then
             strX = ""
           End If
        Next i
        sngRatio = Val(strX)
        sngRatio = IIf(sngRatio = 0, 1, sngRatio)
        sngRatio = sngRatio * sngImax / sngIb
    Else
        For i = 1 To InStr(1, LCase(TestPointName), "ib") - 1
           strX = strX + Mid(TestPointName, i, 1)
           If Not IsNumeric(strX) Then
             strX = ""
           End If
        Next i
        sngRatio = Val(strX)
    End If
    sngRatio = IIf(sngRatio = 0, 1, sngRatio)
    GetCurrentPercent = Format(sngRatio, "####%")
End Function

Function GetCosStr(TestPointName As String) As String
    GetCosStr = GetItem(TestPointName, "(", 1)
    GetCosStr = GetItem(GetCosStr, ")", 0)
End Function
