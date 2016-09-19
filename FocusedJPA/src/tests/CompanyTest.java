package tests;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Company;
import entities.Product;

public class CompanyTest {
	private EntityManagerFactory emf;
	private EntityManager em;

	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("FocusedJPA");
		em = emf.createEntityManager();
	}

	@Test
	public void test() throws ParseException {
		Company company = em.find(Company.class, 1);
		assertEquals("CSS Hub", company.getName());
		assertEquals("csshub", company.getUsername());
		assertEquals("front end devs", company.getDescription());

		Set<Product> products = company.getProducts();
		assertEquals(1, products.size());
	}

	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

}
