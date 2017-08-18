package service;

import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.apache.catalina.User;

import bean.Tag;
import bean.Users;


public class UserService {

	public static void addUser(Users u) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		
		EntityManager em = emf.createEntityManager();
		
		EntityTransaction trans = em.getTransaction();
		
		try {
			trans.begin();
			em.persist(u);
			trans.commit();
		}catch(Exception e){
			if(trans != null) 
				trans.rollback();
			e.printStackTrace();
		}
		finally {
			em.close();
		}
	}
	
	public static boolean checkUser(String username) {
		Users s = null;
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		
		EntityTransaction trans = em.getTransaction();
		
		try{
			trans.begin();
			// select student with given id
			s = em.find(Users.class, username);
			if(s == null)
				return true;
			trans.commit();
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			em.close();
		}
		
		return false;
	}
	
	public static boolean checkUser(String username, String password) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		
		EntityManager em = emf.createEntityManager();
		List<Users> user = null;
		
		try {
			TypedQuery<Users> query = em.createQuery("SELECT users FROM users users WHERE users_username = ?1", Users.class);
			query.setParameter(1, username);
			user = query.getResultList();
			if(user.isEmpty()) {
				return false;
			}
			else {
				if(user.get(0).getUsers_password().equals(password))
					return true;
				else return false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			em.close();
		}
		return false;
	}
	
	public static Users getUser(String username) {
		Users s = null;
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysqldb");
		EntityManager em = emf.createEntityManager();
		
		EntityTransaction trans = em.getTransaction();
		
		try{
			trans.begin();
			// select student with given id
			s = em.find(Users.class, username);
			trans.commit();
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			em.close();
		}
		
		return s;
	}
}
