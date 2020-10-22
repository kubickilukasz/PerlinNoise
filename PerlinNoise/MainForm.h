#pragma once

#include <windows.h>
#include "DataStructures.h"
#include "Generator.h"
#include <chrono> 

namespace PerlinNoise {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

	/// <summary>
	/// Summary for MainForm
	/// </summary>
	public ref class MainForm : public System::Windows::Forms::Form
	{
	public:
		MainForm(void)
		{
			InitializeComponent();
			InitDefaultValues();
		}

	protected:
		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		~MainForm()
		{
			if (components)
			{
				delete components;
			}
		}
	private: System::Windows::Forms::Button^  button1;
	private: System::Windows::Forms::PictureBox^  pictureBox1;
	private: System::Windows::Forms::Label^  label1;
	private: System::Windows::Forms::NumericUpDown^  threads;
	private: System::Windows::Forms::Label^  label2;
	private: System::Windows::Forms::RadioButton^  radioCDLL;
	private: System::Windows::Forms::RadioButton^  radioAsmDLL;
	private: System::Windows::Forms::NumericUpDown^  widthN;
	private: System::Windows::Forms::Label^  label3;
	private: System::Windows::Forms::Label^  label4;
	private: System::Windows::Forms::NumericUpDown^  heightN;
	private: System::Windows::Forms::NumericUpDown^  cellSize;
	private: System::Windows::Forms::Label^  label5;
	private: System::Windows::Forms::Label^  label6;
	private: System::Windows::Forms::NumericUpDown^  levels;
	private: System::Windows::Forms::SaveFileDialog^  saveFileDialog1;
	private: System::Windows::Forms::Label^  timeLabel;
	private: System::Windows::Forms::Label^  label7;
	private: System::Windows::Forms::NumericUpDown^  persistence;




	

	private: System::ComponentModel::IContainer^  components;
	protected:

	private:
		/// <summary>
		/// Required designer variable.
		/// </summary>


#pragma region Windows Form Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		void InitializeComponent(void)
		{
			this->button1 = (gcnew System::Windows::Forms::Button());
			this->pictureBox1 = (gcnew System::Windows::Forms::PictureBox());
			this->label1 = (gcnew System::Windows::Forms::Label());
			this->threads = (gcnew System::Windows::Forms::NumericUpDown());
			this->label2 = (gcnew System::Windows::Forms::Label());
			this->radioCDLL = (gcnew System::Windows::Forms::RadioButton());
			this->radioAsmDLL = (gcnew System::Windows::Forms::RadioButton());
			this->widthN = (gcnew System::Windows::Forms::NumericUpDown());
			this->label3 = (gcnew System::Windows::Forms::Label());
			this->label4 = (gcnew System::Windows::Forms::Label());
			this->heightN = (gcnew System::Windows::Forms::NumericUpDown());
			this->cellSize = (gcnew System::Windows::Forms::NumericUpDown());
			this->label5 = (gcnew System::Windows::Forms::Label());
			this->label6 = (gcnew System::Windows::Forms::Label());
			this->levels = (gcnew System::Windows::Forms::NumericUpDown());
			this->saveFileDialog1 = (gcnew System::Windows::Forms::SaveFileDialog());
			this->timeLabel = (gcnew System::Windows::Forms::Label());
			this->label7 = (gcnew System::Windows::Forms::Label());
			this->persistence = (gcnew System::Windows::Forms::NumericUpDown());
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->pictureBox1))->BeginInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->threads))->BeginInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->widthN))->BeginInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->heightN))->BeginInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->cellSize))->BeginInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->levels))->BeginInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->persistence))->BeginInit();
			this->SuspendLayout();
			// 
			// button1
			// 
			this->button1->Anchor = System::Windows::Forms::AnchorStyles::Bottom;
			this->button1->Location = System::Drawing::Point(242, 387);
			this->button1->Name = L"button1";
			this->button1->Size = System::Drawing::Size(75, 23);
			this->button1->TabIndex = 0;
			this->button1->Text = L"Generate";
			this->button1->UseVisualStyleBackColor = true;
			this->button1->Click += gcnew System::EventHandler(this, &MainForm::button1_Click);
			// 
			// pictureBox1
			// 
			this->pictureBox1->Anchor = System::Windows::Forms::AnchorStyles::Right;
			this->pictureBox1->Location = System::Drawing::Point(373, 12);
			this->pictureBox1->Name = L"pictureBox1";
			this->pictureBox1->Size = System::Drawing::Size(221, 218);
			this->pictureBox1->SizeMode = System::Windows::Forms::PictureBoxSizeMode::StretchImage;
			this->pictureBox1->TabIndex = 1;
			this->pictureBox1->TabStop = false;
			this->pictureBox1->Click += gcnew System::EventHandler(this, &MainForm::pictureBox1_Click);
			// 
			// label1
			// 
			this->label1->AutoSize = true;
			this->label1->Location = System::Drawing::Point(12, 12);
			this->label1->Name = L"label1";
			this->label1->Size = System::Drawing::Size(113, 13);
			this->label1->TabIndex = 2;
			this->label1->Text = L"Perlin Noise Generator";
			// 
			// threads
			// 
			this->threads->Location = System::Drawing::Point(110, 53);
			this->threads->Maximum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 64, 0, 0, 0 });
			this->threads->Minimum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 0 });
			this->threads->Name = L"threads";
			this->threads->Size = System::Drawing::Size(120, 20);
			this->threads->TabIndex = 3;
			this->threads->Value = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 0 });
			// 
			// label2
			// 
			this->label2->AutoSize = true;
			this->label2->Location = System::Drawing::Point(10, 55);
			this->label2->Name = L"label2";
			this->label2->Size = System::Drawing::Size(94, 13);
			this->label2->TabIndex = 4;
			this->label2->Text = L"Number of threads";
			// 
			// radioCDLL
			// 
			this->radioCDLL->AutoSize = true;
			this->radioCDLL->Location = System::Drawing::Point(15, 85);
			this->radioCDLL->Name = L"radioCDLL";
			this->radioCDLL->Size = System::Drawing::Size(69, 17);
			this->radioCDLL->TabIndex = 5;
			this->radioCDLL->TabStop = true;
			this->radioCDLL->Text = L"C Library ";
			this->radioCDLL->UseVisualStyleBackColor = true;
			// 
			// radioAsmDLL
			// 
			this->radioAsmDLL->AutoSize = true;
			this->radioAsmDLL->Location = System::Drawing::Point(110, 85);
			this->radioAsmDLL->Name = L"radioAsmDLL";
			this->radioAsmDLL->Size = System::Drawing::Size(110, 17);
			this->radioAsmDLL->TabIndex = 6;
			this->radioAsmDLL->TabStop = true;
			this->radioAsmDLL->Text = L"Assembler Library ";
			this->radioAsmDLL->UseVisualStyleBackColor = true;
			// 
			// widthN
			// 
			this->widthN->Anchor = System::Windows::Forms::AnchorStyles::Left;
			this->widthN->Location = System::Drawing::Point(77, 122);
			this->widthN->Maximum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 10000, 0, 0, 0 });
			this->widthN->Minimum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 0 });
			this->widthN->Name = L"widthN";
			this->widthN->Size = System::Drawing::Size(120, 20);
			this->widthN->TabIndex = 7;
			this->widthN->Value = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 0 });
			// 
			// label3
			// 
			this->label3->Anchor = System::Windows::Forms::AnchorStyles::Left;
			this->label3->AutoSize = true;
			this->label3->Location = System::Drawing::Point(12, 122);
			this->label3->Name = L"label3";
			this->label3->Size = System::Drawing::Size(35, 13);
			this->label3->TabIndex = 8;
			this->label3->Text = L"Width";
			// 
			// label4
			// 
			this->label4->Anchor = System::Windows::Forms::AnchorStyles::Left;
			this->label4->AutoSize = true;
			this->label4->Location = System::Drawing::Point(12, 150);
			this->label4->Name = L"label4";
			this->label4->Size = System::Drawing::Size(38, 13);
			this->label4->TabIndex = 10;
			this->label4->Text = L"Height";
			this->label4->Click += gcnew System::EventHandler(this, &MainForm::label4_Click);
			// 
			// heightN
			// 
			this->heightN->Anchor = System::Windows::Forms::AnchorStyles::Left;
			this->heightN->Location = System::Drawing::Point(77, 148);
			this->heightN->Maximum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 10000, 0, 0, 0 });
			this->heightN->Minimum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 0 });
			this->heightN->Name = L"heightN";
			this->heightN->Size = System::Drawing::Size(120, 20);
			this->heightN->TabIndex = 9;
			this->heightN->Value = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 0 });
			this->heightN->ValueChanged += gcnew System::EventHandler(this, &MainForm::numericUpDown1_ValueChanged);
			// 
			// cellSize
			// 
			this->cellSize->Anchor = System::Windows::Forms::AnchorStyles::Left;
			this->cellSize->DecimalPlaces = 4;
			this->cellSize->Location = System::Drawing::Point(77, 178);
			this->cellSize->Maximum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1000, 0, 0, 0 });
			this->cellSize->Minimum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 262144 });
			this->cellSize->Name = L"cellSize";
			this->cellSize->Size = System::Drawing::Size(120, 20);
			this->cellSize->TabIndex = 11;
			this->cellSize->Value = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 196608 });
			// 
			// label5
			// 
			this->label5->Anchor = System::Windows::Forms::AnchorStyles::Left;
			this->label5->AutoSize = true;
			this->label5->Location = System::Drawing::Point(9, 180);
			this->label5->Name = L"label5";
			this->label5->Size = System::Drawing::Size(47, 13);
			this->label5->TabIndex = 12;
			this->label5->Text = L"Cell Size";
			this->label5->Click += gcnew System::EventHandler(this, &MainForm::label5_Click);
			// 
			// label6
			// 
			this->label6->Anchor = System::Windows::Forms::AnchorStyles::Left;
			this->label6->AutoSize = true;
			this->label6->Location = System::Drawing::Point(12, 212);
			this->label6->Name = L"label6";
			this->label6->Size = System::Drawing::Size(38, 13);
			this->label6->TabIndex = 14;
			this->label6->Text = L"Levels";
			// 
			// levels
			// 
			this->levels->Anchor = System::Windows::Forms::AnchorStyles::Left;
			this->levels->Location = System::Drawing::Point(77, 210);
			this->levels->Maximum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 128, 0, 0, 0 });
			this->levels->Minimum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 0 });
			this->levels->Name = L"levels";
			this->levels->Size = System::Drawing::Size(120, 20);
			this->levels->TabIndex = 13;
			this->levels->Value = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 0 });
			// 
			// saveFileDialog1
			// 
			this->saveFileDialog1->FileOk += gcnew System::ComponentModel::CancelEventHandler(this, &MainForm::saveFileDialog1_FileOk);
			// 
			// timeLabel
			// 
			this->timeLabel->Anchor = System::Windows::Forms::AnchorStyles::Right;
			this->timeLabel->AutoSize = true;
			this->timeLabel->Location = System::Drawing::Point(415, 233);
			this->timeLabel->Name = L"timeLabel";
			this->timeLabel->Size = System::Drawing::Size(38, 13);
			this->timeLabel->TabIndex = 15;
			this->timeLabel->Text = L"Levels";
			this->timeLabel->TextAlign = System::Drawing::ContentAlignment::TopCenter;
			this->timeLabel->Click += gcnew System::EventHandler(this, &MainForm::label7_Click);
			// 
			// label7
			// 
			this->label7->Anchor = System::Windows::Forms::AnchorStyles::Left;
			this->label7->AutoSize = true;
			this->label7->Location = System::Drawing::Point(9, 248);
			this->label7->Name = L"label7";
			this->label7->Size = System::Drawing::Size(62, 13);
			this->label7->TabIndex = 17;
			this->label7->Text = L"Persistence";
			this->label7->Click += gcnew System::EventHandler(this, &MainForm::label7_Click_1);
			// 
			// persistence
			// 
			this->persistence->Anchor = System::Windows::Forms::AnchorStyles::Left;
			this->persistence->DecimalPlaces = 4;
			this->persistence->Location = System::Drawing::Point(77, 246);
			this->persistence->Maximum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1000, 0, 0, 0 });
			this->persistence->Minimum = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 262144 });
			this->persistence->Name = L"persistence";
			this->persistence->Size = System::Drawing::Size(120, 20);
			this->persistence->TabIndex = 16;
			this->persistence->Value = System::Decimal(gcnew cli::array< System::Int32 >(4) { 1, 0, 0, 196608 });
			this->persistence->ValueChanged += gcnew System::EventHandler(this, &MainForm::numericUpDown1_ValueChanged_1);
			// 
			// MainForm
			// 
			this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->ClientSize = System::Drawing::Size(606, 422);
			this->Controls->Add(this->label7);
			this->Controls->Add(this->persistence);
			this->Controls->Add(this->timeLabel);
			this->Controls->Add(this->label6);
			this->Controls->Add(this->levels);
			this->Controls->Add(this->label5);
			this->Controls->Add(this->cellSize);
			this->Controls->Add(this->label4);
			this->Controls->Add(this->heightN);
			this->Controls->Add(this->label3);
			this->Controls->Add(this->widthN);
			this->Controls->Add(this->radioAsmDLL);
			this->Controls->Add(this->radioCDLL);
			this->Controls->Add(this->label2);
			this->Controls->Add(this->threads);
			this->Controls->Add(this->label1);
			this->Controls->Add(this->pictureBox1);
			this->Controls->Add(this->button1);
			this->Name = L"MainForm";
			this->Text = L"PerlinNoise";
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->pictureBox1))->EndInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->threads))->EndInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->widthN))->EndInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->heightN))->EndInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->cellSize))->EndInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->levels))->EndInit();
			(cli::safe_cast<System::ComponentModel::ISupportInitialize^>(this->persistence))->EndInit();
			this->ResumeLayout(false);
			this->PerformLayout();

		}
