; AutoHotKey 1.1 Capslock Remapping Script 

;===========================; 复合修饰键
Capslock & f::
    SendInput {Blind}{Ctrl DownTemp}
    return
Capslock & f up::
    SendInput {Blind}{Ctrl Up}
    return
;===========================; 方向区
Capslock & u::			;上
    SendInput {Blind}{Up DownTemp}
    return
Capslock & u up::
    SendInput {Blind}{Up Up}
    return
Capslock & j::			;左
    Send {Blind}{Left DownTemp}
    return
Capslock & j up::
    Send {Blind}{Left Up}
    return
Capslock & k::			;下
    Send {Blind}{Down DownTemp}
    return
Capslock & k up::
    Send {Blind}{Down Up}
    return
Capslock & l::			;右
    Send {Blind}{Right DownTemp}
    return
Capslock & l up::
    Send {Blind}{Right Up}
    return
Capslock & h::			;最左
    Send {Blind}{Home DownTemp}
    return
Capslock & h up::
    Send {Blind}{Home Up}
    return
Capslock & `;::			;最右
    Send {Blind}{End DownTemp}
    return
Capslock & `; up::
    Send {Blind}{End Up}
    return
;===========================; 删除区
Capslock & i::
    if getkeystate("shift") = 1
        Send +{Home}{Backspace Down}
    else
        SendInput {Blind}{Backspace Down}
    return
Capslock & i up::SendInput {Blind}{Backspace Up}
Capslock & o::
    if getkeystate("shift") = 1
        Send +{End}{Delete Down}
    else
        SendInput {Blind}{Delete Down}
    return
Capslock & o up::SendInput {Blind}{Delete Up}
;Capslock & p::
;    if getkeystate("shift") = 1
;        Send {+Home}{Delete}{+End}{Delete}
;    return
;===========================;
Capslock & [::SendInput {Blind}{PgUp Down}
Capslock & [ up::SendInput {Blind}{PgUp Up}
Capslock & ]::SendInput {Blind}{PgDn Down}
Capslock & ] up::SendInput {Blind}{PgDn Up}

; 第三行
Capslock & n::SendInput ^+{Left} {Backspace}
Capslock & m::Send, {End}{Enter}
Capslock & ,::Send {End Enter}
Capslock & .::SendInput {Blind}{Delete Down}
Capslock & . up::SendInput {Blind}{Delete Up}
Capslock & /::SendInput ^+{Right} {Delete}

; CL 第零行（替Ctrl）
Capslock & `::Send {ctrl down}`{ctrl up}
Capslock & 1::Send {ctrl down}1{ctrl up}
Capslock & 2::Send {ctrl down}2{ctrl up}
Capslock & 3::Send {ctrl down}3{ctrl up}
Capslock & 4::Send {ctrl down}4{ctrl up}
Capslock & 5::Send {ctrl down}5{ctrl up}
Capslock & 6::Send {ctrl down}6{ctrl up}

; CL 其他行
Capslock & Space::SendInput {Blind}{Enter Down}
Capslock & Space up::SendInput {Blind}{Enter Up}
+Space::SendInput {Blind}{Enter Down}
+Space up::SendInput {Blind}{Enter Up}

; CL 左手行（替Ctrl）
Capslock & Z::Send ^z
Capslock & X::Send ^X
Capslock & C::Send ^C
Capslock & V::Send ^V
Capslock & B::Send ^B
Capslock & Q::Send ^Z
Capslock & W::Send ^X
Capslock & E::Send ^C
Capslock & R::Send ^V
Capslock & T::Send ^T
Capslock & A::Send ^A
Capslock & S::Send ^S
Capslock & D::Send ^D
Capslock & G::Send ^G

; CL Shift 切换大小写
Capslock & Esc::
If GetKeyState("CapsLock", "T") = 1
    SetCapsLockState, AlwaysOff
Else 
    SetCapsLockState, AlwaysOn
Return

; 单击CL为Esc键
CapsLock::Send, {ESC}
return
;CapsLock::Send, {VKC0} ; mapped to `
;CapsLock & c::Run calc
;CapsLock & n::Run notepad
return

; Win 热键
#c::Run calc ; 原动作是叫小娜
#n::Run notepad

; RShift 热键
RShift::SendInput {Blind}{Shift Up Control Down}
RShift up::SendInput {Blind}{Control Up}
return

; A 数字
;A & H::Send 0
;A & J::Send 1
;A & K::Send 2
;A & L::Send 3
;A & `;::Send 4
;A & '::Send .
;A & Y::Send 5
;A & U::Send 6
;A & I::Send 7
;A & O::Send 8
;A & P::Send 9
;A & Space::Send 0
;A::Send, a
;Return