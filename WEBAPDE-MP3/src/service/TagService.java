package service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import bean.Tag;

public class TagService {
	
	public static String[] split(String tags) {
		String	tagList[] = tags.split(", ");
		return tagList;
	}
	
	public static Tag checkTag(String inputTag) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		List<Tag> tagList = null;
		Tag newTag = new Tag();
		try {
			TypedQuery<Tag> query = em.createQuery("SELECT tag FROM tag tag WHERE tag_name = ?1", Tag.class);
			query.setParameter(1, inputTag);
			tagList = query.getResultList();
			System.out.println("tagList contains: ");
			for(Tag resultTag: tagList) {
				if (tagList.isEmpty()) {
					newTag.setTag_name(inputTag);
					TagService.addTag(newTag);
				}
				else {
					newTag.setTag_name(resultTag.getTag_name());
					newTag.setTag_id(resultTag.getTag_id());
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			em.close();
		}
		return newTag;
	}
	
	public static void addTag(Tag t) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			em.persist(t);
			trans.commit();
			System.out.println("Tag with name " + t.getTag_name() + " is added to db!");
		}catch(Exception e) {
			if(trans != null) 
				trans.rollback();
			e.printStackTrace();
		}finally {
			em.close();
		}
	}
	
	public static void main(String[] args) {
		String tags[] = TagService.split("outdoors, games, family, school, travel, computer science, c");
		for(String t: tags) {
			System.out.println(t);
			TagService.checkTag(t);
		}
	}
}
