; AutoHotKey 1.1 Capslock Remapping Script 
; 已知BUG：Ctrl Shift F + 连用

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

;===========================; 复合修饰键，方案1，抬起触发词选行选
				; 长按视为按住Ctrl，缺点是词选反应慢

Capslock & State_Word::			; 词选
    KeyWait f
    return
Capslock & f up::
    if (A_PriorHotkey = "Capslock & f") {
        Send {Ctrl Down}{Left}{Shift Down}{Right}{Shift Up}{Ctrl Up}
    }
    return

Capslock & g::			; 行选
    KeyWait g
    return
Capslock & g up::
    if (A_PriorHotkey = "Capslock & g") {
        Send {Home}{Shift Down}{End}{Shift Up}
    }
    return

Capslock & d::			; 行选
    KeyWait d
    return
Capslock & d up::
    if (A_PriorHotkey = "Capslock & d") {
        Send {Home}{Shift Down}{End}{Shift Up}
    }
    return

;===========================; 复合修饰键，方案2，按下触发词选行选
				; 缺点是按词移动时会闪一下，而且不能词前后/行前后选，会修改光标位置，功能性差。优点是更好理解设计理念，词选响应快

;Capslock & f::			; 词选
;    Send {Ctrl Down}{Left}{Shift Down}{Right}{Shift Up}{Ctrl Up} ; 也可以将Ctrl Up移到松开F时
;    KeyWait f
;    return
;Capslock & f up::
;    return

;Capslock & g::			; 行选
;    Send {Home}{Shift Down}{End}{Shift Up}
;    KeyWait g
;    return

;Capslock & d::			; 行选
;    Send {Home}{Shift Down}{End}{Shift Up}
;    KeyWait d
;    return

;===========================; 方向区

Capslock & u::			; 上
    if (GetKeyState("G", "P") = 1 || GetKeyState("D", "P") = 1) {
        Send {Blind}{Ctrl Down}{Home}{Ctrl Up}
    }
    else
    {
        Send {Blind}{Up}
    }
    return

Capslock & k::			; 下
    if (GetKeyState("G", "P" || GetKeyState("D", "P") = 1) = 1) {
        Send {Blind}{Ctrl Down}{End}{Ctrl Up}
    }
    else
    {
        Send {Blind}{Down}
    }
    return

Capslock & j::			;左
    if (GetKeyState("F", "P") = 1) {
        Send {Blind}{Ctrl Down}{Left}{Ctrl Up}
    }
    else if (GetKeyState("G", "P") = 1 || GetKeyState("D", "P") = 1) {
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
    else if (GetKeyState("G", "P") = 1 || GetKeyState("D", "P") = 1) {
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
    else if (GetKeyState("G", "P") = 1 || GetKeyState("D", "P") = 1) {
    ;    if (A_PriorHotkey = "Capslock & g") {
    ;        Send ^c{End}{Enter}^v
    ;        …… 转用方案2要进行的修改 ; 避免全选两次，不要也行，但会更快
    ;    }
    ;    else {
    ;        Send {Home}{Shift Down}{End}{Shift Up}^c{End}{Enter}^v
    ;    }
        Send {Home}{Shift Down}{End}{Shift Up}^c{End}{Enter}^v
    }
    else {
        Send {Blind}{Enter}
    }
    return

+Space::Send {Blind}{Enter}		; 带Shift的换行

;===========================; 替换Ctrl区

Capslock & `::Send {Blind}{ctrl down}`{ctrl up}
Capslock & 1::Send {Blind}{ctrl down}1{ctrl up}
Capslock & 2::Send {Blind}{ctrl down}2{ctrl up}
Capslock & 3::Send {Blind}{ctrl down}3{ctrl up}
Capslock & 4::Send {Blind}{ctrl down}4{ctrl up}
Capslock & 5::Send {Blind}{ctrl down}5{ctrl up}
Capslock & 6::Send {Blind}{ctrl down}6{ctrl up}

Capslock & Z::Send {Blind}{ctrl down}z{ctrl up}
Capslock & X::Send {Blind}{ctrl down}x{ctrl up}
Capslock & C::Send {Blind}{ctrl down}c{ctrl up}
Capslock & V::Send {Blind}{ctrl down}v{ctrl up}
Capslock & B::Send {Blind}{ctrl down}b{ctrl up}
Capslock & Q::Send {Blind}{ctrl down}z{ctrl up}
Capslock & W::Send {Blind}{ctrl down}x{ctrl up}
Capslock & E::Send {Blind}{ctrl down}c{ctrl up}
Capslock & R::Send {Blind}{ctrl down}v{ctrl up}
Capslock & T::Send {Blind}{ctrl down}t{ctrl up}
Capslock & A::Send {Blind}{ctrl down}a{ctrl up}
Capslock & S::Send {Blind}{ctrl down}s{ctrl up}

;===========================;

Capslock & [::SendInput {Blind}{PgUp Down}
Capslock & [ up::SendInput {Blind}{PgUp Up}
Capslock & ]::SendInput {Blind}{PgDn Down}
Capslock & ] up::SendInput {Blind}{PgDn Up}
Capslock & ,::Send {End Enter}
Capslock & .::SendInput {Blind}{Delete Down}
Capslock & . up::SendInput {Blind}{Delete Up}
Capslock & /::SendInput ^+{Right} {Delete}

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
