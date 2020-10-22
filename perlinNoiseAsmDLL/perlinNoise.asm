
.DATA
    DLL_PROCESS_ATTACH		equ     1
	DLL_PROCESS_DETACH		equ     0
	DLL_THREAD_ATTACH		equ     2
	DLL_THREAD_DETACH		equ     3
	MULTIPLER				DD		2

.CODE
TEST_FUNC PROC
	;ADD    ECX, DWORD PTR [RSP+28H] ; add overflow parameter to first parameter
	;ADD    ECX, R9D                 ; add other three register parameters
	;ADD    ECX, R8D                 ;
	;ADD    ECX, EDX                 ;
	;MOVD   XMM0, ECX                ; move doubleword ECX into XMM0
	;CVTDQ2PD  XMM0, XMM0            ; convert doubleword to floating point
	;MOVSD  XMM1, realVal            ; load 1.5
	;ADDSD  XMM1, MMWORD PTR [RSP+30H]  ; add parameter
	;DIVSD  XMM0, XMM1               ; do division, answer in xmm0
	;RET                             ; return
	MOV RAX, RCX
	MUL MULTIPLER
	RET
TEST_FUNC ENDP
	
end