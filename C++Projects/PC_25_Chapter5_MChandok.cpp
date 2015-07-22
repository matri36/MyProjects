// PC_25_Chapter5_MChandok.cpp : Defines the entry point for the console application.
//This program is written by Meena Chandok.
// Student Lineup program to read the names of students from file and identify the student with alphabet as first and last in the file.

#include "stdafx.h"
#include <iostream>
#include <fstream>//To open file for reading and writing
#include <string> // for string
using namespace std;


int main()
{	
	//Variables declaration and initialization
	ifstream infile;
	string StudentName;
	string FirstStudentAlpha;
	string LastStudentAlpha;
	
	int Counter = 0;

	//To open and read the file
	infile.open("C:\\Users\\meena\\Documents\\Visual Studio 2013\\LineUp.txt");

	//To read the student names in file sequentially and direct them as per alphabetical order
	while (infile >> StudentName)
	{
		if (Counter == 0)
		{
			FirstStudentAlpha = StudentName;
			LastStudentAlpha = StudentName;
			Counter++;
		}
		else
		{
			if (StudentName < FirstStudentAlpha)
				FirstStudentAlpha = StudentName;
			else if (StudentName > LastStudentAlpha)
				LastStudentAlpha = StudentName;
		}
	}
	//If file opened and read correctly then Counter>0 and should display the following statements
	if (Counter > 0)
	{
		cout << "First student by alphabet is " << FirstStudentAlpha << endl;
		cout << "Last student by alphabet is " << LastStudentAlpha << endl;	
	}
	
	//If there is problem in opening/reading the file then the following message should display (as part of input validation)
	else
	{
		cout << "File could not be read" << endl;
	}

	infile.close();
	return 0;
}
	
	