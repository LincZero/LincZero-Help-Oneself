; AutoHotKey 1.1 Capslock Remapping Script 

; RCL 第二行
' & q::Send {!}
' & w::Send {?}
' & e::Send, =
' & r::Send, _
' & t::Send, {+}
' & g::Send, -
' & tab::Send,　　
; 这里输出两个全角空格
' & CapsLock::Send,{Space}{Space}{Space}{Space}
; 这里输出4个半角空格
;' & f::Send, 重复上屏

' & s::Send,  ……
' & d::Send, 、

' & v::Send, ——
;' & b::Send, 常用

; 右手类
' & j::Send, (
' & u::Send, {U+003a}{U+0020}
; 半角空格加空格
' & k::Send, {'{}
' & i::Send, {'}}
' & h::Send, [
' & y::Send, ]
' & l::Send, <
' & o::Send, >


; ' & h::Send '
+':: Send "
'::Send '

return