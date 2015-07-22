// LongDistancePhoneCall.cpp : Defines the entry point for the console application.

// Written by Meena Chandok
//This program computes and displays the long distance bill for the  calls.
// 00:00-07:59 = 0.10 per minute for domestic and 0.29 for international; 
//08:00-18:59 = 0.75 per minute for domestic and 0.99 for international;
//19:00-23:59 = 0.35 per minute for domestic and 0.59 for international

#include "stdafx.h"
#include <iostream> // Required for cout
#include <iomanip> // Required for setw, fixed, setting percision
using namespace std;


int main()
{//Variable declaration
	int  Action;
	double StartTime, NumMin, RateChargeDom, RateChargeInter, Call, Dom, Inter;
	double Charges;

	//value assignment for variables

	Action = 0;
	RateChargeDom = 0.0;// Initialization value
	RateChargeInter = 0.0;// Initialization value
	Call = 0.0;// Initialization value
	Inter = 0.0;// Initialization value

	//Ask for User input about call type and minutes.
	cout << "This program computes and displays the bill for long distance call." << endl << endl;
	cout << "What is the starting time of call, please enter" << endl;
	cout << "in HH.MM format e.g 07:OO as 7.00?" << endl;
	cin >> StartTime;
	cout << "Please enter the number of minutes of call" << endl;
	cin >> NumMin;
	cout << "Please enter the type of call 1 for domestic call and 2 for international call" << endl;
	cin >> Call;
	//cout << "Please enter Int for international call " << endl;
	//cin >> Inter;
	cout << endl;

	//Determine the course of action for type of call and different time scenarios.
	// For domestic call
	if (Call == 1)
	{
		if (StartTime >= 00.00 && StartTime <= 07.59)
		{
			Action = 1;
			RateChargeDom = 0.10;

		}
		if (StartTime >= 08.00 && StartTime <= 18.59)
		{
			Action = 2;
			RateChargeDom = 0.75;
		}

		if (StartTime > 19.00 && StartTime <= 23.59)
		{
			Action = 3;
			RateChargeDom = 0.35;
		}
	}

	if (Call == 2)
	{
		if (StartTime >= 00.00 && StartTime <= 07.59)
		{
			Action = 4;
			RateChargeInter = 0.29;

		}
		if (StartTime >= 08.00 && StartTime <= 18.59)
		{
			Action = 5;
			RateChargeInter = 0.99;
		}

		if (StartTime > 19.00 && StartTime <= 23.59)
		{
			Action = 5;
			RateChargeInter = 0.59;
		}
	}

	if (StartTime - static_cast<int>(StartTime) < 0.59)
	{
		switch (Action)
		{
		case 1: cout << "Your charges for " << NumMin << " =  $" << RateChargeDom*NumMin << endl;
			break;
		case 2: cout << "Your charges for " << NumMin << " =  $" << RateChargeDom*NumMin << endl;
			break;
		case 3: cout << "Your charges for " << NumMin << " =  $" << RateChargeDom*NumMin << endl;
			break;
		case 4: cout << "Your charges for " << NumMin << " =  $" << RateChargeInter*NumMin << endl;
			break;
		case 5: cout << "Your charges for " << NumMin << " =  $" << RateChargeInter*NumMin << endl;
			break;
		case 6: cout << "Your charges for " << NumMin << " =  $" << RateChargeInter*NumMin << endl;
			break;

			//The following default condition applies if the user repeatedly inputs a non positive value. 
		default:  cout << "SORRY - Cannot accept time greater than 23.59" << endl;
		}

	}
	else
		cout << " Last two digits should not be greater than 59" << endl;

	return 0;
}

