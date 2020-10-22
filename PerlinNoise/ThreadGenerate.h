#pragma once
#include "DataStructures.h";
#include <inttypes.h>
#include "BMP.h"

using namespace System::Threading;

namespace PerlinNoise{

	public ref class ThreadGenerate {

		InputThread ^ inputThread;
		Thread ^ thread;
		unsigned char * data;
		DLLFUNCTION func;

		ThreadGenerate() {}

	public:

		ThreadGenerate(InputThread ^ _inputThread, unsigned char * _data, DLLFUNCTION _func) : inputThread(_inputThread), func(_func){
			thread = gcnew Thread(gcnew ParameterizedThreadStart(this, &ThreadGenerate::Generate));
			data = _data;
			thread->Start();
		}

		void Generate(Object^ object) {

			int settings[]{
				inputThread->width
				,inputThread->height
				,BYTES_PER_PIXEL
				,inputThread->YOffset
			};

			func(data, settings);
		}

		void Join() {
			if(thread)
				thread->Join();
		}

	};

}

