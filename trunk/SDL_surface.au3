#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1 (stable)
 Author:         Team Alpha Super Awesome Cool Dynamite Wolf Squadron (only consists of AdmiralAlkex as of writing)

 Script Function:
	UDF for SDL

#ce ----------------------------------------------------------------------------

#include-once

#include "SDL_rect.au3"
#include "SDL_rwops.au3"

#cs
extern DECLSPEC void SDLCALL SDL_FreeSurface(SDL_Surface * surface);
#ce

Func _SDL_FreeSurface($pSurface)
	DllCall($__SDL_DLL, "none:cdecl", "SDL_FreeSurface", "ptr", $pSurface)
	If @error Then Return SetError(1, @error, 0)
EndFunc

#cs
/**
 *  Load a surface from a seekable SDL data stream (memory or file).
 *
 *  If \c freesrc is non-zero, the stream will be closed after being read.
 *
 *  The new surface should be freed with SDL_FreeSurface().
 *
 *  \return the new surface, or NULL if there was an error.
 */
extern DECLSPEC SDL_Surface *SDLCALL SDL_LoadBMP_RW(SDL_RWops * src,
                                                    int freesrc);
#ce

Func _SDL_LoadBMP_RW($pSrc, $iFreeSrc)
	$aCall = DllCall($__SDL_DLL, "ptr:cdecl", "SDL_LoadBMP_RW", "ptr", $pSrc, "int", $iFreeSrc)
	If @error Then Return SetError(1, @error, 0)
	Return $aCall[0]
EndFunc

#cs
/**
 *  Load a surface from a file.
 *
 *  Convenience macro.
 */
#define SDL_LoadBMP(file)	SDL_LoadBMP_RW(SDL_RWFromFile(file, "rb"), 1)
#ce

Func _SDL_LoadBMP($sFile)
	$pRWops = _SDL_RWFromFile($sFile, "rb")
	If @error Then Return SetError(1, @error, 0)
	$pSurface = _SDL_LoadBMP_RW($pRWops, 1)
	If @error Then Return SetError(2, @error, 0)
	Return $pSurface
EndFunc