#pragma endregion
	private: void InitDefaultValues() {

		System::Decimal cellSizeNumber(0.5);

		radioCDLL->Checked = true;
		radioAsmDLL->Checked = false;
		widthN->Value = (unsigned)(256);
		heightN->Value = (unsigned)(256);
		cellSize->Value = cellSizeNumber;
		threads->Value = Generator::NumberOfThreads();
		persistence->Value = System::Decimal(0.5);
		this->levels->Value = 3;
		this->timeLabel->Text = "";
	}

	private: System::Void button1_Click(System::Object^  sender, System::EventArgs^  e) {

		LPCWSTR nameC = L"perlinNoiseCDll";
		LPCWSTR nameAsm = L"perlinNoiseAsmDll";

		delete pictureBox1->Image;

		auto start = std::chrono::high_resolution_clock::now();

		if (!radioCDLL->Checked && radioAsmDLL->Checked) {
			Generator ^ generator = gcnew Generator(
				gcnew InputData( (unsigned)threads->Value, (unsigned)widthN->Value, (unsigned)heightN->Value, 0, (double)cellSize->Value, (unsigned)levels->Value, (double)persistence->Value, false )
				, nameAsm
			);
			generator->Generate();
		}else if (radioCDLL->Checked && !radioAsmDLL->Checked) {
			Generator ^ generator = gcnew Generator(
				gcnew InputData((unsigned)threads->Value, (unsigned)widthN->Value, (unsigned)heightN->Value, 0, (double)cellSize->Value, (unsigned)levels->Value, (double)persistence->Value, false)
				, nameC
			);
			generator->Generate();
		}

		auto finish = std::chrono::high_resolution_clock::now();
		std::chrono::duration<double> elapsed = finish - start;
		timeLabel->Text = "Elapsed Time: " + elapsed.count().ToString() + " sec";


		pictureBox1->Image = Image::FromFile("tmp.bmp");

	}
	private: System::Void pictureBox1_Click(System::Object^  sender, System::EventArgs^  e) {

		saveFileDialog1->Filter = "Bitmap Image|*.bmp";
		saveFileDialog1->Title = "Savee BMP";

		saveFileDialog1->ShowDialog();

		if (saveFileDialog1->FileName != "") {
			pictureBox1->Image->Save(saveFileDialog1->FileName);
		}

	}
