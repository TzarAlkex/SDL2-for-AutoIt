#include-once

; #INDEX# =======================================================================================================================
; Title .........: SDL_Constants
; AutoIt Version : To be decided (3.3.8.1+ recommended maybe??)
; Language ......: English
; Description ...: Constants for SDL functions.
; Author(s) .....: Alexander Samuelsson (AdmiralAlkex)
; ===============================================================================================================================

; #CONSTANTS# ===================================================================================================================
Global Const $_SDL_INIT_TIMER						= 0x00000001
Global Const $_SDL_INIT_AUDIO						= 0x00000010
Global Const $_SDL_INIT_VIDEO						= 0x00000020
Global Const $_SDL_INIT_CDROM						= 0x00000100
Global Const $_SDL_INIT_JOYSTICK					= 0x00000200
Global Const $_SDL_INIT_EVERYTHING					= 0x0000FFFF	;All of the above
Global Const $_SDL_INIT_NOPARACHUTE					= 0x00100000	;Prevents SDL from catching fatal signals
Global Const $_SDL_INIT_EVENTTHREAD					= 0x01000000	;Don't know what it's supposed to do or if it's supported on Windows
; ===============================================================================================================================