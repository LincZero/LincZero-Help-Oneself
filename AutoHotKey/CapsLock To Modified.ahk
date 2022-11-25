; AutoHotKey 1.1 Capslock Remapping Script 

;===========================; Capslock状态
Capslock & Esc::			; 切换大小写
    if GetKeyState("CapsLock", "T") = 1
        SetCapsLockState, AlwaysOff
    else 
        SetCapsLockState, AlwaysOn
    return

init := 0
if (init = 0){			; 防止闪大小锁图标
    Send, {CapsLock Down}{Esc}{Esc}{CapsLock Up}
    init := 1
}

Capslock := 0
CapsLock::			; 单击CL为Esc键
    Send, {ESC}
    return

;===========================; 复合修饰键
Capslock & f::			; 短按全选，长按视为按住Ctrl
    KeyWait f
    Send {Ctrl Down}
    return
Capslock & f up::
    if (A_PriorHotkey = "Capslock & f") {	; 如果有其他操作
        Send {Ctrl Down}{Left}{Shift Down}{Right}{Shift Up}{Ctrl Up}
    }
    return

Capslock & g::
    Send {Home}{Shift Down}{End}{Shift Up}
    return

;===========================; 方向区
Capslock & u::			;上
    Send {Up}
    return
Capslock & j::			;左
    Send {Left}
    return
Capslock & k::			;下
    Send {Down}
    return
Capslock & l::			;右
    Send {Right}
    return
Capslock & h::			;最左
    Send {Home DownTemp}
    return
Capslock & `;::			;最右
    Send {End DownTemp}
    return
;===========================; 删除区
Capslock & i::
    if getkeystate("shift") = 1
        Send +{Home}{Backspace Down}
    else
        Send {Backspace Down}
    return
Capslock & o::
    if getkeystate("shift") = 1
        Send +{End}{Delete Down}
    else
        Send {Delete Down}
    return
;Capslock & p::
;    if getkeystate("shift") = 1
;        Send {+Home}{Delete}{+End}{Delete}
;    return
;===========================;

Capslock & [::SendInput {Blind}{PgUp Down}
Capslock & [ up::SendInput {Blind}{PgUp Up}
Capslock & ]::SendInput {Blind}{PgDn Down}
Capslock & ] up::SendInput {Blind}{PgDn Up}
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