#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_AU3Check_Parameters=-q -d -w 1 -w 2 -w 3 -w- 4 -w 5 -w 6 -w- 7
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#include-once

#include "SDLConstants.au3"

; #INDEX# =======================================================================================================================
; Title .........: SDL (Simple DirectMedia Layer)
; AutoIt Version : To be decided (3.3.8.1 works for now)
; Description ...: Simple DirectMedia Layer is a cross-platform multimedia library.
; Author(s) .....: Alexander Samuelsson (AdmiralAlkex)
; Dll ...........: SDL.dll
; ===============================================================================================================================

; #VARIABLES# ===================================================================================================================
Global $__SDL_DLL = -1
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================

;Initialization and Shutdown
;_SDL_Init
;_SDL_InitSubSystem
;_SDL_Quit
;_SDL_QuitSubSystem
;_SDL_WasInit

;Error Handling
;_SDL_ClearError
;_SDL_GetError
;_SDL_SetError

;Log Handling
;_SDL_LogSetAllPriority

;Display and Window Management
;_SDL_CreateWindow

;2D Accelerated Rendering
;_SDL_CreateRenderer
;_SDL_CreateTextureFromSurface
;_SDL_RenderClear
;_SDL_RenderCopy
;_SDL_RenderPresent
;_SDL_SetRenderDrawColor

;Rectangle Functions


;Surface Creation and Simple Drawing
;_SDL_FreeSurface
;_SDL_LoadBMP_RW
;_SDL_LoadBMP

;Timer Support
;_SDL_Delay

;File I/O Abstraction
;_SDL_RWFromFile
; ===============================================================================================================================

#region Initialization and Shutdown
#cs
/**
 *  This function initializes  the subsystems specified by \c flags
 *  Unless the ::SDL_INIT_NOPARACHUTE flag is set, it will install cleanup
 *  signal handlers for some commonly ignored fatal signals (like SIGSEGV).
 */
extern DECLSPEC int SDLCALL SDL_Init(Uint32 flags);
#ce
Func _SDL_Init($iFlags, $sDllFile)
	$__SDL_DLL = DllOpen($sDllFile)

	If $__SDL_DLL = -1 Then
		Return SetError(1, Default, -1)
	EndIf

	Local $aCall = DllCall($__SDL_DLL, "int:cdecl", "SDL_Init", "uint", $iFlags)
	If @error Then Return SetError(2, @error, -1)
	Return $aCall[0]
EndFunc

#cs
/**
 *  This function initializes specific SDL subsystems
 */
extern DECLSPEC int SDLCALL SDL_InitSubSystem(Uint32 flags);
#ce
Func _SDL_InitSubSystem($iFlags)
	Local $aCall = DllCall($__SDL_DLL, "int:cdecl", "SDL_InitSubSystem", "uint", $iFlags)
	If @error Then Return SetError(1, @error, -1)
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
	If @error Then Return SetError(1, @error, -1)

	DllClose($__SDL_DLL)
	$__SDL_DLL = ""
EndFunc

#cs
/**
 *  This function cleans up specific SDL subsystems
 */
extern DECLSPEC void SDLCALL SDL_QuitSubSystem(Uint32 flags);
#ce
Func _SDL_QuitSubSystem($iFlags)
	DllCall($__SDL_DLL, "none:cdecl", "SDL_QuitSubSystem", "uint", $iFlags)
	If @error Then Return SetError(1, @error, -1)
EndFunc

#cs
/**
 *  This function returns a mask of the specified subsystems which have
 *  previously been initialized.
 *
 *  If \c flags is 0, it returns a mask of all initialized subsystems.
 */
extern DECLSPEC Uint32 SDLCALL SDL_WasInit(Uint32 flags);
#ce
Func _SDL_WasInit($iFlags)
	Local $aCall = DllCall($__SDL_DLL, "uint:cdecl", "SDL_WasInit", "uint", $iFlags)
	If @error Then Return SetError(1, @error, -1)
	Return $aCall[0]
EndFunc
#endregion

