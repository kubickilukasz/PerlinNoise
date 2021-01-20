.DATA

SEED QWORD ?

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

		; y x y x
		roundps	xmm2, xmm0, 001h
		cvtps2dq xmm2, xmm2
		cvtdq2ps xmm3, xmm2
		subps xmm0, xmm3

		movups xmm4, xmm2; copy int
		; -> y+1 x+1 y x
		mov rax, 1
		movq xmm5, rax
		shufps xmm5, xmm5, 00001010b ; 1 1 0 0
		paddd xmm4, xmm5
		; -> y+1+seed x+1 y+seed x
		paddd xmm4, xmm15 ; add seed 
		mov rax, 0FFFFFFFF000000FFh;
		movq xmm5, rax
		shufps xmm5, xmm5, 00010001b ; 255 x 255 x
		pand xmm4, xmm5 ; % 256


		; get hash
		pextrd	eax, xmm4, 01b
		lea     rdx, hash				;FLAT
        movd    xmm2, DWORD PTR [rdx+rax*4] ; for y
		
		pextrd	eax, xmm4, 11b
        movd    xmm7, DWORD PTR [rdx+rax*4] ; for y + 1

		shufps	xmm7, xmm2, 00000000b ; tmp(y) tmp(y) tmp(y+1) tmp(y+1)

		shufps	xmm4, xmm4, 10001000b ; x+1 x x+1 x
		paddd	xmm7, xmm4 ; tmp + x
		shufps	xmm5, xmm5,	01010101b ; 255 255 255 255
		pand	xmm7, xmm5 ; x % 256

		; t s v u

		; u
		movd	eax, xmm7 
		movd    xmm3, DWORD PTR [rdx+rax*4]

		; s
		pextrd	eax, xmm7, 10b
		movd    xmm4, DWORD PTR [rdx+rax*4]

		shufps	xmm3, xmm4, 00000000b ; s s u u 
		cvtdq2ps xmm3, xmm3

		; v
		pextrd	eax, xmm7, 01b
		movd    xmm4, DWORD PTR [rdx+rax*4]

		;t
		pextrd	eax, xmm7, 11b
		movd    xmm5, DWORD PTR [rdx+rax*4]

		shufps	xmm4, xmm5, 00000000b ; t t v v
		cvtdq2ps xmm4, xmm4

		movups	xmm5, xmm0; copy frac
		movups	xmm1, xmm0; copy frac
		movups	xmm0, xmm11 ; 2 2 2 2
		
		mulps	xmm5, xmm11; s * 2

		mov		rax, 040400000h;
		movq	xmm0, rax
		shufps	xmm0, xmm0, 00000000b ; 3 3 3 3
		subps	xmm0, xmm5; 3 - s * 2
		mulps	xmm0, xmm1; (3 - s * 2) * s
		mulps	xmm0, xmm1; (3 - s * 2) * s * s -> y_frac x_frac y_frac x_frac

		subps	xmm4, xmm3
		mulps	xmm4, xmm0
		addps	xmm3, xmm4 ; # low # high

		pextrd	eax, xmm3, 10b
		movd	xmm2, eax

		pextrd	eax, xmm0, 11b
		movd	xmm0, eax

		subss	xmm3, xmm2
		mulss	xmm3, xmm0
		addss	xmm3, xmm2
		
		movss	xmm0, xmm3
       
        ret     0
noise2d ENDP

PERLIN2D PROC

$LN6:

		mov rax, 00111111100000000000000000000000b ; 1
		movd xmm14, eax ; amp
		mov rax, 0
		movd xmm13, eax ; fin
		movd xmm12, eax ; divV

		mulss   xmm0, xmm8 ;xa
		movss	xmm10, xmm0
        
		;movss	DWORD PTR xa, xmm0

		mulss   xmm1, xmm8 ;ya
		movss	xmm11, xmm1

		shufps xmm10, xmm11, 00000000b ; y y x x
		shufps xmm10, xmm10, 11001100b ; y x y x

		movups xmm0, xmm10

		mov		rax, 040000000h
		movd	xmm11, eax
		shufps	xmm11, xmm11, 00000000b ; 2 2 2 2
        
		;mov		r8d, 3
		;movss	xmm9, xmm3 ;persistence

		mov		r9d, 0 ; iIndex
        jmp     SHORT $LN4@perlin2d
$LN2@perlin2d:
        inc      r9d
$LN4@perlin2d:

		cmp		r9d, r13d
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

$LN9:

		mov		r15, rcx

		mov		rax, 00111111100000000000000000000000b ; 1
        movq	xmm8, rax
		movd    xmm1, DWORD PTR [r8]
		subss   xmm8, xmm1 ; freq

		mov		eax, DWORD PTR [r8 + 4]
		movd	xmm9, eax; persistence


		mov		eax, DWORD PTR [rdx + 12]
		mov		r10d, eax ; cOffset

		mov		eax, DWORD PTR [rdx]
		mov		r11d, eax ; widthPic

		mov		r8d, DWORD PTR [rdx + 4]
		add		r8d, r10d ;heightPic		

		mov		eax, DWORD PTR [rdx + 8]
		mov		r12d, eax ;bytesPerPixel

		mov		eax, DWORD PTR [rdx + 16]
		mov		r13d, eax ; levels

		mov ecx, DWORD PTR SEED
		movd xmm15, rcx
		shufps xmm15, xmm15, 00100010b ; for y

        jmp     SHORT $LN4@PERLIN_NOI
$LN2@PERLIN_NOI:
        inc		r10d; cOffset
$LN4@PERLIN_NOI:

		cmp		r10d, r8d
        jge     $LN3@PERLIN_NOI
		mov		r14d, 0
        jmp     SHORT $LN7@PERLIN_NOI
$LN5@PERLIN_NOI:
		inc		r14d
$LN7@PERLIN_NOI:

		cmp			r14d, r11d
        jge     $LN2@PERLIN_NOI

        cvtsi2ss xmm1, r10d ; cOffset
        cvtsi2ss xmm0, r14d ;DWORD PTR jIndex
        call    PERLIN2D
		mov		rax, 01000011011111110000000000000000b ; 255
		movq	xmm1, rax
        mulss		xmm0, xmm1 ; * 255
        cvttss2si rbx, xmm0 ; convert to int
        mov     eax, r10d;DWORD PTR cOffset

        imul    eax, r11d;DWORD PTR widthPic
        imul    eax, r12d;DWORD PTR bytesPerPixel
        mov     ecx, r14d ; jIndex
        imul    ecx, r12d ; bytesPerPixel
        add     eax, ecx
        mov     BYTE PTR [r15 + rax], bl
        mov     BYTE PTR [r15 + rax + 1], bl
        mov     BYTE PTR [r15 + rax + 2], bl
        jmp     $LN5@PERLIN_NOI
$LN3@PERLIN_NOI:
        xor     eax, eax
        ret     0
PERLIN_NOISE ENDP

SET_SEED PROC
        mov     DWORD PTR SEED, ecx
        ret     0
SET_SEED ENDP

END