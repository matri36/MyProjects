package chapter3;
import java.util.Scanner;
/*
 * Project number: 3
 * Description: This program is written by Meena Chandok. It determines if a 3 digit number
 * provided by user is a palindrome number. A number is a palindrome if it reads the same 
 * from right to left and from left to right.
 *  Date: 07/01/2015
 * Programmed in Java using Eclipse
*/
public class PalindromeNumber {
	public static void main(String args[]){
		
		// Variable declaration 
		int number;
		int numberFirst;
		int numberLast;
		
		/* Value assignment for variables. Set the default value and 
		reassign the value based on user input. */
		numberFirst = 0;
		numberLast = 0;
		
		// To read input from user
		Scanner input = new Scanner(System.in);
		
		//Explain the purpose of program to user and prompt the user to enter
		// the 3 digit integer number.
						
		System.out.print("This program determines if the 3 digit integer number is a palindrome. \n"
						+ "\nEnter a three-digit interger: ");
				
				number = input.nextInt();
		
		// Close user input	
		input.close();
		
		// For a 3 digit integer to be a palindrome the first and last digits of the number have to be same.
		// Derive the last and first number of 3 digits number and compare if they are same.	
		
		// Derive the first digit number from the entered number
		numberFirst = (number/100);
		
		// Derive the last digit number from the entered number
		numberLast = (number % 10);
	
		// Compare the first and last digit numbers to determine if number is palindrome.
		// And display the results.
	
		if (numberFirst == numberLast)
			System.out.println(number + " is a palindrome.");
		else
			System.out.println(number + " is not a palindrome.");
			
	}
}