#region Error Handling
#cs
extern DECLSPEC void SDLCALL SDL_ClearError(void);
#ce
Func _SDL_ClearError()
	DllCall($__SDL_DLL, "none:cdecl", "SDL_ClearError")
	If @error Then Return SetError(1, @error, -1)
EndFunc

#cs
extern DECLSPEC const char *SDLCALL SDL_GetError(void);
#ce
Func _SDL_GetError()
	Local $aCall = DllCall($__SDL_DLL, "str:cdecl", "SDL_GetError")
	If @error Then Return SetError(1, @error, -1)
	Return $aCall[0]
EndFunc

#cs
extern DECLSPEC void SDLCALL SDL_SetError(const char *fmt, ...);
#ce
Func _SDL_SetError($sMessage)
	DllCall($__SDL_DLL, "none:cdecl", "SDL_SetError", "str", $sMessage)
	If @error Then Return SetError(1, @error, -1)
EndFunc
#endregion

#region Log Handling
#cs
/**
 *  \brief Set the priority of all log categories
 */
extern DECLSPEC void SDLCALL SDL_LogSetAllPriority(SDL_LogPriority priority);
#ce
Func _SDL_LogSetAllPriority($iPriority)
	DllCall($__SDL_DLL, "none:cdecl", "SDL_LogSetAllPriority", "str", $sMessage)
	If @error Then Return SetError(1, @error, -1)
EndFunc
#endregion

#region Display and Window Management
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
	If @error Then Return SetError(1, @error, -1)
	Return $aCall[0]
EndFunc
#endregion

#region 2D Accelerated Rendering
#cs
/**
 *  \brief Create a 2D rendering context for a window.
 *
 *  \param window The window where rendering is displayed.
 *  \param index    The index of the rendering driver to initialize, or -1 to
 *                  initialize the first one supporting the requested flags.
 *  \param flags    ::SDL_RendererFlags.
 *
 *  \return A valid rendering context or NULL if there was an error.
 *
 *  \sa SDL_CreateSoftwareRenderer()
 *  \sa SDL_GetRendererInfo()
 *  \sa SDL_DestroyRenderer()
 */
extern DECLSPEC SDL_Renderer * SDLCALL SDL_CreateRenderer(SDL_Window * window,
                                               int index, Uint32 flags);
#ce
Func _SDL_CreateRenderer($pWindow, $iIndex, $iFlags)
	Local $aCall = DllCall($__SDL_DLL, "ptr:cdecl", "SDL_CreateRenderer", "ptr", $pWindow, "int", $iIndex, "uint", $iFlags)
	If @error Then Return SetError(1, @error, -1)
	Return $aCall[0]
EndFunc

#cs
/**
 *  \brief Create a texture from an existing surface.
 *
 *  \param surface The surface containing pixel data used to fill the texture.
 *
 *  \return The created texture is returned, or 0 on error.
 *
 *  \note The surface is not modified or freed by this function.
 *
 *  \sa SDL_QueryTexture()
 *  \sa SDL_DestroyTexture()
 */
extern DECLSPEC SDL_Texture * SDLCALL SDL_CreateTextureFromSurface(SDL_Renderer * renderer, SDL_Surface * surface);
#ce
Func _SDL_CreateTextureFromSurface($pRenderer, $pSurface)
	Local $aCall = DllCall($__SDL_DLL, "ptr:cdecl", "SDL_CreateTextureFromSurface", "ptr", $pRenderer, "ptr", $pSurface)
	If @error Then Return SetError(1, @error, -1)
	Return $aCall[0]
EndFunc

#cs
/**
 *  \brief Clear the current rendering target with the drawing color
 *
 *  This function clears the entire rendering target, ignoring the viewport.
 */
extern DECLSPEC int SDLCALL SDL_RenderClear(SDL_Renderer * renderer);
#ce
Func _SDL_RenderClear($pRenderer)
	Local $aCall = DllCall($__SDL_DLL, "int:cdecl", "SDL_RenderClear", "ptr", $pRenderer)
	If @error Then Return SetError(1, @error, -1)
	Return $aCall[0]
EndFunc

