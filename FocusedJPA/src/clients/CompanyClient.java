package clients;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import entities.Company;

public class CompanyClient {
	public static void main(String[] args) {
		System.out.println("Working . . .");
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("FocusedJPA");
		EntityManager em = emf.createEntityManager();
		
		Company c = em.find(Company.class, 1);
		System.out.println(c.getName());
		
		em.close();
		emf.close();
	}
}
