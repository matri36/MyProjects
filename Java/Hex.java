package chapter3;
import java.util.Scanner;
/*
 
 * Project number: 1
 * Description: This program is written by Meena Chandok. It converts the decimal number  
 * entered by user (in range of 0 to 15) to hexadecimal. 
 * Date: 07/01/2015
 * Programmed in Java using Eclipse
*/
public class Hex {
	public static void main(String args[]){
		
		// Variable declaration 
		int numberDecimal;
		char  hexaDecimal;
		
		// Variable initialization; set hexadecimal to a value not within range of user input
		hexaDecimal = 'Z';

		// To read input from user
		Scanner input = new Scanner(System.in);
		
		//Explain the purpose of program to user and prompt the user to enter
		//the information.
		
		System.out.print("This program converts a decimal number to hexadecimal. \n "
				+ "\nEnter a decimal integer (0 to 15): ");
		
		 numberDecimal = input.nextInt();
		 
		 input.close();
		 
		 // Evaluate the user's input and display the output accordingly.
		 if (numberDecimal <= 15 && numberDecimal >=0)
		 	{
			 
			 	if (numberDecimal <=9)
			 	//It is not necessary to check here if user input is also greater than 0 since it
			 	//has already been checked in the main "if" branch. 
			 	System.out.println("The hex value is " + numberDecimal + ".");
			 
			 	if (numberDecimal >=10)
			 	{
		 		 //Converting decimal value to hexadecimal formula if the decimal value is >=10.
		 		 hexaDecimal = (char)('A' + numberDecimal - 10);
		 		 System.out.println("The hex value is " + hexaDecimal + ".");
			 	}
			 	
		 	}
		 else
			 System.out.println("Invalid input");

	}
}

