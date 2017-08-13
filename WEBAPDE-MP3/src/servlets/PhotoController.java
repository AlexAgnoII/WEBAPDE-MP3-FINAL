package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Photo;
import bean.Tag;
import service.PhotoService;
import service.TagService;

/**
 * Servlet implementation class PhotoController
 */
@WebServlet(urlPatterns= {"/upload", "/photoSearch"})
public class PhotoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhotoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String urlpattern = request.getServletPath();
		System.out.println("PHOTOSERVLET:  " + urlpattern);
		switch(urlpattern) {
			case "/photoSearch": filterByTag(request, response);
				                 break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String urlpattern = request.getServletPath();
		
		System.out.println("PHOTOSERVLET (POST): " + urlpattern);
		switch(urlpattern) {
		case"/upload": addPhoto(request, response);
								break;
		}
	}
	
	public void filterByTag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//		PhotoService ps = new PhotoService();
//		ArrayList<Photo> test = new ArrayList<Photo>();
//		System.out.println(request.getParameter("search"));
//		
//		test = ps.filterByTag(request.getParameter("search"));
//		if(test != null) {
//			for (Photo p : test) {
//				System.out.println(p.getPhoto_title());
//			}
//		}
//		
//		else System.out.println("PHOTO NOT FOUND");
//		request.setAttribute("Photo", test);
		
		request.getRequestDispatcher("searchResult.jsp").forward(request,  response);

	}
	
	public void addPhoto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Photo p = new Photo();
		p.setUser_username(request.getParameter("uploader"));
		p.setPhoto_title(request.getParameter("title"));
		p.setPhoto_description(request.getParameter("description"));
		p.setPhoto_url(request.getParameter("pic"));
		p.setPhoto_privacy(request.getParameter("privacy"));
		
		PhotoService.addPhoto(p);
		
		String tagNames[] = TagService.split(request.getParameter("tags"));
		for(String t: tagNames)
			System.out.println(t);
		System.out.println("Photo added!");
		System.out.println(request.getParameter("pic"));
		System.out.println("I added photos.");

		response.sendRedirect("profile.jsp");
	}
}