#pragma once
#include <stdio.h>

const int BYTES_PER_PIXEL = 3; /// red, green, & blue
const int FILE_HEADER_SIZE = 14;
const int INFO_HEADER_SIZE = 40;

unsigned char* createBitmapFileHeader(int height, int stride);

unsigned char* createBitmapInfoHeader(int height, int width);

void generateBitmapImage(unsigned char* image, int height, int width, char* imageFileName);