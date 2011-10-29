#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1 (stable)
 Author:         Team Alpha Super Awesome Cool Dynamite Wolf Squadron (only consists of AdmiralAlkex as of writing)

 Script Function:
	UDF for SDL

#ce ----------------------------------------------------------------------------

#include-once

#cs
/**
 *  \name RWFrom functions
 *
 *  Functions to create SDL_RWops structures from various data streams.
 */
/*@{*/

extern DECLSPEC SDL_RWops *SDLCALL SDL_RWFromFile(const char *file,
                                                  const char *mode);
#ce

Func _SDL_RWFromFile($sFile, $sMode)
	$aCall = DllCall($__SDL_DLL, "ptr:cdecl", "SDL_RWFromFile", "str", $sFile, "str", $sMode)
	If @error Then Return SetError(1, @error, 0)
	Return $aCall[0]
EndFunc