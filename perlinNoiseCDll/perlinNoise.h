#pragma once
#include <inttypes.h>

#ifdef DLL_EXPORT
#define DLL_PERLIN_NOISE_C __declspec(dllexport)
#else
#define DLL_PERLIN_NOISE_C __declspec(dllimport)
#endif

DLL_PERLIN_NOISE_C unsigned PERLIN_NOISE(unsigned char*, int *);

//extern "C"