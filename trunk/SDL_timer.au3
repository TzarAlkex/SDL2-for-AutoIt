#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1 (stable)
 Author:         Team Alpha Super Awesome Cool Dynamite Wolf Squadron (only consists of AdmiralAlkex as of writing)

 Script Function:
	UDF for SDL

#ce ----------------------------------------------------------------------------

#include-once

#cs
/**
 * \brief Wait a specified number of milliseconds before returning.
 */
extern DECLSPEC void SDLCALL SDL_Delay(Uint32 ms);
#ce

Func _SDL_Delay($iMs)
	Local $aCall = DllCall($__SDL_DLL, "none:cdecl", "SDL_Delay", "uint", $iMs)
	If @error Then Return SetError(1, @error, 0)
EndFunc