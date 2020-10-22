#pragma once
#include "DataStructures.h"
#include <fstream>


class FileController{

	const std::string const fileName = "tmp.bmp";
	std::fstream emptyFile;

public:

	//create empty file to save 
	bool CreateEmptyFile(InputData _inputData);

	//save output to file
	bool SaveBMP();

};

