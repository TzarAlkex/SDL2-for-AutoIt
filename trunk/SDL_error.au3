#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1 (stable)
 Author:         Team Alpha Super Awesome Cool Dynamite Wolf Squadron (only consists of AdmiralAlkex as of writing)

 Script Function:
	UDF for SDL

#ce ----------------------------------------------------------------------------

#include-once

#cs
/* Public functions */
extern DECLSPEC void SDLCALL SDL_SetError(const char *fmt, ...);
extern DECLSPEC const char *SDLCALL SDL_GetError(void);
extern DECLSPEC void SDLCALL SDL_ClearError(void);
#ce

Func _SDL_GetError()
	$aCall = DllCall($__SDL_DLL, "str:cdecl", "SDL_GetError")
	If @error Then Return SetError(1, @error, 0)
	Return $aCall[0]
EndFunc