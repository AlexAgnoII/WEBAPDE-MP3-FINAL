package service;

import java.util.Scanner;

public class TagServiceTest {

	public static String[] split(String input) {
		String	tags[] = input.split(" and ");
		return tags;
	}
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String inputs[];
		String input;
		
		System.out.println("Enter a string: ");
		input = sc.nextLine();
		System.out.println(input);
		inputs = split(input);
		for(String s: inputs)
			System.out.println(s);
		sc.close();
	}
}
