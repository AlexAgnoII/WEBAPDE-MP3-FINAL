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

import bean.Users;
import service.UserService;

/**
 * Servlet implementation class WebController
 */
@WebServlet(urlPatterns= {"/login", "/register"})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public UserServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getServletPath(); //Get the path
		System.out.println("In doPost: " + url + "\n\n"); //for checking
		
		//Determine what to do.
		switch(url) {
			case "/login": loginUser(request, response);
						   break;
			case "/register": signupUser(request, response);
							 break;
		}
	}
	
	//Login the user
	private void loginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String username,
		       password,
		       rememberMe;
			System.out.println("Request.getAtribute(\"username\") = " + request.getAttribute("username") );
				
			HttpSession s = request.getSession();
			Boolean isValid;
			//getUsername
			username = request.getParameter("username");
			password = request.getParameter("password");
			rememberMe = request.getParameter("remember");
			
			System.out.println("Username etnered: " + username);
			System.out.println("Password entered: " + password);
			System.out.println("Remember me: " + rememberMe);
			
			//validate if they exist
			//isValid = UserService.validateUser(username, password);
			
			//If its a valid username and password, forward to success page
			if(username.equalsIgnoreCase("admin") && password.equalsIgnoreCase("nyeam") /*theService.isValid(username, password)*/) {
				RequestDispatcher rd = request.getRequestDispatcher("success.jsp");

				
				/* Set attributes */
				//Username attribute
				s.setAttribute("un", username);
				System.out.println("The session attribute: " + s.getAttribute("un"));
				
				/* Extend cookies */
				Cookie theCookie;
					
				//This generates the cookie.
				//For now, this will be the parameter for cookie:
				//Cookie(s1, s2);
				//s1 = the name which is "USER"
				//s2 = <username>|rememberMe_value 
				//s2 may change once we get to the database part.
				theCookie = new Cookie("USER", username + "|" + rememberMe);
					
				//Checking
				System.out.println("Cookie placed: " + theCookie.getName());
				System.out.println("Cookie value: " + theCookie.getValue());
	
				
				
				//Check if remember me is check or not null
				if(rememberMe != null) {
					theCookie.setMaxAge(60*60*24*21); //three weeks extended
				}
				
				response.addCookie(theCookie);
	
				
				/*Forward to success.jsp*/
				rd.forward(request, response);
			}
			
			//if its not valid, redirect them back to the login page.
			else {
				//#1 Send 201 http code
				
				//#2 Send redirect
				System.out.println("does not exist.");
				System.out.println("The session attribute: " + s.getAttribute("un"));
				response.sendRedirect("homepage.jsp");
			}
		
		
	}
	
	//Sign's the user up
	private void signupUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		Users u = new Users();
		u.setUsers_username(request.getParameter("username"));
		u.setUsers_password(request.getParameter("password"));
		u.setUsers_description(request.getParameter("desc"));
		
		UserService.addUser(u);
		System.out.println("Successfuly registered!");
		System.out.println(request.getParameter("username"));
		System.out.println(request.getParameter("password"));
		System.out.println(request.getParameter("desc"));
		response.sendRedirect("homepage.jsp");
	}

}
