; AutoHotKey 1.1 Capslock Remapping Script 
; 已知BUG：Ctrl Shift F + 连用

;===========================; Mode

Mode_Word := 0	; 词模式
Mode_Line := 0	; 行模式
Mode_Select := 0	; 选择模式 beta

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

Capslock & f::			; 行选
    Mode_Line := 1
    KeyWait f
    return
Capslock & f up::
    Mode_Line := 0
    if (A_PriorHotkey = "Capslock & f" && A_PriorKey = "f") {
        Send {Home}{Shift Down}{End}{Shift Up}
    }
    return

Capslock & d::			; 词选
    Mode_Word := 1
    KeyWait d
    return
Capslock & d up::
    Mode_Word := 0
    if (A_PriorHotkey = "Capslock & d" && A_PriorKey = "d") {
        Send {Ctrl Down}{Left}{Shift Down}{Right}{Shift Up}{Ctrl Up}
    }
    return

Capslock & g::			; 词选
    Mode_Word := 1
    KeyWait g
    return
Capslock & g up::
    Mode_Word := 0
    if (A_PriorHotkey = "Capslock & g" && A_PriorKey = "g") {
        Send {Ctrl Down}{Left}{Shift Down}{Right}{Shift Up}{Ctrl Up}
    }
    return

;===========================; 方向区

Capslock & u::			; 上
    if (Mode_Word = 1) {
        Send {Blind}{Ctrl Down}{Home}{Ctrl Up}
    }
    else if (Mode_Line = 1) {
        Send {Blind}{Shift Down}{Up}{Shift Up}
    }
    else
    {
        Send {Blind}{Up}
    }
    return

Capslock & k::			; 下
    if (Mode_Word = 1) {
        Send {Blind}{Ctrl Down}{End}{Ctrl Up}
    }
    else if (Mode_Line = 1) {
        Send {Blind}{Shift Down}{Down}{Shift Up}
    }
    else
    {
        Send {Blind}{Down}
    }
    return

Capslock & j::			;左
    if (Mode_Word = 1) {
        Send {Blind}{Ctrl Down}{Left}{Ctrl Up}
    }
    else if (Mode_Line = 1) {
        Send {Blind}{Shift Down}{Left}{Shift Up}
    }
    else {
        Send {Blind}{Left}
    }
    return

Capslock & l::			; 右
    if (Mode_Word = 1) {
        Send {Blind}{Ctrl Down}{Right}{Ctrl Up}
    }
    else if (Mode_Line = 1) {
        Send {Blind}{Shift Down}{Right}{Shift Up}
    }
    else {
        Send {Blind}{Right}
    }
    return

Capslock & h::			; 最左
    if (Mode_Word = 1) {
        Send {Blind}{Shift Down}{Ctrl Down}{Left}{Ctrl Up}{Shift Up}
    }
    else if (Mode_Line = 1) {
        Send {Blind}{Shift Down}{Home}{Shift Up}
    }
    else {
        Send {Blind}{Home}
    }
    return

Capslock & `;::			; 最右
    if (Mode_Word = 1) {
        Send {Blind}{Shift Down}{Ctrl Down}{Right}{Ctrl Up}{Shift Up}
    }
    else if (Mode_Line = 1) {
        Send {Blind}{Shift Down}{End}{Shift Up}
    }
    else {
        Send {Blind}{End}
    }
    return

;===========================; 删除区

Capslock & i::			; 前删
    if (Mode_Word = 1) {
        Send {Blind}{Ctrl Down}{Backspace}{Ctrl Up}
    }
    else if (Mode_Line = 1) {
        Send +{Home}{Backspace}
    }
    else if (Mode_Select = 1) {
        Send +{Home}{Backspace}
    }
    ;else if getkeystate("shift") = 1
    ;    Send +{Home}{Backspace}
    else
        Send {Backspace}
    return

Capslock & o::			; 后删
    if (Mode_Word = 1) {
        Send {Blind}{Ctrl Down}{Delete}{Ctrl Up}
    }
    else if (Mode_Line = 1) {
        Send +{End}{Backspace}
    }
    else if (Mode_Select = 1) {
        Send +{End}{Backspace}
    }
    ;else if getkeystate("shift") = 1
    ;    Send +{End}{Delete}
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
    if (Mode_Line = 1) {
        Send {End}{Enter}
    }
    else if (Mode_Word = 1) {
        Send {Home}{Shift Down}{End}{Shift Up}^c{End}{Enter}^v
    }
    else {
        Send {Blind}{Enter}
    }
    return

+Space::Send {Blind}{Enter}		; 带Shift的换行

;===========================; 替换Ctrl区

Capslock & Z::Send {Blind}{ctrl down}z{ctrl up}
Capslock & X::Send {Blind}{ctrl down}x{ctrl up}
Capslock & C::Send {Blind}{ctrl down}c{ctrl up}
Capslock & V::Send {Blind}{ctrl down}v{ctrl up}
Capslock & B::Send {Blind}{ctrl down}b{ctrl up}

Capslock & Q::
    Mode_Select := 1
    Send {Blind}{Shift Down}
    KeyWait q
    return
Capslock & Q up::
    Mode_Select := 0
    Send {Blind}{Shift Up}
    return
Capslock & W::Send {Blind}{ctrl down}Z{ctrl up}
Capslock & E::Send {Blind}{ctrl down}X{ctrl up}
Capslock & R::Send {Blind}{ctrl down}C{ctrl up}
Capslock & T::Send {Blind}{ctrl down}V{ctrl up}

Capslock & A::Send {Blind}{ctrl down}A{ctrl up}
Capslock & S::Send {Blind}{ctrl down}S{ctrl up}

Capslock & `::Send {Blind}{ctrl down}`{ctrl up}
Capslock & 1::Send {Blind}{ctrl down}1{ctrl up}
Capslock & 2::Send {Blind}{ctrl down}2{ctrl up}
Capslock & 3::Send {Blind}{ctrl down}3{ctrl up}
Capslock & 4::Send {Blind}{ctrl down}4{ctrl up}
Capslock & 5::Send {Blind}{ctrl down}5{ctrl up}
Capslock & 6::Send {Blind}{ctrl down}6{ctrl up}

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
