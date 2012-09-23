#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.6.1 (stable)
 Author:         Team Alpha Super Awesome Cool Dynamite Wolf Squadron (only consists of AdmiralAlkex as of writing)

 Script Function:
	UDF for SDL

#ce ----------------------------------------------------------------------------

#include-once

#cs
/**
 *  \brief A rectangle, with the origin at the upper left.
 *
 *  \sa SDL_RectEmpty
 *  \sa SDL_RectEquals
 *  \sa SDL_HasIntersection
 *  \sa SDL_IntersectRect
 *  \sa SDL_UnionRect
 *  \sa SDL_EnclosePoints
 */
typedef struct SDL_Rect
{
    int x, y;
    int w, h;
} SDL_Rect;
#ce

Func _SDL_Rect($iX, $iY, $iWidth, $iHeight)
	Local $pRect
	$pRect = DllStructCreate("int;int;int;int")
	DllStructSetData($pRect, 1,$iX)
	DllStructSetData($pRect, 2,$iY)
	DllStructSetData($pRect, 3,$iWidth)
	DllStructSetData($pRect, 4,$iHeight)
	Return $pRect
EndFunc