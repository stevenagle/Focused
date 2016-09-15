package tests;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Feature;

public class FeatureTest {

	private EntityManagerFactory emf;
	private EntityManager em;

	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("FocusedJPA");
		em = emf.createEntityManager();
	}

	@Test
	public void test() throws ParseException {
		Feature feature = em.find(Feature.class, 1);
		assertEquals("plastic container", feature.getDetails());

	}

	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

}
