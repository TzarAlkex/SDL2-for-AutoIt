#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1 (stable)
 Author:         Alexander Samuelsson (AdmiralAlkex)

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

Opt("MustDeclareVars", 1)

#include "SDL.au3"

_Test()

ConsoleWrite(DllStructGetSize(DllStructCreate($tagSDL_Rect)) & @LF)

Func _Test()
	Local $sDll = @ScriptDir & "\SDL.dll"
	If @AutoItX64 Then $sDll = @ScriptDir & "\SDL_x64.dll"

	Local $iRet = _SDL_Init($_SDL_INIT_VIDEO, $sDll)
	ConsoleWrite($iRet & @LF)
EndFunc