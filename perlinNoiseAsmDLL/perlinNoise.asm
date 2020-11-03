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

tmp$ = 0
x$ = 32
y$ = 40
noise2  PROC
$LN3:
        mov     DWORD PTR [rsp+16], edx
        mov     DWORD PTR [rsp+8], ecx
        sub     rsp, 24
        mov     eax, DWORD PTR SEED
        mov     ecx, DWORD PTR y$[rsp]
        add     ecx, eax
        mov     eax, ecx
        cdq
        and     edx, 255                      ; 000000ffH
        add     eax, edx
        and     eax, 255                      ; 000000ffH
        sub     eax, edx
        cdqe
        lea     rcx, OFFSET hash				;FLAT
        mov     eax, DWORD PTR [rcx+rax*4]
        mov     DWORD PTR tmp$[rsp], eax
        mov     eax, DWORD PTR x$[rsp]
        mov     ecx, DWORD PTR tmp$[rsp]
        add     ecx, eax
        mov     eax, ecx
        cdq
        and     edx, 255                      ; 000000ffH
        add     eax, edx
        and     eax, 255                      ; 000000ffH
        sub     eax, edx
        cdqe
        lea     rcx, OFFSET hash				;FLAT
        mov     eax, DWORD PTR [rcx+rax*4]
        add     rsp, 24
        ret     0
noise2  ENDP

x$ = 8
y$ = 16
s$ = 24
lin_inter PROC
        movss   DWORD PTR [rsp+24], xmm2
        movss   DWORD PTR [rsp+16], xmm1
        movss   DWORD PTR [rsp+8], xmm0
        movss   xmm0, DWORD PTR y$[rsp]
        subss   xmm0, DWORD PTR x$[rsp]
        movss   xmm1, DWORD PTR s$[rsp]
        mulss   xmm1, xmm0
        movaps  xmm0, xmm1
        movss   xmm1, DWORD PTR x$[rsp]
        addss   xmm1, xmm0
        movaps  xmm0, xmm1
        ret     0
lin_inter ENDP

x$ = 48
y$ = 56
s$ = 64
smooth_inter PROC
        ;movss   DWORD PTR [rsp+24], xmm2
        ;movss   DWORD PTR [rsp+16], xmm1
        ;movss   DWORD PTR [rsp+8], xmm0
        ;sub     rsp, 40                             ; 00000028H

		;movss	xmm4, DWORD PTR __real@40000000 ; 2
		;mulss	xmm4, xmm2	 ; 2 * s
		;movss	xmm5, DWORD PTR __real@40400000 ; 3
		;subss	xmm5, xmm4 ; 3 - 2 * s
		;mulss	xmm2, xmm2 ; s = s * s
		;mulss	xmm2, xmm5 ; s * s * ( 3 - 2 * s )
		;call    lin_inter
		;ret     0

        ;movss   xmm4, DWORD PTR xmm0
        ;mulss   xmm4, DWORD PTR xmm0
        ;movss   xmm1, DWORD PTR __real@40000000
        ;mulss   xmm1, DWORD PTR s$[rsp]
        ;movss   xmm2, DWORD PTR __real@40400000
        ;subss   xmm2, xmm1
        ;movaps  xmm1, xmm2
        ;mulss   xmm0, xmm1
        ;movaps  xmm2, xmm0
        ;movss   xmm1, DWORD PTR y$[rsp]
        ;movss   xmm0, DWORD PTR x$[rsp]
        ;add     rsp, 40                             ; 00000028H
$LN3:
        movss   DWORD PTR [rsp+24], xmm2
        movss   DWORD PTR [rsp+16], xmm1
        movss   DWORD PTR [rsp+8], xmm0
        sub     rsp, 40                             ; 00000028H
        movss   xmm0, DWORD PTR s$[rsp]
        mulss   xmm0, DWORD PTR s$[rsp]
        movss   xmm1, DWORD PTR __real@40000000
        mulss   xmm1, DWORD PTR s$[rsp]
        movss   xmm2, DWORD PTR __real@40400000
        subss   xmm2, xmm1
        movaps  xmm1, xmm2
        mulss   xmm0, xmm1
        movaps  xmm2, xmm0
        movss   xmm1, DWORD PTR y$[rsp]
        movss   xmm0, DWORD PTR x$[rsp]
        call    lin_inter
        add     rsp, 40                             ; 00000028H
        ret     0
