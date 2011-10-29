#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1 (stable)
 Author:         Team Alpha Super Awesome Cool Dynamite Wolf Squadron (only consists of AdmiralAlkex as of writing)

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

#include "SDL.au3"

;Initialize SDL.
$iRet = _SDL_Init($_SDL_INIT_VIDEO)
_CW($iRet)

;Create the window where we will draw.
$pWindow = _SDL_CreateWindow("SDL_RenderClear", 0x2FFF0000, 0x2FFF0000, 512, 512, 0x00000004)   ;SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 512, 512, SDL_WINDOW_SHOWN
_CW($pWindow)

;We must call SDL_CreateRenderer in order for draw calls to affect this window.
$pRenderer = _SDL_CreateRenderer($pWindow, -1, 0)
_CW($pRenderer)

;Select the color for drawing. It is set to red here.
_SDL_SetRenderDrawColor($pRenderer, 255, 0, 0, 255)

;Clear the entire screen to our selected color.
_SDL_RenderClear($pRenderer)

;Up until now everything was drawn behind the scenes.
;This will show the new, red contents of the window.
_SDL_RenderPresent($pRenderer)

;Give us time to see the window.
_SDL_Delay(5000)   ;Or use Sleep(5000)

_SDL_Quit()