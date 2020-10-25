#include "DataStructures.h"
//#include "ThreadGenerate.h"
#include "BMP.h"
#include <inttypes.h>
#include <windows.h>
#include <vector>

public ref class SingleThread {

	InputData ^ inData;

	unsigned char * data;

	int offset;
	int partHeight;

	DLLFUNCTION Func;

public:

	Thread ^ thread;

	SingleThread(InputData ^ in, unsigned char * d, int o, int p, DLLFUNCTION f) : inData(in), data(d), offset(o), partHeight(p), Func(f) {
		thread = gcnew Thread(gcnew ParameterizedThreadStart(this, &SingleThread::ThreadFunction));
	}

	void ThreadFunction(Object ^ object) {

		int param[]{
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

		Func(data, param, fParam);
	}

};
