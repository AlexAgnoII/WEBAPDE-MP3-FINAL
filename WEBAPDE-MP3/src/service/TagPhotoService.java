package service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import bean.Tag_Photo_Relation;

public class TagPhotoService {

	public static boolean checkMapping(int tagId, int photoid) {
		List<Tag_Photo_Relation> resultList = null;
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		try {
			TypedQuery<Tag_Photo_Relation> query = em.createQuery("SELECT tag_photo_relation FROM tag_photo_relation tag_photo_relation " +
												   "WHERE tag_photo_relation.tag_id = ?1 " +
												   "AND tag_photo_relation.photo_id = ?2", Tag_Photo_Relation.class);
			query.setParameter(1, tagId);
			query.setParameter(2, photoid);
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