#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1 (stable)
 Author:         Alexander Samuelsson (AdmiralAlkex)

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

#include "ExampleCommons.au3"

_SDL_Init(0, _DllFile())   ;Can't remember what 0 means but it works...

ConsoleWrite(_SDL_LogGetPriority($_SDL_LOG_CATEGORY_CUSTOM) & @LF)
_SDL_LogSetAllPriority($_SDL_LOG_PRIORITY_VERBOSE)
ConsoleWrite(_SDL_LogGetPriority($_SDL_LOG_CATEGORY_CUSTOM) & @LF)
_SDL_LogSetPriority($_SDL_LOG_CATEGORY_CUSTOM, $_SDL_LOG_PRIORITY_INFO)
ConsoleWrite(_SDL_LogGetPriority($_SDL_LOG_CATEGORY_CUSTOM) & @LF)
_SDL_LogResetPriorities()
ConsoleWrite(_SDL_LogGetPriority($_SDL_LOG_CATEGORY_CUSTOM) & @LF)