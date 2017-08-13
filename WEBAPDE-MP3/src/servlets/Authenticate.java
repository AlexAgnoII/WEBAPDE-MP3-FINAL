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
		
		//Check if the cookie "USER" exists.
		Cookie[] cookieList = req.getCookies();
		System.out.println("Authenticate url path: "+  url);
		if(cookieList != null) {
			for(Cookie aCookie : cookieList) {
				if(aCookie.getName().equals("USER")) {
					System.out.println("USER Cookie found!");
						
					if(aCookie.getMaxAge() != 0)
						proceed = true; //if it exists, proceed.

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
						System.out.println("Continue to its page..");
						chain.doFilter(request, response);
					}
					
				 break;
			case "/success.jsp":
			case "/userfeed.jsp":
			case "/profile.jsp":	
			case "/upload.jsp":
				if(proceed) { //forward to the its page. 
					System.out.println("proceed to its page.");
					chain.doFilter(request, response);
					
				}
				else {
					System.out.println("Redirect to access denied..");
					res.sendRedirect("Access-Denied.html");
				}
				
				 break;
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
