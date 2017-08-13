package service;

public class CookieDecoder {
	//0 == value
	//1 == remember or not
	private String[] parts;
	
	public void decode(String theSentence) {
		System.out.println("The sentence: " + theSentence);
		parts = theSentence.split("\\|");
		System.out.println("parts: " +parts[0] + " and " + parts[1]);
	}

	//Returns the value of the Cookie
	public String getValue() {
		return parts[0];
	}
	
	//Returns if its remembered or not.
	public Boolean isRemembered() {
		return !parts[1].equals("null");
	}
}