smooth_inter ENDP

y_int$ = 32
x_int$ = 36
x_frac$ = 40
t$ = 44
s$ = 48
tv90 = 52
v$ = 56
u$ = 60
tv128 = 64
y_frac$ = 68
high$ = 72
low$ = 76
x$ = 96
y$ = 104
noise2d PROC

LOCAL xV : DWORD
LOCAL yV : DWORD

LOCAL x_int : DWORD
LOCAL y_int : DWORD

LOCAL x_frac : DWORD
LOCAL y_frac : DWORD


$LN3:
       ; movss   DWORD PTR [rsp+16], xmm1
       ; movss   DWORD PTR [rsp+8], xmm0
       ; sub     rsp, 88                             ; 00000058H
		movd		xV, xmm0;
		cvttss2si	eax, xmm0
		mov			x_int, eax

		movd		yV, xmm1;
		cvttss2si	eax, xmm1
		mov			y_int, eax

		cvtsi2ss xmm0, DWORD PTR x_int
		cvtsi2ss xmm1, DWORD PTR y_int
       ; cvttss2si eax, DWORD PTR x$[rsp]
       ; mov     DWORD PTR x_int$[rsp], eax
       ; cvttss2si eax, DWORD PTR y$[rsp]
       ; mov     DWORD PTR y_int$[rsp], eax
        cvtsi2ss xmm0, DWORD PTR x_int
        movss   xmm1, DWORD PTR xV
        subss   xmm1, xmm0
        ;movaps  xmm0, xmm1
        movss   DWORD PTR x_frac, xmm1
        cvtsi2ss xmm0, DWORD PTR y_int
        movss   xmm1, DWORD PTR yV
        subss   xmm1, xmm0
        ;movaps  xmm0, xmm1
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
        cvtsi2ss xmm0, r9d
        cvtsi2ss xmm1, r8d
        movss   DWORD PTR xV, xmm1
        movss   xmm2, DWORD PTR x_frac
        movaps  xmm1, xmm0
        movss   xmm0, DWORD PTR xV
        call    smooth_inter
        movss   DWORD PTR xV, xmm0
        cvtsi2ss xmm0, r11d
        cvtsi2ss xmm1, r10d
        movss   DWORD PTR yV, xmm1
        movss   xmm2, DWORD PTR x_frac
        movaps  xmm1, xmm0
        movss   xmm0, DWORD PTR yV
        call    smooth_inter
        movss   DWORD PTR yV, xmm0
        movss   xmm2, DWORD PTR y_frac
        movss   xmm1, DWORD PTR xV; high
        movss   xmm0, DWORD PTR yV; low
        call    smooth_inter
       ; add     rsp, 88                             ; 00000058H
        ret     0
noise2d ENDP

amp$ = 32
i$ = 36
xa$ = 40
ya$ = 44
fin$ = 48
div$ = 52
x$ = 80
y$ = 88
freq$ = 96
depth$ = 104
persistence$ = 112
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
       ; mov     DWORD PTR [rsp+32], r9d
        ;movss   DWORD PTR [rsp+24], xmm2
        ;movss   DWORD PTR [rsp+16], xmm1
        ;movss   DWORD PTR [rsp+8], xmm0
        ;sub     rsp, 72                             ; 00000048H
       ; movss   xmm0, DWORD PTR x$[rsp]
        mulss   xmm0, xmm2;DWORD PTR freq$[rsp]
		movss	DWORD PTR xa, xmm0
        ;movss   DWORD PTR xa$[rsp], xmm0
        ;movss   xmm0, DWORD PTR y$[rsp]
        mulss   xmm1, xmm2;DWORD PTR freq$[rsp]
		movss	DWORD PTR ya, xmm1
       ; movss   DWORD PTR ya$[rsp], xmm0
       ; movss   xmm0, DWORD PTR __real@3f800000
       ; movss   DWORD PTR amp$[rsp], xmm0
       ; xorps   xmm0, xmm0
       ; movss   DWORD PTR fin$[rsp], xmm0
       ; xorps   xmm0, xmm0
       ; movss   DWORD PTR div$[rsp], xmm0
        mov     DWORD PTR iIndex, 0
        jmp     SHORT $LN4@perlin2d
