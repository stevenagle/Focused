package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Company;
import entities.Product;
import entities.Reviewer;

@Transactional
public class FocusedDaoImpl implements FocusedDbDao {

	@PersistenceContext
	private EntityManager em;

	// Company methods

	@Override
	public Company createCompany(String name, String username, String password, String description) {

		Company c = new Company();

		c.setName(name);
		c.setUsername(username);
		c.setPassword(password);
		c.setDescription(description);

		em.persist(c);

		return c;
	}

	@Override
	public Company updateCompany(int id, String name, String username, String password, String description) {

		Company c = em.find(Company.class, id);
		c.setName(name);
		c.setDescription(username);
		c.setUsername(password);
		c.setPassword(description);

		return c;
	}

	@Override
	public Company getCompanyById(int id) {
		return em.find(Company.class, id);
	}
	
	@Override
	public Company MatchCompany(String username, String password) {

		String queryString = "SELECT c FROM Company c";

		List<Company> results = em.createQuery(queryString, Company.class).getResultList();
		Company match = new Company();

		for (Company result : results) {
			if (result.getUsername().equals(username)) {
				match = result;
			}
		}
		
		return match;
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

		Reviewer r = em.find(Reviewer.class, id);
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

	@Override
	public Reviewer MatchReviewer(String username, String password) {

		String queryString = "SELECT r FROM Reviewer r";

		List<Reviewer> results = em.createQuery(queryString, Reviewer.class).getResultList();
		Reviewer match = new Reviewer();

		for (Reviewer result : results) {
			if (result.getUsername().equals(username)) {
				match = result;
				return match;
			}
		}
		return em.find(Reviewer.class, 1);
		
	}

	// Product Methods
	@Override
	public Product createProduct(int id, String name, double price, String photoUrl, String description) {

		Product p = new Product();

		Company c = getCompanyById(id);
		p.setCompany(c);

		p.setName(name);
		p.setPrice(price);
		p.setPhotoUrl(photoUrl);
		p.setDescription(description);
		// p.setFeatures(features);

		return p;
	}

}
