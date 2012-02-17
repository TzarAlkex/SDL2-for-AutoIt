#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1 (stable)
 Author:         Team Alpha Super Awesome Cool Dynamite Wolf Squadron (only consists of AdmiralAlkex as of writing)

 Script Function:
	UDF for SDL

#ce ----------------------------------------------------------------------------

#include-once

#include "SDL_rect.au3"
#include "SDL_surface.au3"

#cs
/**
 *  \brief Create a window with the specified position, dimensions, and flags.
 *
 *  \param title The title of the window, in UTF-8 encoding.
 *  \param x     The x position of the window, ::SDL_WINDOWPOS_CENTERED, or
 *               ::SDL_WINDOWPOS_UNDEFINED.
 *  \param y     The y position of the window, ::SDL_WINDOWPOS_CENTERED, or
 *               ::SDL_WINDOWPOS_UNDEFINED.
 *  \param w     The width of the window.
 *  \param h     The height of the window.
 *  \param flags The flags for the window, a mask of any of the following:
 *               ::SDL_WINDOW_FULLSCREEN, ::SDL_WINDOW_OPENGL,
 *               ::SDL_WINDOW_SHOWN,      ::SDL_WINDOW_BORDERLESS,
 *               ::SDL_WINDOW_RESIZABLE,  ::SDL_WINDOW_MAXIMIZED,
 *               ::SDL_WINDOW_MINIMIZED,  ::SDL_WINDOW_INPUT_GRABBED.
 *
 *  \return The id of the window created, or zero if window creation failed.
 *
 *  \sa SDL_DestroyWindow()
 */
extern DECLSPEC SDL_Window * SDLCALL SDL_CreateWindow(const char *title,
                                                      int x, int y, int w,
                                                      int h, Uint32 flags);
#ce

Func _SDL_CreateWindow($sTitle, $iX, $iY, $iW, $iH, $iFlags)
	Local $aCall = DllCall($__SDL_DLL, "ptr:cdecl", "SDL_CreateWindow", "str", $sTitle, "int", $iX, "int", $iY, "int", $iW, "int", $iH, "uint", $iFlags)
	If @error Then Return SetError(1, @error, 0)
	Return $aCall[0]
EndFunc