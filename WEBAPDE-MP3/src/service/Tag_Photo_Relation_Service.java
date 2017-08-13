package service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import bean.Photo;
import bean.Tag;
import bean.Tag_Photo_Relation;

public class Tag_Photo_Relation_Service {

	public void addTagPhotoRelation(Tag t, Photo p) {
		int tagId = t.getTag_id(), photoId = p.getPhoto_id();
		Tag_Photo_Relation tp = null;
		tp.setPhoto_id(photoId);
		tp.setTag_id(tagId);
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
