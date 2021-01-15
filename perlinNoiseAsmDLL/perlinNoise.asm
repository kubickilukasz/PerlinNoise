.DATA

SEED QWORD ?

bytesPerPixel  DWORD ?
levels  DWORD ?
cellSize  DWORD ?
persistence  DWORD ?


__real@43800000 DD 043800000r             ; 256
__real@437f0000 DD 0437f0000r             ; 255
__real@40400000 DD 040400000r             ; 3
__real@40000000 DD 040000000r             ; 2
__real@3f800000 DD 03f800000r             ; 1

hash    DD      0d0H
        DD      022H
        DD      0e7H
        DD      0d5H
        DD      020H
        DD      0f8H
        DD      0e9H
        DD      038H
        DD      0a1H
        DD      04eH
        DD      018H
        DD      08cH
        DD      047H
        DD      030H
        DD      08cH
        DD      0feH
        DD      0f5H
        DD      0ffH
        DD      0f7H
        DD      0f7H
        DD      028H
        DD      0b9H
        DD      0f8H
        DD      0fbH
        DD      0f5H
        DD      01cH
        DD      07cH
        DD      0ccH
        DD      0ccH
        DD      04cH
        DD      024H
        DD      01H
        DD      06bH
        DD      01cH
        DD      0eaH
        DD      0a3H
        DD      0caH
        DD      0e0H
        DD      0f5H
        DD      080H
        DD      0a7H
        DD      0ccH
        DD      09H
        DD      05cH
        DD      0d9H
        DD      036H
        DD      0efH
        DD      0aeH
        DD      0adH
        DD      066H
        DD      0c1H
        DD      0bdH
        DD      0beH
        DD      079H
        DD      064H
        DD      06cH
        DD      0a7H
        DD      02cH
        DD      02bH
        DD      04dH
        DD      0b4H
        DD      0ccH
        DD      08H
        DD      051H
        DD      046H
        DD      0dfH
        DD      0bH
        DD      026H
        DD      018H
        DD      0feH
        DD      0d2H
        DD      0d2H
        DD      0b1H
        DD      020H
        DD      051H
        DD      0c3H
        DD      0f3H
        DD      07dH
        DD      08H
        DD      0a9H
        DD      070H
        DD      020H
        DD      061H
        DD      035H
        DD      0c3H
        DD      0dH
        DD      0cbH
        DD      09H
        DD      02fH
        DD      068H
        DD      07dH
        DD      075H
        DD      072H
        DD      07cH
        DD      0a5H
        DD      0cbH
        DD      0b5H
        DD      0ebH
        DD      0c1H
        DD      0ceH
        DD      046H
        DD      0b4H
        DD      0aeH
        DD      00H
        DD      0a7H
        DD      0b5H
        DD      029H
        DD      0a4H
        DD      01eH
        DD      074H
        DD      07fH
        DD      0c6H
        DD      0f5H
        DD      092H
        DD      057H
        DD      0e0H
        DD      095H
        DD      0ceH
        DD      039H
        DD      04H
        DD      0c0H
        DD      0d2H
        DD      041H
        DD      0d2H
        DD      081H
        DD      0f0H
        DD      0b2H
        DD      069H
        DD      0e4H
        DD      06cH
        DD      0f5H
        DD      094H
        DD      08cH
        DD      028H
        DD      023H
        DD      0c3H
        DD      026H
        DD      03aH
        DD      041H
        DD      0cfH
        DD      0d7H
        DD      0fdH
        DD      041H
        DD      055H
        DD      0d0H
        DD      04cH
        DD      03eH
        DD      03H
        DD      0edH
        DD      037H
        DD      059H
        DD      0e8H
        DD      032H
        DD      0d9H
        DD      040H
        DD      0f4H
        DD      09dH
        DD      0c7H
        DD      079H
        DD      0fcH
        DD      05aH
        DD      011H
        DD      0d4H
        DD      0cbH
        DD      095H
        DD      098H
        DD      08cH
        DD      0bbH
        DD      0eaH
        DD      0b1H
        DD      049H
        DD      0aeH
        DD      0c1H
        DD      064H
        DD      0c0H
        DD      08fH
        DD      061H
        DD      035H
        DD      091H
        DD      087H
        DD      013H
        DD      067H
        DD      0dH
        DD      05aH
        DD      087H
        DD      097H
        DD      0c7H
        DD      05bH
        DD      0efH
        DD      0f7H
        DD      021H
        DD      027H
        DD      091H
        DD      065H
        DD      078H
        DD      063H
        DD      03H
        DD      0baH
        DD      056H
        DD      063H
        DD      029H
        DD      0edH
        DD      0cbH
        DD      06fH
        DD      04fH
        DD      0dcH
        DD      087H
        DD      09eH
        DD      02aH
        DD      01eH
        DD      09aH
        DD      078H
        DD      043H
        DD      057H
        DD      0a7H
        DD      087H
        DD      0b0H
        DD      0b7H
        DD      0bfH
        DD      0fdH
        DD      073H
        DD      0b8H
        DD      015H
        DD      0e9H
        DD      03aH
        DD      081H
        DD      0e9H
        DD      08eH
        DD      027H
        DD      080H
        DD      0d3H
        DD      076H
        DD      089H
        DD      08bH
        DD      0ffH
        DD      072H
        DD      014H
        DD      0daH
        DD      071H
        DD      09aH
        DD      01bH
        DD      07fH
        DD      0f6H
        DD      0faH
        DD      01H
        DD      08H
        DD      0c6H
        DD      0faH
        DD      0d1H
        DD      05cH
        DD      0deH
        DD      0adH
        DD      015H
        DD      058H
        DD      066H
        DD      0dbH
