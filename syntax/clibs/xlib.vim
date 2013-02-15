" clibs/xlib.vim: Syntax file to match identifiers from Xlib
" Created:	Thu 25 May 2006 06:27:55 PM CDT
" Modified: 	Thu 22 Feb 2007 01:10:28 AM PST
" Author:   	Gautam Iyer <gi1242@users.sourceforge.net>
"
" DESCRIPTION
"
"   Matches the standard functions defined by xlib. This file is meant to be
"   included from whatever file wants to match these items (the including file
"   must provide the cLibIdentifiers syntax cluster).
"
" No need to provide load control using b:current_syntax, as this file is only
" meant to be included from the C syntax file. However if "c_hi_identifiers"
" is not defined, we define no syntax items so we exit right away and define
" no syntax items.
if !exists( 'c_hi_identifiers' )
    finish
endif

" Standard X library functions (no extensions)
if c_hi_identifiers =~ '\v\C<(all|functions)>'
    " {{{ Xlib functions [generated from /usr/include/X11/Xlib.h]
    syn keyword cLibFunction contained  XActivateScreenSaver XAddConnectionWatch XAddExtension XAddHost XAddHosts XAddToExtensionList XAddToSaveSet XAllPlanes XAllocColor XAllocColorCells XAllocColorPlanes XAllocNamedColor XAllowEvents XAutoRepeatOff XAutoRepeatOn
    syn keyword cLibFunction contained  XBaseFontNameListOfFontSet XBell XBitmapBitOrder XBitmapPad XBitmapUnit XBlackPixel XBlackPixelOfScreen
    syn keyword cLibFunction contained  XCellsOfScreen XChangeActivePointerGrab XChangeGC XChangeKeyboardControl XChangeKeyboardMapping XChangePointerControl XChangeProperty XChangeSaveSet XChangeWindowAttributes XCheckIfEvent XCheckMaskEvent XCheckTypedEvent XCheckTypedWindowEvent XCheckWindowEvent XCirculateSubwindows XCirculateSubwindowsDown XCirculateSubwindowsUp XClearArea XClearWindow XCloseDisplay XCloseIM XCloseOM XConfigureWindow XConnectionNumber XContextDependentDrawing XContextualDrawing XConvertSelection XCopyArea XCopyColormapAndFree XCopyGC XCopyPlane XCreateBitmapFromData XCreateColormap XCreateFontCursor XCreateFontSet XCreateGC XCreateGlyphCursor XCreateIC XCreateImage XCreateOC XCreatePixmap XCreatePixmapCursor XCreatePixmapFromBitmapData XCreateSimpleWindow XCreateWindow
    syn keyword cLibFunction contained  XDefaultColormap XDefaultColormapOfScreen XDefaultDepth XDefaultDepthOfScreen XDefaultGC XDefaultGCOfScreen XDefaultRootWindow XDefaultScreen XDefaultScreenOfDisplay XDefaultVisual XDefaultVisualOfScreen XDefineCursor XDeleteModifiermapEntry XDeleteProperty XDestroyIC XDestroyOC XDestroySubwindows XDestroyWindow XDirectionalDependentDrawing XDisableAccessControl XDisplayCells XDisplayHeight XDisplayHeightMM XDisplayKeycodes XDisplayMotionBufferSize XDisplayName XDisplayOfIM XDisplayOfOM XDisplayOfScreen XDisplayPlanes XDisplayString XDisplayWidth XDisplayWidthMM XDoesBackingStore XDoesSaveUnders XDrawArc XDrawArcs XDrawImageString XDrawImageString16 XDrawLine XDrawLines XDrawPoint XDrawPoints XDrawRectangle XDrawRectangles XDrawSegments XDrawString XDrawString16 XDrawText XDrawText16
    syn keyword cLibFunction contained  XEHeadOfExtensionList XEnableAccessControl XEventMaskOfScreen XEventsQueued XExtendedMaxRequestSize XExtentsOfFontSet
    syn keyword cLibFunction contained  XFetchBuffer XFetchBytes XFetchName XFillArc XFillArcs XFillPolygon XFillRectangle XFillRectangles XFilterEvent XFindOnExtensionList XFlush XFlushGC XFontsOfFontSet XForceScreenSaver XFree XFreeColormap XFreeColors XFreeCursor XFreeExtensionList XFreeFont XFreeFontInfo XFreeFontNames XFreeFontPath XFreeFontSet XFreeGC XFreeModifiermap XFreePixmap XFreeStringList
    syn keyword cLibFunction contained  XGContextFromGC XGeometry XGetAtomName XGetAtomNames XGetCommand XGetDefault XGetErrorDatabaseText XGetErrorText XGetFontPath XGetFontProperty XGetGCValues XGetGeometry XGetICValues XGetIMValues XGetIconName XGetImage XGetInputFocus XGetKeyboardControl XGetKeyboardMapping XGetModifierMapping XGetMotionEvents XGetOCValues XGetOMValues XGetPointerControl XGetPointerMapping XGetScreenSaver XGetSelectionOwner XGetSubImage XGetTransientForHint XGetWMColormapWindows XGetWMProtocols XGetWindowAttributes XGetWindowProperty XGrabButton XGrabKey XGrabKeyboard XGrabPointer XGrabServer
    syn keyword cLibFunction contained  XHeightMMOfScreen XHeightOfScreen
    syn keyword cLibFunction contained  XIMOfIC XIconifyWindow XIfEvent XImageByteOrder XInitExtension XInitImage XInitThreads XInsertModifiermapEntry XInstallColormap XInternAtom XInternAtoms XInternalConnectionNumbers
    syn keyword cLibFunction contained  XKeycodeToKeysym XKeysymToKeycode XKeysymToString XKillClient
    syn keyword cLibFunction contained  XLastKnownRequestProcessed XListDepths XListExtensions XListFonts XListFontsWithInfo XListHosts XListInstalledColormaps XListPixmapFormats XListProperties XLoadFont XLoadQueryFont XLocaleOfFontSet XLocaleOfIM XLocaleOfOM XLockDisplay XLookupColor XLookupKeysym XLowerWindow
    syn keyword cLibFunction contained  XMapRaised XMapSubwindows XMapWindow XMaskEvent XMaxCmapsOfScreen XMaxRequestSize XMinCmapsOfScreen XMoveResizeWindow XMoveWindow
    syn keyword cLibFunction contained  XNewModifiermap XNextEvent XNextRequest XNoOp
    syn keyword cLibFunction contained  XOMOfOC XOpenDisplay XOpenIM XOpenOM
    syn keyword cLibFunction contained  XParseColor XParseGeometry XPeekEvent XPeekIfEvent XPending XPlanesOfScreen XProcessInternalConnection XProtocolRevision XProtocolVersion XPutBackEvent XPutImage
    syn keyword cLibFunction contained  XQLength XQueryBestCursor XQueryBestSize XQueryBestStipple XQueryBestTile XQueryColor XQueryColors XQueryExtension XQueryFont XQueryKeymap XQueryPointer XQueryTextExtents XQueryTextExtents16 XQueryTree
    syn keyword cLibFunction contained  XRaiseWindow XReadBitmapFile XReadBitmapFileData XRebindKeysym XRecolorCursor XReconfigureWMWindow XRefreshKeyboardMapping XRegisterIMInstantiateCallback XRemoveConnectionWatch XRemoveFromSaveSet XRemoveHost XRemoveHosts XReparentWindow XResetScreenSaver XResizeWindow XResourceManagerString XRestackWindows XRootWindow XRootWindowOfScreen XRotateBuffers XRotateWindowProperties
    syn keyword cLibFunction contained  XScreenCount XScreenNumberOfScreen XScreenOfDisplay XScreenResourceString XSelectInput XSendEvent XServerVendor XSetAccessControl XSetAfterFunction XSetArcMode XSetAuthorization XSetBackground XSetClipMask XSetClipOrigin XSetClipRectangles XSetCloseDownMode XSetCommand XSetDashes XSetErrorHandler XSetFillRule XSetFillStyle XSetFont XSetFontPath XSetForeground XSetFunction XSetGraphicsExposures XSetICFocus XSetICValues XSetIMValues XSetIOErrorHandler XSetIconName XSetInputFocus XSetLineAttributes XSetLocaleModifiers XSetModifierMapping XSetOCValues XSetOMValues XSetPlaneMask XSetPointerMapping XSetScreenSaver XSetSelectionOwner XSetState XSetStipple XSetSubwindowMode XSetTSOrigin XSetTile XSetTransientForHint XSetWMColormapWindows XSetWMProtocols XSetWindowBackground XSetWindowBackgroundPixmap XSetWindowBorder XSetWindowBorderPixmap XSetWindowBorderWidth XSetWindowColormap XStoreBuffer XStoreBytes XStoreColor XStoreColors XStoreName XStoreNamedColor XStringToKeysym XSupportsLocale XSync XSynchronize
    syn keyword cLibFunction contained  XTextExtents XTextExtents16 XTextWidth XTextWidth16 XTranslateCoordinates
    syn keyword cLibFunction contained  XUndefineCursor XUngrabButton XUngrabKey XUngrabKeyboard XUngrabPointer XUngrabServer XUninstallColormap XUnloadFont XUnlockDisplay XUnmapSubwindows XUnmapWindow XUnregisterIMInstantiateCallback XUnsetICFocus
    syn keyword cLibFunction contained  XVaCreateNestedList XVendorRelease XVisualIDFromVisual
    syn keyword cLibFunction contained  XWarpPointer XWhitePixel XWhitePixelOfScreen XWidthMMOfScreen XWidthOfScreen XWindowEvent XWithdrawWindow XWriteBitmapFile
    syn keyword cLibFunction contained  XmbDrawImageString XmbDrawString XmbDrawText XmbLookupString XmbResetIC XmbTextEscapement XmbTextExtents XmbTextPerCharExtents XrmInitialize Xutf8DrawImageString Xutf8DrawString Xutf8DrawText Xutf8LookupString Xutf8ResetIC Xutf8TextEscapement Xutf8TextExtents Xutf8TextPerCharExtents XwcDrawImageString XwcDrawString XwcDrawText XwcLookupString XwcResetIC XwcTextEscapement XwcTextExtents XwcTextPerCharExtents _Xmblen _Xmbtowc _Xwctomb
    " }}}
endif

" TODO: Match xlib constants. Is there a good list somewhere?
