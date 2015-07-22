// PC21_Chapter5_WhileLoop.cpp : Defines the entry point for the console application.
////This program is written by Meena Chandok
//This program generates a random number and asks the user to guess the number. The output also provides the number of 
//attempts user has taken to guess the correct number.

#include "stdafx.h"
#include <iostream>
#include <cstdlib> //for rand, srand
#include <ctime> // for time function
using namespace std;


int main()
{
	//Variables for random number generation
	int Num, Ans, NumAttempt;

	//Initialization to calculate number of attempts.
	NumAttempt = 0;

	//To generate random number whenever programs runs
	unsigned seed = time(0);

	// To seed the random number generator
	srand(seed);

	//Brief description of what this program does.
	cout << "In this game program generates a random number in range of 1-100" << endl;
	Num = rand() % 100;  //generates a random number in 1-10 range

	//Ask the user to guess the random number.
	cout << "Can you Guess the number?" << endl;
	cout << "Enter your answer" << endl;

	//User input for number.
	cin >> Ans;

	// Input Validation: Do not accept negative number and number beyond the range of 1-100.
	// Input Validation: Do not accept symbol, character or string as valid input. Use of cin.good()
	// These attempts were not considered in counting as user did not provide the number in the correct range.

	while ((Num != Ans) && cin.good())
		
	{	if (Ans < 1 || Ans>100)
	
		{ cout << "The number should be in range of 1-100. Please enter again" << endl;
			cin >> Ans;
		}
			// If user provides the number in the valid range (1-100) then compare that with the generated random 
			// number and count the number of attempts of user till user guess the correct number.

	else
	{
		if (Num > Ans)
		{
			cout << "Your number is lower than the random number, please enter another number" << endl;
			cin >> Ans;

			//Calculate the number of attempts taken.
			NumAttempt++;
		}

		if (Num < Ans)
		{
			cout << "Your number is higher than the random number, please enter another number" << endl;
			cin >> Ans;

			//Calculate the number of attempts taken.
			NumAttempt++;
		}
		
	}			// End of else 

	}			// End of while loop

	if (cin.good() == 0)

	{	cout << "invalid entry" << endl;
	
	}

	 if (Num == Ans)
	{
		//Calculate the number of attempts taken.
		NumAttempt++;

		cout << "Congrats!! You guessed the correct number " << Num << endl;
		cout << "You have taken a total of " << NumAttempt << " attempts to guess the number correctly" << endl;
	}
	
	return 0;
}




