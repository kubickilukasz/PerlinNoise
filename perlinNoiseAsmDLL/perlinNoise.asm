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

noise2  PROC
$LN3:
		xor		rax, rax
        mov     eax, DWORD PTR SEED
        add     eax, edx
		movzx	eax, al
		cdqe
        ;lea     rcx, OFFSET hash				;FLAT
        lea     rdx, hash				;FLAT
        mov     eax, DWORD PTR [rdx+rax*4]
		add		eax, ecx 
		movzx	eax, al
		cdqe			
        mov     eax, DWORD PTR [rdx+rax*4]
        ret     0
noise2  ENDP


lin_inter PROC
		subss	xmm1, xmm0
		mulss	xmm1, xmm2
		addss	xmm0, xmm1
        ret     0
lin_inter ENDP


smooth_inter PROC
		movss	xmm3, xmm0
		movss	xmm0, DWORD PTR __real@40000000 ; 2
		mulss	xmm0, xmm2	 ; 2 * s
		movss	xmm4, DWORD PTR __real@40400000 ; 3
		subss	xmm4, xmm0 ; 3 - 2 * s
		mulss	xmm2, xmm2 ; s = s * s
		mulss	xmm4, xmm2 ; s * s * ( 3 - 2 * s )
		movss	xmm2, xmm4
		movss	xmm0, xmm3
		call    lin_inter
		ret     0
smooth_inter ENDP


noise2d PROC

LOCAL xV : DWORD
LOCAL yV : DWORD

LOCAL x_int : DWORD
LOCAL y_int : DWORD

LOCAL x_frac : DWORD
LOCAL y_frac : DWORD

$LN3:
		movd		xV, xmm0;
		cvttss2si	eax, xmm0
		mov			x_int, eax

		movd		yV, xmm1;
		cvttss2si	eax, xmm1
		mov			y_int, eax

		cvtsi2ss xmm0, DWORD PTR x_int
		;cvtsi2ss xmm1, DWORD PTR y_int
        movss   xmm1, DWORD PTR xV
        subss   xmm1, xmm0
        movss   DWORD PTR x_frac, xmm1
        cvtsi2ss xmm0, DWORD PTR y_int
        movss   xmm1, DWORD PTR yV
        subss   xmm1, xmm0
        movss   DWORD PTR y_frac, xmm1
        mov     edx, DWORD PTR y_int
        mov     ecx, DWORD PTR x_int
        call    noise2
        mov     r8d, eax				;s
        mov     eax, DWORD PTR x_int
        inc     eax
        mov     edx, DWORD PTR y_int
        mov     ecx, eax
        call    noise2
        mov     r9d, eax				;t
        mov     eax, DWORD PTR y_int
        inc     eax
        mov     edx, eax
        mov     ecx, DWORD PTR x_int
        call    noise2
        mov     r10d, eax				;u
        mov     eax, DWORD PTR y_int
        inc     eax
        mov     ecx, DWORD PTR x_int
        inc     ecx
        mov     edx, eax
        call    noise2
        mov     r11d, eax				;v
		movss   xmm2, DWORD PTR x_frac
		cvtsi2ss xmm1, r9d ; t
		cvtsi2ss xmm0, r8d ; s
        call    smooth_inter
        movss   DWORD PTR xV, xmm0 ; low
		movss   xmm2, DWORD PTR x_frac
		cvtsi2ss xmm1, r11d ; v
		cvtsi2ss xmm0, r10d ; u
        call    smooth_inter
        movss   DWORD PTR yV, xmm0
        movss   xmm2, DWORD PTR y_frac
        movss   xmm1, DWORD PTR yV; high
        movss   xmm0, DWORD PTR xV; low
        call    smooth_inter
        ret     0
noise2d ENDP


perlin2d PROC

LOCAL iIndex : DWORD
LOCAL xa : DWORD
LOCAL ya : DWORD
LOCAL fin : DWORD
LOCAL amp : DWORD
LOCAL divV : DWORD
$LN6:
		mov rax, 00111111100000000000000000000000b ; 1
		mov DWORD PTR amp, eax
		mov rax, 0
		mov DWORD PTR fin, eax
		mov DWORD PTR divV, eax

        mulss   xmm0, xmm2;DWORD PTR freq$[rsp]
		movss	DWORD PTR xa, xmm0

        mulss   xmm1, xmm2
		movss	DWORD PTR ya, xmm1
        mov     DWORD PTR iIndex, 0
        jmp     SHORT $LN4@perlin2d
$LN2@perlin2d:
        inc      DWORD PTR iIndex
$LN4@perlin2d:
        mov     eax, DWORD PTR levels
        cmp     DWORD PTR iIndex, eax
        jge     $LN3@perlin2d

        call    noise2d
        mulss   xmm0, DWORD PTR amp
        movss   xmm1, DWORD PTR fin
        addss   xmm1, xmm0
        movss   DWORD PTR fin, xmm1

		movss   xmm0, DWORD PTR __real@43800000
        mulss   xmm0, DWORD PTR amp
        addss   xmm0, DWORD PTR divV
		movss   DWORD PTR divV, xmm0

        movss   xmm0, DWORD PTR amp
        mulss   xmm0, DWORD PTR persistence
        movss   DWORD PTR amp, xmm0

        movss   xmm0, DWORD PTR xa
        mulss   xmm0, DWORD PTR __real@40000000
        movss   DWORD PTR xa, xmm0

        movss   xmm1, DWORD PTR ya
        mulss   xmm1, DWORD PTR __real@40000000
        movss   DWORD PTR ya, xmm1
        jmp     $LN2@perlin2d
$LN3@perlin2d:
        movss   xmm0, DWORD PTR fin
        divss   xmm0, DWORD PTR divV
        ret     0
perlin2d ENDP


PERLIN_NOISE PROC

LOCAL dataPointer : QWORD 
LOCAL cOffset : DWORD
LOCAL widthPic : DWORD
LOCAL heightPic : DWORD
LOCAL jIndex : DWORD

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
		mov		eax, DWORD PTR [r8]
		mov		DWORD PTR cellSize, eax
		mov		eax, DWORD PTR [r8 + 4]
		mov		DWORD PTR persistence, eax
        jmp     SHORT $LN4@PERLIN_NOI
$LN2@PERLIN_NOI:
        mov     eax, DWORD PTR cOffset
        inc     eax
        mov		DWORD PTR cOffset, eax
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
		cmp		 DWORD PTR jIndex, eax
        jge     $LN2@PERLIN_NOI
		mov		rax, 00111111100000000000000000000000b ; 1
        movq	xmm2, rax
        subss   xmm2, DWORD PTR cellSize
        cvtsi2ss xmm1, DWORD PTR cOffset
        cvtsi2ss xmm0, DWORD PTR jIndex
        call    perlin2d
		mov		rax, 01000011011111110000000000000000b ; 255
		movq	xmm1, rax
        mulss		xmm0, xmm1 ; * 255
        cvttss2si eax, xmm0 ; convert to int
        mov		R8d, eax
		mov		rax, 0
        mov     eax, DWORD PTR cOffset
        imul    eax, DWORD PTR widthPic
        imul    eax, DWORD PTR bytesPerPixel
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
        ret     0
SET_SEED ENDP

END