#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1 (stable)
 Author:         Team Alpha Super Awesome Cool Dynamite Wolf Squadron (only consists of AdmiralAlkex as of writing)

 Script Function:
	UDF for SDL

#ce ----------------------------------------------------------------------------

#include-once

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
	If @error Then Return SetError(1, @error, 0)
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
	If @error Then Return SetError(1, @error, 0)
	Return $aCall[0]
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
	If @error Then Return SetError(1, @error, 0)
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
	If @error Then Return SetError(1, @error, 0)
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
	Local $aCall = DllCall($__SDL_DLL, "int:cdecl", "SDL_RenderCopy", "ptr", $pRenderer, "ptr", $pTexture, "ptr", DllStructGetPtr($pSrcRect), "ptr", DllStructGetPtr($pDstRect))
	If @error Then Return SetError(1, @error, 0)
	Return $aCall[0]
EndFunc

#cs
/**
 *  \brief Update the screen with rendering performed.
 */
extern DECLSPEC void SDLCALL SDL_RenderPresent(SDL_Renderer * renderer);
#ce

Func _SDL_RenderPresent($pRenderer)
	Local $aCall = DllCall($__SDL_DLL, "none:cdecl", "SDL_RenderPresent", "ptr", $pRenderer)
	If @error Then Return SetError(1, @error, 0)
EndFunc