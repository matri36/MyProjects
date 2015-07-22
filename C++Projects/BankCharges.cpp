// HWAssignment4A_MeenaChandok.cpp : Defines the entry point for the console application.
//
// Written by Meena Chandok
//This program computes and displays the bank’s service fees for the month.
// Bank charges $10 per month plus $0.10 for <20 checks, $0.08 for 20-39 checks, $0.06 for 40-59 checks.
// $0.04 for 60 or >60 checks. Extra $15 if the balance of account <400 before any check fees applied. 
// Use of switch and case statements to handle different scenarios.

#include "stdafx.h"
#include <iostream> // Required for cout
#include <iomanip> // Required for setw, fixed, setting percision
using namespace std;


int main()
{//Variable declaration
	int NumbChecks, Action;
	double BeginBalance;
	double MonthlyCharges, MinBalanceCharge;

	//value assignment for variables
	MonthlyCharges = 10.00;
	MinBalanceCharge = 0.00;	// Set the default value and reassign the value based on user input
	Action = 0;					// Initialization value

	//Determine the status of balance of account before requesting checks and how many checks are needed. 
	cout << "This program computes and displays the bank's service fees for checks requested." << endl << endl;
	cout << "What is the beginning balance in account?" << endl;
	cout << " (Hit Enter After Entering the balance)" << endl << endl;
	cin >> BeginBalance;
	cout << endl;

	//Determine the course of action for different balance scenarios.
	if (BeginBalance < 0)
			 cout << "URGENT MESSAGE: Your account is overdrawn." << endl;		
	
	if (BeginBalance < 400)
		MinBalanceCharge = 15.00;

	//Determine the number of checks written and avoid negative number input
	cout << endl;
	cout << "How many checks have you written?" << endl;
	cin >> NumbChecks;
	if (NumbChecks < 0)
	{
		cout << "Please enter a non negative number" << endl;
		cin >> NumbChecks;
	}


	//Determine the bank charges and fees for user's requested checks. Use switch statements. Assign a different action value for each scenario.
	cout << setprecision(2) << fixed;
	cout << endl;
	if (NumbChecks >= 0 && NumbChecks < 20) Action = 1;
	if (NumbChecks >= 20 && NumbChecks < 40) Action = 2;
	if (NumbChecks >= 40 && NumbChecks < 60) Action = 3;
    if (NumbChecks >= 60) Action = 4;

	switch (Action)
	{
	case 1: cout << "Your charges for " << NumbChecks << " Checks =  $" << MonthlyCharges + MinBalanceCharge + (NumbChecks * 0.10) << endl;
		break;
	case 2: cout << "Your charges for " << NumbChecks << " Checks =  $" << MonthlyCharges + MinBalanceCharge + (NumbChecks * 0.08) << endl;
		break;
	case 3: cout << "Your charges for " << NumbChecks << " Checks =  $" << MonthlyCharges + MinBalanceCharge + (NumbChecks * 0.06) << endl;
		break;
	case 4: cout << "Your charges for " << NumbChecks << " Checks =  $" << MonthlyCharges + MinBalanceCharge + (NumbChecks * 0.04) << endl;
		break;
	//The following default condition applies if the user repeatedly inputs a non positive value. 
	default:  cout << "SORRY - Cannot take negative value for checks" << endl;
	}
	return 0;
}

