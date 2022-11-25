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
;Capslock & f::			; 方案1：短按抬起词选。长按视为按住Ctrl，缺点是词选反应很慢
;    Send {Ctrl Down}
;    KeyWait f
;    return
;Capslock & f up::
;    if (A_PriorHotkey = "Capslock & f") {
;        SendInput {Left}{Shift Down}{Right}{Shift Up}{Ctrl Up}
;    }
;    else {
;        SendInput {Ctrl Up}
;    }
;    return

Capslock & f::			; 方案2：直接词选。缺点是按词移动时会闪一下，优点是更好理解设计理念，词选响应快
    Send {Ctrl Down}{Left}{Shift Down}{Right}{Shift Up}{Ctrl Up} ; 也可以将Ctrl Up移到松开F时
    KeyWait f
    return
Capslock & f up::
    return

Capslock & g::			; 行选
    Send {Home}{Shift Down}{End}{Shift Up}
    KeyWait g
    return

;===========================; 方向区
Capslock & u::			; 上
    if (GetKeyState("G", "P") = 1) {
        Send {Blind}{Ctrl Down}{Home}{Ctrl Up}
    }
    else
    {
        Send {Blind}{Up}
    }
    return

Capslock & k::			; 下
    if (GetKeyState("G", "P") = 1) {
        Send {Blind}{Ctrl Down}{End}{Ctrl Up}
    }
    else
    {
        Send {Blind}{Down}
    }

Capslock & j::			;左
    if (GetKeyState("F", "P") = 1) {
        Send {Blind}{Ctrl Down}{Left}{Ctrl Up}
    }
    else if (GetKeyState("G", "P") = 1) {
        Send {Blind}{Home}
    }
    else {
        Send {Blind}{Left}
    }
    return

Capslock & l::			; 右
    if (GetKeyState("F", "P") = 1) {
        Send {Blind}{Ctrl Down}{Right}{Ctrl Up}
    }
    else if (GetKeyState("G", "P") = 1) {
        Send {Blind}{End}
    }
    else {
        Send {Blind}{Right}
    }
    return

Capslock & h::			; 最左
    Send {Blind}{Home DownTemp}
    return

Capslock & `;::			; 最右
    Send {Blind}{End DownTemp}
    return

;===========================; 删除区
Capslock & i::			; 前删
    if (GetKeyState("F", "P") = 1) {
        Send {Blind}{Ctrl Down}{Backspace}{Ctrl Up}
    }
    else if getkeystate("shift") = 1
        Send +{Home}{Backspace}
    else
        Send {Backspace}
    return

Capslock & o::			; 后删
    if (GetKeyState("F", "P") = 1) {
        Send {Blind}{Ctrl Down}{Delete}{Ctrl Up}
    }
    else if getkeystate("shift") = 1
        Send +{End}{Delete}
    else
        Send {Delete}
    return

;Capslock & p::
;    if getkeystate("shift") = 1
;        Send {+Home}{Delete}{+End}{Delete}
;    return

;===========================; 增加区
; CL 其他行
Capslock & Space::			; 新增行 (P尾换行，G拷贝换行)
    if (GetKeyState("F", "P") = 1) {
        Send {End}{Enter}
    }
    else if (GetKeyState("G", "P") = 1) {
        if (A_PriorHotkey = "Capslock & g") { ; 避免全选两次，不要也行，但会更快
            Send ^c{End}{Enter}^v
        }
        else {
            Send {Home}{Shift Down}{End}{Shift Up}^c{End}{Enter}^v
        }
    }
    else {
        Send {Blind}{Enter}
    }
    return

+Space::Send {Blind}{Enter}		; 带Shift的换行

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
