package tests;

import static org.junit.Assert.assertEquals;

import java.text.ParseException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Reviewer;

public class ReviewerTest {

	private EntityManagerFactory emf;
	private EntityManager em;

	@Before
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("FocusedJPA");
		em = emf.createEntityManager();
	}

	@Test
	public void test() throws ParseException {
		Reviewer r = em.find(Reviewer.class, 1);
		assertEquals(1, r.getId());
		assertEquals(24, r.getAge());
		assertEquals("M", r.getGender());
		assertEquals("user1", r.getUsername());
		assertEquals("user1", r.getPassword());

	}

	@After
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

}
