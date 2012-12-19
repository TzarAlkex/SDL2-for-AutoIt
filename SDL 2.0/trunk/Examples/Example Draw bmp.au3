#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1 (stable)
 Author:         Alexander Samuelsson (AdmiralAlkex)

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

#include "ExampleCommons.au3"

_SDL_Init($_SDL_INIT_VIDEO, _DllFile())

Global $apWindow[2]
$apWindow[0] = _SDL_CreateWindow(StringTrimRight(@ScriptName, 4), 0, 0, 256, 256, $_SDL_WINDOW_SHOWN)
$apWindow[1] = _SDL_CreateWindow(StringTrimRight(@ScriptName, 4), 256, 0, 256, 256, $_SDL_WINDOW_SHOWN)

Global $apRenderer[UBound($apWindow)]
For $iX = 0 To UBound($apWindow) -1
	$apRenderer[$iX] = _SDL_CreateRenderer($apWindow[$iX], -1, 1)
	_SDL_SetRenderDrawColor($apRenderer[$iX], 0, 0, 0, 255)
Next

Global $asImage[2] = ["20100513_009.bmp", "20100514_010.bmp"], $apTexture[UBound($asImage)]
For $iX = 0 To UBound($asImage) -1
	$pImage = _SDL_LoadBMP($asImage[$iX])
	$apTexture[$iX] = _SDL_CreateTextureFromSurface($apRenderer[$iX], $pImage)
	_SDL_FreeSurface($pImage)
Next

Local $iTimer = TimerInit()
For $iX = 1 To 1024
	For $iY = 0 To UBound($apRenderer) -1
		_SDL_RenderCopy($apRenderer[$iY], $apTexture[$iY], 0, 0)
		_SDL_RenderPresent($apRenderer[$iY])
	Next
Next
ConsoleWrite(TimerDiff($iTimer) & @CRLF)

_SDL_Quit()