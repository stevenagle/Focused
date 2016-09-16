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

	// Company methods

	@Override
	public Company createCompany(String name, String description, String username, String password) {

		Company c = new Company();

		c.setName(name);
		c.setUsername(username);
		c.setPassword(password);
		c.setDescription(description);

		em.persist(c);

		return c;
	}

	@Override
	public Company updateCompany(int id, String name, String description, String username, String password) {
		
		Company c = em.find(Company.class, id);
		c.setName(name);
		c.setDescription(name);
		c.setUsername(name);
		c.setPassword(name);
		
		return c;
	}
	
	@Override
	public Company getCompanyById(int id) {
		return em.find(Company.class, id);
	}

	// Reviewer methods

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

	@Override
	public Reviewer updateReviewer(int id, String username, String password, int age, String gender) {
		
		Reviewer r= em.find(Reviewer.class, id);
		r.setUsername(username);
		r.setPassword(password);
		r.setAge(age);
		r.setGender(gender);
		
		return r;
	}

	@Override
	public Reviewer getReviewerById(int id) {
		return em.find(Reviewer.class, id);
	}


}
