package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;

import bean.Photo;
import bean.Tag;
import bean.Tag_Photo_Relation;
import bean.Users;
import service.PhotoService;
import service.TagPhotoService;
import service.TagService;
import service.UserService;

/**
 * Servlet implementation class PhotoController
 */
@WebServlet(urlPatterns= {"/upload", "/photoSearch", "/showPublic", "/showUserFeedPhotos", "/showUserPhotos", "/visitThisUser"})
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
		System.out.println("------PHOTOSERVLET:  " + urlpattern + "-------");
		System.out.println("Session: " + request.getSession().getAttribute("un"));
		switch(urlpattern) {
			case "/photoSearch": filterByTag(request, response);
				                 break;
			case "/showPublic": showPublicPhotos(request, response); break;
			case "/showUserFeedPhotos": showUserFeedPhotos(request, response); break;
			case "/showUserPhotos": showUserPhotos(request, response); break;
			case "/visitThisUser": showUserVisitedPhotos(request, response); break;
			default: System.out.println("PATH DOES NOT EXIST ( PHOTO CONTROLLER ) ");
		}
	}

	private void showUserVisitedPhotos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userToVisit = request.getParameter("user");
		String currentUser = request.getSession().getAttribute("un").toString();
		System.out.println("User to visit: " + userToVisit);
		System.out.println("Current user: " + currentUser);
		
		List<Photo> photoList;
		Users theUser = UserService.getUser(userToVisit);
		System.out.println("TheUser: " + theUser.getUsers_username());

		//get all photos of user
		photoList = PhotoService.getUserPhotos(currentUser, userToVisit); //replace this with new function 
		
		if(photoList != null) {
			//display all photos (for testing)
			System.out.println("Photos here: ");
			for(int i = 0; i < photoList.size(); i++) {
				System.out.print("Photo#" + (i+1) + ": " + photoList.get(i).getPhoto_title());
				System.out.println("URL: "  + photoList.get(i).getPhoto_url());
				
			}
		}
		
		System.out.println("Forwarding to profile.jsp..");
		System.out.println("View specific user");
		request.setAttribute("photoList", photoList);
		request.setAttribute("user", theUser);
		
		request.getRequestDispatcher("profile.jsp").forward(request, response);
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
	
	//show pics that are only for that user.
	private void showUserPhotos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Photo> photoList;
		Users theUser = new Users();
		theUser.setUsers_username("testing");
		theUser.setUsers_description("Testing purposes");
		String username = request.getSession().getAttribute("un").toString();
		//get all photos of user
		photoList = PhotoService.getUserPhotos(username); //replace this with new function 
		
		//get the user itself
		System.out.println(request.getSession().getAttribute("un"));
		if(photoList != null) {
			//display all photos (for testing)
			System.out.println("Photos here: ");
			for(int i = 0; i < photoList.size(); i++) {
				System.out.print("Photo#" + (i+1) + ": " + photoList.get(i).getPhoto_title());
				System.out.println("URL: "  + photoList.get(i).getPhoto_url());
				
			}
		}
		
		System.out.println("Forwarding to profile.jsp..");
		System.out.println("hakuna matataa");
		request.setAttribute("photoList", photoList);
		request.setAttribute("user", theUser);
		
		request.getRequestDispatcher("profile.jsp").forward(request, response);
	}
	
	//Shows pics that are shared, public and private.
	private void showUserFeedPhotos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				List<Photo> photoList;
				String username = request.getSession().getAttribute("un").toString();
				//get all public photos
				photoList = PhotoService.getUserFeed(username); //replace this with new function 
				
				if(photoList != null) {
					//display all photos (for testing)
					System.out.println("Photos here: ");
					for(int i = 0; i < photoList.size(); i++) {
						System.out.print("Photo#" + (i+1) + ": " + photoList.get(i).getPhoto_title());
						System.out.println("URL: "  + photoList.get(i).getPhoto_url());
						
					}
				}
				
				System.out.println("Forwarding to userfeed.jsp..");
				System.out.println("Sesson: " + request.getSession().getAttribute("un"));
				System.out.println("testing");
				request.setAttribute("photoList", photoList);
				request.getRequestDispatcher("userfeed.jsp").forward(request, response);
	}
	
	//shows public only.
	private void showPublicPhotos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Photo> photoList;
		
		//get all public photos
		photoList = PhotoService.getPublicPhotos();
		
		if(photoList != null) {
			//display all photos (for testing)
			System.out.println("Photos here: ");
			for(int i = 0; i < photoList.size(); i++) {
				System.out.print("Photo#" + (i+1) + ": " + photoList.get(i).getPhoto_title());
				System.out.println("URL: "  + photoList.get(i).getPhoto_url());
				
			}
		}
		
		System.out.println("Forwarding to hompage.jsp..");
		request.setAttribute("photoList", photoList);
		request.getRequestDispatcher("homepage.jsp").forward(request, response);

	}
	
	public void filterByTag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		List<Photo> photoList;
		
		photoList = PhotoService.filterByTag(request.getParameter("search"));
		
		for(Photo p: photoList) {
			System.out.println(p.toString());
		}
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
		System.out.println("Uploaded by: " + request.getSession().getAttribute("un").toString());
		System.out.println("Title: " + request.getParameter("title"));
		System.out.println("Description: " + request.getParameter("description"));
		System.out.println("URL:" + request.getParameter("pic"));
		System.out.println("Privacy: " + request.getParameter("privacy"));
		System.out.println("Tags: " + request.getParameter("tags"));
		
		String tagNames[] = TagService.split(request.getParameter("tags"));
		ArrayList<Tag> tagObjects = new ArrayList<Tag>();
		for(String t: tagNames) {
			TagService.checkTag(t);
			tagObjects.add(TagService.queryTag(t));
		}
		System.out.println("tagObjects contains ");
		for(Tag t: tagObjects) {
			System.out.println("Tag id: " + t.getTag_id());
			System.out.println("Tag name: " + t.getTag_name());
		}
		
		Photo p = new Photo();
		p.setUser_username(request.getSession().getAttribute("un").toString());
		p.setPhoto_title(request.getParameter("title"));
		p.setPhoto_description(request.getParameter("description"));
		p.setPhoto_url(request.getParameter("pic"));
		p.setPhoto_privacy(request.getParameter("privacy"));
		
		PhotoService.addPhoto(p);
	
		//add Tag Photo Relation
		Tag_Photo_Relation tpr = new Tag_Photo_Relation();
		tpr.setPhoto_id(p.getPhoto_id());
		for(Tag t: tagObjects) {
			tpr.setTag_id(t.getTag_id());
			TagPhotoService.addTagPhotoRelation(tpr);
			System.out.println("photo id: " + tpr.getPhoto_id() + " tag id " + t.getTag_id() + "name " + t.getTag_name());
		}
		//if private, map shared photos
		
		//message once it's done
		System.out.println("Photo added!");
		//System.out.println(request.getParameter("pic"));
		System.out.println("I added photos.");

		response.sendRedirect("profile.jsp");
	}
}