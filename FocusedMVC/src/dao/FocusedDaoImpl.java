package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import entities.Company;

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

		return c;
	}
}
