#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
menu,tray,NoStandard
menu,tray,DeleteAll
menu,tray,Tip, weiredClick2normal-NEKO
; menu,tray,add, ReSet
menu,tray,add, Quite
; Process, priority, %PIDS%, Low

limitTime = 45
WheelDown::If (A_TimeSincePriorHotkey < limitTime && !WheelUP)
SendInput, {WheelDown}
return
WheelUP::If (A_TimeSincePriorHotkey < limitTime && !WheelDown)
SendInput, {WheelUP}
Return


; MButton::
; If (A_TimeSincePriorHotkey < limitTime)
; Return
; SendInput, {MButton Down}
; KeyWait, MButton
; Send, {MButton Up}
; Return
; RButton::
; If (A_TimeSincePriorHotkey < limitTime)
; Return
; SendInput, {RButton Down}
; KeyWait, RButton
; Send, {RButton Up}
; return 
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
A:
return
Quite:
ExitApp
return 