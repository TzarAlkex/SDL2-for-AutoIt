#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1 (stable)
 Author:         Alexander Samuelsson (AdmiralAlkex)

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

#include-once

#include "..\SDL.au3"

Func _DllFile()
	Local $sDll = @ScriptDir & "\..\SDL.dll"
	If @AutoItX64 Then $sDll = @ScriptDir & "\..\SDL_x64.dll"
	Return $sDll
EndFunc