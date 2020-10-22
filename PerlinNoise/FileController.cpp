#include "FileController.h"

bool FileController::CreateEmptyFile(InputData _inputData){
	if (emptyFile.is_open()) {
		emptyFile.close();
	}
	emptyFile.open("tmp.bmp");
	if (emptyFile.good()) {
		return true;
		emptyFile.close();
	}else {
		return false;
	}
}
