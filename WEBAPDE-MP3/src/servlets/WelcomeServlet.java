package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CookieDecoder;

/**
 * Servlet implementation class welcomeServlet
 */
@WebServlet(urlPatterns= {"/welcome"})
public class WelcomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CookieDecoder theCookieDecoder = new CookieDecoder();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WelcomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String url = request.getServletPath(); //Get the path
		System.out.println("In doGet: " + url); //for checking
		
		switch(url) {
			case "/welcome": performRelogin(request, response); 
							 break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	//Performs the relogin feature. Wherein the user will be relogged in the website if and only if
	//It has a cookie, else it'll proceed to the welcome page.
	private void performRelogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		System.out.println(request.getRequestURL());

		Cookie[] theCookies;
		HttpSession theSession = request.getSession();
		String value = null;
		
		//Get all cookies in the browser
		theCookies = request.getCookies();
		
		//Check if cookie exits
		if(theCookies != null) {
			//Traverse the whole cookie, and find this certain cookie = s2 of Cookie in loginServlet
			for(Cookie aCookie : theCookies) {
				if(aCookie.getName().equals("USER")) {
					theCookieDecoder.decode(aCookie.getValue());
					System.out.println("Cookie found: " + aCookie.getName());
					System.out.println("The value of cookie: " + aCookie.getValue());
					value = theCookieDecoder.getValue();
					System.out.println("The value of cookie: " + value);
					
					//if remember me is not null, set cookie explirey to 3 weeks
					if(theCookieDecoder.isRemembered()) {
						aCookie.setMaxAge(60*60*24*21);
					}
					
					response.addCookie(aCookie);
				}
			}
		}
		
		//If it exists = redirect to homepage while logged in
		if(value != null) {
			System.out.println("WELCOMESERVLET, User exists.");
			RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
			theSession.setAttribute("un",value);
			rd.forward(request, response);
		}
		else {
			System.out.println("WELCOMESERVLET, User does not exist.");
			//else, redirect to  homepage
			response.sendRedirect("homepage.jsp");
		}

	}


}
