// PC14_chapter7.cpp : Defines the entry point for the console application.
// This program was written by Meena Chandok. The program simulates a lottery. 5 integer array named lottery is geneated through random
// numbers in the range of 0-9. The user is asked to enter 5 digit and program compare both the arrays and display the results about
// the numbers matched. If all 5 digits matches the user is declared as a winner. 

#include "stdafx.h"
#include <iostream>
#include <cstdlib> //for rand, srand
#include <ctime> // for time function
using namespace std;



// Function prototype
int generateNumbers(int);
void findMatches(int[], int[], int);
void displayValues(int[], int);

int main()
{
	const int ARRAY_SIZE = 5;           // SIZE of an array.
	const int MAX_RANGE = 9;            // The max range between 0 to 9.
	
	int User[ARRAY_SIZE];				// To hold the user's number.
	int LotteryNum[ARRAY_SIZE] = { 0, 0, 0, 0, 0 };

	//Brief description of what this program does.
	cout << "This is lottery game program, enter the 5 numbers in range of 0-9." << endl;
	cout << "If your number matches with the lottery, you will be winner." << endl;

	//get the lottery numbers & user input
	for (int i = 0; i < ARRAY_SIZE; i++)
	{
		LotteryNum[i] = generateNumbers(i);  //send a different 'i' each time to change the random seed

		//get user numbers
		cout << "Enter a number" << (i + 1) << ":" << endl;
		cin >> User[i];
	
		//input validation for entry of negative numbers and numbers greater than 9
		while ((User[i] < 0) || (User[i] > 9))
			{
				cout << "Please enter a positive number between range of 0-9: " << endl;
				cin >> User[i];
			}
		
	}
	
	//display values
	cout << "Lottery array: " << endl;
	displayValues(LotteryNum, ARRAY_SIZE);

	cout << "User array: " << endl;
	displayValues(User, ARRAY_SIZE);

	//find match between lottery and user array
	findMatches(LotteryNum, User, ARRAY_SIZE);
	
	return 0;
}


// function to generate lottery numbers
int generateNumbers(int i)
{ 
	int LotteryNum;
	const int MIN_VAL = 0;
	const int MAX_VAL = 9;
	// To generate random number whenever programs runs
	unsigned seed = time(0)+i; //'+i' was needed to generate a different random number each time

	// To seed the random number generator
	srand(seed);

		LotteryNum = (rand() % (MAX_VAL - MIN_VAL + 1)) + MIN_VAL;
		
		return LotteryNum;
}

// function to match user numbers with lottery numbers
void findMatches(int Lottery[], int UserNum[], int Size)
{
	bool arraysEqual = true; // Flag variable
	int count = 0; // Loop counter variable
	int Match = 0; // Match counter variable
	
	// Determine whether the elements contain the same data.
	while (count < Size)
	{
		if (UserNum[count] != Lottery[count])
		{
			arraysEqual = false;
		}
		else
		{
			Match=Match+1;
		}
		count++;
	}
	if (arraysEqual)
	{
		cout << "The arrays are equal. All 5 numbers matched.\n";
		cout << "congratulations, you are a grand prize winner." << endl;
	}
	else
	{
		cout << "The arrays are not equal. Only " << Match << " numbers matched.\n";
		cout << "Sorry, try again.\n";
	}

}

// function to display values

void displayValues(int DisplayNum[], int Size)
{
	for (int i = 0; i < Size; i++)
	{
		cout << DisplayNum[i] << "\t";
	}
	cout << endl;

}
