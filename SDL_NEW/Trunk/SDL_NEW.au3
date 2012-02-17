#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_AU3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w- 4 -w 5 -w 6 -w- 7
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include-once

#include "SDLConstants.au3"

; #INDEX# =======================================================================================================================
; Title .........: SDL (Simple DirectMedia Layer)
; AutoIt Version : To be decided (3.3.8.1+ recommended maybe??)
; Description ...: Simple DirectMedia Layer is a cross-platform multimedia library.
; Author(s) .....: Alexander Samuelsson (AdmiralAlkex)
; Dll ...........: SDL.dll
; ===============================================================================================================================

; #VARIABLES# ===================================================================================================================
Global $__SDL_DLL = -1
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
;_SDL_Init
;_SDL_InitSubSystem
;_SDL_QuitSubSystem
;_SDL_Quit
;_SDL_WasInit
;_SDL_GetError
; ===============================================================================================================================

#Region General
; #FUNCTION# ====================================================================================================================
; Name ..........: _SDL_Init
; Description ...: Initializes SDL
; Syntax ........: _SDL_Init($iFlags[, $sFilename = Default])
; Parameters ....: $iFlags              - An integer value.
;                  $sFilename           - [optional] A string value. Default is Default.
; Return values .: Negative on an error or 0 on success.
; Author ........: Alexander Samuelsson (AdmiralAlkex)
; Modified ......:
; Remarks .......: U
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _SDL_Init($iFlags, $sFilename = Default)
	If IsKeyword($sFilename) Then $sFilename = @ScriptDir & "\SDL.dll"

	$__SDL_DLL = DllOpen($sFilename)
	If $__SDL_DLL = -1 Then
		Return SetError(1)
	EndIf

	Local $avRet = DllCall($__SDL_DLL, "int:cdecl", "SDL_Init", "uint", $iFlags)
	If @error Then Return SetError(@error, 0, -2)
	Return $avRet[0]
EndFunc

; #FUNCTION# ====================================================================================================================
; Name ..........: _SDL_InitSubSystem
; Description ...: Initialize subsystems
; Syntax ........: _SDL_InitSubSystem($iFlags)
; Parameters ....: $iFlags              - An integer value.
; Return values .: Negative on an error or 0 on success.
; Author ........: Alexander Samuelsson (AdmiralAlkex)
; Modified ......:
; Remarks .......: U
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _SDL_InitSubSystem($iFlags)
	Local $avRet = DllCall($__SDL_DLL, "int:cdecl", "SDL_InitSubSystem", "uint", $iFlags)
	If @error Then Return SetError(@error, 0, -2)
	Return $avRet[0]
EndFunc

; #FUNCTION# ====================================================================================================================
; Name ..........: _SDL_QuitSubSystem
; Description ...: Shut down a subsystem
; Syntax ........: _SDL_QuitSubSystem($iFlags)
; Parameters ....: $iFlags              - An integer value.
; Return values .: Negative on an error
; Author ........: Alexander Samuelsson (AdmiralAlkex)
; Modified ......:
; Remarks .......: U
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _SDL_QuitSubSystem($iFlags)
	DllCall($__SDL_DLL, "none:cdecl", "SDL_QuitSubSystem", "uint", $iFlags)
	If @error Then Return SetError(@error, 0, -2)
EndFunc

; #FUNCTION# ====================================================================================================================
; Name ..........: _SDL_Quit
; Description ...: Shut down SDL
; Syntax ........: _SDL_Quit()
; Parameters ....:
; Return values .: Negative on an error
; Author ........: Alexander Samuelsson (AdmiralAlkex)
; Modified ......:
; Remarks .......: U
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _SDL_Quit()
	DllCall($__SDL_DLL, "cdecl", "SDL_Quit")
	If @error Then Return SetError(@error, 0, -2)
	DllClose($__SDL_DLL)
EndFunc

; #FUNCTION# ====================================================================================================================
; Name ..........: _SDL_WasInit
; Description ...: Check which subsystems are initialized
; Syntax ........: _SDL_WasInit($iFlags)
; Parameters ....: $iFlags              - An integer value.
; Return values .: SDL_WasInit returns a bitwised OR'd combination of the initialized subsystems
; Author ........: Alexander Samuelsson (AdmiralAlkex)
; Modified ......:
; Remarks .......: U
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _SDL_WasInit($iFlags)
	Local $avRet = DllCall($__SDL_DLL, "uint:cdecl", "SDL_WasInit", "uint", $iFlags)
	If @error Then Return SetError(@error, 0, -2)
	Return $avRet[0]
EndFunc

; #FUNCTION# ====================================================================================================================
; Name ..........: _SDL_GetError
; Description ...: Get SDL error string
; Syntax ........: _SDL_GetError()
; Parameters ....:
; Return values .: SDL_GetError returns a NULL terminated string containing information about the last internal SDL error
; Author ........: Alexander Samuelsson (AdmiralAlkex)
; Modified ......:
; Remarks .......: U
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================
Func _SDL_GetError()
	Local $avRet = DllCall($__SDL_DLL, "str:cdecl", "SDL_GetError")
	If @error Then Return SetError(@error, 0, -2)
	Return $avRet[0]
EndFunc
#EndRegion
