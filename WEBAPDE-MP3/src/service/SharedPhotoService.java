package service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import bean.Shared_Photos;
import bean.Tag_Photo_Relation;

public class SharedPhotoService {

	public static boolean checkMapping(String username, int photoId) {
		List<Shared_Photos> resultList = null;
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		try {
			TypedQuery<Shared_Photos> query = em.createQuery("SELECT shared_photos FROM shared_photos shared_photos " +
												   "WHERE shared_photos.photo_id = ?1 " +
												   "AND shared_photos.shared_user_username = ?2", Shared_Photos.class);
			query.setParameter(2, username);
			query.setParameter(1, photoId);
			resultList = query.getResultList();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			em.close();
		}
		if(resultList.isEmpty())
			return true;
		return false;
	}
	
	public static String[] split(String input) {
		String	sharedTo[] = input.split(", ");
		return sharedTo;
	}
	public static void addSharedPhoto(Shared_Photos sp) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			em.persist(sp);
			trans.commit();
		}catch(Exception e) {
			if(trans != null) 
				trans.rollback();
			e.printStackTrace();
		}finally {
			em.close();
		}
	}
	
}
