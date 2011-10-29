#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1 (stable)
 Author:         Team Alpha Super Awesome Cool Dynamite Wolf Squadron (only consists of AdmiralAlkex as of writing)

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

#include "SDL.au3"

$iRet = _SDL_Init($_SDL_INIT_VIDEO)

Global $apWindow[1]
$apWindow[0] = _SDL_CreateWindow(StringTrimRight(@ScriptName, 4), 0, 0, 256, 256, 0x00000004)   ;0x00000004 = SDL_WINDOW_SHOWN
;~ $apWindow[1] = _SDL_CreateWindow(StringTrimRight(@ScriptName, 4), 256, 0, 256, 256, 0x00000004)
;~ $apWindow[2] = _SDL_CreateWindow(StringTrimRight(@ScriptName, 4), 0, 256, 256, 256, 0x00000004)
;~ $apWindow[3] = _SDL_CreateWindow(StringTrimRight(@ScriptName, 4), 256, 256, 256, 256, 0x00000004)

Global $apRenderer[UBound($apWindow)]
For $iX = 0 To UBound($apWindow) -1
	$apRenderer[$iX] = _SDL_CreateRenderer($apWindow[$iX], -1, 1)
	_SDL_SetRenderDrawColor($apRenderer[$iX], 0, 0, 0, 255)
;~ 	_CW($apRenderer[$iX])
Next

;~ _CW(_SDL_GetError())

;~ _SDL_Quit()
;~ Exit

Global $asImage[1] = ["20100513_009.bmp"], $apTexture[UBound($asImage)];, "20100513_012.bmp", "20100514_010.bmp", "20100607_002.bmp"
For $iX = 0 To UBound($asImage) -1
	$pImage = _SDL_LoadBMP($asImage[$iX])
;~ 	_CW($pImage)
	$apTexture[$iX] = _SDL_CreateTextureFromSurface($apRenderer[$iX], $pImage)
;~ 	_CW($apTexture[$iX])
	_SDL_FreeSurface($pImage)
Next

;~ _CW(_SDL_GetError())

$hStruct = _SDL_Rect_Create(0, 0, 128, 128)

Local $iTimer = TimerInit()
For $iX = 1 To 1024
;~ 	For $iY = 0 To 3
;~ 		_SDL_RenderClear($apRenderer[$iY])
;~ 		_SDL_RenderPresent($apRenderer[$iY])
;~ 	Next

;~ 	For $iY = 0 To 3
		_SDL_RenderCopy2($apRenderer[0], $apTexture[0], $hStruct, $hStruct)
;~ 		_SDL_RenderPresent($apRenderer[$iY])
;~ 	Next
Next
_SDL_RenderPresent($apRenderer[0])
ConsoleWrite(TimerDiff($iTimer) & @CRLF)

Sleep(1000)

;~ _CW(_SDL_GetError())

_SDL_Quit()

Func _WalkingInteger()
	Static Local $iZ = 0
	$iZ += 1
	If $iZ = 4 Then $iZ = 0
	Return $iZ
EndFunc

Func _SDL_Rect_Create($iX, $iY, $iWidth, $iHeight)
	Local $pRect
	$pRect = DllStructCreate("int;int;int;int")
	DllStructSetData($pRect, 1,$iX)
	DllStructSetData($pRect, 2,$iY)
	DllStructSetData($pRect, 3,$iWidth)
	DllStructSetData($pRect, 4,$iHeight)
	Return $pRect
EndFunc

Func _SDL_RenderCopy2($pRenderer, $pTexture, $pSrcRect, $pDstRect)
	Local $aCall = DllCall($__SDL_DLL, "int:cdecl", "SDL_RenderCopy", "ptr", $pRenderer, "ptr", $pTexture, "struct*", $pSrcRect, "struct*", $pDstRect)
	If @error Then Return SetError(1, @error, 0)
	Return $aCall[0]
EndFunc