package service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import javax.persistence.TypedQuery;

import bean.Photo;

public class PhotoService {
	
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
	
	public static void main(String[] args) {
		List<Photo> photoList = PhotoService.getPublicPhotos();
		for(Photo p: photoList) {
			System.out.println(p.toString());
		}
	}
}
