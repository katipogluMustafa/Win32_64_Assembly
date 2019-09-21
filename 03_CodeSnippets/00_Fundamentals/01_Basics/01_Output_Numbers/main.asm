.486
.model flat, stdcall
option casemap :none		; case sensitive
	
    include \masm32\include\windows.inc     ; always first
    include \masm32\macros\macros.asm       ; MASM support macros
	
    include \masm32\include\masm32.inc
    include \masm32\include\gdi32.inc
    include \masm32\include\user32.inc
    include \masm32\include\kernel32.inc
	include \masm32\include\msvcrt.inc
	
    includelib \masm32\lib\masm32.lib
    includelib \masm32\lib\gdi32.lib
    includelib \masm32\lib\user32.lib
    includelib \masm32\lib\kernel32.lib
	includelib \masm32\lib\msvcrt.lib
.code

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
start:						; entry point
	call main				
	exit
; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««

main proc
	LOCAL var1:DWORD
	LOCAL str1:DWORD
	
	mov eax, 100
	mov ecx, 250
	add eax, ecx
	
	print str$(eax)
	print chr$(13,10,13,10)
	
	mov var1, sval(input("Enter a number: "))
	
	cmp var1, 100
	je equal
	jg bigger
	jl smaller

	equal:
	  print chr$("The number you entered is 100", 13, 10)
		jmp over
	
	bigger:
	  print chr$("The number you entered is greater than 100",13, 10)
	  jmp over
	  
	smaller:
	  print chr$("The number you entered is less than 100", 13, 10)
	
	over:
	  ret

main endp

; «««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««««
end start					; tell the entry point
