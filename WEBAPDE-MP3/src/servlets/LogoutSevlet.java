package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import service.CookieDecoder;

/**
 * Servlet implementation class LogoutSevlet
 */
@WebServlet("/logout")
public class LogoutSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession theSession = request.getSession();
		
		//Kill the session
		theSession.invalidate();
		
		//Remove the cookies
		Cookie[] cookieList = request.getCookies();
		
		//search for the cookie and kill it.
		for (Cookie cookies : cookieList) {
			if(cookies.getName().equals("USER")) {
				cookies.setMaxAge(0);
				response.addCookie(cookies);
			}
		}
		
		cookieList = request.getCookies();
		for (Cookie cookies : cookieList) {
			if(cookies.getName().equals("USER")) {
				System.out.println("LOGOUTSERVLET: COOKEIS STILL EXIST!");
				System.out.println("WAT IS UR TIME COOKIE: " + cookies.getMaxAge());
			}
		}
		
		
		response.sendRedirect("homepage.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
