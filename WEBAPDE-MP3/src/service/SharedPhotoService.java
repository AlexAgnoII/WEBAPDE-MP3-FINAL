package service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import bean.Shared_Photos;

public class SharedPhotoService {

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
