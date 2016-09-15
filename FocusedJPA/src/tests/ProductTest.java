package tests;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Product;

public class ProductTest {

	private EntityManagerFactory emf;
	private EntityManager em;

	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("FocusedJPA");
		em = emf.createEntityManager();
	}

	@Test
	public void test() throws ParseException {
		Product product = em.find(Product.class, 1);
		assertEquals(1, product.getId());
		assertEquals("holds water", product.getDescription());
		assertEquals("water bottle", product.getName());
		assertEquals(2.0, product.getPrice(), 0.001);


	}

	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}
}
