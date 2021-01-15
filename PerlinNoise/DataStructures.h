#pragma once
#include <windows.h>
#include <inttypes.h>

using namespace System::Threading;

//typedef INT(CALLBACK* DLLFUNCTION)(unsigned char*, int*, float*);
typedef float(CALLBACK* DLLFUNCTION)(float x, float y, float freq, float persistence, int depth);
typedef VOID(CALLBACK* SET_SEED)(int);

public ref struct InputData {
	unsigned numberOfThreads;
	unsigned width, height;
	long int seed;
	float cellSize;
	unsigned levels;
	float persistence;
	bool color;
	InputData(
		unsigned numberOfThreads,
		unsigned width,
		unsigned height,
		long int seed,
		float cellSize,
		unsigned levels,
		float persistence,
		bool color
	) : 
		numberOfThreads(numberOfThreads),
		width(width),
		height(height),
		seed(seed),
		cellSize(cellSize),
		levels(levels),
		persistence(persistence),
		color(color)
	{}
};

public ref struct InputThread {
	unsigned offset;
	unsigned char * data;
	InputThread(unsigned offset, unsigned char * data) 
		:offset(offset), data(data){}
};