_DATA   ENDS

.CODE

noise2d PROC
$LN3:		

		movups xmm1, xmm0; copy y x y x
		;roundps	xmm2, xmm0, 001h
		cvtps2dq xmm2, xmm0
		;movq QWORD PTR xy_int, mm1
		cvtdq2ps xmm3, xmm2
		;roundpd xmm3, xmm3, 1
		subps xmm1, xmm3
		;movlps QWORD PTR xy_frac, xmm1

		movups xmm4, xmm2; copy int
		; -> y+1 x+1 y x
		mov r14, 1
		movq xmm5, r14
		shufps xmm5, xmm5, 00001010b ; 1 1 0 0
		paddd xmm4, xmm5
		; -> y+1+seed x+1 y+seed x
		paddd xmm4, xmm15 ; add seed 
		mov r14, 0FFFFFFFF000000FFh;
		movq xmm5, r14
		shufps xmm5, xmm5, 00010001b ; 255 x 255 x
		pand xmm4, xmm5 ; % 256


		; get hash
		movups	xmm6, xmm4; copy
		shufps	xmm6, xmm6, 10110001b; x+1 y+1 x y
		movd	eax, xmm6 
		lea     rdx, hash				;FLAT
        movd    xmm8, DWORD PTR [rdx+rax*4] ; for y
		
		shufps	xmm6, xmm6, 01001110b; x y x+1 y+1
		movd	eax, xmm6 				
        movd    xmm7, DWORD PTR [rdx+rax*4] ; for y + 1

		shufps	xmm7, xmm8, 00000000b ; tmp(y) tmp(y) tmp(y+1) tmp(y+1)
		;vpunpcklqdq xmm7, xmm7, xmm8

		shufps	xmm4, xmm4, 10000100b ; x+1 x x+1 x
		paddd	xmm7, xmm4 ; tmp + x
		shufps	xmm5, xmm5,	01010101b ; 255 255 255 255
		pand	xmm7, xmm5 ; x % 256

		; t s v u

		movd	eax, xmm7 ; u
		movd    xmm3, DWORD PTR [rdx+rax*4]

		shufps	xmm7, xmm7, 11000110b ; t u v s
		movd	eax, xmm7 ; s
		movd    xmm4, DWORD PTR [rdx+rax*4]

		shufps	xmm3, xmm4, 00000000b ; s s u u 
		cvtdq2ps xmm3, xmm3

		shufps	xmm7, xmm7, 11100001b ; t u s v
		movd	eax, xmm7 ; v
		movd    xmm4, DWORD PTR [rdx+rax*4]

		shufps	xmm7, xmm7, 00100111b ; v u s t
		movd	eax, xmm7 ; t
		movd    xmm5, DWORD PTR [rdx+rax*4]

		shufps	xmm4, xmm5, 00000000b ; t t v v
		cvtdq2ps xmm4, xmm4

		movups	xmm5, xmm1; copy frac
		movups	xmm0, xmm11
		
		mulps	xmm5, xmm0; s * 2

		mov		r14, 040400000h;
		movq	xmm0, r14
		shufps	xmm0, xmm0, 00000000b ; 3 3 3 3
		subps	xmm0, xmm5; 3 - s * 2
		mulps	xmm0, xmm1; (3 - s * 2) * s
		mulps	xmm0, xmm1; (3 - s * 2) * s * s -> y_frac x_frac y_frac x_frac

		subps	xmm4, xmm3
		mulps	xmm4, xmm0
		addps	xmm3, xmm4 ; # low # high

		shufps	xmm3, xmm3, 00001010b ; high high low low
		movups	xmm2, xmm3	
		shufps	xmm2, xmm2, 00001010b ; low low high high

		subps	xmm3, xmm2
		mulps	xmm3, xmm0
		addps	xmm3, xmm2 

		shufps	xmm3, xmm3, 00000011b ; # # # result
		movss	xmm0, xmm3
       
        ret     0
noise2d ENDP

PERLIN2D PROC