#cs
/**
 *  \brief Copy a portion of the texture to the current rendering target.
 *
 *  \param texture The source texture.
 *  \param srcrect   A pointer to the source rectangle, or NULL for the entire
 *                   texture.
 *  \param dstrect   A pointer to the destination rectangle, or NULL for the
 *                   entire rendering target.
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDLCALL SDL_RenderCopy(SDL_Renderer * renderer,
                                           SDL_Texture * texture,
                                           const SDL_Rect * srcrect,
                                           const SDL_Rect * dstrect);
#ce
Func _SDL_RenderCopy($pRenderer, $pTexture, $pSrcRect, $pDstRect)
	Local $aCall = DllCall($__SDL_DLL, "int:cdecl", "SDL_RenderCopy", "ptr", $pRenderer, "ptr", $pTexture, "struct*", $pSrcRect, "struct*", $pDstRect)
	If @error Then Return SetError(1, @error, -1)
	Return $aCall[0]
EndFunc

#cs
/**
 *  \brief Update the screen with rendering performed.
 */
extern DECLSPEC void SDLCALL SDL_RenderPresent(SDL_Renderer * renderer);
#ce
Func _SDL_RenderPresent($pRenderer)
	DllCall($__SDL_DLL, "none:cdecl", "SDL_RenderPresent", "ptr", $pRenderer)
	If @error Then Return SetError(1, @error, -1)
EndFunc

#cs
/**
 *  \brief Set the color used for drawing operations (Fill and Line).
 *
 *  \param r The red value used to draw on the rendering target.
 *  \param g The green value used to draw on the rendering target.
 *  \param b The blue value used to draw on the rendering target.
 *  \param a The alpha value used to draw on the rendering target, usually
 *           ::SDL_ALPHA_OPAQUE (255).
 *
 *  \return 0 on success, or -1 on error
 */
extern DECLSPEC int SDL_SetRenderDrawColor(SDL_Renderer * renderer,
                                           Uint8 r, Uint8 g, Uint8 b,
                                           Uint8 a);
#ce
Func _SDL_SetRenderDrawColor($pRenderer, $iR, $iG, $iB, $iA)
	Local $aCall = DllCall($__SDL_DLL, "int:cdecl", "SDL_SetRenderDrawColor", "ptr", $pRenderer, "BYTE", $iR, "BYTE", $iG, "BYTE", $iB, "BYTE", $iA)
	If @error Then Return SetError(1, @error, -1)
	Return $aCall[0]
EndFunc
#endregion

#region Rectangle Functions

#endregion

#region Surface Creation and Simple Drawing
#cs
extern DECLSPEC void SDLCALL SDL_FreeSurface(SDL_Surface * surface);
#ce
Func _SDL_FreeSurface($pSurface)
	DllCall($__SDL_DLL, "none:cdecl", "SDL_FreeSurface", "ptr", $pSurface)
	If @error Then Return SetError(1, @error, -1)
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
	Local $aCall = DllCall($__SDL_DLL, "ptr:cdecl", "SDL_LoadBMP_RW", "ptr", $pSrc, "int", $iFreeSrc)
	If @error Then Return SetError(1, @error, -1)
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
	Local $pRWops = _SDL_RWFromFile($sFile, "rb")
	If @error Then Return SetError(1, @error, -1)
	Local $pSurface = _SDL_LoadBMP_RW($pRWops, 1)
	If @error Then Return SetError(2, @error, -1)
	Return $pSurface
EndFunc
#endregion

#region Timer Support
#cs
/**
 * \brief Wait a specified number of milliseconds before returning.
 */
extern DECLSPEC void SDLCALL SDL_Delay(Uint32 ms);
#ce
Func _SDL_Delay($iMs)
	DllCall($__SDL_DLL, "none:cdecl", "SDL_Delay", "uint", $iMs)
	If @error Then Return SetError(1, @error, -1)
EndFunc
#endregion

#region File I/O Abstraction
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
	Local $aCall = DllCall($__SDL_DLL, "ptr:cdecl", "SDL_RWFromFile", "str", $sFile, "str", $sMode)
	If @error Then Return SetError(1, @error, -1)
	Return $aCall[0]
EndFunc
#endregion