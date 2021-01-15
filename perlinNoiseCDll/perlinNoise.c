// MathLibrary.cpp : Defines the exported functions for the DLL.
//#include "pch.h" // use stdafx.h in Visual Studio 2017 and earlier
/*#include <utility>
#include <limits.h>*/
#include "perlinNoise.h"


static int SEED = 0;

static int hash[] = { 208,34,231,213,32,248,233,56,161,78,24,140,71,48,140,254,245,255,247,247,40,
					 185,248,251,245,28,124,204,204,76,36,1,107,28,234,163,202,224,245,128,167,204,
					 9,92,217,54,239,174,173,102,193,189,190,121,100,108,167,44,43,77,180,204,8,81,
					 70,223,11,38,24,254,210,210,177,32,81,195,243,125,8,169,112,32,97,53,195,13,
					 203,9,47,104,125,117,114,124,165,203,181,235,193,206,70,180,174,0,167,181,41,
					 164,30,116,127,198,245,146,87,224,149,206,57,4,192,210,65,210,129,240,178,105,
					 228,108,245,148,140,40,35,195,38,58,65,207,215,253,65,85,208,76,62,3,237,55,89,
					 232,50,217,64,244,157,199,121,252,90,17,212,203,149,152,140,187,234,177,73,174,
					 193,100,192,143,97,53,145,135,19,103,13,90,135,151,199,91,239,247,33,39,145,
					 101,120,99,3,186,86,99,41,237,203,111,79,220,135,158,42,30,154,120,67,87,167,
					 135,176,183,191,253,115,184,21,233,58,129,233,142,39,128,211,118,137,139,255,
					 114,20,218,113,154,27,127,246,250,1,8,198,250,209,92,222,173,21,88,102,219 };

int noise2(int x, int y)
{
	int tmp = hash[(y + SEED) % 256];
	return hash[(tmp + x) % 256];
}

float lin_inter(float x, float y, float s)
{
	return x + s * (y - x);
}

float smooth_inter(float x, float y, float s)
{
	return lin_inter(x, y, s * s * (3 - 2 * s));
}

float noise2d(float x, float y)
{
	int x_int = x;
	int y_int = y;
	float x_frac = x - x_int;
	float y_frac = y - y_int;
	int s = noise2(x_int, y_int);
	int t = noise2(x_int + 1, y_int);
	int u = noise2(x_int, y_int + 1);
	int v = noise2(x_int + 1, y_int + 1);
	float low = smooth_inter(s, t, x_frac);
	float high = smooth_inter(u, v, x_frac);
	return smooth_inter(low, high, y_frac);
}

float PERLIN2D(float x, float y, float freq, float persistence, int depth)
{
	float xa = x * freq;
	float ya = y * freq;
	float amp = 1.0;
	float fin = 0;
	float div = 0.0;

	int i;
	for (i = 0; i < depth; i++)
	{
		div += 256 * amp;
		fin += noise2d(xa, ya) * amp;
		amp *= persistence;
		xa *= 2;
		ya *= 2;
	}

	return fin / div;
}

/*
unsigned PERLIN_NOISE(unsigned char * data, int * param, float * fParam) {

	int offset = param[3];
	int width = param[0];
	int height = param[1] + offset;
	int bytesPerPixel = param[2];	
	int levels = param[4];

	float cellSize = fParam[0];
	float persistence = fParam[1];

	int i, j;
	for (int i = offset; i < height; i++) {
		for (int j = 0; j < width; j++) {
			unsigned char value = (unsigned char)(PERLIN2D(j, i, 1 - cellSize, levels, persistence) * 255);
			data[i * width * bytesPerPixel + j * bytesPerPixel] = value;
			data[i * width * bytesPerPixel + j * bytesPerPixel + 1] = value;
			data[i * width * bytesPerPixel + j * bytesPerPixel + 2] = value;
		}
	}

	return 0;
}*/

/*
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

*/

void SET_SEED(int seed) {
	SEED = seed;
}