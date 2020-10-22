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

	DLLFUNCTION Func;

public:

	Thread ^ thread;

	SingleThread(InputData ^ in, unsigned char * d, int o, DLLFUNCTION f) : inData(in), data(d), offset(o), Func(f) {
		thread = gcnew Thread(gcnew ParameterizedThreadStart(this, &SingleThread::ThreadFunction));
	}

	void ThreadFunction(Object ^ object) {

		int param[]{
					inData->width
					,inData->height
					,BYTES_PER_PIXEL
					,offset
					,inData->levels
		};

		float fParam[]{
			inData->cellSize
			,inData->persistence
		};

		Func(data, param, fParam);

		System::Console::WriteLine(thread->Name);
	}

};
