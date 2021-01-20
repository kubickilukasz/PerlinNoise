#pragma once
#include <inttypes.h>

#ifdef DLL_EXPORT
#define DLL_PERLIN_NOISE_C __declspec(dllexport)
#else
#define DLL_PERLIN_NOISE_C __declspec(dllimport)
#endif

DLL_PERLIN_NOISE_C unsigned PERLIN_NOISE(unsigned char*, int *, float * fParam);

//DLL_PERLIN_NOISE_C float PERLIN2D(float x, float y, float freq, float persistence, int depth);

DLL_PERLIN_NOISE_C void SET_SEED(int);

//extern "C"