private: System::Void toolTip1_Popup(System::Object^  sender, System::Windows::Forms::PopupEventArgs^  e) {
}
private: System::Void label4_Click(System::Object^  sender, System::EventArgs^  e) {
}
private: System::Void numericUpDown1_ValueChanged(System::Object^  sender, System::EventArgs^  e) {
}
private: System::Void label5_Click(System::Object^  sender, System::EventArgs^  e) {
}
private: System::Void saveFileDialog1_FileOk(System::Object^  sender, System::ComponentModel::CancelEventArgs^  e) {

	if (saveFileDialog1->FileName != "") {

		/*System::IO::FileStream ^ fs = gcnew System::IO::FileStream("F:\\studia\\JA\\projekt\\Project\\PerlinNoise\\x64\\Release\\tmp.bmp", System::IO::FileMode::Open);
		//(System::IO::FileStream ^)(saveFileDialog->OpenFile());
		//pictureBox1->Image->Save()
		if (fs->CanRead) {
		
		}*/
	}
}
private: System::Void label7_Click(System::Object^  sender, System::EventArgs^  e) {
}
private: System::Void label7_Click_1(System::Object^  sender, System::EventArgs^  e) {
}
private: System::Void numericUpDown1_ValueChanged_1(System::Object^  sender, System::EventArgs^  e) {
}
};
}
