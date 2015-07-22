package chapter3;
import java.util.Scanner;
/*
 *  Project number: 2
 * Description: This program is written by Meena Chandok. This program  predicts the 
 * future day of the week for user based on their number input for today's day of week.   
 * Sunday is 0, Monday is 1, ..., and Saturday is 6.
 * Date: 07/01/2015
 * Programmed in Java using Eclipse
*/
public class FutureDate {
	public static void main(String args[]){
		
		// Variable declaration 
		int today, elapsedDay, futureDay;
		String todayStatus, futureStatus;
		
		// Variable assignment
		todayStatus = "-1";
		futureStatus ="-1";
		
		// To read input from user
		Scanner input = new Scanner(System.in);
				
		//Explain the purpose of program to user and prompt the user to enter
		//the information.
						
		System.out.print("This program predicts the future day. "
				+ "Enter the number from 0 to 6 for today.\n" 
				+ "Sunday is 0, Monday is 1, ..., and Saturday is 6. \n\n"
				+ "Enter today's day:  ");
	
		today = input.nextInt();
				
		System.out.print("Enter the number of days elapsed since today: ");
		elapsedDay = input.nextInt();
				
		//Closing user input
		input.close();

		//Use switch to define the integer number entered by user to day.
		switch(today) 
		{
		case 0: todayStatus = "Sunday"; break;
		case 1: todayStatus = "Monday"; break;
		case 2: todayStatus = "Tuesday"; break;
		case 3: todayStatus = "Wednesday"; break;
		case 4: todayStatus = "Thursday"; break;
		case 5: todayStatus = "Friday"; break;
		case 6: todayStatus = "Saturday"; break;
		}
		
		// Calculation of future day using %7 (a week has 7 days) 
		futureDay = (today + elapsedDay)%7;
				
		//Use switch to define the integer number entered by user to day.
		switch(futureDay) 
		{
		case 0: futureStatus = "Sunday"; break;
		case 1: futureStatus = "Monday"; break;
		case 2: futureStatus = "Tuesday"; break;
		case 3: futureStatus = "Wednesday"; break;
		case 4: futureStatus = "Thursday"; break;
		case 5: futureStatus = "Friday"; break;
		case 6: futureStatus = "Saturday"; break;
		}
		
		//Display the results 
		System.out.println("Today is " + todayStatus +  
		" and the future day is " + futureStatus + ".");
								
	}
		
}


