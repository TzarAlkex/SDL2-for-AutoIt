#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1 (stable)
 Author:         Team Alpha Super Awesome Cool Dynamite Wolf Squadron (only consists of AdmiralAlkex as of writing)

 Script Function:
	UDF for SDL

#ce ----------------------------------------------------------------------------

#include-once
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#Region UDF stuff
Global $__SDL_DLL = -1
#EndRegion

#include "SDL_error.au3"
#include "SDL_render.au3"
#include "SDL_rwops.au3"
#include "SDL_timer.au3"
#include "SDL_video.au3"
#include "SDL_autoit.au3"

#cs
/**
 *  \name SDL_INIT_*
 *
 *  These are the flags which may be passed to SDL_Init().  You should
 *  specify the subsystems which you will be using in your application.
 */
#ce

Global Const $_SDL_INIT_TIMER			= 0x00000001
Global Const $_SDL_INIT_AUDIO			= 0x00000010
Global Const $_SDL_INIT_VIDEO			= 0x00000020
Global Const $_SDL_INIT_JOYSTICK		= 0x00000200
Global Const $_SDL_INIT_HAPTIC			= 0x00001000
Global Const $_SDL_INIT_NOPARACHUTE		= 0x00100000   ;Don't catch fatal signals
Global Const $_SDL_INIT_EVERYTHING		= 0x0000FFFF

#cs
/**
 *  This function initializes  the subsystems specified by \c flags
 *  Unless the ::SDL_INIT_NOPARACHUTE flag is set, it will install cleanup
 *  signal handlers for some commonly ignored fatal signals (like SIGSEGV).
 */
extern DECLSPEC int SDLCALL SDL_Init(Uint32 flags);
#ce

Func _SDL_Init($iFlags, $sDir = @ScriptDir)
	If StringRight($sDir, 1) <> "\" Then $sDir &= "\"   ;Use this instead, it's better

	If @AutoItX64 Then
		$__SDL_DLL = DllOpen($sDir & "SDL_x64.dll")
	Else
		$__SDL_DLL = DllOpen($sDir & "SDL.dll")
	EndIf

	If $__SDL_DLL = -1 Then
		Return SetError(1)
	EndIf

	Local $aCall = DllCall($__SDL_DLL, "int:cdecl", "SDL_Init", "uint", $iFlags)
	If @error Then Return SetError(1, @error, 0)
	Return $aCall[0]
EndFunc

#cs
/**
 *  This function cleans up all initialized subsystems. You should
 *  call it upon all exit conditions.
 */
extern DECLSPEC void SDLCALL SDL_Quit(void);
#ce

Func _SDL_Quit()
	DllCall($__SDL_DLL, "none:cdecl", "SDL_Quit")
	If @error Then Return SetError(1, @error, 0)

	DllClose($__SDL_DLL)
EndFunc