$LN2@perlin2d:
       ; mov     eax, DWORD PTR iIndex
        inc      DWORD PTR iIndex ;eax
       ; mov     DWORD PTR i$[rsp], eax
$LN4@perlin2d:
        mov     eax, DWORD PTR levels
        cmp     DWORD PTR iIndex, eax
        jge     $LN3@perlin2d
       ; movss   xmm0, DWORD PTR __real@43800000
       ; mulss   xmm0, DWORD PTR amp$[rsp]
       ; movss   xmm1, DWORD PTR div$[rsp]
       ; addss   xmm1, xmm0
      ;  movaps  xmm0, xmm1
       ; movss   DWORD PTR div$[rsp], xmm0
      ;  movss   xmm1, DWORD PTR ya
      ;  movss   xmm0, DWORD PTR xa
        call    noise2d
        mulss   xmm0, DWORD PTR amp;$[rsp]
        movss   xmm1, DWORD PTR fin;$[rsp]
        addss   xmm1, xmm0
        ;movaps  xmm0, xmm1
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
        ;add     rsp, 72                             ; 00000048H
        ret     0
perlin2d ENDP

value$1 = 48
i$2 = 52
j$3 = 56
bytesPerPixel$ = 60
width$ = 64
offset$ = 68
height$ = 72
cellSize$ = 76
persistence$ = 80
levels$ = 84
tv90 = 88
data$ = 112
param$ = 120
fParam$ = 128
PERLIN_NOISE PROC

LOCAL dataPointer : QWORD 
LOCAL cOffset : DWORD
LOCAL widthPic : DWORD
LOCAL heightPic : DWORD
LOCAL jIndex : DWORD

$LN9:
      ;  mov     QWORD PTR [rsp+24], r8
      ;  mov     QWORD PTR [rsp+16], rdx
      ;  mov     QWORD PTR [rsp+8], rcx
      ;  sub     rsp, 104                      ; 00000068H
      ;  mov     eax, 4
      ;  imul    rax, rax, 3
     ;   mov     rcx, QWORD PTR [rsp + 16] ;param$[rsp]
     ;   mov     eax, DWORD PTR [rcx+rax]
      ;  mov     DWORD PTR offset$[rsp], eax
		;mov		rax, QWORD PTR [rsp + rdx]
		;mov		QWORD PTR dataPointer, rcx
		mov		r15, rcx
		mov		eax, DWORD PTR [rdx + 12]
		mov		DWORD PTR cOffset, eax
       ; mov     eax, 4
       ; imul    rax, rax, 0
       ; mov     rcx, QWORD PTR param$[rsp]
       ; mov     eax, DWORD PTR [rcx+rax]
       ; mov     DWORD PTR width$[rsp], eax
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
        ;mov     eax, 4
        ;imul    rax, rax, 1
        ;mov     rcx, QWORD PTR param$[rsp]
        ;mov     eax, DWORD PTR [rcx+rax]
        ;add     eax, DWORD PTR offset$[rsp]
        ;mov     DWORD PTR height$[rsp], eax
        ;mov     eax, 4
        ;imul    rax, rax, 2
        ;mov     rcx, QWORD PTR param$[rsp]
        ;mov     eax, DWORD PTR [rcx+rax]
        ;mov     DWORD PTR bytesPerPixel$[rsp], eax
        ;mov     eax, 4
        ;imul    rax, rax, 4
        ;mov     rcx, QWORD PTR param$[rsp]
        ;mov     eax, DWORD PTR [rcx+rax]
        ;mov     DWORD PTR levels$[rsp], eax
        ;mov     eax, 4
        ;imul    rax, rax, 0
        ;mov     rcx, QWORD PTR fParam$[rsp]
        ;movss   xmm0, DWORD PTR [rcx+rax]
        ;movss   DWORD PTR cellSize$[rsp], xmm0
        ;mov     eax, 4
        ;imul    rax, rax, 1
        ;mov     rcx, QWORD PTR fParam$[rsp]
        ;movss   xmm0, DWORD PTR [rcx+rax]
        ;movss   DWORD PTR persistence$[rsp], xmm0
		;mov     eax, DWORD PTR offset$[rsp]
        ;mov     DWORD PTR i$2[rsp], eax
        jmp     SHORT $LN4@PERLIN_NOI