LOCAL iIndex : DWORD
LOCAL xa : DWORD
LOCAL ya : DWORD
LOCAL fin : DWORD
LOCAL amp : DWORD
LOCAL divV : DWORD
$LN6:

		mov ecx, DWORD PTR SEED
		movd xmm15, rcx
		shufps xmm15, xmm15, 00100010b ; for y

		mov rax, 00111111100000000000000000000000b ; 1
		movd xmm14, eax ; amp
		mov rax, 0
		movd xmm13, eax ; fin
		movd xmm12, eax ; divV

		mulss   xmm0, xmm2 ;xa
		movss	xmm10, xmm0
        
		;movss	DWORD PTR xa, xmm0

		mulss   xmm1, xmm2 ;ya
		movss	xmm11, xmm1

		shufps xmm10, xmm11, 00000000b ; y y x x
		shufps xmm10, xmm10, 11001100b ; y x y x

		movups xmm0, xmm10

		mov		rax, 040000000h
		movd	xmm11, eax
		shufps	xmm11, xmm11, 00000000b ; 2 2 2 2
        
		mov		r8d, 3
		movss	xmm9, xmm3 ;persistence

		mov		r9d, 0 ; iIndex
        jmp     SHORT $LN4@perlin2d
$LN2@perlin2d:
        inc      r9d
$LN4@perlin2d:

		cmp		r9d, r8d
        jge     $LN3@perlin2d

        call    noise2d
        mulss   xmm0, xmm14 ; amp
		addss	xmm13, xmm0; fin

		mov		rax, 043800000h
		movd	xmm0, eax
		mulss   xmm0, xmm14
		addss	xmm12, xmm0; div

		mulss	xmm14, xmm9; amp * persistence

		mulps	xmm10, xmm11
		movups  xmm0, xmm10

        jmp     $LN2@perlin2d
$LN3@perlin2d:
        movss   xmm0, xmm13
        divss   xmm0, xmm12
        ret     0
perlin2d ENDP


PERLIN_NOISE PROC

LOCAL dataPointer : QWORD 
LOCAL cOffset : DWORD
LOCAL widthPic : DWORD
LOCAL heightPic : DWORD
LOCAL jIndex : DWORD
LOCAL widthPixel : DWORD
LOCAL heightPixel : DWORD

$LN9:

		mov		r15, rcx
		mov		eax, DWORD PTR [rdx + 12]
		mov		DWORD PTR cOffset, eax
		mov		eax, DWORD PTR [rdx]
		mov		DWORD PTR widthPic, eax 
		mov		eax, DWORD PTR [rdx + 4]
		add		eax, DWORD PTR cOffset
		mov		DWORD PTR heightPic, eax 
		mov		eax, DWORD PTR [rdx + 8]
		mov		DWORD PTR bytesPerPixel, eax
		mov		eax, DWORD PTR [rdx + 16]
		mov		DWORD PTR levels, eax
		
		;mov		DWORD PTR cellSize, ecx

		mov		rax, 00111111100000000000000000000000b ; 1
        movq	xmm2, rax
		movd    xmm1, DWORD PTR [r8]
		
		subss   xmm2, xmm1
		movd	DWORD PTR cellSize, xmm2


		mov		eax, DWORD PTR [r8 + 4]
		mov		DWORD PTR persistence, eax
		mov		eax, 0
		mov		DWORD PTR widthPixel, eax
		mov		DWORD PTR heightPixel, eax
        jmp     SHORT $LN4@PERLIN_NOI
$LN2@PERLIN_NOI:
        mov     eax, DWORD PTR cOffset
        inc     eax
        mov		DWORD PTR cOffset, eax
		imul    eax, DWORD PTR widthPic
        imul    eax, DWORD PTR bytesPerPixel
		mov		DWORD PTR widthPixel, eax
$LN4@PERLIN_NOI:
		mov		eax,  DWORD PTR heightPic
		cmp		DWORD PTR cOffset, eax
        jge     $LN3@PERLIN_NOI
        mov     DWORD PTR jIndex, 0
        jmp     SHORT $LN7@PERLIN_NOI
$LN5@PERLIN_NOI:
		inc DWORD PTR jIndex
$LN7@PERLIN_NOI:
		mov		eax,  DWORD PTR widthPic
		cmp		DWORD PTR jIndex, eax
        jge     $LN2@PERLIN_NOI
		movd xmm2, DWORD PTR cellSize
        cvtsi2ss xmm1, DWORD PTR cOffset
        cvtsi2ss xmm0, DWORD PTR jIndex
        call    PERLIN2D
		mov		rax, 01000011011111110000000000000000b ; 255
		movq	xmm1, rax
        mulss		xmm0, xmm1 ; * 255
        cvttss2si eax, xmm0 ; convert to int
        mov		R8d, eax
        ;mov     eax, DWORD PTR cOffset
		mov     eax, DWORD PTR widthPixel
        ;imul    eax, DWORD PTR widthPic
        ;imul    eax, DWORD PTR bytesPerPixel
        mov     ecx, DWORD PTR jIndex
        imul    ecx, DWORD PTR bytesPerPixel
        add     eax, ecx
        mov     BYTE PTR [r15 + rax], R8b
        mov     BYTE PTR [r15 + rax + 1], R8b
        mov     BYTE PTR [r15 + rax + 2], R8b
        jmp     $LN5@PERLIN_NOI
$LN3@PERLIN_NOI:
        xor     eax, eax
        ret     0
PERLIN_NOISE ENDP

SET_SEED PROC
        mov     DWORD PTR SEED, ecx
		;movd	xmm15, ecx
		;shufps	xmm15, xmm15, 00100010b ; seed 0 seed 0
        ret     0
SET_SEED ENDP

END