#pragma once
#include "DataStructures.h"
//#include "ThreadGenerate.h"
#include "BMP.h"
#include "SingleThread.h"
#include <inttypes.h>
#include <windows.h>
#include <vector>

using namespace System;
using namespace System::Threading;
using namespace System::Collections::Generic;
//using namespace PerlinNoise;


public ref class Generator{

	InputData ^ inputData;

	HINSTANCE hInstLibrary;

	DLLFUNCTION Func;
	SET_SEED setSeed;

	//get library instance
	void GetLibInstance(LPCWSTR _libName) {
		hInstLibrary = LoadLibrary(_libName);
	}

	bool GetLibFunction() {
		if (hInstLibrary) {
			//Func = (DLLFUNCTION)GetProcAddress(hInstLibrary, "PERLIN_NOISE");
			Func = (DLLFUNCTION)GetProcAddress(hInstLibrary, "PERLIN2D");
			setSeed = (SET_SEED)GetProcAddress(hInstLibrary, "SET_SEED");
			if (Func && setSeed) {
				return true;
			}
			else {
				return false;
			}
		}
		else {
			return false;
		}
	}

	//default contrustor
	Generator() {}

public:

	//init generator with the new values
	Generator(InputData^ _inputData, LPCWSTR _libName) : inputData(_inputData) {
		GetLibInstance(_libName);
	}

	//return file
	void Generate() {
		if (GetLibFunction()) {
			//do this

			setSeed(inputData->seed);

			int heightSingleThread = (int)(inputData->height / inputData->numberOfThreads);
			int restPixels = inputData->height - (inputData->numberOfThreads * heightSingleThread);

			std::vector<unsigned char> image;
			image.resize(inputData->height * inputData->width * BYTES_PER_PIXEL);

			array<SingleThread^> ^ threads = gcnew array<SingleThread^>(inputData->numberOfThreads);
			int currentOffset = 0;

			heightSingleThread++;
			for (int i = 0; i < restPixels; i++) {
				threads[i] = gcnew SingleThread(inputData, image.data(), currentOffset, heightSingleThread, Func);
				threads[i]->thread->Priority = ThreadPriority::AboveNormal;
				currentOffset += heightSingleThread;
			}

			heightSingleThread--;
			for (int i = restPixels; i < inputData->numberOfThreads; i++) {
				threads[i] = gcnew SingleThread(inputData, image.data(), currentOffset, heightSingleThread, Func);
				threads[i]->thread->Priority = ThreadPriority::AboveNormal;
				currentOffset += heightSingleThread;
			}

			for (int i = 0; i < inputData->numberOfThreads; i++) {
				threads[i]->thread->Start();
			}

			for (int i = 0; i < inputData->numberOfThreads; i++) {		
				threads[i]->thread->Join();
			}

			generateBitmapImage(image.data(), inputData->height, inputData->width, "tmp.bmp");

		}
	}

	~Generator() {
		if (hInstLibrary)
			FreeLibrary(hInstLibrary);
	}

	//number of threads
	static int NumberOfThreads() { return Environment::ProcessorCount; }

};