$LN2@PERLIN_NOI:
        mov     eax, DWORD PTR cOffset
        inc     eax
        mov		DWORD PTR cOffset, eax
$LN4@PERLIN_NOI:
        ;mov     eax, DWORD PTR height$[rsp]
        ;cmp     DWORD PTR i$2[rsp], eax
		mov		eax,  DWORD PTR heightPic
		cmp		DWORD PTR cOffset, eax
        jge     $LN3@PERLIN_NOI
        mov     DWORD PTR jIndex, 0
        jmp     SHORT $LN7@PERLIN_NOI
$LN5@PERLIN_NOI:
        ;mov     eax, j
        ;inc     eax
        ;mov     j, eax
		inc DWORD PTR jIndex
$LN7@PERLIN_NOI:
        ;mov     eax, DWORD PTR width$[rsp]
        ;cmp     DWORD PTR j$3[rsp], eax
		mov		eax,  DWORD PTR widthPic
		cmp		 DWORD PTR jIndex, eax
        jge     $LN2@PERLIN_NOI
		mov		rax, 00111111100000000000000000000000b ; 1
        movq	xmm2, rax
        subss   xmm2, DWORD PTR cellSize
        cvtsi2ss xmm1, DWORD PTR jIndex
        cvtsi2ss xmm0, cOffset
      ;  movss   DWORD PTR tv90[rsp], xmm2
       ; movss   xmm3, DWORD PTR persistence
       ; movss   DWORD PTR [rsp+32], xmm3
       ; mov     r9d, DWORD PTR levels
       ; movaps  xmm2, xmm0
       ; movss   xmm0, DWORD PTR tv90[rsp]
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
		;lea		eax, DWORD PTR [rax+rcx]
        ;cdqe
       ; mov     rcx, QWORD PTR dataPointer;data$[rsp]
		;mov		rcx, r15
        ;mov		edx, R8d
        mov     BYTE PTR [r15 + rax], R8b
        mov     BYTE PTR [r15 + rax + 1], R8b
        mov     BYTE PTR [r15 + rax + 2], R8b
       ; mov     BYTE PTR [rcx+rax + 1], R8b
       ; mov     BYTE PTR [rcx+rax + 2], R8b
      ;  mov     eax, DWORD PTR i$2[rsp]
      ;  imul    eax, DWORD PTR width$[rsp]
      ;  imul    eax, DWORD PTR bytesPerPixel$[rsp]
      ;  mov     ecx, DWORD PTR j$3[rsp]
      ;  imul    ecx, DWORD PTR bytesPerPixel$[rsp]
      ;  lea     eax, DWORD PTR [rax+rcx+1]
      ;  cdqe
      ;  mov     rcx, QWORD PTR data$[rsp]
      ;  movzx   edx, BYTE PTR value$1[rsp]
      ;  mov     BYTE PTR [rcx+rax], dl
       ; mov     eax, DWORD PTR i$2[rsp]
       ; imul    eax, DWORD PTR width$[rsp]
       ; imul    eax, DWORD PTR bytesPerPixel$[rsp]
       ; mov     ecx, DWORD PTR j$3[rsp]
       ; imul    ecx, DWORD PTR bytesPerPixel$[rsp]
       ; lea     eax, DWORD PTR [rax+rcx+2]
       ; cdqe
       ; mov     rcx, QWORD PTR data$[rsp]
       ; movzx   edx, BYTE PTR value$1[rsp]
       ; mov     BYTE PTR [rcx+rax], dl
        jmp     $LN5@PERLIN_NOI
;$LN6@PERLIN_NOI:
;        jmp     $LN2@PERLIN_NOI
$LN3@PERLIN_NOI:
        xor     eax, eax
       ; add     rsp, 104                      ; 00000068H
        ret     0
PERLIN_NOISE ENDP

SET_SEED PROC
        mov     DWORD PTR SEED, ecx
        ret     0
SET_SEED ENDP

END