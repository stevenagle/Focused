package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Company;
import entities.Reviewer;

@Transactional
public class FocusedDaoImpl implements FocusedDbDao {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Company createCompany(String name, String description, String username, String password) {

		Company c = new Company();
		
		c.setName(name);
		c.setDescription(description);
		c.setUsername(username);
		c.setPassword(password);

		em.persist(c);
		
		return c;
	}

	@Override
	public Reviewer createReviewer(String username, String password, int age, String gender) {
	
		Reviewer r = new Reviewer();
		r.setUsername(username);
		r.setPassword(password);
		r.setAge(age);
		r.setGender(gender);
		
		em.persist(r);
		
		return r;
	}
}
