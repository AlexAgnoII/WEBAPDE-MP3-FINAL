package service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import bean.Tag_Photo_Relation;

public class TagPhotoService {

	public static void addTagPhotoRelation(Tag_Photo_Relation tpr) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			em.persist(tpr);
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