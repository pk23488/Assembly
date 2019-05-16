assume cs:code, ds:data, ss:stack
data segment
		dw  0123H, 0456H, 0789H, 0abcH,0defH, 0fedH, 0cbaH, 0987H
data ends

stack segment
		dw  0, 0, 0, 0, 0, 0, 0, 0    ;16个字的内容
stack ends

code segment：

start:		mov ax,stack
				mov ss,ax
				mov sp,16   ;sp指向栈顶地址16
				mov ax,data
				mov ds,ax
				push ds,[0]
				push ds,[2]
				pop ds,[2]
				pop ds,[0]
				
				mov ax,4c00h
				int 21h
				
code ends
end start     ;意味着代码段从start这里开始，一直到end start结束