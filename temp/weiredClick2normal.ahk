#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
menu,tray,NoStandard
menu,tray,DeleteAll
menu,tray,Tip, NEKO MouseStop
; menu,tray,add, ReSet
menu,tray,add, Quite
; Process, priority, %PIDS%, Low

limitTime = 100
MButton::
If (A_TimeSincePriorHotkey < limitTime)
Return
SendInput, {MButton Down}
KeyWait, MButton
Send, {MButton Up}
Return

RButton::
If (A_TimeSincePriorHotkey < limitTime)
Return
SendInput, {RButton Down}
KeyWait, RButton
Send, {RButton Up}
return 



; LButton:: If ( A_TimeSincePriorHotkey < limitTime ) 
; SendInput, {Lbutton Down} 
; return 
; Lbutton Up::SendInput, {Lbutton Up} 
; Mbutton Up::
; SendInput, {MButton Up} 
; return 
; Rbutton Up::If ( A_TimeSincePriorHotkey < limitTime )
	; return
	; Send {Rbutton Up}
; return
; $F2::
; reload
; return
; ReSet:
; Reload
; return

Quite:
ExitApp
return 