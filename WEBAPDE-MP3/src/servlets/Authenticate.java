package servlets;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CookieDecoder;

/**
 * Servlet Filter implementation class Authenticate
 */
@WebFilter (urlPatterns={"*.html", "*.jsp"})
public class Authenticate implements Filter {
	private HttpServletRequest req;
	private HttpServletResponse res;
	private boolean proceed;
    /**
     * Default constructor. 
     */
    public Authenticate() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		req = (HttpServletRequest) request;
		res = (HttpServletResponse) response;
		proceed = false; //Fixed infinite redirection
		String url = req.getServletPath();
		String temp;
		HttpSession theSession;
		CookieDecoder theCookieDecoder = new CookieDecoder();
		
		System.out.println("\n\n--AUTHENTICATE SERVLET--");
		
		//check if session attribute exists
		theSession = req.getSession();
		System.out.println("Session attribute(un): " + theSession.getAttribute("un"));
		
		//Check if the cookie "USER" exists.
		Cookie[] cookieList = req.getCookies();
		System.out.println("Authenticate url path: "+  url);
		if(cookieList != null) {
			for(Cookie aCookie : cookieList) {
				if(aCookie.getName().equals("USER")) {
					System.out.println("USER Cookie found!");
						
					if(aCookie.getMaxAge() != 0)
						proceed = true; //if it exists, proceed.
					
					//Allows session attribute to stay in the website
					//When user enters exact url.
					if(theSession.getAttribute("un") == null) {
						theCookieDecoder.decode(aCookie.getValue());
						temp = theCookieDecoder.getValue();
						System.out.println("(Authenticate) Cookie value: " + temp);
						theSession.setAttribute("un",temp);
					}
					
				}
			}
		}
		
		System.out.println("\n\nAUTHENTICATE FILTER LOG---------------------------");
		System.out.println("Url:" + url);
		System.out.println("Cookie exists: " + proceed);
		switch(url) {
			case "/homepage.jsp": 
			case "/Access-Denied.html": 
					if(proceed) { //forward to the welcome servlet.
							System.out.println("Forwarding to userfeed");
							res.sendRedirect("userfeed.jsp");
					}
					
					else {
						if(!url.equals("/homepage.jsp")) {
							System.out.println("Continue to its page..");
							chain.doFilter(request, response);
						}
						
						else {
							System.out.println("homepage.jsp, proceeding to showPublic...");
							req.getRequestDispatcher("showPublic").forward(req, res);
						}
						
					}
					
				 break;
			case "/success.jsp":
			case "/userfeed.jsp":
			case "/profile.jsp":	
			case "/upload.jsp":
				if(proceed) { //forward to the its page. 
					
					if(url.equals("/userfeed.jsp")) {
						System.out.println("userfeed.jsp, proceeding to showUserFeedPhotos...");
						req.getRequestDispatcher("showUserFeedPhotos").forward(req, res);
					}
					
					else if(url.equals("/profile.jsp")) {
						System.out.println("profile.jsp, proceeding to showUserPhotos...");
						req.getRequestDispatcher("showUserPhotos").forward(req, res);
					}
					
					else {
						System.out.println("proceed to its page.");
						chain.doFilter(request, response);
					}

					
				}
				else {
					System.out.println("Redirect to access denied..");
					res.sendRedirect("Access-Denied.html");
				}
				
				 break;
			case "/searchResult.jsp": chain.doFilter(request, response); break;
			default: System.out.println("Path not found");
		}
		System.out.println("---------------------------\n\n");
	}


	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
