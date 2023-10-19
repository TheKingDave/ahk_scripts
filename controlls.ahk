Pause::Send {Media_Play_Pause}

DetectHiddenWindows, On

// Taken from https://gist.github.com/jcsteh/7ccbc6f7b1b7eb85c1c14ac5e0d65195#file-spotifyglobalkeys-ahk-L27
; Get the HWND of the Spotify main window.
getSpotifyHwnd() {
	WinGet, spotifyHwnd, ID, ahk_exe spotify.exe
	Return spotifyHwnd
}

; Send a key to Spotify.
spotifyKey(key) {
	spotifyHwnd := getSpotifyHwnd()
	; Chromium ignores keys when it isn't focused.
	; Focus the document window without bringing the app to the foreground.
	ControlFocus, Chrome_RenderWidgetHostHWND1, ahk_id %spotifyHwnd%
	ControlSend, , %key%, ahk_id %spotifyHwnd%
	Return
}

; WIN + Alt + Page Up volume up
#!PgUp::
{
  spotifyKey("^{Up}")
  return
}

; WIN + Alt + Page Down volume down
#!PgDn::
{
  spotifyKey("^{Down}")
  return
}


; Send play/pause directly to spotify and not to teams
Media_Play_Pause::PostMessage, 0x319,, 0xE0000,, ahk_exe Spotify.exe

; WIN + Alt + Right next song
#!Right::PostMessage, 0x319,, 0xB0000,, ahk_exe Spotify.exe

; WIN + Alt + Up play/pause
#!Up::PostMessage, 0x319,, 0xE0000,, ahk_exe Spotify.exe

; WIN + Alt + Left previus song
#!Left::PostMessage, 0x319,, 0xC0000,, ahk_exe Spotify.exe
