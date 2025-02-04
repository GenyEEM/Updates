Attribute VB_Name = "basTxt"


Function FormatStringWithPadding(strSource As String, intLen As Integer) As String
    Dim padding As String
    
    If Len(strSource) < intLen Then
        padding = String(intLen - Len(strSource), " ")
        FormatStringWithPadding = strSource & padding
    Else
        FormatStringWithPadding = strSource
    End If
    
End Function


Sub Write2Text(strFN As String)
    Dim fs, a
    Dim fn As String
    Dim i As Integer
    Dim j As Integer
    Dim strValue As String
    Const ForReading = 1, ForWriting = 2, ForAppending = 8

    fn = GetPath(Sheet1.TextBox1.Text)
    
    '----check directory if it's exisit----
    
    If Not CheckDirectoryExistsUsingLen(fn) Then
        MsgBox "Directory is not exist: " & fn, vbInformation
    End If
    
    fn = fn & strFN & ".txt"
    
    Set fs = CreateObject("Scripting.FileSystemObject")
    
    If Dir(fn) > "" Then
        Set a = fs.OpenTextFile(fn, ForAppending, False, TristateTrue)
    Else
        Set a = fs.CreateTextFile(fn, True)
    End If
    
    a.WriteLine "MTS file generated at " & Format(Now(), "short date") & " " & Format(Now(), "short time")
'    a.WriteBlankLines 2
'    a.WriteLine ("This is a test.")
    
    With Sheet1
        For i = 1 To 32
            strValue = ""
            If .Range("err" & CStr(i)) <> "" Then
                For j = 1 To 46
                    strValue = strValue & FormatStringWithPadding(.Range("err" & CStr(i)).Offset(j), CInt(.Range("_size").Offset(j)))
'                    If .Range("_remarks").Offset(j) = "" Then
'                        strValue = strValue & FormatStringWithPadding(.Range("err" & CStr(i)).Offset(j), CInt(.Range("_size").Offset(j)))
'                    Else
'                        strValue = strValue & FormatStringWithPadding(Format(.Range("err" & CStr(i)).Offset(j), .Range("_remarks").Offset(j)), CInt(.Range("_size").Offset(j)))
'                    End If
                Next j
                'write a line
                a.WriteLine strValue
            End If
        Next i
    End With
    
    a.Close


End Sub

Function CheckDirectoryExistsUsingLen(directoryPath As String) As Boolean
    Dim directoryExists As Boolean
    
    CheckDirectoryExistsUsingLen = Len(Dir(directoryPath, vbDirectory)) > 0
    
End Function


