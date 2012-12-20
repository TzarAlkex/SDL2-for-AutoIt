#include-once

; #INDEX# =======================================================================================================================
; Title .........: SDL_Constants
; AutoIt Version : To be decided (3.3.8.1 works for now)
; Language ......: English
; Description ...: Constants for SDL functions.
; Author(s) .....: Alexander Samuelsson (AdmiralAlkex)
; ===============================================================================================================================

; #CONSTANTS# ===================================================================================================================
#region Initialization and Shutdown
#cs
/**
 *  \name SDL_INIT_*
 *
 *  These are the flags which may be passed to SDL_Init().  You should
 *  specify the subsystems which you will be using in your application.
 */
#ce
Global Const $_SDL_INIT_TIMER						= 0x00000001
Global Const $_SDL_INIT_AUDIO						= 0x00000010
Global Const $_SDL_INIT_VIDEO						= 0x00000020
Global Const $_SDL_INIT_JOYSTICK					= 0x00000200
Global Const $_SDL_INIT_HAPTIC						= 0x00001000
Global Const $_SDL_INIT_EVERYTHING					= 0x0000FFFF	;All of the above
Global Const $_SDL_INIT_NOPARACHUTE					= 0x00100000	;Prevents SDL from catching fatal signals
#endregion

#region Log Handling
#cs
/**
 *  \brief The predefined log categories
 *
 *  By default the application category is enabled at the INFO level,
 *  and all other categories are enabled at the CRITICAL level.
 */
#ce
Global Enum $_SDL_LOG_CATEGORY_APPLICATION, _
	$_SDL_LOG_CATEGORY_ERROR, _
	$_SDL_LOG_CATEGORY_SYSTEM, _
	$_SDL_LOG_CATEGORY_AUDIO, _
	$_SDL_LOG_CATEGORY_VIDEO, _
	$_SDL_LOG_CATEGORY_RENDER, _
	$_SDL_LOG_CATEGORY_INPUT, _
	$_SDL_LOG_CATEGORY_RESERVED1, _
	$_SDL_LOG_CATEGORY_RESERVED2, _
	$_SDL_LOG_CATEGORY_RESERVED3, _
	$_SDL_LOG_CATEGORY_RESERVED4, _
	$_SDL_LOG_CATEGORY_RESERVED5, _
	$_SDL_LOG_CATEGORY_RESERVED6, _
	$_SDL_LOG_CATEGORY_RESERVED7, _
	$_SDL_LOG_CATEGORY_RESERVED8, _
	$_SDL_LOG_CATEGORY_RESERVED9, _
	$_SDL_LOG_CATEGORY_RESERVED10, _
	$_SDL_LOG_CATEGORY_CUSTOM

#cs
/**
 *  \brief The predefined log priorities
 */
#ce
Global Enum $_SDL_LOG_PRIORITY_VERBOSE = 1, _
	$_SDL_LOG_PRIORITY_DEBUG, _
	$_SDL_LOG_PRIORITY_INFO, _
	$_SDL_LOG_PRIORITY_WARN, _
	$_SDL_LOG_PRIORITY_ERROR, _
	$_SDL_LOG_PRIORITY_CRITICAL, _
	$_SDL_NUM_LOG_PRIORITIES
#endregion

#region Display and Window Management
#cs
/**
 *  \brief The flags on a window
 *
 *  \sa SDL_GetWindowFlags()
 */
 #ce
Global Const $_SDL_WINDOW_FULLSCREEN				= 0x00000001	;fullscreen window
Global Const $_SDL_WINDOW_OPENGL					= 0x00000002	;window usable with OpenGL context
Global Const $_SDL_WINDOW_SHOWN						= 0x00000004	;window is visible
Global Const $_SDL_WINDOW_HIDDEN					= 0x00000008	;window is not visible
Global Const $_SDL_WINDOW_BORDERLESS				= 0x00000010	;no window decoration
Global Const $_SDL_WINDOW_RESIZABLE					= 0x00000020	;window can be resized
Global Const $_SDL_WINDOW_MINIMIZED					= 0x00000040	;window is minimized
Global Const $_SDL_WINDOW_MAXIMIZED					= 0x00000080	;window is maximized
Global Const $_SDL_WINDOW_INPUT_GRABBED				= 0x00000100	;window has grabbed input focus
Global Const $_SDL_WINDOW_INPUT_FOCUS				= 0x00000200	;window has input focus
Global Const $_SDL_WINDOW_MOUSE_FOCUS				= 0x00000400	;window has mouse focus
Global Const $_SDL_WINDOW_FOREIGN					= 0x00000800	;window not created by SDL
#endregion

#region 2D Accelerated Rendering
#cs
/**
 *  \brief Flags used when creating a rendering context
 */
#ce
Global Const $_SDL_RENDERER_SOFTWARE				= 0x00000001	;The renderer is a software fallback
Global Const $_SDL_RENDERER_ACCELERATED				= 0x00000002	;The renderer uses hardware acceleration
Global Const $_SDL_RENDERER_PRESENTVSYNC			= 0x00000004	;Present is synchronized with the refresh rate
Global Const $_SDL_RENDERER_TARGETTEXTURE			= 0x00000008	;The renderer supports rendering to texture
#endregion

#region Rectangle Functions
#cs
typedef struct
{
    int x;
    int y;
} SDL_Point;
#ce
Global Const $tagSDL_Point = "int x;int y"

#cs
typedef struct SDL_Rect
{
    int x, y;
    int w, h;
} SDL_Rect;
#ce
Global Const $tagSDL_Rect = "int x;int y;int w;int h"
#endregion
; ===============================================================================================================================