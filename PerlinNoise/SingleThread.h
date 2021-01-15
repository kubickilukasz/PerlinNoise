#include "DataStructures.h"
//#include "ThreadGenerate.h"
#include "BMP.h"
#include <inttypes.h>
#include <windows.h>
#include <vector>

using namespace System;

public ref class SingleThread {

	InputData ^ inData;

	unsigned char * data;

	int offset;
	int partHeight;

	int i,j,height,width;
	unsigned char value;

	DLLFUNCTION Func;

public:

	Thread ^ thread;

	SingleThread(InputData ^ in, unsigned char * d, int o, int p, DLLFUNCTION f) : inData(in), data(d), offset(o), partHeight(p), Func(f) {
		thread = gcnew Thread(gcnew ParameterizedThreadStart(this, &SingleThread::ThreadFunction));
	}

	void ThreadFunction(Object ^ object) {

		/*int param[]{
					inData->width
					,partHeight
					,BYTES_PER_PIXEL
					,offset
					,inData->levels
		};

		float fParam[]{
			inData->cellSize
			,inData->persistence
		};

		Func(data, param, fParam);*/

		height = partHeight + offset;
		width = inData->width;

		for (i = offset; i < height; i++) {
			for (j = 0; j < width; j++) {
				value = (unsigned char)(Func((float)j, (float)i, 1 - inData->cellSize, inData->persistence, inData->levels) * 255);
				data[i * inData->width * BYTES_PER_PIXEL + j * BYTES_PER_PIXEL] = value;
				data[i * inData->width * BYTES_PER_PIXEL + j * BYTES_PER_PIXEL + 1] = value;
				data[i * inData->width * BYTES_PER_PIXEL + j * BYTES_PER_PIXEL + 2] = value;
			}
		}

	}

};
