package service;

import java.util.ArrayList;
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
	
	private static boolean checkTagBool(String inputTag) {
		System.out.println("inputTag is " + inputTag);
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		try {
			TypedQuery<Tag> query = em.createQuery("SELECT tag FROM tag tag WHERE tag_name = ?1", Tag.class);
			query.setParameter(1, inputTag);
			List<Tag> tagList = query.getResultList();
			if(tagList.isEmpty()){
				return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			em.close();
		}
		return true;
	}
	
	public static Tag queryTag(String inputTag) {
		Tag returnTag = new Tag();
		
		System.out.println("inputTag is " + inputTag);
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		try {
			TypedQuery<Tag> query = em.createQuery("SELECT tag FROM tag tag WHERE tag_name = ?1", Tag.class);
			query.setParameter(1, inputTag);
			List<Tag> tagList = query.getResultList();
			
			returnTag.setTag_id(tagList.get(0).getTag_id());
			returnTag.setTag_name(tagList.get(0).getTag_name());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			em.close();
		}
		return returnTag;
	}
	
	public static void checkTag(String inputTag) {
		if (!checkTagBool(inputTag)) {
			System.out.println("Tag " + inputTag + "does not yet exist in db. adding now");
			TagService.addTag(inputTag);
		}
	}
	
	public static void addTag(String tagName) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		EntityTransaction trans = em.getTransaction();
		Tag t = new Tag();
		t.setTag_name(tagName);
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
		System.out.println("tags contains: ");
		for(String t: tags) {
			System.out.println(t);
			//TagService.checkTag(t);
		}
	}
}
