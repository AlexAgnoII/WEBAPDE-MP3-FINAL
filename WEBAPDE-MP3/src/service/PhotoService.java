package service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import javax.persistence.TypedQuery;

import bean.Photo;

public class PhotoService {
	
	public static List<Photo> filterByTag(String tag){
		List<Photo> photoList = null;
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		
		try {
			TypedQuery<Photo> query = em.createQuery("SELECT photo " + 
													 "FROM photo photo, tag tag, tag_photo_relation tag_photo_relation, " +
													 "shared_photos shared_photos " + 
													 "WHERE( " +  
													 "tag_photo_relation.photo_id = photo.photo_id " + 
													 "AND tag.tag_id = tag_photo_relation.tag_id " + 
													 "AND photo.photo_privacy = ?1 " + 
													 "AND tag.tag_name = ?2 " + 
													 ") " +
													 "GROUP BY photo.photo_id " + 
													 "ORDER BY photo.photo_uploadDate", Photo.class);
			query.setParameter(1, "public");
			query.setParameter(2, tag);
			photoList = query.getResultList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			em.close();
		}
		return photoList;
	}
	
	public static List<Photo> getUserPhotos(String viewer, String visitedUser){
		List<Photo> photoList = null;
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		
		try {
			TypedQuery<Photo> query = em.createQuery("SELECT photo FROM photo photo, users users, shared_photos shared_photos " +
													 "WHERE( " +
													 "photo.photo_privacy = ?1 " +
													 "AND photo.user_username = ?2 " +
													 ") " +
													 "OR( " +
													 "photo.photo_privacy = ?3 " +
													 "AND photo.user_username = ?2 " +
													 "AND shared_photos.shared_user_username = ?4 " +
													 "AND shared_photos.photo_id = photo.photo_id ) " +
													 "GROUP BY photo.photo_id " +
													 "ORDER BY photo.photo_privacy", Photo.class);
			query.setParameter(1, "public");
			query.setParameter(2, visitedUser);
			query.setParameter(3, "private");
			query.setParameter(4, viewer);
			photoList = query.getResultList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			em.close();
		}
		return photoList;
	}
	
	public static List<Photo> getUserFeed(String username){
		List<Photo> photoList = null;
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		
		try {
			TypedQuery<Photo> query = em.createQuery("SELECT photo From photo photo, users users, " + 
													 "shared_photos shared_photos " + 
													 "WHERE( " +
													 "photo.photo_privacy = ?1 " + 
													 "AND shared_photos.shared_user_username = users.users_username " + 
													 "AND shared_photos.shared_user_username = ?2) " +
													 "AND shared_photos.photo_id = photo.photo_id " +
													 "OR( " +
													 "photo.photo_privacy = ?1 " + 
													 "AND photo.user_username = ?2) " +
													 "OR ( photo.photo_privacy = ?3) " +
													 "GROUP BY photo.photo_id " +
													 "ORDER BY photo.photo_privacy", Photo.class);
			query.setParameter(1, "private");
			query.setParameter(2, username);
			query.setParameter(3, "public");
			photoList = query.getResultList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			em.close();
		}
		return photoList;
	}
	
	public static List<Photo> getUserPhotos(String username){
		List<Photo> photoList = null;
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();

		try {
			TypedQuery<Photo> query = em.createQuery("SELECT photo FROM photo photo WHERE user_username = ?1 " +
													 "ORDER BY photo_uploadDate", Photo.class);
			query.setParameter(1, username);
			photoList = query.getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			em.close();
		}
		return photoList;
	}
	
	public static List<Photo> filterByTag(String username, String tag){
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		
		EntityManager em = emf.createEntityManager();
		
		List<Photo> photoList = null;
		try {
			TypedQuery<Photo> query = em.createQuery("SELECT photo " + 
													 "FROM photo photo, tag tag, tag_photo_relation tag_photo_relation, " +
													 "shared_photos shared_photos " + 
													 "WHERE( " +  
													 "tag_photo_relation.photo_id = photo.photo_id " + 
													 "AND tag.tag_id = tag_photo_relation.tag_id " + 
													 "AND photo.photo_privacy = ?1 " + 
													 "AND tag.tag_name = ?2 " + 
													 ") " + 
													 "OR( " +  
													 "tag_photo_relation.photo_id = photo.photo_id " + 
													 "AND photo.photo_id = shared_photos.photo_id " + 
													 "AND tag_photo_relation.photo_id = shared_photos.photo_id " + 
													 "AND tag.tag_id = tag_photo_relation.tag_id " + 
													 "AND photo.photo_privacy = ?3 " + 
													 "AND shared_photos.shared_user_username = ?4 " + 
													 "AND tag.tag_name = ?2 " + 
													 ") " +
													 "OR( " +  
													 "tag_photo_relation.photo_id = photo.photo_id " + 
													 "AND tag_photo_relation.tag_id = tag_photo_relation.tag_id " + 
													 "AND photo.photo_privacy = ?3 " + 
													 "AND photo.user_username =  ?4 " + 
													 "AND tag.tag_name = ?2 " + 
													 ") " + 
													 "GROUP BY photo.photo_id " + 
													 "ORDER BY photo.photo_uploadDate", Photo.class);
			query.setParameter(1, "public");
			query.setParameter(2, tag);
			query.setParameter(3, "private");
			query.setParameter(4, username);
			photoList = query.getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			em.close();
		}
		return photoList;
	}
	
	public static List<Photo> getPublicPhotos() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		
		EntityManager em = emf.createEntityManager();
		
		List<Photo> photoList = null;
		try {
			TypedQuery<Photo> query = em.createQuery("SELECT photo FROM photo photo WHERE photo_privacy= ?1 ORDER BY photo_uploadDate", Photo.class);
			query.setParameter(1, "public");
			photoList = query.getResultList();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			em.close();
		}
		return photoList;
	}
	
	public static void addPhoto(Photo p) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		
		EntityManager em = emf.createEntityManager();
		
		EntityTransaction trans = em.getTransaction();
		
		try {
			trans.begin();
			em.persist(p);
			trans.commit();
			System.out.println("Photo id" + p.getPhoto_id());
		}catch(Exception e){
			if(trans != null) 
				trans.rollback();
			e.printStackTrace();
		}
		finally {
			em.close();
		}
	}
	
}
