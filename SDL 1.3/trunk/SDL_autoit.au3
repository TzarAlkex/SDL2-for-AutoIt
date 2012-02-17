#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1 (stable)
 Author:         Team Alpha Super Awesome Cool Dynamite Wolf Squadron (only consists of AdmiralAlkex as of writing)

 Script Function:
	UDF for SDL

#ce ----------------------------------------------------------------------------

#include-once

Func _CW($Whatever1, $Whatever2 = @ScriptLineNumber, $Whatever3 = @error, $Whatever4 = @extended)		;Copied from CodecControl 2.2.9.au3
	Static Local $iExist = FileExists(@ScriptDir & "\Log.txt")
	Local $sText = "(" & $Whatever2 & ") :" & " /Time:" & @YDAY & ":" & @HOUR & ":" & @MIN & ":" & @SEC & ":" & @MSEC & " /Current@Error:" & $Whatever3 & " /Current@Extended:" & $Whatever4 & " /VarGetType:" & VarGetType($Whatever1) & " /Value:" & $Whatever1 & @CRLF
	If $iExist <> 0 Then
		FileWrite(@ScriptDir & "\Log.txt", $sText)
	Else
		ConsoleWrite($sText)
	EndIf
EndFunc