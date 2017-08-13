package service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

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
}
